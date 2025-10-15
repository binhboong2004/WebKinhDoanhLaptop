<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class AdminCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $categories = Category::orderBy('created_at', 'desc')->get();
        return view('admin.category.index', compact('categories'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.category.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            // validate
            $validateData = $request->validate([
                'category_name' => 'required|string',
                'image' => 'image|required',
            ]);

            // upload image
            $imagePath = $request->file('image')->store('categories', 'public');

            // create category
            Category::create([
                'category_name' => $validateData['category_name'],
                'image' => $imagePath,
                'status' => 0
            ]);

            // return
            return redirect()->route('admin.category.index')->with('success', 'Thêm danh mục thành công');
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
            $category = Category::findOrFail($id);
            $category->update([
                'status' => $newStatus
            ]);
            return redirect()->route('admin.category.index');
        } catch (\Throwable $e) {
            return redirect()->back()->withErrors(['error' => 'Error']);
        }
    }
    /**
    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $category = Category::find($id);
        return view('admin.category.edit', compact('category'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        try {
            // validate
            $validateData = $request->validate([
                'category_name' => 'required|string',
                'image' => 'image'
            ]);
    
            $category = Category::findOrFail($id);
            $imageOld = $category->image;

            if($request->hasFile('image')){
                // upload new image
                $imagePath = $request->file('image')->store('categories', 'public');
            }else{
                $imagePath = $imageOld;
            }
            // create category
            $category->update([
                'category_name' => $validateData['category_name'],
                'image' => $imagePath
            ]);
            // return
            return redirect()->route('admin.category.index')->with('success', 'Cập nhật danh mục thành công');
        } catch (\Throwable $e) {
            Storage::delete($imagePath);
            return redirect()->back()->withInput()->withErrors(['error' => 'Error']);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $category = Category::findOrFail($id);
        $category->delete();
        return redirect()->route('admin.category.index')->with('success', 'Xóa danh mục thành công');
    }
}
