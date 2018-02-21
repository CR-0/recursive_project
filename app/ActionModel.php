<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ActionModel extends Model
{
    //
    protected $table = 'actions';
    public $timestamps = false;
    protected $fillable = ['user_id','process_id','status','quantity'];
}
