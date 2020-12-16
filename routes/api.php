<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/userRegister','ApiController@create');
Route::get('/showAlluserRegister','ApiController@showAlluserRegister');
Route::get('/userfetchbyId/{id}','ApiController@usershowbyId');
Route::put('/userUpdate/{id}','ApiController@userUpdatebyId');
Route::get('/userDelete/{id}','ApiController@userDeletebyId');
Route::post('/userUpdate','ApiController@userUpdate');
Route::post('/userLogin','ApiController@userLogin');
