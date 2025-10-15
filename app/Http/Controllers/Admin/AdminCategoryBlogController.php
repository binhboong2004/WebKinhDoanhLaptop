<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\CategoryBlog;
use Illuminate\Http\Request;

class AdminCategoryBlogController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $categories = CategoryBlog::all();
        return view('admin.blog.category.index', compact('categories'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.blog.category.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $validateData = $request->validate([
                'category_name' => 'required',
            ]);
            CategoryBlog::create([
                'category_name' => $validateData['category_name'],
                'status' => 0
            ]);
            return redirect()
                ->route('admin.blog.category.index')
                ->with('success', 'Added category blog successfully');
        } catch (\Throwable $e) {
            return redirect()
                ->back()
                ->withInput()->withErrors(['error' => 'Error']);
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
        $category = CategoryBlog::findOrFail($id);
        return view('admin.blog.category.edit', compact('category'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        try {
            $validateData = $request->validate([
                'category_name' => 'required',
            ]);
            $category = CategoryBlog::findOrFail($id);
            $category->update([
                'category_name' => $validateData['category_name'],
            ]);
            return redirect()
                ->route('admin.blog.category.index')
                ->with('success', 'Updated category blog successfully');
        } catch (\Throwable $e) {
            return redirect()
                ->back()
                ->withInput()->withErrors(['error' => 'Error']);
        }
    }
    public function updateStatus(Request $request, string $id){
        $validateData = $request->validate([
            'status' => 'required|numeric'
        ]);
        $status = $validateData['status'];
        if($status == 0){
            $newStatus = 1;
        }else{
            $newStatus = 0;
        }
        $category = CategoryBlog::findOrFail($id);
        $category->update([
            'status' => $newStatus
        ]);
        return redirect()->route('admin.blog.category.index');
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $category = CategoryBlog::findOrFail($id);
        $category->delete();
        return redirect()
            ->route('admin.blog.category.index')
            ->with('success', 'Deleted category blog successfully');;
    }
}
