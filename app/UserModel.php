<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserModel extends Model
{
    //
    protected $table = 'users';
    //$incrementing = false;
    protected $primaryKey = 'user_id';
    //public $timestamps = false;
    protected $fillable = ['short_code','parent_id'];

    public function actionmodel()
    {
      return $this->hasMany('App\ActionModel');
    }
    public function balancemodel()
    {
      return $this->hasOne('App\BalanceModel','user_id','user_id');
    }
}
