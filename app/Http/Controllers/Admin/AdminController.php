<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Product;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    public function index(){
        $totalOrders = Order::count();
        $totalUsers = User::count();
        $totalProducts = Product::count();
        // total price 1 month
        $currentDate = Carbon::now();
        $startDate = $currentDate->subMonth()->startOfMonth();
        $endDate = $startDate->copy()->endOfMonth();
        $totalPrice1Month = Order::where('status', 3)->whereBetween('created_at', [$startDate, $endDate])->sum('total');
        // top selling
        $topSelling = $this->topSellingProduct(4);
        return view('admin.index', compact('totalOrders', 'totalUsers', 'totalProducts', 'totalPrice1Month', 'topSelling'));
    }
    public function topSellingProduct($limit, $status = null){
        $query = Product::select('products.*', DB::raw('SUM(order_details.quantity) as total_quantity'))
        ->join('order_details', 'products.id', '=', 'order_details.product_id')
        ->join('categories', 'categories.id', '=', 'products.category_id')
        ->groupBy('products.id')
        ->orderBy('total_quantity', 'desc')
        ->limit($limit);
        if(!is_null($status)){
            $query->where('products.status', $status);
        }
        $topSelling = $query->get();
        return $topSelling;
    }
}
 