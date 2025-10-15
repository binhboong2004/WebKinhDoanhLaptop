<?php

namespace App\Http\Controllers;

use App\Models\Email;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;
    public $totalEmail;
    public function __construct(){
        $this->totalEmail = $this->totalEmail();
    }
    public function totalEmail(){
        return Email::count();
    }
}
