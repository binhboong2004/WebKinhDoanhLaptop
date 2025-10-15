<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PageContact;
use Illuminate\Http\Request;

class AdminPageContactController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $contact = PageContact::find(1);
        return view('admin.page.contact', compact('contact'));
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
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
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
    public function update(Request $request, string $id = '1')
    {
        try {
            // Validate the incoming request data
            $validatedData = $request->validate([
                'phone' => 'required|string|max:255',
                'address' => 'required|string|max:255',
                'open_time' => 'required|string|max:255',
                'close_time' => 'required|string|max:255',
                'email' => 'required|email|max:255',
                'url_iframe' => 'nullable|string',
            ]);
        } catch (\Throwable $e) {
            return redirect()->back()->withInput()->with('error', 'Not filled in all information');
        }
        // Find the contact by ID, in this case, it's fixed to 1
        $contact = PageContact::findOrFail($id);

        // Update the contact's details
        $contact->phone = $validatedData['phone'];
        $contact->address = $validatedData['address'];
        $contact->open_time = $validatedData['open_time'];
        $contact->close_time = $validatedData['close_time'];
        $contact->email = $validatedData['email'];
        $contact->url_iframe = $validatedData['url_iframe'];

        // Save the changes to the database
        $contact->save();

        // Redirect back with a success message
        return redirect()->route('admin.page.contact.index')->with('success', 'Contact information updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
