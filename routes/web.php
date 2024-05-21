<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\NoteController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\TypeController;
use Illuminate\Support\Facades\Route;

Route::group(['middleware' => ['guest']], function () {
    Route::get('/login', [AuthController::class, 'login'])->name('login');
    Route::post('/login', [AuthController::class, 'loginApp']);
    Route::get('/registration', [AuthController::class, 'registration']);
    Route::post('/registration', [AuthController::class, 'registrationApp']);
});


Route::group(['middleware' => ['auth']], function () {
    Route::get('/', [ProductController::class,'index']);
    Route::resource('/dashboard', DashboardController::class);
    Route::get('/cariNama', [DashboardController::class, 'cariNama']);
    Route::get('/kategori', [DashboardController::class, 'kategori']);
    Route::resource('/types', TypeController::class);

    Route::get('/carts', [CartController::class, 'index']);
    Route::post('/cart', [CartController::class, 'store']);
    Route::get('/cart/{id}', [CartController::class, 'destroy']);

    Route::post('/note', [NoteController::class, 'store']);
    Route::get('/note/{id}', [NoteController::class, 'show']);

    Route::get('/logout', [AuthController::class, 'logout']);
});
