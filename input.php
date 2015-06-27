<?php

include "koneksi.php";

$obat_id = $_POST['obat_id'];
$obat_nama = $_POST['obat_nama'];
$obat_deskripsi = $_POST['obat_deskripsi'];
$obat_indikasi = $_POST['obat_indikasi'];
$obat_harga = $_POST['obat_harga'];
$obat_jenis = $_POST['obat_jenis'];
//$obat_pic = $_POST['obat_pic'];

$url = $_SERVER['SERVER_NAME'] . '/pharmadict/obat.php';
$data = $obat_id.'+'.$obat_nama.'+'.$obat_deskripsi.'+'.$obat_indikasi.'+'.$obat_harga.'+'.$obat_jenis;
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "PUT");
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
curl_exec($ch);
curl_close($ch);

?>