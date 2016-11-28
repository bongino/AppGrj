<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

//Route::get('/', 'MobileController@getPengumuman');
//Route::get('getJadwalBesuk', 'MobileController@getJadwalBesuk');
//Route::get('getRenungan', 'MobileController@getRenungan');
//Route::get('getDetailRenungan', 'MobileController@getDetailRenungan');
Route::get('/', array('middleware' => 'cors', 'uses' => 'MobileController@getPengumuman'));
Route::get('getJadwalBesuk', array('middleware' => 'cors', 'uses' => 'MobileController@getJadwalBesuk'));
Route::get('getRenungan', array('middleware' => 'cors', 'uses' => 'MobileController@getRenungan'));
Route::get('getDetailRenungan', array('middleware' => 'cors', 'uses' => 'MobileController@getDetailRenungan'));
Route::get('getJemaat', array('middleware' => 'cors', 'uses' => 'MobileController@getJemaat'));
Route::get('getHambaTuhan', array('middleware' => 'cors', 'uses' => 'MobileController@getHambaTuhan'));
Route::post('checkLogin', array('middleware' => 'cors', 'uses' => 'MobileController@checkLogin'));
