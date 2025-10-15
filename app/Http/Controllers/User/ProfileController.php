<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProfileController extends Controller
{
    public function index(){
        $user = User::findOrFail(Auth::id());
        return view('user.profile', compact('user'));
    }
    public function edit(){
        $user = User::findOrFail(Auth::id());
        return view('user.profile-edit', compact('user'));
    }
    public function update(Request $request){
        // validate
        try {
            $validated = $request->validate([
                'name' => 'required',
                'address' => 'required',
                'phone' => 'required',
                'email' => 'required'
            ]);
        } catch (\Throwable $e) {
            return redirect()->back()->withInput()->with('error', 'Chưa nhập đầy đủ thông tin');
        }
        $user = User::findOrFail(Auth::id());
        if($request->hasFile('avatar')){
            $avatarPath = $request->file('avatar')->store('avatar', 'public');
            $user->avatar = $avatarPath;
        }
        $user->update([
            'name' => $validated['name'],
            'address' => $validated['address'],
            'phone' => $validated['phone'],
            'email' => $validated['email']
        ]);
        return redirect()->route('user.profile')->with('success', 'Cập nhật thành công');
    }
}
