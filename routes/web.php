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

use App\User;



Route::group(['middleware' => ['locator']], function () {

    Route::get('/', 'WelcomeController@index')->name('start');

});




Route::get('test', 'UserController@testo');
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/formm', 'HomeController@formm')->name('formm');
Route::post('/savee', 'HomeController@savee')->name('savee');

Route::get('lang/{locale}', 'HomeController@lang')->name('lang');

Route::prefix('admin')->group(function () {
    Route::get('/users', 'UserController@index')->name('users')->middleware('permission:access-users');
    Route::get('/roles', 'UserController@roles')->name('roles')->middleware('permission:access-roles');
    Route::get('/permissions', 'UserController@permissions')->name('permissions')->middleware('permission:access-permissions');
    Route::get('/profile/{user}', 'UserController@profile')->name('profile');
    Route::get('/me', 'UserController@me')->name('me');
    Route::get('/config', 'ConfigController@config')->name('config.index')->middleware('permission:access-configs');
    Route::get('/settings', 'ConfigController@settings')->name('config.settings');
    Route::get('/desktop',function(){
     return view('modules.desktop');
    })->name('desktop');
});
