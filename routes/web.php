<?php

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

Route::get('/', function () {
    return view('welcome');
});


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('customers', 'CustomerController@index');
Route::post('customers', 'CustomerController@store');


Route::resource('books', 'BookController');
Route::resource('authors', 'AuthorController');
Route::post('books/{book}/checkout', 'CheckoutBookController@checkout')->name('books.checkout');
Route::post('books/{book}/checkin', 'CheckoutBookController@checkin')->name('books.checkin');
