<?php
/**
 * Created by PhpStorm.
 * User: nosurino
 * Date: 8/23/2016
 * Time: 7:50 PM
 */

namespace App\ModelMobile;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Admin extends Model
{
    public function checkLogin($username, $password)
    {
        $data = DB::table('tbl_admin')
            ->where('Adm_Username', $username)
            ->where('Adm_Password', md5($password))
            ->first();
        return $data;
    }
}