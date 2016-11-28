<?php
/**
 * Created by PhpStorm.
 * User: nosurino
 * Date: 8/23/2016
 * Time: 6:54 PM
 */

namespace App\ModelMobile;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Jemaat extends Model
{
    public function getAll()
    {
        $data = DB::table('tbl_jemaat')->get();
        return $data;
    }

}