<?php

use App\Http\Controllers\Admin\AdminCategoryBlogController;
use App\Http\Controllers\Admin\AdminCategoryController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\AdminEmailController;
use App\Http\Controllers\Admin\AdminImageController;
use App\Http\Controllers\Admin\AdminNotificationController;
use App\Http\Controllers\Admin\AdminOrderController;
use App\Http\Controllers\Admin\AdminPageContactController;
use App\Http\Controllers\Admin\AdminPageGeneralController;
use App\Http\Controllers\Admin\AdminPagePolicyController;
use App\Http\Controllers\Admin\AdminPostController;
use App\Http\Controllers\Admin\AdminProductController;
use App\Http\Controllers\Admin\AdminUserController;
use App\Http\Controllers\Admin\PageContactController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\EmailController;
use App\Http\Controllers\ErrorController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ShopController;
use App\Http\Controllers\User\CartController;
use App\Http\Controllers\User\CheckoutController;
use App\Http\Controllers\User\FavouriteController;
use App\Http\Controllers\User\ProfileController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ChatbotController;

/* ---------------------------------- AUTH ---------------------------------- */
Auth::routes(['verify' => true]);
Route::get('password/confirm', 'App\Http\Controllers\Auth\ConfirmPasswordController@showConfirmForm')
    ->middleware('auth')
    ->name('password.confirm');
Route::post('password/confirm', 'App\Http\Controllers\Auth\ConfirmPasswordController@confirm')
    ->middleware('auth');
/* ---------------------------------- AUTH ---------------------------------- */

/* ---------------------------------- HOME ---------------------------------- */
Route::get('/', [HomeController::class, 'index'])->name('home.index');
Route::get('/policy', [HomeController::class, 'policy'])->name('home.policy');
Route::get('/contact', [HomeController::class, 'contact'])->name('home.contact');
Route::post('/contact/send', [EmailController::class, 'store'])
    ->name('home.contact.send');
/* ---------------------------------- HOME ---------------------------------- */

/* ---------------------------------- SHOP ---------------------------------- */
Route::get('/shop', [ShopController::class, 'shop'])
    ->name('home.shop');
Route::get('/shop/{id}/details', [ShopController::class, 'shopDetails'])
    ->name('home.shop-details');
Route::post('/search', [ShopController::class, 'search'])
    ->name('home.search');
Route::get('/filter-category/{id}', [ShopController::class, 'filterCategory'])
    ->name('home.filter-category');
/* ---------------------------------- SHOP ---------------------------------- */

/* ------------------------------- CART ------------------------------ */
Route::get('/cart', [CartController::class, 'index'])
    ->name('user.cart');
Route::get('/cart/add/{id}/{quantity}', [CartController::class, 'addToCart'])
    ->name('user.cart.add');
Route::get('/cart/delete/{id}', [CartController::class, 'deleteCart'])
    ->name('user.cart.delete');
Route::get('/cart/control/{id}/{action}', [CartController::class, 'quantityControl'])
    ->name('user.cart-control');
/* ------------------------------- CART ------------------------------ */

/* -------------------------------- FAVOURITE ------------------------------- */
Route::get('/favourite', [FavouriteController::class, 'index'])
    ->name('user.favourite');
Route::get('/favourite/add/{id}', [FavouriteController::class, 'addToFavourite'])
    ->name('user.favourite.add');
Route::get('/favourite/delete/{id}', [FavouriteController::class, 'deleteFavourite'])
    ->name('user.favourite.delete');
/* -------------------------------- FAVOURITE ------------------------------- */

/* ---------------------------------- BLOG ---------------------------------- */
Route::get('/blog', [BlogController::class, 'blog'])
    ->name('home.blog');
Route::get('/blog/{id}/details', [BlogController::class, 'blogDetails'])
    ->name('home.blog-details');
Route::post('/blog/search', [BlogController::class, 'search'])
    ->name('home.blog.search');
Route::get('/blog/filter/{id}', [BlogController::class, 'filter'])
    ->name('home.blog.filter');
