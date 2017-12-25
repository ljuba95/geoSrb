<?php

namespace App\Http\Controllers;

use App\Link;
use App\LinkGroup;
use App\News;
use Illuminate\Http\Request;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use App\Language;
use PhpParser\Node\Expr\Cast\Object_;
use TCG\Voyager\Models\Page;

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
        $jezikID = $jezik_tabela->id;;
        $linkGroups = LinkGroup::where('active', 1)->where('language_id',$jezikID)->get();
        $posts = News::where('active', 1)->where('language_id', $jezikID)->orderBy('created_at', 'DESC')->paginate(3);
        $menu_items = array();


        return view('home.index',['posts' => $posts, 'linkGroups' => $linkGroups]);
    }

    public function about(){
        $jezik = LaravelLocalization::getCurrentLocale();
        $jezik_tabela = Language::where('name', $jezik)->first();
        $jezikID = $jezik_tabela->id;
        $linkGroups = LinkGroup::where('active', 1)->where('language_id',$jezikID)->get();

        return view('home.about', ['linkGroups' => $linkGroups]);
    }

    public function partners(){
        $jezik = LaravelLocalization::getCurrentLocale();
        $jezik_tabela = Language::where('name', $jezik)->first();
        $jezikID = $jezik_tabela->id;
        $linkGroups = LinkGroup::where('active', 1)->where('language_id',$jezikID)->get();

        return view('home.partners', ['linkGroups' => $linkGroups]);
    }

    public function contacts(){
        $jezik = LaravelLocalization::getCurrentLocale();
        $jezik_tabela = Language::where('name', $jezik)->first();
        $jezikID = $jezik_tabela->id;
        $linkGroups = LinkGroup::where('active', 1)->where('language_id',$jezikID)->get();

        return view('home.contacts', ['linkGroups' => $linkGroups]);
    }


    public function inspire(){
        $jezik = LaravelLocalization::getCurrentLocale();
        $jezik_tabela = Language::where('name', $jezik)->first();
        $jezikID = $jezik_tabela->id;
        $linkGroups = LinkGroup::where('active', 1)->where('language_id',$jezikID)->get();

        return view('home.inspire', ['linkGroups' => $linkGroups]);
    }

    public function terms(){
        $jezik = LaravelLocalization::getCurrentLocale();
        $jezik_tabela = Language::where('name', $jezik)->first();
        $jezikID = $jezik_tabela->id;
        $linkGroups = LinkGroup::where('active', 1)->where('language_id',$jezikID)->get();

        return view('home.terms', ['linkGroups' => $linkGroups]);
    }
}
