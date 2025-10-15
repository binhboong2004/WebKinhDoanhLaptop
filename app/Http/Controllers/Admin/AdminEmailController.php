<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Email;
use Illuminate\Http\Request;

class AdminEmailController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $emails = Email::all();
        return view('admin.email.index', compact('emails'));
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
        if(!isset($_POST["send"])){
            return redirect()->back();
        }
        try {
            $validated = $request->validate([
                'name' => 'required|string',
                'email' => 'required|string',
                'content' => 'required'
            ]);
        } catch (\Throwable $e) {
            return redirect()->back()->withInput()->with('error', 'Not filled in all information');
        }
        Email::create([
            'name' => $validated['name'],
            'email' => $validated['email'],
            'content' => $validated['content']
        ]);
        return redirect()->back()->with('success', 'Send message successfully');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $email = Email::findOrFail($id);
        return view('admin.email.show', compact('email'));
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
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $email = Email::findOrFail($id);
        $email->delete();
        return redirect()
            ->route('admin.email.index')
            ->with('Deleted email successfully');
    }
}
