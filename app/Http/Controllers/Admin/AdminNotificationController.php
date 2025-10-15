<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Notification;

class AdminNotificationController extends Controller
{
    public function store(string $content, string $type, string $id_link){
        $notification = new Notification();
        $notification->content = $content;
        $notification->type = $type;
        $notification->id_link = $id_link;
        $notification->save();
        if($notification){  
            return true;
        }else{
            return false;
        }
    }
    public function clear(){
        Notification::truncate();
        return redirect()->back();
    }
}
