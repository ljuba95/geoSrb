<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\FileCategory;

class FileCategoriesController extends Controller
{
    function index(){
        $categories = FileCategory::all();
        return view('home.files', ['categories' => $categories]);
    }

}
