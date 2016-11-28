<?php
/**
 * Created by PhpStorm.
 * User: nosurino
 * Date: 8/23/2016
 * Time: 7:36 PM
 */
namespace App\ModelMobile;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class HambaTuhan extends Model
{
    public function getAll()
    {
        $data = DB::table('tbl_hambatuhan')->get();
        return $data;
    }

}