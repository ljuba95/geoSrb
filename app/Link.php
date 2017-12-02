<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Link extends Model
{
    public function group()
    {
        return $this->belongsTo('App\LinkGroup');
    }

}
