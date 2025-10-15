<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PageContact extends Model
{
    use HasFactory;
    protected $table = 'page_contact';
    protected $fillable = [
        'phone',
        'address',
        'open_time',
        'close_time',
        'email',
        'url_iframe',
    ];
}
