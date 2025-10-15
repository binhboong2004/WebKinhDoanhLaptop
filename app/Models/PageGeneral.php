<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PageGeneral extends Model
{
    use HasFactory;
    protected $table = 'page_general';
    protected $fillable = [
        'logo',
        'app_name',
        'welcome',
    ];
}
