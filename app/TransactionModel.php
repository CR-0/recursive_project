<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TransactionModel extends Model
{
    //
    protected $table = 'transactions';
    protected $primaryKey = 'process_id';
    //public $timestamps = false;
    protected $fillable = ['operation','status','details'];

    public function actionmodel()
    {
      return $this->hasMany('App\ActionModel');
    }
}
