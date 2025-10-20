<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Admin\AdminNotificationController;
use App\Http\Controllers\Controller;
use App\Models\Notification;
use App\Models\Order;
use App\Models\OrderDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class CheckoutController extends Controller
{
    public function index(){
        if(Auth::user() === null){
            return redirect()->route('login');
        }
        $carts = Session::get('cart');
        if(empty($carts)){
            return redirect()->route('user.cart');
        }
        return view('user.checkout', compact('carts'));
    }
    
    public function process(Request $request){
        $carts = Session::get('cart');
        // check login
        if(Auth::user() === null){
            return redirect()->route('login');
        }
        // check cart
        if(empty($carts)){
            return redirect()->route('user.cart');
        }
        // check click
        if(!isset($_POST["checkout"])){
            return redirect()->route('user.checkout');
        }
        // validate
        try {
            $validated = $request->validate([
                'address' => 'required|string',
                'phone' => 'required',
                'email' => 'required',
                'total' => 'required|numeric',
                'payment' => 'required'
            ]);
        } catch (\Throwable $e) {
            return redirect()->back()->withInput()->with('error', 'Chưa nhập đầy đủ thông tin');
        }
        $orderNumber = 'ORD-' . strtoupper(substr( bin2hex(random_bytes(5)), 0, 5));
        // create order
        $order = Order::create([
            'user_id' => Auth::id(),
            'order_number' => $orderNumber,
            'total' => $validated['total'],
            'shipping_address' => $validated['address'],
            'phone' => $validated['phone'],
            'email' => $validated['email'],
            'note' => $validated['note'] ?? 0,
            'payment_method' => $validated['payment'],
            'status' => 'pending'
        ]);
        $orderId = $order->id;
        // create order details
        foreach ($carts as $cart) {
            OrderDetail::create([
                'order_id' => $orderId,
                'product_id' => $cart['id'],
                'price' => $cart['price'],
                'quantity' => $cart['quantity']
            ]);
        }
        (new AdminNotificationController)->store('Đơn hàng mới từ ' . Auth::user()->name, 'order', $orderId);
        Session::forget('cart'); // delete cart session
        //Nếu là chuyển khoản ngân hàng, chuyển sang trang QR ngân hàng
        if ($validated['payment'] === 'Chuyển Khoản Ngân Hàng') {
            return redirect()->route('user.checkout.bank-transfer')
                ->with('total', $validated['total'])
                ->with('order_number', $orderNumber);
        }
        //Nếu là ZaloPay, chuyển sang trang ZaloPay QR
        elseif ($validated['payment'] === 'Quét Mã ZaloPay') {
            return redirect()->route('user.checkout.zalopay')
                ->with('total', $validated['total'])
                ->with('order_number', $orderNumber);
        }
        //Nếu là MoMo, chuyển sang trang MoMo QR
        elseif ($validated['payment'] === 'Quét Mã Momo') {
            return redirect()->route('user.checkout.momo')
                ->with('total', $validated['total'])
                ->with('order_number', $orderNumber);
        }

        // Nếu là Thanh toán khi nhận hàng, về trang chủ
        return redirect()->route('home.index')->with('success', 'Thanh toán thành công');
    }

    //Hiển thị trang thanh toán Chuyển khoản ngân hàng
    public function bankTransfer(){
        // Kiểm tra xem có thông tin đơn hàng trong session không
        if(!Session::has('total') || !Session::has('order_number')){
            return redirect()->route('home.index');
        }

        $total = Session::get('total');
        $orderNumber = Session::get('order_number');

        // Thông tin tài khoản ngân hàng
        $bankAccount = '6802122004';
        $bankName = 'MBBank';
        $accountName = 'VU DUY BINH';
        // Tạo nội dung chuyển khoản (sử dụng mã đơn hàng)
        $addInfo = urlencode($orderNumber);
        
        // Tạo URL cho ảnh QR
        $qrUrl = "https://img.vietqr.io/image/{$bankName}-{$bankAccount}-compact2.png?amount={$total}&addInfo={$addInfo}&accountName={$accountName}";

        return view('user.bank-transfer', compact('total', 'orderNumber', 'qrUrl', 'bankAccount', 'accountName', 'bankName'));
    }

    //Hiển thị trang thanh toán ZaloPay
    public function zaloPay(){
        // Kiểm tra xem có thông tin đơn hàng trong session không
        if(!Session::has('total') || !Session::has('order_number')){
            return redirect()->route('home.index');
        }

        $total = Session::get('total');
        $orderNumber = Session::get('order_number');

        return view('user.zalopay', compact('total', 'orderNumber'));
    }

    //Hiển thị trang thanh toán Momo
    public function momo(){
        // Kiểm tra xem có thông tin đơn hàng trong session không
        if(!Session::has('total') || !Session::has('order_number')){
            return redirect()->route('home.index');
        }

        $total = Session::get('total');
        $orderNumber = Session::get('order_number');

        return view('user.momo', compact('total', 'orderNumber'));
    }

}