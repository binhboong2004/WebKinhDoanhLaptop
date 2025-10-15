<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Log;

class ChatController extends Controller
{
    public function chat(Request $request)
    {
        $request->validate([
            'message' => 'required|string',
            'session_id' => 'nullable|string',
        ]);

        $message = $request->input('message');
        $session = $request->input('session_id') ?? uniqid();

        $systemPrompt = "Bạn là trợ lý bán hàng cho website laptop. Trả lời ngắn gọn, lịch sự, chính xác về sản phẩm hoặc cửa hàng.";

        $client = new Client();
        $apiKey = env('OPENAI_API_KEY');

        try {
            $response = $client->post('https://api.openai.com/v1/chat/completions', [
                'headers' => [
                    'Authorization' => "Bearer {$apiKey}",
                    'Content-Type'  => 'application/json',
                ],
                'json' => [
                    'model' => 'gpt-4o-mini',
                    'messages' => [
                        ['role' => 'system', 'content' => $systemPrompt],
                        ['role' => 'user', 'content' => $message],
                    ],
                    'max_tokens' => 300,
                    'temperature' => 0.2,
                ],
            ]);

            $body = json_decode($response->getBody()->getContents(), true);
            $reply = $body['choices'][0]['message']['content'] ?? 'Xin lỗi, mình chưa trả lời được.';

        } catch (\Exception $e) {
            Log::error("OpenAI error", ['message' => $e->getMessage(), 'trace' => $e->getTraceAsString()]);
return response()->json([
    'reply' => "Có lỗi: ".$e->getMessage()
]);
            $reply = "Xin lỗi, hiện tại hệ thống đang bận.";
        }

        return response()->json([
            'reply' => $reply,
            'session_id' => $session,
        ]);
    }
}