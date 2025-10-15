<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CategoryBlog;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class AdminPostController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $posts = Post::all();
        return view('admin.blog.post.index', compact('posts'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = CategoryBlog::all();
        return view('admin.blog.post.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $validateData = $request->validate([
                'title' => 'required|string',
                'category_id' => 'required|integer|exists:category_blogs,id',
                'image' => 'required|image',
                'description' => 'required',
                'content' => 'required'
            ]);
            // upload image
            $imagePath = $request->file('image')->store('post', 'public');
            // create
            $userId = auth()->id();
            Post::create([
                'user_id' => $userId,
                'title' => $validateData['title'],
                'category_id' => $validateData['category_id'],
                'image' => $imagePath,
                'description' => $validateData['description'],
                'content' => $validateData['content'],
                'status' => 0
            ]);
            return redirect()->route('admin.blog.post.index')->with('success', 'Added post successfully');
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
        $categories = CategoryBlog::all();
        $post = Post::findOrFail($id);
        return view('admin.blog.post.edit', compact('post', 'categories'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        try {
            $validateData = $request->validate([
                'title' => 'required|string',
                'category_id' => 'required|integer|exists:category_blogs,id',
                'image' => 'image',
                'description' => 'required',
                'content' => 'required'
            ]);
            $post = Post::findOrFail($id);
            $imageOld = $post['image'];
            if($request->hasFile('image')){
                $imagePath = $request->file('image')->store('post', 'public');
            }else{
                $imagePath = $imageOld;
            }
            // create
            $post->update([
                'title' => $validateData['title'],
                'category_id' => $validateData['category_id'],
                'image' => $imagePath,
                'description' => $validateData['description'],
                'content' => $validateData['content'],
            ]);
            return redirect()->route('admin.blog.post.index')->with('success', 'Updated post successfully');
        } catch (\Throwable $e) {
            Storage::delete($imagePath);
            return redirect()->back()->withInput()->withErrors(['error' => 'Error']);
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
        $post = Post::findOrFail($id);
        $post->update([
            'status' => $newStatus
        ]);
        return redirect()->route('admin.blog.post.index');
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $post = Post::find($id);
        $post->delete();
        return redirect()
            ->route('admin.blog.post.index')
            ->with('success', 'Deleted post successfully');
    }
}
