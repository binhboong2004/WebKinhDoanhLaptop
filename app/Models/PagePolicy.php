<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PagePolicy extends Model
{
    use HasFactory;
    protected $table = 'page_policy';
    protected $fillable = [
        'content'
    ];
}
