<?php
// array for JSON response
$response = array();
 
// include db connect class
require_once '/db_connect.php';
 
// connecting to db
$db = new DB_CONNECT();
 
// check for post data
if (isset($_POST["username"]) && isset($_POST["password"])) {
    $username = $_POST['username'];
    $password = md5($_POST['password']);
 
    // get obat from obat table
    $result = mysql_query("SELECT * FROM admin WHERE username='$username' && password='$password'");
 
    if (!empty($result)) {
        // check for empty result
        if (mysql_num_rows($result) > 0) {
            // user node

            $response["success"] = 1;
            // echoing JSON response
            echo json_encode($response);
        } else {
            // no obat found
            $response["success"] = 0;

            // echo no users JSON
            echo json_encode($response);
        }
    } else {
        // no obat found
        $response["success"] = 0;
 
        // echo no users JSON
        echo json_encode($response);
    }
} else {
    // required field is missing
    $response["success"] = 0;
 
    // echoing JSON response
    echo json_encode($response);
}
?>