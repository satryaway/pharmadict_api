<?php
$response = array();
require_once '/db_connect.php';
$db = new DB_CONNECT();
 
    $obat_id = $_DELETE['obat_id'];
    //$obat_pic = $_POST['obat_pic'];
 
	$query = "DELETE from obat WHERE obat_id = $obat_id";
	
	die($_SERVER['REQUEST_METHOD']);
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