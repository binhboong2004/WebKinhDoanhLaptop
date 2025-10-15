<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Support\Facades\Session;

class CartController extends Controller
{
    public function index(){
        $carts = Session::get('cart');
        return view('user.cart', compact('carts'));
    }
    public function addToCart($id, $quantity){
        $product = Product::find($id);
        $cart = Session::get('cart');

        if(isset($cart[$id])){
            $cart[$id]['quantity'] += $quantity;
        }else{
            $cart[$id] = [
                "id" => $product->id,
                "name" => $product->product_name,
                "image" => $product->image,
                "price" => $product->price,
                "quantity" => 1
            ];
        }
        Session::put('cart', $cart);
        return redirect()->back()->with('success', 'Đã thêm vào giỏ hàng');
    }
    public function quantityControl($id, $action){
        $product = Product::find($id);
        $cart = Session::get('cart');
        if(isset($cart[$id])){
            if($action === 'up'){
                $cart[$id]['quantity'] ++;
            }
            if($action === 'down'){
                $cart[$id]['quantity'] --;
            }
        }
        Session::put('cart', $cart);
        return redirect()->back();
    }
    public function deleteCart($id){
        $cart = Session::get('cart');
        if(isset($cart[$id])){
            unset($cart[$id]);
            Session::put('cart', $cart);
        }
        return redirect()->back();
    }
}
