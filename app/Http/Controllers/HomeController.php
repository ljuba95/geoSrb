<?php

namespace App\Http\Controllers;

use App\Link;
use App\LinkGroup;
use App\News;
use Illuminate\Http\Request;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {

    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        //todo: andrija ovo je sve shit filtriranje, treba da se menja

        $jezik = LaravelLocalization::getCurrentLocale();
        $linkGroups = LinkGroup::all();
        $posts = News::all();
        $grupeSaJezikom = array();
        $postovi = array();
        foreach ($linkGroups as $group) {
            if($group->language->name == $jezik && $group->active){
                $grupeSaJezikom[] = $group;
            }
        }

        foreach ($posts as $post) {
            if($post->language->name == $jezik && $post->active){
                $postovi[] = $post;
            }
        }
        return view('home.index',['posts' => $postovi, 'linkGroups' => $grupeSaJezikom]);
    }
}
