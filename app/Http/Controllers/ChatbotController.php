<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log; // <-- THÊM MỚI: Để ghi log lỗi

class ChatbotController extends Controller
{
    public function handle(Request $request)
    {
        // Cho phép message có thể rỗng, vì người dùng có thể chỉ gửi ảnh
        $message = trim($request->input('message', '')); 
        $imageFile = $request->file('image'); // <-- THÊM MỚI: Lấy file ảnh
        $identifiedProductName = null; // <-- THÊM MỚI: Biến lưu tên SP từ ảnh

        // --- BƯỚC XỬ LÝ ẢNH MỚI ---
        if ($imageFile) {
            // Bạn có thể thêm validation nghiêm ngặt hơn
            $request->validate([
                'image' => 'image|mimes:jpeg,png,jpg,webp|max:5120', // Giới hạn 5MB
            ]);
            
            // Gọi hàm AI để nhận diện sản phẩm từ ảnh
            $identifiedProductName = $this->_getProductNameFromImage($imageFile);
            
            // Nếu AI không nhận diện được, coi như không có tên
            if ($identifiedProductName === 'UNKNOWN') {
                $identifiedProductName = null;
            }
        }

        // Nếu không có tin nhắn VÀ không có ảnh (hoặc nhận diện thất bại)
        if (empty($message) && !$identifiedProductName) {
            return response()->json(['answer' => 'Xin vui lòng nhập câu hỏi hoặc gửi ảnh sản phẩm.']);
        }
        
        $lowerMessage = mb_strtolower($message, 'UTF-8');

        // =========================================================================
        // ===== 1. PHÂN TÍCH Ý ĐỊNH NGƯỜI DÙNG (CÁC TRƯỜNG HỢP ƯU TIÊN) =====
        // =========================================================================

        // --- Ý định 1: Hỏi chi tiết/cấu hình về một sản phẩm cụ thể (ĐÃ NÂNG CẤP) ---
        $detailKeywords = ['chi tiết', 'cấu hình', 'thông tin', 'mô tả'];
        $isDetailIntent = false;
        foreach ($detailKeywords as $keyword) {
            if (strpos($lowerMessage, $keyword) !== false) {
                $isDetailIntent = true;
                break;
            }
        }

        // QUAN TRỌNG: Trigger Ý định 1 nếu:
        // 1. Nhận diện được sản phẩm từ ảnh (ví dụ: gửi ảnh + hỏi "giá sao?")
        // 2. Người dùng hỏi từ khóa chi tiết (logic cũ)
        if ($identifiedProductName || $isDetailIntent) {
            
            $productKeywords = [];
            
            if ($identifiedProductName) {
                // Ưu tiên tên sản phẩm lấy từ hình ảnh
                $productKeywords = array_filter(explode(' ', $identifiedProductName));
            } else {
                // Nếu không có ảnh, dùng logic cũ để bóc tách tên SP từ text
                $stopWordsForDetails = ['bạn', 'tôi', 'muốn', 'xem', 'shop', 'có', 'bán', 'không', 'giá', 'của', 'cho', 'mình', 'hỏi', 'về', 'sản', 'phẩm',
                 'loại', 'cái', 'chiếc', 'ạ', 'tư', 'vấn', 'chi tiết', 'cấu hình', 'thông tin', 'mô tả', 'biết', 'thêm', 'xin', 'máy'];
                
                $cleanedMessage = str_ireplace($stopWordsForDetails, '', $lowerMessage);
                $cleanedMessage = preg_replace('/[^\p{L}\p{N}\s]/u', '', $cleanedMessage);
                $cleanedMessage = trim(preg_replace('/\s+/', ' ', $cleanedMessage));
                $productKeywords = array_filter(explode(' ', $cleanedMessage));
            }

            if (!empty($productKeywords)) {
                $query = DB::table('products');
                
                // Tìm sản phẩm chứa tất cả các từ khóa tên
                foreach ($productKeywords as $pKeyword) {
                    $query->where('product_name', 'LIKE', '%' . $pKeyword . '%');
                }
                
                $product = $query->first(); // Lấy kết quả phù hợp nhất

                if ($product) {
                    $answer = "Đây là thông tin chi tiết về sản phẩm bạn yêu cầu (" . $product->product_name . "):\n" . // Thêm tên SP cho rõ
                              "- Thông tin: " . strip_tags($product->information);
                    return response()->json(['answer' => $answer, 'source' => 'database_product_details']);
                }
            }
            
            // Nếu có ảnh nhưng không tìm thấy trong DB
            if ($identifiedProductName) {
                 return response()->json(['answer' => "Mình nhận diện được sản phẩm '{$identifiedProductName}' từ ảnh của bạn, nhưng rất tiếc chưa tìm thấy thông tin của sản phẩm này trong cửa hàng.", 'source' . 'intent_image_db_not_found']);
            }

            // Nếu hỏi chi tiết (text) mà không cung cấp tên SP
            return response()->json(['answer' => 'Bạn muốn xem chi tiết của sản phẩm nào ạ? Vui lòng cho mình biết tên sản phẩm nhé.', 'source' . 'intent_helper_details']);
        }

        // --- Ý định 2: Hỏi về tình trạng đơn hàng --- (Giữ nguyên)
        if (strpos($lowerMessage, 'đơn hàng') !== false || strpos($lowerMessage, 'tình trạng đơn') !== false) {
            preg_match('/(ORD-[A-Z0-9]+)/i', $message, $matches);
            if (!empty($matches[1])) {
                $orderNumber = strtoupper($matches[1]);
                $order = DB::table('orders')->where('order_number', $orderNumber)->first();
                if ($order) {
                    $statusTranslations = ['pending' => 'đang chờ xử lý', 'completed' => 'đã hoàn thành', 'delivering' => 'đang giao hàng', 'cancelled' => 'đã hủy', 'paid' => 'đã thanh toán'];
                    $status = $statusTranslations[$order->status] ?? $order->status;
                    $answer = "Chào bạn, đơn hàng `{$order->order_number}` của bạn có tổng giá trị là **" . number_format($order->total) . " VNĐ** và hiện đang ở trạng thái **{$status}**.";
                    return response()->json(['answer' => $answer, 'source' => 'database_orders']);
                } else {
                    return response()->json(['answer' => "Mình không tìm thấy đơn hàng có mã `{$orderNumber}`.", 'source' => 'database_orders_not_found']);
                }
            } else {
                return response()->json(['answer' => 'Để kiểm tra đơn hàng, bạn vui lòng cung cấp mã đơn hàng.', 'source' => 'intent_helper']);
            }
        }

        // --- Ý định 3: Hỏi về thông tin liên hệ --- (Giữ nguyên)
        $contactKeywords = ['liên hệ', 'địa chỉ', 'cửa hàng ở đâu', 'số điện thoại', 'email', 'giờ mở cửa', 'sdt', 'sđt'];
        foreach ($contactKeywords as $keyword) {
             if (strpos($lowerMessage, $keyword) !== false) {
                $contactInfo = DB::table('page_contact')->first();  
                if ($contactInfo) {
                    $answer = "Thông tin liên hệ của shop:\n" .
                              "- Địa chỉ: {$contactInfo->address}\n" .
                              "- Số điện thoại: {$contactInfo->phone}\n" .
                              "- Email: {$contactInfo->email}\n" .
                              "- Giờ mở cửa: {$contactInfo->open_time} - {$contactInfo->close_time} hàng ngày.";
                    return response()->json(['answer' => $answer, 'source' => 'database_page_contact']);
                }
            }
        }
        
        // =========================================================================
        // ===== 2. Nếu K Có Ý Định Nào Khớp -> Phương Án Dự Phòng 1: Tìm kiếm sản phẩm chung =====
        // =========================================================================
        // (Giữ nguyên logic fallback tìm kiếm sản phẩm chung)
        $stopWords = ['bạn', 'tôi', 'muốn', 'shop', 'bán', 'không', 'giá', 'bao', 'nhiêu', 'cho', 'mình', 'hỏi', 'về', 'sản', 'phẩm', 'loại', 'cái', 'chiếc', 'ạ', 'tư', 'vấn', 'mấy', 'bên', 'cần',
        'tìm', 'một', 'con', 'em', 'hãy', 'của', 'có', 'còn', 'cửa hàng', '?', 'anh', 'chị', 'hãng', 'này'];
        $cleanedMessage = str_replace($stopWords, '', $lowerMessage);
        $cleanedMessage = preg_replace('/[^\p{L}\p{N}\s]/u', '', $cleanedMessage);
        $cleanedMessage = trim(preg_replace('/\s+/', ' ', $cleanedMessage));
        $keywords = array_filter(explode(' ', $cleanedMessage));

        if (!empty($keywords)) {    
            $query = DB::table('products');
            foreach ($keywords as $keyword) {
                $query->where(function($q) use ($keyword) {
                    $q->where('product_name', 'LIKE', '%' . $keyword . '%')
                      ->orWhere('description', 'LIKE', '%' . $keyword . '%');
                });
            }
            $result = $query->limit(3)->get();

            if ($result->count() > 0) {
                $formattedResult = $result->map(function($item) {
                    return "- " . $item->product_name . " (Giá: " . number_format($item->price) . " VNĐ. " . 
                    "Số lượng còn: " . $item->quantity. " chiếc)";
                })->implode("\n");
                $answer = "Mình tìm thấy các sản phẩm sau khớp với yêu cầu của bạn:\n" . $formattedResult;
                return response()->json(['answer' => $answer, 'source' => 'database_products_summary']);
            }
        }

        // =========================================================================
        // ===== 3. Nếu vẫn k có, thì tìm trong (FAQ & GEMINI) =====
        // =========================================================================
        // (Giữ nguyên logic FAQ)
        $faqPath = public_path('faq.json');
        if (file_exists($faqPath)) {
            $faqs = json_decode(file_get_contents($faqPath), true);
            foreach ($faqs as $item) {
                if (stripos($message, $item['question']) !== false) {
                    return response()->json(['answer' => $item['answer'], 'source' => 'faq']);
                }
            }
        }

        // --- PHẦN GỌI GEMINI FALLBACK (ĐÃ SỬA LỖI) ---
        $apiKey = env('GEMINI_API_KEY');
        // Sửa: Dùng model `gemini-1.5-flash` thay vì `2.5` không tồn tại
        $endpoint = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key={$apiKey}";

        $response = Http::post($endpoint, [
            'contents' => [['parts' => [['text' => $message]]]]
        ]);

        $data = $response->json();
        $answer = $data['candidates'][0]['content']['parts'][0]['text'] ?? 'Xin lỗi, tôi chưa có câu trả lời.';
        
        // SỬA LỖI: source của bạn đang bị hardcode thành câu xin lỗi
        return response()->json(['answer' => $answer, 'source' => 'gemini']);
    }

