<?php

include "koneksi.php";
	
$id = $_GET['id'];
$url = $_SERVER['SERVER_NAME'] . '/pharmadict/obat.php/'.$id.'';
 
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "DELETE");
curl_setopt($ch, CURLOPT_POSTFIELDS, $id);
curl_exec($ch);
curl_close($ch);

?>