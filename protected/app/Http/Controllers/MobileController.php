<?php
/**
 * Created by PhpStorm.
 * User: nosurino
 * Date: 8/6/2016
 * Time: 1:36 PM
 */

namespace App\Http\Controllers;


use App\ModelMobile\Admin;
use App\ModelMobile\Besuk;
use App\ModelMobile\HambaTuhan;
use App\ModelMobile\Jemaat;
use App\ModelMobile\Pengumuman;
use App\ModelMobile\Renungan;

class MobileController extends Controller
{
    public function getPengumuman()
    {
        $pengumuman = new Pengumuman();
        $listData = $pengumuman->getAll();
        return response()->json($listData);
    }
    public function getJadwalBesuk()
    {
        $jadwalBesuk = new Besuk();
        $listData = $jadwalBesuk->getAll();
        return response()->json($listData);
    }
    public function getRenungan()
    {
        $renungan = new Renungan();
        $listData = $renungan->getAll();
        return response()->json($listData);
    }
    public function getDetailRenungan()
    {
        $idRenungan = $_GET['idRenungan'];
        $renungan = new Renungan();
        $listData = $renungan->getById($idRenungan);
        return response()->json($listData);
    }
    public function getJemaat(){
        $jemaat = new Jemaat();
        $listData = $jemaat->getAll();
        return response()->json($listData);
    }
    public function getHambaTuhan(){
        $hambaTuhan = new HambaTuhan();
        $listData = $hambaTuhan->getAll();
        return response()->json($listData);
    }
    public function checkLogin(){
        $username = $_POST['username'];
        $password = $_POST['password'];
        $adminLogin = new Admin();
        $adminLogin = $adminLogin->checkLogin($username, $password);
        if ($adminLogin === null) {
            $adminLogin ['success']= false;
        }
        return response()->json($adminLogin);
    }
}