    // =========================================================================
    // ===== HÀM MỚI: DÙNG GEMINI VISION ĐỂ NHẬN DIỆN SẢN PHẨM TỪ ẢNH =====
    // =========================================================================
    
    /**
     * Gửi ảnh đến Gemini 1.5 Flash để lấy tên sản phẩm.
     * @param \Illuminate\Http\UploadedFile $imageFile
     * @return string|null Tên sản phẩm hoặc "UNKNOWN"
     */
    private function _getProductNameFromImage($imageFile)
    {
        try {
            $apiKey = env('GEMINI_API_KEY');
            if (empty($apiKey)) {
                Log::error('GEMINI_API_KEY is not set.');
                return 'UNKNOWN';
            }
            
            // Sử dụng model 1.5 Flash mới nhất hỗ trợ hình ảnh (multimodal)
            $endpoint = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key={$apiKey}";

            // Chuẩn bị dữ liệu ảnh
            $imageData = base64_encode(file_get_contents($imageFile->getRealPath()));
            $mimeType = $imageFile->getMimeType();

            // Prompt này rất quan trọng:
            // Yêu cầu AI chỉ trả về tên sản phẩm để chúng ta dùng truy vấn CSDL.
            $promptText = "Bạn là chuyên gia nhận diện sản phẩm. Hãy xác định tên sản phẩm chính trong hình ảnh này. Chỉ trả lời bằng tên sản phẩm (ví dụ: 'iPhone 15 Pro Max', 'Laptop Dell XPS 15'). Nếu không nhận ra, hãy trả lời 'UNKNOWN'.";

            // Xây dựng payload cho Gemini Vision
            $payload = [
                'contents' => [
                    [
                        'parts' => [
                            ['text' => $promptText], // Câu lệnh prompt
                            [
                                'inline_data' => [ // Dữ liệu ảnh
                                    'mime_type' => $mimeType,
                                    'data' => $imageData
                                ]
                            ]
                        ]
                    ]
                ]
            ];

            $response = Http::timeout(30)->post($endpoint, $payload); // Thêm timeout
            $data = $response->json();

            if (isset($data['candidates'][0]['content']['parts'][0]['text'])) {
                $productName = trim($data['candidates'][0]['content']['parts'][0]['text']);
                // Đôi khi AI trả về nhiều dòng, chỉ lấy dòng đầu tiên
                $productName = explode("\n", $productName)[0]; 
                
                Log::info('Gemini Vision identified: ' . $productName); // Ghi log để debug
                return $productName;
            }
            
            Log::warning('Gemini Vision API response error: ', $data);
            return 'UNKNOWN';

        } catch (\Exception $e) {
            // Ghi log bất kỳ lỗi nào xảy ra (ví dụ: API key sai, hết hạn...)
            Log::error('Gemini Vision API exception: ' . $e->getMessage());
            return 'UNKNOWN';
        }
    }
}