<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
    public function index(){
        $orders = Order::where('user_id', Auth::id())->orderBy('created_at', 'desc')->get();
        return view('user.my-order', compact('orders'));
    }
    public function show(string $id){
        $orderDetails = OrderDetail::where('order_id', $id)->get();
        return view('user.my-order-details', compact('orderDetails'));
    }
    public function destroy(string $id){
        $order = Order::findOrFail($id);
        $order->delete();
        return redirect()->back()->with('success', 'Deleted order successfully');
    }
}
