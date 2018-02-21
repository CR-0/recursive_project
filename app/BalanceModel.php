<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BalanceModel extends Model
{
    //
    protected $table = 'balances';
    public $timestamps = false;
    protected $primaryKey = 'user_id';
    protected $fillable = ['user_id','balance'];
}
