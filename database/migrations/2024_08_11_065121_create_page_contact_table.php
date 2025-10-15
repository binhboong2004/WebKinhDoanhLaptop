<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('page_contact', function (Blueprint $table) {
            $table->id();
            $table->string('phone')->default('0366461704');
            $table->string('address')->default('Đà Nẵng');
            $table->string('open_time')->default('10:00 am');
            $table->string('close_time')->default('23:00 pm');
            $table->string('email')->default('nghiadaica@gmail.com');
            $table->string('url_iframe')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('page_contact');
    }
};
