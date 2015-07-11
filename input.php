<?php

include "koneksi.php";

$obat_id = $_POST['obat_id'];
$obat_nama = $_POST['obat_nama'];
$obat_deskripsi = $_POST['obat_deskripsi'];
$obat_indikasi = $_POST['obat_indikasi'];
$obat_harga = $_POST['obat_harga'];
$obat_jenis = $_POST['obat_jenis'];
$obat_efeksamping=$_POST['obat_efeksamping'];
$obat_dosis=$_POST['obat_dosis'];
$obat_perhatian=$_POST['obat_perhatian'];
$obat_isi=$_POST['obat_isi'];
$obat_kode=$_POST['obat_kode'];
$obat_pic = $_POST['obat_pics'];

$target_dir = "pic/";
$target_file = $target_dir . basename($_FILES["obat_pic"]["name"]);
$tmp_name = $_FILES['obat_pic']['tmp_name'];
$name = $_FILES['obat_pic']['name'];
	
$uploadOk = 1;
$imageFileType = pathinfo($target_file, PATHINFO_EXTENSION);
if($_FILES['obat_pic']['name'] != '')
{
	if(!move_uploaded_file($tmp_name, "$target_dir/$name")){
		die($target_file."failed");
	}
} else {
	$name = $obat_pic;
}
$url = $_SERVER['SERVER_NAME'] . '/pharmadict/obat.php';
$data = $obat_id.'+'.$obat_nama.'+'.$obat_deskripsi.'+'.$obat_indikasi.'+'.$obat_harga.'+'.$obat_jenis.'+'.$obat_efeksamping
.'+'.$obat_dosis.'+'.$obat_perhatian.'+'.$obat_isi.'+'.$obat_kode.'+'.$name;
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "PUT");
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
curl_exec($ch);
curl_close($ch);

?>