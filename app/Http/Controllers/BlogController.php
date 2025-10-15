<?php

namespace App\Http\Controllers;

use App\Models\CategoryBlog;
use App\Models\Post;
use Illuminate\Http\Request;

class BlogController extends Controller
{
    protected $categoryBlog;
    protected $post;

    public function __construct(CategoryBlog $categoryBlog, Post $post)
    {
        $this->categoryBlog = $categoryBlog;
        $this->post = $post;
    }

    public function blog(){
        $categoryBlogs = $this->getCategoryBlog();
        $newBlogs = $this->getNewBlog();
        $blogs = $this->post->where(['status' => 1])->get();
        $title = "All post";
        return view('home.blog', compact('categoryBlogs', 'newBlogs', 'blogs', 'title'));
    }

    public function blogDetails(string $id){
        $categoryBlogs = $this->getCategoryBlog();
        $newBlogs = $this->getNewBlog();
        $post = $this->post->where('status', 1)->findOrFail($id);
        $content = $post->content;
        $postMayLikes = $this->post->where('category_id', $post->category_id)->where('id', '!=', $id)->limit(3)->get();
        return view('home.blog-details', compact('post', 'content', 'categoryBlogs', 'newBlogs', 'postMayLikes'));
    }

    private function getCategoryBlog(){
        return $this->categoryBlog->where('status', 1)->get();
    }

    private function getNewBlog(){
        return $this->post->where(['status' => 1])->orderBy('created_at', 'desc')->limit(3)->get();
    }
    public function search(){
        if(empty($_POST["keyword"])){
            return redirect()->back()->with('error', 'Empty keyword');
        }
        $keyword = '%' . $_POST["keyword"] . '%';
        $categoryBlogs = $this->getCategoryBlog();
        $newBlogs = $this->getNewBlog();
        $blogs = Post::where('title', 'LIKE' , $keyword)->get();
        $title = 'Result search';
        return view('home.blog', compact('blogs', 'categoryBlogs', 'newBlogs', 'title'));
    }
    public function filter($id){
        $categoryBlogs = $this->getCategoryBlog();
        $newBlogs = $this->getNewBlog();
        $blogs = Post::where('category_id', $id)->get();
        $title = 'Result filter';
        return view('home.blog', compact('blogs', 'categoryBlogs', 'newBlogs', 'title'));
    }
}
