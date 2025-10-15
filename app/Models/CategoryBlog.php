<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class CategoryBlog extends Model
{
    use HasFactory;
    protected $fillable = [
        'category_name',
        'status'
    ];
    public function posts(){
        return $this->hasMany(Post::class, 'category_id');
    }
    public function quantityPost(){
        return $this->posts()->where('status', 1)->count();
    }
}
