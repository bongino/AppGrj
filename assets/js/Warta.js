/**
 * Created by nosurino on 8/4/2016.
 */
var BaseUrl = 'http://192.168.1.118/AppGereja/';
var IconMarker = 'glyphicon glyphicon-map-marker';
var IconUser = 'glyphicon glyphicon-user';
var IconBook = 'glyphicon glyphicon-book';
var IconCalendar = 'glyphicon glyphicon-calendar';
var IconTime = 'glyphicon glyphicon-time';
var IconPhone = 'glyphicon glyphicon-earphone';
var LinkLogin = '<div id="Logout"><a onclick="Login()"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span> Login</a></div>';
var LinkLogout = '<div id="Logout"><a onclick="Logout()"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span> Logout</a></div>';

function PageJemaat() {
}
function Login() {
    var results = '';
    results += '<div class="col-lg-12"><form>'
    results += ' <div class="form-group">'
    results += '<label for="exampleInputEmail1">Username</label>';
    results += '<input type="text" class="form-control" name="username" id="username" placeholder="Email"></div>';
    results += '<div class="form-group">';
    results += '<label for="exampleInputPassword1">Password</label>';
    results += '<input type="password" class="form-control" name= "password" id="password" placeholder="Password"></div>';
    results += '<button style="width: 100%;color: #03a9f4; font-weight: bold;font-size: 100%;" type="button" onclick="checkLogin()" class="btn btn-default">';
    results += '<span style="font-size: 150%;" class="glyphicon glyphicon-log-in" aria-hidden="true"></span>&nbsp;&nbsp;Submit';
    results += '</button></form></div>';
    document.getElementById('Contens').innerHTML = results;
    document.getElementById('Header').innerHTML = '<div id="Title"><a href="javascript:void(0)" onclick="Index()"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></a>&nbsp;&nbsp;Login</div> <div id="Logout"><a onclick="Login()"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span> Login</a>';
}
function DaftarJemaatPage() {
    ShowLoadingBar();
    loadDataJemaat();
}
function HambaTuhanPage() {
    ShowLoadingBar();
    loadDataHambaTuhan();
}
function PengumumanPage() {
    ShowLoadingBar();
    loadDataPengumuman();
}
function JadwalBesuk() {
    ShowLoadingBar();
    loadDataJadwalBesuk();
}
function RenunganPage() {
    ShowLoadingBar();
    loadDataRenungan();
}
function checkLogin() {
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;
    $.ajax({
        url: BaseUrl + 'checkLogin',
        type: 'POST',
        data: 'username=' + username + '&password=' + password,
        success: function (data) {
            //alert(data['Adm_Id']);
            //alert(data['success']);
            if (data['success'] === false) {
                alert('Username & Password Salah !!!');
            } else {
                localStorage.setItem('dataLogin', JSON.stringify(data));
                Index();
            }
        }
    });
}
function PecahString(text) {
    var results = '';
    var counter = 0;
    for (var i = 0; i < text.length; i++) {
        counter++;
        results += text[i];
        if (counter === 35 && text[i] === ' ') {
            results += '<br>';
            counter = 0;
        } else if (counter === 35 && text[i] !== ' ') {
            counter--;
        }
    }
    return results;
}
// load data function
function loadDataJemaat() {
    $.ajax({
        url: BaseUrl + 'getJemaat',
        type: 'GET',
        data: 'json',
        success: function (data) {
            var results = '';
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    results += '<a href="javascript:void(0)" onclick="DetailPengumuman(' + data[i]['Peng_Id'] + ')">'
                    results += '<div id="ContainerBox" class="row">'
                    results += '<div class="BoxFull">';
                    results += '<span class="Title ' + IconUser + '">&nbsp;</span><span class="NormalText">' + data[i]['Jem_Nama'] + '</span><br>';
                    results += '<span class="NormalText ' + IconPhone + '">&nbsp;</span><span class="NormalText">' + data[i]['Jem_NomorTelepon'] + '</span><br>';
                    results += '<span class="NormalText ' + IconMarker + '">&nbsp;</span><span class="NormalText">' + data[i]['Jem_Alamat'] + '</span><br>';
                    results += '</div>';
                    results += '</div>';
                    results += '</a>';
                }
            } else {
                results = '<h1>Data Kosong</h1>'
            }
            HideLoadingBar();
            document.getElementById('Contens').innerHTML = results;
            document.getElementById('Header').innerHTML = '<div id="Title"><a href="javascript:void(0)" onclick="Index()"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></a>&nbsp;&nbsp;Pengumuman</div> <div id="Logout"><a onclick="Login()"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span> Login</a>';
        }
    });
}
function loadDataPengumuman() {
    $.ajax({
        url: BaseUrl,
        type: 'GET',
        data: 'json',
        success: function (data) {
            var results = '';
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    var judul = PecahString(data[i]['Peng_Judul']);
                    var keterangan = PecahString(data[i]['Peng_Keterangan'].substring(0, 30));
                    results += '<a href="javascript:void(0)" onclick="DetailPengumuman(' + data[i]['Peng_Id'] + ')">'
                    results += '<div id="ContainerBox" class="row">'
                    results += '<div class="BoxLeft">';
                    results += '<span class="Title">' + judul + '</span><br>';
                    results += '<span class="SmallText ' + IconCalendar + '">&nbsp;</span><span class="SmallText">' + data[i]['Peng_Tanggal'] + '</span><br>';
                    results += '<span class="SmallText ' + IconTime + '">&nbsp;</span><span class="SmallText">' + data[i]['Peng_Waktu'] + '</span><br>';
                    results += '<span class="SmallText">' + keterangan + '</span><br>';
                    results += '</div>';
                    results += '<div class="BoxRight">';
                    results += '<img style="width:100px; height: 100px" src="' + BaseUrl + 'assets/image/' + data[i]['Peng_Foto'] + '" class="img-responsive" alt="Responsive image">';
                    results += '</div>';
                    results += '</div>';
                    results += '</a>';
                }
            } else {
                results = '<h1>Data Kosong</h1>'
            }
            HideLoadingBar();
            document.getElementById('Contens').innerHTML = results;
            document.getElementById('Header').innerHTML = '<div id="Title"><a href="javascript:void(0)" onclick="Index()"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></a>&nbsp;&nbsp;Pengumuman</div> <div id="Logout"><a onclick="Login()"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span> Login</a>';
        }
    });
}
function loadDataJadwalBesuk() {
    $.ajax({
        url: BaseUrl + 'getJadwalBesuk',
        type: 'GET',
        data: 'json',
        success: function (data) {
            var results = '';
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    results += '<div id="ContainerBox" class="row">';
                    results += '<span class="Title ' + IconUser + '">&nbsp;</span><span class="LargeText">' + data[i]['Jem_Nama'] + '</span><hr>';
                    results += '<span class="NormalText ' + IconMarker + '">&nbsp;</span><span class="NormalText">' + data[i]['Jem_Alamat'] + '</span><br>';
                    results += '<span class="NormalText ' + IconCalendar + '">&nbsp;</span><span class="NormalText">' + data[i]['Bes_Tanggal'] + '</span><br>';
                    results += '<span class="NormalText ' + IconTime + '">&nbsp;</span><span class="NormalText">' + data[i]['Bes_Jam'] + '</span><br>';
                    results += '<span class="NormalText" >' + data[i]['Bes_Keterangan'] + '</span><br>';
                    results += '</div>';
                }
            } else {
                results = '<h1>Data Kosong</h1>'
            }
            HideLoadingBar();
            document.getElementById('Contens').innerHTML = results;
            document.getElementById('Header').innerHTML = '<div id="Title"><a href="javascript:void(0)" onclick="Index()"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></a>&nbsp;&nbsp;Besuk</div> <div id="Logout"><a onclick="Login()"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span> Login</a>';
        }
    });
}
function loadDataRenungan() {
    $.ajax({
        url: BaseUrl + 'getRenungan',
        type: 'GET',
        data: 'json',
        success: function (data) {
            var results = '';
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    results += '<a href="javascript:void(0)" onclick="DetailRenungan(' + data[i]['Ren_Id'] + ')">'
                    results += '<div id="ContainerBox" class="row">'
                    results += '<div class="BoxLeft">';
                    results += '<span class="Title">' + data[i]['Ren_Judul'] + '</span><br>';
                    results += '<span class="SmallText ' + IconBook + '" aria-hidden="true">&nbsp;</span><span class="SmallText">' + data[i]['Ren_NatsAlkitab'] + '</span>';
                    results += '</div>';
                    results += '<div class="BoxRight">';
                    results += '<img style="width:100px; height: 100px" src="' + BaseUrl + 'assets/image/' + data[i]['Ren_Foto'] + '" class="img-responsive" alt="Responsive image">';
                    results += '</div>';
                    results += '</div>';
                    results += '</a>';
                }
            } else {
                results = '<h1>Data Kosong</h1>'
            }
            HideLoadingBar();
            document.getElementById('Contens').innerHTML = results;
            document.getElementById('Header').innerHTML = '<div id="Title"><a href="javascript:void(0)" onclick="Index()"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></a>&nbsp;&nbsp;Renungan</div> <div id="Logout"><a onclick="Login()"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span> Login</a>';
        }
    });
}
function DetailRenungan(idRenungan) {
    ShowLoadingBar();
    $.ajax({
        url: BaseUrl + 'getDetailRenungan',
        type: 'GET',
        data: 'idRenungan=' + idRenungan,
        success: function (data) {
            var results = '';
            results += '<div id="ContainerBox" class="row">'
            results += '<span class="Title">' + data['Ren_Judul'] + '</span><br>';
            results += '<span class="NormalText ' + IconBook + '" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;' + data['Ren_NatsAlkitab'];
            results += '<img style="width:100%;" src="' + BaseUrl + 'assets/image/' + data['Ren_Foto'] + '" class="img-responsive" alt="Responsive image">';
            results += data['Ren_Isi'];
            results += '</div>';
            HideLoadingBar();
            document.getElementById('Contens').innerHTML = results;
            document.getElementById('Header').innerHTML = '<div id="Title"><a href="javascript:void(0)" onclick="RenunganPage()"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></a>&nbsp;&nbsp;Renungan</div> <div id="Logout"><a onclick="Login()"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span> Login</a>';
        }
    });
}
function loadDataHambaTuhan() {
    $.ajax({
        url: BaseUrl + 'getHambaTuhan',
        type: 'GET',
        data: 'json',
        success: function (data) {
            var results = '';
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    results += '<div id="ContainerBox" class="row">'
                    results += '<div class="BoxLeft">';
                    results += '<span class="Title">' + data[i]['Hat_Nama'] + '</span><br>';
                    results += '<span class="SmallText ' + IconPhone + '" aria-hidden="true">&nbsp;</span><span class="SmallText">' + data[i]['Hat_NomorTelepon'] + '</span>';
                    results += '</div>';
                    results += '<div class="BoxRight">';
                    results += '<img style="width:100px; height: 100px" src="' + BaseUrl + 'assets/image/' + data[i]['Hat_Foto'] + '" class="img-responsive" alt="Responsive image">';
                    results += '</div>';
                    results += '</div>';
                }
            } else {
                results = '<h1>Data Kosong</h1>'
            }
            HideLoadingBar();
            document.getElementById('Contens').innerHTML = results;
            document.getElementById('Header').innerHTML = '<div id="Title"><a href="javascript:void(0)" onclick="Index()"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></a>&nbsp;&nbsp;Hamba Tuhan</div> <div id="Logout"><a onclick="Login()"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span> Login</a>';
        }
    });
}
// General function
function Logout() {
    localStorage.removeItem('dataLogin');
    Index();
}
function Index() {
    var linkAdmin = '';
    var linkLogon = LinkLogin;
    var loginSession = JSON.parse(localStorage.getItem('dataLogin'));
    if (loginSession !== null) {
        console.log(localStorage.getItem('dataLogin'));
        var session = JSON.parse(localStorage.getItem('dataLogin'));
        console.log(session);
        console.log(session['Adm_Username']);
        linkAdmin += '<div class="col-lg-12 MenuButton">';
        linkAdmin += '<button style="width: 100%; color: #03a9f4; font-weight: bold;font-size: 100%;" onclick="DaftarJemaatPage()" type="button" class="btn btn-default btn-lg">';
        linkAdmin += '<span style="font-size: 150%;" class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;Daftar Jemaat';
        linkAdmin += '</button></div>';
        linkLogon = LinkLogout;
    }
    document.getElementById('Header').innerHTML = '<div id="Logo"><img src="'+BaseUrl+'assets/image/logo.png" class="img-responsive" alt="Responsive image"></div>' + linkLogon;
    document.getElementById('Contens').innerHTML = linkAdmin + '<div class="col-lg-12 MenuButton">'
        + '<button style="width: 100%;color: #009688; font-weight: bold;font-size: 100%;" onclick="RenunganPage()" type="button" class="btn btn-default btn-lg">'
        + '<span style="font-size: 150%;"  class="glyphicon glyphicon-calendar" aria-hidden="true"></span>&nbsp;&nbsp;Renungan'
        + '</button>'
        + '</div>'
        + '<div class="col-lg-12 MenuButton">'
        + '<button style="width: 100%; color:  #ffc107; font-weight: bold;font-size: 100%;" onclick="PengumumanPage()" type="button" class="btn btn-default btn-lg">'
        + '<span style="font-size: 150%;"  class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span>&nbsp;&nbsp;Pengumuman'
        + '</button>'
        + '</div>'
        + '<div class="col-lg-12 MenuButton">'
        + '<button style="width: 100%; color: #4caf50; font-weight: bold;font-size: 100%;" onclick="JadwalBesuk()" type="button" class="btn btn-default btn-lg">'
        + '<span style="font-size: 150%;"  class="glyphicon glyphicon-tree-deciduous" aria-hidden="true"></span>&nbsp;&nbsp;Jadwal Besuk'
        + '</button>'
        + '</div>'
        + '<div class="col-lg-12 MenuButton">'
        + '<button style="width: 100%; color: #4caf50; font-weight: bold;font-size: 100%;" onclick="JadwalIbadah()" type="button" class="btn btn-default btn-lg">'
        + '<span style="font-size: 150%;"  class="glyphicon glyphicon-tree-deciduous" aria-hidden="true"></span>&nbsp;&nbsp;Jadwal Ibadah'
        + '</button>'
        + '</div>'
        + '<div class="col-lg-12 MenuButton">'
        + '<button style="width: 100%; color:  #ffc107; font-weight: bold;font-size: 100%;" onclick="HambaTuhanPage()" type="button" class="btn btn-default btn-lg">'
        + '<span style="font-size: 150%;"  class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span>&nbsp;&nbsp;Hamba Tuhan'
        + '</button>'
        + '</div>';
}
function ShowLoadingBar() {
    var contentBlock = document.getElementById('Contens');
    contentBlock.style.display = 'none';
    var loadingBlock = document.getElementById('LoadingImage');
    loadingBlock.style.display = 'block';

}
function HideLoadingBar() {
    var loadingBlock = document.getElementById('LoadingImage');
    loadingBlock.style.display = 'none';
    var contentBlock = document.getElementById('Contens');
    contentBlock.style.display = 'block';
}