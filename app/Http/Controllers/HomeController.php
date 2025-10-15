<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Admin\AdminController;
use App\Models\PagePolicy;
use App\Models\Post;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Models\User;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    /* ---------------------------------- HOME ---------------------------------- */
    public function index(){
        $products = Product::limit(9)->where('status', 1)->get();
        $adminController = new AdminController();
        $topSellingProducts = $adminController->topSellingProduct(12, 1);
        $blogs = Post::limit(3)->where('status', 1)->get();
        return view('home.index', compact('products', 'topSellingProducts', 'blogs'));
    }
    public function contact(){
        return view('home.contact');
    }
    public function policy(){
        $policy = PagePolicy::find(1) ?? "";
        return view('home.policy', compact('policy'));
    }
    /* ---------------------------------- HOME ---------------------------------- */
}
