<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ActionModel extends Model
{
    //
    protected $table = 'actions';
    public $timestamps = false;
    protected $fillable = ['user_id','process_id','status','quantity'];

    public function usermodel()
    {
      return $this->belongsTo('App\UserModel');
    }

    public function transactionmodel()
    {
      return $this->belongsTo('App\TransactionModel');
    }
}
