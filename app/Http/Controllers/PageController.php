<?php

namespace App\Http\Controllers;

use App\LinkGroup;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use TCG\Voyager\Models\Page;

class PageController extends Controller
{
    public function index(){
        $pages = Page::all();
        $json = array();

        foreach($pages as $page){
            array_push($json, array('id' => $page->id, 'title' => $page->title));
        }
        return json_encode($json);
    }

    public function show($id){
        $pageContent = DB::table('pages')->where('id', $id)->first();
        $jezik = LaravelLocalization::getCurrentLocale();
        $linkGroups = LinkGroup::all();
        $grupeSaJezikom = array();
        foreach ($linkGroups as $group) {
            if($group->language->name == $jezik && $group->active){
                $grupeSaJezikom[] = $group;
            }
        }
        return view('home.pages', ['pageContent' => $pageContent, 'linkGroups' => $grupeSaJezikom]);
    }

    public static function getMenuItems(){
        $pages = Page::all();

        foreach ($pages as $page) {
            $menu_items[] = array('url' => '/pages/' . $page->id, 'title' => $page->title);
        }

        return $menu_items;
    }
}
