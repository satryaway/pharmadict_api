<?php
include "koneksi.php";

$query = "SELECT * FROM obat ORDER BY obat_nama ";
$result = mysql_query($query) or die('Query failed: ' . mysql_error());
?>
<body>
<div style="width:650px; margin:0 auto;">
	<table border = '1'>
		<tr>
			<th>Id</th>
			<th>Nama</th>
			<th>Indikasi</th>
			<th>Jenis</th>
			<th>Gambar</th>
			<th>Action</th>
		</tr>
<?php

while($row = mysql_fetch_array($result)){
?>
		<tr>
			<td><?php echo $row['obat_id'];?></td>
			<td><?php echo $row['obat_nama']?></td>
			<td><?php echo substr($row['obat_indikasi'],0,50)?>...</td>
			<td><?php echo $row['obat_jenis']?></td>
			<td><img height='50' width='50' src='pic/<?php echo $row['obat_pic']?>' /></td>
			<td><a href='eg2.php?id=<?php echo $row['obat_id']?>'>Edit</a> | <a href='delete.php?id=<?php echo $row['obat_id']?>'>Delete</a>
		</tr>
<?php
	}
	?>
</table>

</div>
</body>