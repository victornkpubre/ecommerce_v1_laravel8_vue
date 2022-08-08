<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MailController;
use App\Http\Controllers\CartsController;
use App\Http\Controllers\ProductsController;
use Illuminate\Foundation\Auth\EmailVerificationRequest;
use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [ProductsController::class, 'index']);
Auth::routes();
Route::get('/email', function () {
    return view('auth.verify');
});


//Handler
Route::get('/email/verify/{id}/{hash}', function (EmailVerificationRequest $request) {
    $request->fulfill();

    return redirect('/home');
})->middleware(['auth', 'signed'])->name('verification.verify');


//Notice
Route::get('/email/verify', function () {
    return view('auth.verify');
})->middleware('auth')->name('verification.notice');


//Resend Link Function
Route::post('/email/verification-notification', function (Request $request) {
    $request->user()->sendEmailVerificationNotification();
    //return back()->with('message', 'Verification Link Sent!');
})->middleware(['auth', 'throttle:6,1'])->name('verification.resend');


Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
    Route::post('/cart', [CartsController::class, 'store'])->name('cart');
    Route::get('/checkout', [CartsController::class, 'index'])->name('checkout');
    Route::get('/checkout/get/items', [CartsController::class, 'getCartItemsForCheckout']);
    Route::post('/process/user/payment', [CartsController::class, 'processPayment']);
});


Route::post('/send/contact-email', [MailController::class, 'sendContactEmail'])->name('send.contact');
Route::post('/send/checkout-email', [MailController::class, 'sendCheckoutEmail'])->name('send.checkout');
