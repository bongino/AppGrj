<?php
/**
 * Created by PhpStorm.
 * User: nosurino
 * Date: 8/6/2016
 * Time: 1:38 PM
 */

namespace App\ModelMobile;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Pengumuman extends Model
{
    public function getAll()
    {
        $data = DB::table('tbl_Pengumuman')->get();
        return $data;
    }

}