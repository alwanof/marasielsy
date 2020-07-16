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



Route::group(['prefix' => 'drivers','middleware' => ['locator']],function () {
    Route::get('form/{country?}', 'DriversController@index')->name('drivers.index');
    Route::get('/upload/attach/{email}','DriversController@attach' )->name('drivers.attach');;
    Route::post('/', 'DriversController@store')->name('drivers.store');
    Route::get('/go/test','DriversController@test');


});

Route::group(['prefix' => 'drivers','middleware' => ['auth']],function () {
    Route::get('sheet/{active?}','DriversController@sheet')->name('drivers.sheet');
    Route::get('active','DriversController@active')->name('drivers.active');
    Route::get('customers/active','DriversController@customers')->name('customers.active');
    Route::get('orders/{filter}','DriversController@orders')->name('orders.sheet');

});

