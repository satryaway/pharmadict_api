<?php
/*
 * samstudio
 */
error_reporting(E_ERROR | E_PARSE);
header('Content-type: application/json; charset=utf-8');
include "koneksi.php";

$path = $_SERVER[PATH_INFO];
if($path != null){
	$path_params = spliti ("/", $path);
}
//die($_SERVER['REQUEST_METHOD']);
if($_SERVER['REQUEST_METHOD'] == 'POST'){
	// POST
	
	if($path_params[1] == 'login'){
		$input = explode("+", file_get_contents("php://input"));
		$query = "SELECT * FROM admin WHERE username='$input[0]' && password='$input[1]'";
	}else{
$target_dir = "pic/";
	$target_file = $target_dir . basename($_FILES["obat_pic"]["name"]);
	$tmp_name = $_FILES['obat_pic']['tmp_name'];
	$name = $_FILES['obat_pic']['name'];
	
	$uploadOk = 1;
	$imageFileType = pathinfo($target_file, PATHINFO_EXTENSION);
	if(!move_uploaded_file($tmp_name, "$target_dir/$name")){
		die($target_file."failed");
	}
		$obat_nama = $_POST['obat_nama'];
		$obat_deskripsi = $_POST['obat_deskripsi'];
		$obat_indikasi = $_POST['obat_indikasi'];
		$obat_harga = $_POST['obat_harga'];
		$obat_jenis = $_POST['obat_jenis'];
		$obat_efeksamping = $_POST['obat_efeksamping'];
		$obat_dosis = $_POST['obat_dosis'];
		$obat_perhatian = $_POST['obat_perhatian'];
		$obat_isi = $_POST['obat_isi'];
		$obat_kode = $_POST['obat_kode'];
		$obat_pic = $name;
		$query = "INSERT INTO obat (
		obat_nama,
		obat_deskripsi,
		obat_indikasi,
		obat_harga,
		obat_jenis, 
		obat_efeksamping,
		obat_dosis,
		obat_perhatian,
		obat_isi,
		obat_kode, 
		obat_pic) VALUES (
		'$obat_nama',
		'$obat_deskripsi',
		'$obat_indikasi',
		'$obat_harga',
		'$obat_jenis',
		'$obat_efeksamping',
		'$obat_dosis',
		'$obat_perhatian',
		'$obat_isi',
		'$obat_kode',
		'$obat_pic'
		)";
	}

	mysql_query($query);
    if (mysql_affected_rows() > 0) {
        $response["success"] = 1;
        echo json_encode($response);
    } else {
        $response["success"] = 0;
        echo json_encode($response);
    }
} else if ($_SERVER['REQUEST_METHOD'] == 'GET') {
	// GET
    if ($path_params[1] != null) {
		if($path_params[1] != 'key'){
			$query = "SELECT * FROM obat WHERE obat_id = $path_params[1]";
		}else{
			if($path_params[2] == 'obat'){
				$key = $path_params[3];
				//die($key);
				$query = "SELECT * FROM obat WHERE 
								obat_nama LIKE '%$key%' OR 
								obat_deskripsi LIKE '%$key%' OR
								obat_id LIKE '%$key%'";
			}else{
				$key = $path_params[3];
				//die($key);
				$query = "SELECT * FROM obat WHERE obat_indikasi LIKE '%$key%'";
			}
		}
    }else {  
        $query = "SELECT * FROM obat";
    }
	
    $result = mysql_query($query) or die('Query failed: ' . mysql_error());
	if(!empty($result)){
		if (mysql_num_rows($result) > 0) {
            $response["obat"] = array();
            while($row = mysql_fetch_array($result)){
            $obat = array();
            $obat["obat_id"] = $row["obat_id"];
            $obat["obat_nama"] = $row["obat_nama"];
            $obat["obat_deskripsi"] = $row["obat_deskripsi"];
            $obat["obat_indikasi"] = $row["obat_indikasi"];
            $obat["obat_harga"] = $row["obat_harga"];
            $obat["obat_jenis"] = $row["obat_jenis"];
            $obat["obat_pic"] = $row["obat_pic"];
			$obat["obat_efeksamping"] = $row["obat_efeksamping"];
			$obat["obat_dosis"] = $row["obat_dosis"];
			$obat["obat_perhatian"] = $row["obat_perhatian"];
			$obat["obat_isi"] = $row["obat_isi"];
			$obat["obat_kode"] = $row["obat_kode"];
 
            array_push($response["obat"], $obat);
			}
            $response["success"] = 1;
            echo json_encode($response);
        } else {
            $response["success"] = 0;
            echo json_encode($response);
        }
	}
    mysql_free_result($result);
} else if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
	// DELETE
	$input = file_get_contents("php://input");
    $query = "DELETE FROM obat WHERE obat_id=$input";
    $result = mysql_query($query) or die('Query failed: ' . mysql_error());
	$resp;
	if(mysql_affected_rows() > 0){
		$resp = 1;
	}else{
		$resp = 0;
	}
	$response["success"] = $resp;
	echo json_encode($response);
} else if($_SERVER['REQUEST_METHOD'] == 'PUT'){
	// PUT
	$obat_pic = $name;
	$input = explode("+", file_get_contents("php://input"));
	$query = "UPDATE obat SET 
		obat_nama='$input[1]',
		obat_deskripsi='$input[2]',
		obat_indikasi='$input[3]',
		obat_harga='$input[4]',
		obat_jenis='$input[5]',
		obat_efeksamping='$input[6]',
		obat_dosis='$input[7]',
		obat_perhatian='$input[8]',
		obat_isi='$input[9]',
		obat_kode='$input[10]',
		obat_pic='$input[11]'
		WHERE
		obat_id = '$input[0]'";
	//die($query);
	$result = mysql_query($query) or die('Query failed: ' . mysql_error());
	$resp;
	if(mysql_affected_rows() > 0){
		$resp = 1;
	}else{
		$resp = 0;
	}
	$response["success"] = $resp;
	echo json_encode($response);
}
 
mysql_close($link);