<?php
// array for JSON response
$response = array();
 
// include db connect class
require_once '/db_connect.php';
 
// connecting to db
$db = new DB_CONNECT();
 
// check for post data
if (isset($_GET["key"])) {
    $key = $_GET['key'];
 
    // get obat from obat table
    $result = mysql_query("SELECT * FROM obat WHERE 
							obat_nama LIKE '%$key%' OR 
							obat_deskripsi LIKE '%$key%' OR 
							obat_indikasi LIKE '%$key%' OR
							obat_id LIKE '%$key%'");
 
    if (!empty($result)) {
        // check for empty result
        if (mysql_num_rows($result) > 0) {
            // user node
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
            // echoing JSON response
            echo json_encode($response);
        } else {
            // no obat found
            $response["success"] = 0;
            $response["message"] = "Data tidak ditemukan";

            // echo no users JSON
            echo json_encode($response);
        }
    } else {
        // no obat found
        $response["success"] = 0;
        $response["message"] = "Kata kunci tidak ditemukan";
 
        // echo no users JSON
        echo json_encode($response);
    }
} else {
    // required field is missing
    $response["success"] = 0;
    $response["message"] = "Required field(s) is missing";
 
    // echoing JSON response
    echo json_encode($response);
}
?>