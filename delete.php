<?php
    include "koneksi.php";
 
    $id = $_GET['id'];
     //echo $id;
 
    $url = $_SERVER['SERVER_NAME'] . '/pharmadict/obat.php/'.$id.'';
 
    $ch = curl_init();
 
    // $data = "<data><book>
                // <id>" . $id . "</id>
                // </book></data>";
 
    // Bagian untuk memanggil request DELETE dari books.php
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "DELETE");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $id);
 
        curl_exec($ch);
        curl_close($ch);
 
        //echo "<a href='index.php'>Kembali ke index.php</a>";
 
    ?>