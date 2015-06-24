<?php
    // Koneksi ke Database
    $link = mysql_connect('localhost', 'root', '') or die('Could not connect: ' . mysql_error());
    mysql_select_db('pharmadict') or die('Could not select database');
?>