/* ---------------------------------- BLOG ---------------------------------- */

/* ---------------------------------- USER ---------------------------------- */
Route::middleware('auth')->group(function(){
    // profile
    Route::get('/profile', [ProfileController::class, 'index'])
        ->name('user.profile');
    Route::get('/profile/edit', [ProfileController::class, 'edit'])
        ->name('user.profile.edit');
    Route::put('/profile/save-change', [ProfileController::class, 'update'])
        ->name('user.profile.save-change');
    // order
    Route::get('/my-order', [OrderController::class, 'index'])
        ->name('user.my-order');
    Route::get('/order/{id}', [OrderController::class, 'show'])
        ->name('user.order.details');
    Route::delete('/order/{id}', [OrderController::class, 'destroy'])
        ->name('user.order.destroy');
    // checkout
    Route::get('/checkout', [CheckoutController::class, 'index'])
        ->name('user.checkout');
    Route::post('/checkout/process', [CheckoutController::class, 'process'])
        ->name('user.checkout.process');
});
/* ---------------------------------- USER ---------------------------------- */

/* ---------------------------------- ADMIN --------------------------------- */
Route::prefix('admin-panel')->middleware(['auth', 'admin'])
    ->name('admin.')
    ->group(function () {
    // start admin 
    Route::get('/', [AdminController::class, 'index'])
        ->name('index');
    // user
    Route::get('/user', [AdminUserController::class, 'index'])
        ->name('user.index');
    Route::get('/user/{id}/show', [AdminUserController::class, 'show'])
        ->name('user.show');
    Route::put('/user/update', [AdminUserController::class, 'update'])
        ->name('user.update');
    Route::get('/user/{id}/update-role', [AdminUserController::class, 'updateRole'])
        ->name('user.update-role');
    Route::get('/user/{id}/change-password', [AdminUserController::class, 'changePassword'])
        ->name('user.change-password'); 
    Route::post('/user/process-change-password', [AdminUserController::class, 'processChangePassword'])
        ->name('user.process-change-password');
    Route::get('/user/{id}/update-disable', [AdminUserController::class, 'updateDisable'])
        ->name('user.update-disable');
    Route::get('/user/{id}', [AdminUserController::class, 'destroy'])
        ->name('user.destroy');
    // category
    Route::get('/category', [AdminCategoryController::class, 'index'])
        ->name('category.index');
    Route::get('/category/create', [AdminCategoryController::class, 'create'])
        ->name('category.create');
    Route::post('/category/store', [AdminCategoryController::class, 'store'])
        ->name('category.store');
    Route::get('/category/{id}/edit', [AdminCategoryController::class, 'edit'])
        ->name('category.edit');
    Route::put('/category/{id}/update', [AdminCategoryController::class, 'update'])
        ->name('category.update');
    Route::put('/category/{id}/update-status', [AdminCategoryController::class, 'updateStatus'])
        ->name('category.update-status');
    Route::get('/category/{id}', [AdminCategoryController::class, 'destroy'])
        ->name('category.destroy');
    // product
    Route::get('/product', [AdminProductController::class, 'index'])
        ->name('product.index');
    Route::get('/product/create', [AdminProductController::class, 'create'])
        ->name('product.create');
    Route::post('/product/store', [AdminProductController::class, 'store'])
        ->name('product.store');
    Route::get('/product/{id}/edit', [AdminProductController::class, 'edit'])
        ->name('product.edit');
    Route::put('/product/{id}/update', [AdminProductController::class, 'update'])
        ->name('product.update');
    Route::put('/product/{id}/update-status', [AdminProductController::class, 'updateStatus'])
        ->name('product.update-status');
    Route::get('/product/{id}', [AdminProductController::class, 'destroy'])
        ->name('product.destroy');
    // image product
    Route::get('/product/{id}/image/create', [AdminImageController::class, 'create'])
        ->name('product.image.create');
    Route::post('/product/{id}/image/store', [AdminImageController::class, 'store'])
        ->name('product.image.store');
    Route::delete('/product/{id}/image/destroy', [AdminImageController::class, 'destroy'])
        ->name('product.image.destroy');
    // order
    Route::get('/order', [AdminOrderController::class, 'index'])
        ->name('order.index');
    Route::get('/order/{id}/update-status/{status}', [AdminOrderController::class, 'updateStatus'])
        ->name('order.update-status');
    Route::get('/order/{id}/show', [AdminOrderController::class, 'show'])
        ->name('order.show');
    Route::get('/order/{id}/destroy', [AdminOrderController::class, 'destroy'])
        ->name('order.destroy');
    // email
    Route::get('/email', [AdminEmailController::class, 'index'])
        ->name('email.index');
    Route::get('/email/{id}/show', [AdminEmailController::class, 'show'])
        ->name('email.show');
    Route::get('/email/{id}', [AdminEmailController::class, 'destroy'])
        ->name('email.destroy');
    // category blog
    Route::get('/blog/category', [AdminCategoryBlogController::class, 'index'])
        ->name('blog.category.index');
    Route::get('/blog/category/create', [AdminCategoryBlogController::class, 'create'])
        ->name('blog.category.create');
    Route::post('/blog/category/store', [AdminCategoryBlogController::class, 'store'])
        ->name('blog.category.store');
    Route::get('/blog/category/{id}/edit', [AdminCategoryBlogController::class, 'edit'])
        ->name('blog.category.edit');
    Route::put('/blog/category/{id}/update', [AdminCategoryBlogController::class, 'update'])
        ->name('blog.category.update');
    Route::put('/blog/category/{id}/update-status', [AdminCategoryBlogController::class, 'updateStatus'])
        ->name('blog.category.update-status');
    Route::get('/blog/category/{id}', [AdminCategoryBlogController::class, 'destroy'])
        ->name('blog.category.destroy');
    // post
    Route::get('/blog/post', [AdminPostController::class, 'index'])
        ->name('blog.post.index');
    Route::get('/blog/post/create', [AdminPostController::class, 'create'])
        ->name('blog.post.create');
    Route::post('/blog/post/store', [AdminPostController::class, 'store'])
        ->name('blog.post.store');
    Route::get('/blog/post/{id}/edit', [AdminPostController::class, 'edit'])
        ->name('blog.post.edit');
    Route::put('/blog/post/{id}/update', [AdminPostController::class, 'update'])
        ->name('blog.post.update');
    Route::put('/blog/post/{id}/update-status', [AdminPostController::class, 'updateStatus'])
        ->name('blog.post.update-status');
    Route::get('/blog/post/{id}', [AdminPostController::class, 'destroy'])
        ->name('blog.post.destroy');
    // page contact
    Route::get('/page/contact', [AdminPageContactController::class, 'index'])
        ->name('page.contact.index');
    Route::put('/page/contact/update', [AdminPageContactController::class, 'update'])
        ->name('page.contact.update');
    // page general
    Route::get('/page/general', [AdminPageGeneralController::class, 'index'])
        ->name('page.general.index');
    Route::put('/page/general/update', [AdminPageGeneralController::class, 'update'])
        ->name('page.general.update');
    // page policy
    Route::get('/page/policy', [AdminPagePolicyController::class, 'index'])
        ->name('page.policy.index');
    Route::put('/page/policy/update', [AdminPagePolicyController::class, 'update'])
        ->name('page.policy.update');
    Route::get('/notification/clear', [AdminNotificationController::class, 'clear'])
        ->name('notification.clear');
    /* ------------------------------------ - ----------------------------------- */
    }); // end amdin
/* ---------------------------------- ADMIN --------------------------------- */

/* ---------------------------------- ERROR --------------------------------- */
Route::get('/404', [ErrorController::class, 'error404'])->name('error.404');
/* ---------------------------------- ERROR --------------------------------- */
Route::get('/vnpay', function(){
    return view('vnpay');
});
Route::get('/momo', function(){
    return view('momo');
});

Route::post('/chatbot', [ChatbotController::class, 'handle'])->name('chatbot.handle');