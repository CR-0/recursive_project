<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\UserModel;
use App\BalanceModel;
use App\TransactionModel;
use App\ActionModel;
class UserController extends Controller
{
    private $process_id;
    private function uniqCode($length = 5)//unique kod oluşturmak için fonk.
    {
    		 $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    		 $chars = str_split($chars);
    		 $code = null;
    		 for ($i=0; $i < $length; $i++) {
    			$code .= $chars[rand(0,35)];
    		 }
    		 return $code;
    }

    private function getParent($user_id)
    {
      $var = UserModel::where('user_id',$user_id)->first();
      if($var)
        return $var->parent_id;
      else
        return false;
    }

    private function getAllParent($user_id, $interval = 3)
    {
      $parent = self::getParent($user_id);
      $parents = $parent ? array($parent) : array();
      for ($i=0; $i < $interval ; $i++)
      {
        if(array_key_exists($i,$parents))
        {
          $parent = self::getParent($parents[$i]);
          if($parent !== false)
            array_push($parents,$parent);
        }
      }
      return $parents;
    }

    private function createUser($short_code)
    {
      $var = UserModel::where('short_code',$short_code)->first();
      if(!$var)
        return false;
      else
      {
        $user = UserModel::firstOrCreate(array(
          'short_code' => self::uniqCode(),
          'parent_id' => $var->user_id
        ));
        $user->save();
        return $user->user_id;
      }
    }

    private function createTransaction($details, $status = true, $operation = true)
    {
          $transaction = new TransactionModel(array(
            'operation' => $operation,
            'status' => $status,
            'details' => $details
          ));
          $transaction->save();
          $this->process_id = $transaction->process_id;
          return $this->process_id;
    }

    private function createBalance($user_id)
    {
      $var = new BalanceModel(array(
        'user_id' => $user_id,
        'balance' => 0
      ));
      return $var->save();
    }

    private function updateBalance($user_id, $quantity, $operation)
    {
        $var = BalanceModel::where('user_id',$user_id);
        if($var->count() == 1)
          $var = $var->firstOrFail();
        else {
          self::createBalance($user_id);
          $var = BalanceModel::where('user_id',$user_id)->firstOrFail();
        }
        if($operation == true)
          $var->balance += $quantity;
        elseif($operation == false)
          $var->bacance -= $quantity;
        return $var->save();
    }

    private function createAction($user_id, $quantity, $status)
    {
        $action = new ActionModel(array(
          'status' => $status,
          'quantity' => $quantity,
          'user_id' => $user_id,
          'process_id' => $this->process_id
        ));
        return $action->save();
    }

    public function create($short_code)
    {
        //
        $user_id = self::createUser($short_code);
        if($user_id !== false)
        {
          self::createTransaction('test');//açıklama girilebilir
          $parents = self::getAllParent($user_id);
          print_r($parents);
          foreach ($parents as $id)
          {
            if($id != 0)
              {
                self::createAction($id, 1,true);
                self::updateBalance($id, 1, true);
              }

          }
        }
    }

    public function show($id)
    {
        //
        $var = UserModel::where('user_id',$id)->get();
        var_dump($var);
        echo "<hr>";
        foreach ($var as $key => $value) {
          echo $value->short_code;
          # code...
        }
    }
}
