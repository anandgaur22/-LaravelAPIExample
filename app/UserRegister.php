<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserRegister extends Model
{
    protected $table='user_register';
    protected $fillable=['id','name','email','password','mobile_no'];
}
