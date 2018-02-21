<?php

Route::get('/', function () {
    return view('welcome');
});

Route::get('/create/{short_code}','UserController@create');
Route::get('/list','UserController@show');

Route::get('/{id}','UserController@index');
