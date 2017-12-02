<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class LinkGroup extends Model
{
    public function links()
    {
        return $this->hasMany('App\Link');
    }

    public function language()
    {
        return $this->belongsTo('App\Language');
    }
}
