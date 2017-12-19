<?php
/**
 * Created by PhpStorm.
 * User: Milos
 * Date: 12/2/2017
 * Time: 9:00 PM
 */

namespace App\Http\Controllers;


use App\LinkGroup;
use App\News;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class NewsController
{
    public function index(){
    }

    public function show($id){
        $vest = News::find($id);
        //dd($vest);
        $jezik = LaravelLocalization::getCurrentLocale();
        $linkGroups = LinkGroup::all();
        $grupeSaJezikom = array();

        foreach ($linkGroups as $group) {
            if($group->language->name == $jezik && $group->active){
                $grupeSaJezikom[] = $group;
            }
        }

        return view('news.show', ['vest' => $vest, 'linkGroups' => $grupeSaJezikom]);
    }
}