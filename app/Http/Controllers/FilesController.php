<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\File;
use App\FileCategory;

class FilesController extends Controller
{
    function index($id){
        $category = FileCategory::find($id);
       
        return json_encode($category->files);
    }


}
