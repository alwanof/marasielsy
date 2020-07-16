<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::group(['prefix' => 'drivers/apigate','middleware' => ['auth:api']], function () {
    Route::get('sheet','API\DriversController@index');
    Route::get('search/drivers', 'API\DriversController@search');
    Route::get('set/{driver}/{uid}/approved', 'API\DriversController@setApproved');
});

Route::get('nullo', 'API\DriversController@search4null');


