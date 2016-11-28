<?php
/**
 * Created by PhpStorm.
 * User: nosurino
 * Date: 8/13/2016
 * Time: 11:59 AM
 */
namespace App\ModelMobile;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Renungan extends Model
{
    public function getAll()
    {
        $data = DB::table('tbl_Renungan')->get();
        return $data;
    }
    public function getById($idrenungan) {
        $data = DB::table('tbl_Renungan')
            ->Where('Ren_Id', '=', $idrenungan)
            ->first();
            return $data;
    }

}