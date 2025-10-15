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
        return redirect()->route('home.index')->with('success', 'Thanh toán thành công');
    }
}
