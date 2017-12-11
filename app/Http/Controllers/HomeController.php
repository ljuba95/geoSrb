<?php

namespace App\Http\Controllers;

use App\Link;
use App\LinkGroup;
use App\News;
use Illuminate\Http\Request;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use App\Language;

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
        $jezik_tabela = Language::where('name', $jezik)->first();
        $jezikID = $jezik_tabela->id;
        // $linkGroups = LinkGroup::all();
        // $posts = News::all();
        $linkGroups = LinkGroup::where('active', 1)->where('language_id',$jezikID)->get();
        $posts = News::where('active', 1)->where('language_id', $jezikID)->orderBy('created_at', 'DESC')->paginate(3);

        // $grupeSaJezikom = array();
        // $postovi = array();

        // kako god linkovi treba da budu sortirani
        // foreach ($linkGroups as $group) {
            // if($group->language->name == $jezik){
                // $grupeSaJezikom[] = $group;
            // }
        // }
        
        // foreach ($posts as $post) {
            // if($post->language->name == $jezik){
                // $postovi[] = $post;
                // usort($postovi, function($a, $b){
                    // return strtotime($b->created_at) - strtotime($a->created_at);
                // });
            // }
        // }
        // usort($posts, function($a, $b){
            // return strtotime($b->created_at) - strtotime($a->created_at);
        // });
        return view('home.index',['posts' => $posts, 'linkGroups' => $linkGroups]);
    }

    public function about(){
        $jezik = LaravelLocalization::getCurrentLocale();
        $jezik_tabela = Language::where('name', $jezik)->first();
        $jezikID = $jezik_tabela->id;
        $linkGroups = LinkGroup::where('active', 1)->where('language_id',$jezikID)->get();

        return view('home.about', ['linkGroups' => $linkGroups]);
    }
}
