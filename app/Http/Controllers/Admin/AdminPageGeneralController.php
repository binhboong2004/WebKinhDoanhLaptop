<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PageGeneral;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class AdminPageGeneralController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $general = PageGeneral::find(1);
        return view('admin.page.general', compact('general'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
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
        // Validate the incoming request data
        $validatedData = $request->validate([
            'logo' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'app_name' => 'required|string|max:255',
            'welcome' => 'required|string|max:255',
        ]);
    
        // Find the general settings by ID, in this case, it's fixed to 1
        $general = PageGeneral::findOrFail($id);
    
        // Handle logo upload
        if ($request->hasFile('logo')) {
            // Delete the old logo if exists
            if ($general->logo) {
                Storage::delete('public/' . $general->logo);
            }
    
            // Store the new logo
            $path = $request->file('logo')->store('logos', 'public');
            $general->logo = $path;
        }
    
        // Update the other details
        $general->app_name = $validatedData['app_name'];
        $general->welcome = $validatedData['welcome'];
    
        // Save the changes to the database
        $general->save();
    
        // Redirect back with a success message
        return redirect()->route('admin.page.general.index')->with('success', 'General settings updated successfully.');
    }
    

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
