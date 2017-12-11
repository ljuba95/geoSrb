<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\FileCategory;
use App\Link;
use App\LinkGroup;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use App\Language;


class FileCategoriesController extends Controller
{
    function index(Request $request){
        $categories = FileCategory::all();

        if ($request->wantsJson()) {
            return json_encode($categories);
        }

        $jezik = LaravelLocalization::getCurrentLocale();
        $jezik_tabela = Language::where('name', $jezik)->first();
        $jezikID = $jezik_tabela->id;
        $linkGroups = LinkGroup::where('active', 1)->where('language_id',$jezikID)->get();
               
        return view('home.files', ['categories' => $categories, 'linkGroups' => $linkGroups]);
    }

}
