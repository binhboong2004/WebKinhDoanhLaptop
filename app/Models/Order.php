<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'order_number',
        'total',
        'shipping_address',
        'phone',
        'email',
        'note',
        'payment_method',
        'status'
    ];
    protected $casts = [
        // 'total' => 'integer'
    ];
    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
    public function orderDetails(){
        return $this->belongsTo(OrderDetail::class, 'id', 'order_id');
    }
}
