<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Image;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class AdminImageController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(string $id)
    {
        $product = Product::findOrFail($id);
        $images = Image::where('product_id', $id)->get();
        return view('admin.product.image', compact('images', 'product'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request, string $id)
    {
        try {
            // validate
            $validateData = $request->validate([
                'image' => 'required|image'
            ]);
            // upload
            $imagePath = $request->file('image')->store('image-more', 'public');
            // create image
            Image::create([
                'product_id' => $id,
                'image' => $imagePath
            ]);
            return redirect()->back()->with('success', 'Added image successfully');
        } catch (\Throwable $e) {
            Storage::delete($imagePath);
            return redirect()->back()->withInput()->withErrors(['error' => 'Error']);
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
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $image = Image::findOrFail($id);
        $image->delete();
        return redirect()->back()->with('success', 'Deleted image successfully');
    }
}
