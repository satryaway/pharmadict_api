 <?php
 
include "koneksi.php";

if (isset ($_POST['username']) && isset ($_POST['password'])) {
$url = $_SERVER['SERVER_NAME'] . '/pharmadict/obat.php';
$data = $_POST['username'].'+'.md5($_POST['password']);
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
curl_exec($ch);
curl_close($ch);
}

?>