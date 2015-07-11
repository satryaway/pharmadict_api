<?php
/*
 * samstudio
 */

header('Content-Type: application/json');
include "koneksi.php";

$path = $_SERVER[PATH_INFO];
if($path != null){
	$path_params = spliti ("/", $path);
}
	die($_SERVER['REQUEST_METHOD']);

if($_SERVER['REQUEST_METHOD'] == 'POST'){
	// POST

	$input = explode("+", file_get_contents("php://input"));
    $result = mysql_query("SELECT * FROM admin WHERE username='$input[0]' && password='$input[1]'");
 
    if (!empty($result)) {
        if (mysql_num_rows($result) > 0) {
            $response["success"] = 1;
            echo json_encode($response);
        } else {
            $response["success"] = 0;
            echo json_encode($response);
        }
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
			$key = $path_params[2];
			$query = "SELECT * FROM obat WHERE 
							obat_nama LIKE '%$key%' OR 
							obat_deskripsi LIKE '%$key%' OR 
							obat_indikasi LIKE '%$key%' OR
							obat_id LIKE '%$key%'";
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
}
 
mysql_close($link);