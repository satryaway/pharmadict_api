<?php

require_once '/db_connect.php';
$response = array();
$db = new DB_CONNECT();

$obat_nama = $_POST['obat_nama'];
$obat_deskripsi = $_POST['obat_deskripsi'];
$obat_indikasi = $_POST['obat_indikasi'];
$obat_harga = $_POST['obat_harga'];
$obat_jenis = $_POST['obat_jenis'];
//$obat_pic = $_POST['obat_pic'];
	
if(strlen($_POST['obat_id']) != 0){
	//UPDATE
	$obat_id = $_POST['obat_id'];
	$query = "UPDATE obat SET 
		obat_nama='$obat_nama',
		obat_deskripsi='$obat_deskripsi',
		obat_indikasi='$obat_indikasi',
		obat_harga='$obat_harga',
		obat_jenis='$obat_jenis'
		WHERE
		obat_id = '$obat_id'";
}else{
	$query = "INSERT INTO obat (
		obat_nama,
		obat_deskripsi,
		obat_indikasi,
		obat_harga,
		obat_jenis) VALUES (
		'$obat_nama',
		'$obat_deskripsi',
		'$obat_indikasi',
		'$obat_harga',
		'$obat_jenis'
		)";
}
$result = mysql_query($query);
if (!empty($result)) {
    if ( mysql_affected_rows() == 1) {
        $response["success"] = 1;
        echo json_encode($response);
    } else {
        $response["success"] = 0;
        echo json_encode($response);
    }
} else {
        $response["success"] = 2;
        echo json_encode($response);
}

?>