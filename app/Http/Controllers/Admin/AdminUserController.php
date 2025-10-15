<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AdminUserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $users = User::all();   
        return view('admin.user.index', compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }
        /**
     *  Update disale
     */
    public function updateDisable(Request $request, string $id){
        try {
            $user = User::findOrFail($id);
            $disable = $user['disable'];
            if($disable == 0){
                $newDisable = 1;
            }else{
                $newDisable = 0;
            }
            $user->update([
                'disable' => $newDisable
            ]);
            return redirect()->route('admin.user.index');
        } catch (\Throwable $e) {
            return redirect()
                ->back()
                ->withErrors(['error' => 'Error']);
        }
    }
    public function updateRole(Request $request, string $id){
        try {
            $user = User::findOrFail($id);
            $roleId = $user['role_id'];
            if($roleId == 1){
                $newRole = 3;
            }else{
                $newRole = 1;
            }
            $user->update([
                'role_id' => $newRole
            ]);
            return redirect()->route('admin.user.index');
        } catch (\Throwable $e) {
            return redirect()
                ->back()
                ->withErrors(['error' => 'Error']);
        }
    }
    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $user = User::findOrFail($id);
        return view('admin.user.show', compact('user'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
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
        return redirect()->route('admin.user.show', ['id'=>Auth::id()])->with('success', 'Cập nhật hồ sơ thành công');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $user = User::findOrFail($id);
        $user->delete();
        return redirect()
            ->route('admin.user.index')
            ->with('success', 'Xóa thành công');
    }
    public function changePassword(string $id){
        $user = User::findOrFail($id);
        return view('admin.user.change-password', compact('user'));
    }
    public function processChangePassword(Request $request){
        // validate
        try {
            $validated = $request->validate([
                'oldPassword' => 'required',
                'newPassword' => 'required',
                'confirmNewPassword' => 'required'
            ]);
        } catch (\Throwable $e) {
            return redirect()->back()->withInput()->with('error', 'Chưa nhập đầy đủ thông tin');
        }
        try {
            $request->validate([
                'newPassword' => [
                    'min:8',
                    'regex:/[A-Z]/', 
                    'regex:/\d/',
                ],
            ]);
        } catch (\Throwable $e) {
            return redirect()->back()->withInput()->with('error', 'Password must contain at least 8 characters, 1 uppercase letter and 1 number');
        }
        
        $oldPassword = $validated['oldPassword'];
        $newPassword = $validated['newPassword'];
        $confirmNewPassword = $validated['confirmNewPassword'];

        // check password
        $passwordDb = Auth::user()->password;

        if(!Hash::check($oldPassword, $passwordDb)){
            return redirect()->back()->withInput()->with('error', 'Current password is incorrect.');
        }
        if(Hash::check($newPassword, $passwordDb)){
            return redirect()->back()->withInput()->with('error', 'New password can’t be the same as a previous password');
        }
        if ($newPassword !== $confirmNewPassword) {
            return redirect()->back()->withInput()->with('error', 'New password and confirm password do not match.');
        }
        Auth::user()->password = Hash::make($newPassword);
        Auth::user()->save();
        return redirect()->route('admin.user.show', ['id'=>Auth::id()])->with('success', 'Change password successfully');
    }
}
