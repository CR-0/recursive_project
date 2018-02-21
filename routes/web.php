<?php

Route::get('/', function () {
    return view('welcome');
});

Route::get('/create/{short_code}','UserController@create');
Route::get('/show/{id}','UserController@show');
