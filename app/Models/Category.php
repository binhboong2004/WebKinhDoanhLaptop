<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;
    protected $fillable = [
        'category_name',
        'image',
        'status'
    ];
    public function products(){
        return $this->hasMany(Product::class, 'category_id');
    }
    public function quantityProduct(){
        return $this->products()->where(['status' => 1])->count();
    }
}
