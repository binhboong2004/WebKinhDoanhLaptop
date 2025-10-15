<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class FavouriteController extends Controller
{
    public function index(){
        $favourites = Session::get('favourite');
        return view('user.favourite', compact('favourites'));
    }
    public function addToFavourite($id){
        $product = Product::find($id);
        $favourite = Session::get('favourite');

        if(isset($favourite[$id])){
            return redirect()->back()->with('error', 'This product has been added to your favorites');
        }else{
            $favourite[$id] = [
                "id" => $product->id,
                "name" => $product->product_name,
                "image" => $product->image,
                "price" => $product->price,
            ];
        }
        Session::put('favourite', $favourite);
        return redirect()->back()->with('success', 'Product added to favourite successfully');
    }
    public function deleteFavourite($id){
        $favourite = Session::get('favourite');
        if(isset($favourite[$id])){
            unset($favourite[$id]);
            Session::put('favourite', $favourite);
        }
        return redirect()->back();
    }
}
