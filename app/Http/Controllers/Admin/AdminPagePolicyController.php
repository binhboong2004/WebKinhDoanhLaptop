<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PagePolicy;
use Illuminate\Http\Request;

class AdminPagePolicyController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $policy = PagePolicy::find(1);
        return view('admin.page.policy', compact('policy'));
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
        // Validate the incoming request data
        $validatedData = $request->validate([
            'content' => 'nullable|string',
        ]);
    
        // Find the policy by ID, in this case, it's fixed to 1
        $policy = PagePolicy::findOrFail($id);
    
        // Update the policy's content
        $policy->content = $validatedData['content'];
    
        // Save the changes to the database
        $policy->save();
    
        // Redirect back with a success message
        return redirect()->route('admin.page.policy.index')->with('success', 'Policy content updated successfully.');
    }
    

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
