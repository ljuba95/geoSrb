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

//Route::get('/', function () {
//    //dd(App\Post::find(1));
//    return view('random');
//    //return view('home.index',['posts' => App\Post::all(), 'linkGroups' => App\LinkGroup::all()]);
//});

Route::group(['prefix' => LaravelLocalization::setLocale()], function()
{
    /** ADD ALL LOCALIZED ROUTES INSIDE THIS GROUP **/
    Route::get('/', function()
    {
        //dd(LaravelLocalization::getCurrentLocale()); //pomocu ovog helpera vadimo konkretne stranice,linkove,grupe.. iz baze

        return view('home.index',['posts' => App\Post::all(), 'linkGroups' => App\LinkGroup::all()]);
    });

    Route::get('test',function(){
        return View::make('test');
    });
});

//Auth::routes();

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
