<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;

class ChatbotController extends Controller
{
    public function handle(Request $request)
    {
        $message = trim($request->input('message'));
        if (empty($message)) {
            return response()->json(['answer' => 'Xin vui lòng nhập câu hỏi.']);
        }
        
        $lowerMessage = mb_strtolower($message, 'UTF-8');

        // =========================================================================
        // ===== 1. PHÂN TÍCH Ý ĐỊNH NGƯỜI DÙNG (CÁC TRƯỜNG HỢP ƯU TIÊN) =====
        // =========================================================================

        // --- Ý định 1: Hỏi chi tiết/cấu hình về một sản phẩm cụ thể ---
        $detailKeywords = ['chi tiết', 'cấu hình', 'thông tin', 'mô tả'];
        foreach ($detailKeywords as $keyword) {
            if (strpos($lowerMessage, $keyword) !== false) {
                
                // Danh sách các từ nhiễu cần loại bỏ khi hỏi chi tiết
                $stopWordsForDetails = ['bạn', 'tôi', 'muốn', 'xem', 'shop', 'có', 'bán', 'không', 'giá', 'của', 'cho', 'mình', 'hỏi', 'về', 'sản', 'phẩm',
                 'loại', 'cái', 'chiếc', 'ạ', 'tư', 'vấn', 'chi tiết', 'cấu hình', 'thông tin', 'mô tả'];
                
                // Làm sạch câu hỏi để chỉ giữ lại các từ khóa tên sản phẩm
                $cleanedMessage = str_ireplace($stopWordsForDetails, '', $lowerMessage);
                $cleanedMessage = trim(preg_replace('/\s+/', ' ', $cleanedMessage));
                $productKeywords = array_filter(explode(' ', $cleanedMessage));

                if (!empty($productKeywords)) {
                    $query = DB::table('products');
                    
                    // Tìm sản phẩm chứa tất cả các từ khóa tên
                    foreach ($productKeywords as $pKeyword) {
                        $query->where('product_name', 'LIKE', '%' . $pKeyword . '%');
                    }
                    
                    $product = $query->first(); // Lấy kết quả phù hợp nhất

                    if ($product) {
                        $answer = "Đây là thông tin chi tiết về sản phẩm bạn yêu cầu:\n" .
                                  "- Thông tin: " . strip_tags($product->information);
                        return response()->json(['answer' => $answer, 'source' => 'database_product_details']);
                    }
                }

                return response()->json(['answer' => 'Bạn muốn xem chi tiết của sản phẩm nào ạ? Vui lòng cho mình biết tên sản phẩm nhé.', 'source' . 'intent_helper_details']);
            }
        }

        // --- Ý định 2: Hỏi về tình trạng đơn hàng ---
        if (strpos($lowerMessage, 'đơn hàng') !== false || strpos($lowerMessage, 'tình trạng đơn') !== false) {
            preg_match('/(ORD-[A-Z0-9]+)/i', $message, $matches);
            if (!empty($matches[1])) {
                $orderNumber = strtoupper($matches[1]);
                $order = DB::table('orders')->where('order_number', $orderNumber)->first();
                if ($order) {
                    $statusTranslations = ['pending' => 'đang chờ xử lý', 'completed' => 'đã hoàn thành', 'delivering' => 'đang giao hàng', 'cancelled' => 'đã hủy'];
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

        // --- Ý định 3: Hỏi về thông tin liên hệ ---
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
        //các từ để tìm kiếm sản phẩm (loại bỏ các từ này->tìm kiếm sản phẩm)
        $stopWords = ['bạn', 'tôi', 'muốn', 'shop', 'bán', 'không', 'giá', 'bao', 'nhiêu', 'cho', 'mình', 'hỏi', 'về', 'sản', 'phẩm', 'loại', 'cái', 'chiếc', 'ạ', 'tư', 'vấn', 'mấy', 'bên', 'cần',
        'tìm', 'một', 'con', 'em', 'hãy', 'của', 'có', 'còn'];
        $cleanedMessage = str_replace($stopWords, '', $lowerMessage);
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
                    return "- " . $item->product_name . " (Giá: " . number_format($item->price) . " VNĐ)";
                })->implode("\n");
                $answer = "Mình tìm thấy các sản phẩm sau khớp với yêu cầu của bạn:\n" . $formattedResult;
                return response()->json(['answer' => $answer, 'source' => 'database_products_summary']);
            }
        }

        // =========================================================================
        // ===== 3. Nếu vẫn k có, thì tìm trong (FAQ & GEMINI) =====
        // =========================================================================
        $faqPath = public_path('faq.json');
        if (file_exists($faqPath)) {
            $faqs = json_decode(file_get_contents($faqPath), true);
            foreach ($faqs as $item) {
                if (stripos($message, $item['question']) !== false) {
                    return response()->json(['answer' => $item['answer'], 'source' => 'faq']);
                }
            }
        }

        $apiKey = env('GEMINI_API_KEY');
        $endpoint = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key={$apiKey}";

        $response = Http::post($endpoint, [
            'contents' => [['parts' => [['text' => $message]]]]
        ]);

        $data = $response->json();
        $answer = $data['candidates'][0]['content']['parts'][0]['text'] ?? 'Xin lỗi, tôi chưa có câu trả lời.';
        return response()->json(['answer' => $answer, 'source' =>'Xin lỗi, mình chưa hiểu ý bạn. Bạn có thể hỏi một câu hỏi khác được không ạ?']);
    }
}