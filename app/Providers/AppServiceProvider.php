<?php

namespace App\Providers;

use App\Models\Category;
use App\Models\Notification;
use App\Models\PageContact;
use App\Models\PageGeneral;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        /* ---------------------------------- Client ---------------------------------- */
        $categories = Category::where('status', 1)->get();
        $contact = PageContact::find(1);
        $general = PageGeneral::find(1);
        /* ---------------------------------- Client ---------------------------------- */
        /* ---------------------------------- Admin --------------------------------- */
        $notifications = Notification::all();
        /* ---------------------------------- Admin --------------------------------- */
        // share
        View::share([
            'categories' => $categories,
            'contact' => $contact,
            'general' => $general,
            // admin
            'notifications' => $notifications,
        ]);
    }
}

