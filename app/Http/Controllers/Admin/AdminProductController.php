<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class AdminProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $products = Product::orderBy('created_at', 'desc')->get();
        return view('admin.product.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = Category::all();
        return view('admin.product.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // validate
        $validateData = $request->validate([
            'product_name' => 'required|string',
            'image' => 'required|image',
            'price' => 'required|numeric',
            'discount' => 'nullable|numeric',
            'information' => 'required',
            'description' => 'required',
            'quantity' => 'required|numeric',
            'category_id' => 'required|exists:categories,id',
        ]);

        // create product
        try {
            // upload image
            $imagePath = $request->file('image')->store('products', 'public');
            Product::create([
                'product_name' => $validateData['product_name'],
                'image' => $imagePath,
                'price' => $validateData['price'],
                'discount' => $validateData['discount'] ?? 0,
                'information' => $validateData['information'],
                'description' => $validateData['description'],
                'quantity' => $validateData['quantity'],
                'status' => 0,
                'category_id' => $validateData['category_id']
            ]);
            return redirect()
                ->route('admin.product.index')
                ->with('success', 'Thêm sản phẩm thành công');
        } catch (\Throwable $e) {
            Storage::delete($imagePath);
            return redirect()
                ->back()
                ->withInput()
                ->withErrors(['error' => 'Error']);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     *  Update status
     */
    public function updateStatus(Request $request, string $id){
        try {
            $validateData = $request->validate([
                'status' => 'required|numeric'
            ]);
            $status = $validateData['status'];
            if($status == 0){
                $newStatus = 1;
            }else{
                $newStatus = 0;
            }
            $product = Product::findOrFail($id);
            $product->update([
                'status' => $newStatus
            ]);
            return redirect()->route('admin.product.index');
        } catch (\Throwable $e) {
            return redirect()
                ->back()
                ->withErrors(['error' => 'Error']);
        }
    }
    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $categories = Category::all();
        $product = Product::findOrFail($id);
        return view('admin.product.edit', compact('product', 'categories'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        try {
            // validate
            $validateData = $request->validate([
                'product_name' => 'required|string',
                'image' => 'image',
                'price' => 'required|numeric',
                'discount' => 'nullable|numeric',
                'information' => 'required',
                'description' => 'required',
                'quantity' => 'required|numeric',
                'category_id' => 'required|exists:categories,id',
            ]);

            $product = Product::findOrFail($id);
            $imageOld = $product->image;

            // check upload immage
            if($request->hasFile('image')){
                $imagePath = $request->file('image')->store('products', 'public');
            }else{
                $imagePath = $imageOld;
            }

            // update product
            $product->update([
                'product_name' => $validateData['product_name'],
                'image' => $imagePath,
                'price' => $validateData['price'],
                'discount' => $validateData['discount'] ?? 0,
                'information' => $validateData['information'],
                'description' => $validateData['description'],
                'quantity' => $validateData['quantity'],
                'category_id' => $validateData['category_id'],
            ]);

            return redirect()
                ->route('admin.product.index')
                ->with('success', 'Cập nhật sản phẩm thành công');
        } catch (\Throwable $e) {
            Storage::delete($imagePath);
            return redirect()
                ->back()
                ->withInput()
                ->withErrors(['error' => 'Error']);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $product = Product::findOrFail($id);
        $product->delete();
        return redirect()
            ->route('admin.product.index')
            ->with('success', 'Xóa sản phẩm thành công');
    }
}
