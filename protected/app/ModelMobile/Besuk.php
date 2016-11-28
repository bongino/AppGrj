<?php

/**
 * Created by PhpStorm.
 * User: nosurino
 * Date: 8/8/2016
 * Time: 8:15 PM
 */
namespace App\ModelMobile;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Besuk extends Model
{
    public function getAll()
    {
        $data = DB::table('tbl_besuk AS bes')
            ->leftJoin('tbl_jemaat AS Jem', 'jem.Jem_Id', '=', 'bes.Bes_IdJemaat')
            ->select('jem.Jem_Nama', 'jem.Jem_Alamat', 'bes.Bes_Tanggal', 'bes.Bes_Jam', 'bes.Bes_Keterangan')
            ->get();
        return $data;
    }
}