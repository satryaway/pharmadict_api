<html>
<body>
<?php
include "koneksi.php";
$id = $_GET['id'];
$query = "SELECT * FROM obat WHERE obat_id = $id";

if(isset($_GET['id'])){
	$result = mysql_query($query) or die('Query failed: ' . mysql_error());
	$row = mysql_fetch_array($result);
}
?>
<form enctype="multipart/form-data" action="<?php if(!isset($_GET['id'])){?>obat.php<?php }else{?>input.php<?php } ?>" method="post">
<table>
	<tr>
		<td>id</td>
		<td><input disabled type="text" value="<?php echo $row['obat_id'];?>"></td>
		<td><input type="text" style="display:none;" value="<?php echo $row['obat_id'];?>" name="obat_id"></td>
	</tr>
	<tr>
		<td>nama</td>
		<td><input type="text" value="<?php echo $row['obat_nama'];?>" name="obat_nama"></td>
	<tr>
		<td>deskripsi</td>
		<td><textarea type="text" style="width:500px; height:150px;" name="obat_deskripsi"><?php echo $row['obat_deskripsi'];?></textarea></td>
	</tr>
	</tr>
		<td>indikasi</td>
		<td><textarea type="text" style="width:500px; height:150px;" name="obat_indikasi"><?php echo $row['obat_indikasi'];?></textarea></td>
	<tr>
		<td>jenis</td>
		<td>
			<input type="radio" name="obat_jenis" value="1" <?php echo ($row['obat_jenis'] == 1)?'checked':'';?> />Tablet
			<input type="radio" name="obat_jenis" value="2" <?php echo ($row['obat_jenis'] == 2)?'checked':'';?> />Kapsul
			<input type="radio" name="obat_jenis" value="3" <?php echo ($row['obat_jenis'] == 3)?'checked':'';?> />Sirup
			<input type="radio" name="obat_jenis" value="4" <?php echo ($row['obat_jenis'] == 4)?'checked':'';?> />Puyer
			<input type="radio" name="obat_jenis" value="5" <?php echo ($row['obat_jenis'] == 5)?'checked':'';?> />Krim
			<input type="radio" name="obat_jenis" value="6" <?php echo ($row['obat_jenis'] == 6)?'checked':'';?> />Salep
			<input type="radio" name="obat_jenis" value="7" <?php echo ($row['obat_jenis'] == 7)?'checked':'';?> />Minyak
		</td>
	</tr>
	<tr>
		<td>harga</td>
		<td><input type="text" value="<?php echo $row['obat_harga'];?>" name="obat_harga"></td>
	</tr>
	<tr>
		<td>efek samping</td>
		<td><textarea type="text" style="width:500px; height:150px;" name="obat_efeksamping"><?php echo $row['obat_efeksamping'];?></textarea></td>
	</tr>
	<tr>
		<td>dosis</td>
		<td><textarea type="text" style="width:500px; height:150px;" name="obat_dosis"><?php echo $row['obat_dosis'];?></textarea></td>
	</tr>
	<tr>
		<td>perhatian</td>
		<td><textarea type="text" style="width:500px; height:150px;" name="obat_perhatian"><?php echo $row['obat_perhatian'];?></textarea></td>
	</tr>
	<tr>
		<td>isi</td>
		<td><input type="text" value="<?php echo $row['obat_isi'];?>" name="obat_isi"></td>
	</tr>
	<tr>
		<td>kode</td>
		<td><input type="radio" name="obat_kode" value="1" <?php echo ($row['obat_kode'] == 1)?'checked':'';?> />Ringan
			<input type="radio" name="obat_kode" value="2" <?php echo ($row['obat_kode'] == 2)?'checked':'';?> />Sedang
			<input type="radio" name="obat_kode" value="3" <?php echo ($row['obat_kode'] == 3)?'checked':'';?> />Keras
		</td>
	</tr>
	
	<tr>
		<td>gambar</td>
		<td><?php if($row['obat_pic'] != ''){ ?><img height="100" width="200" src="pic/<?php echo $row['obat_pic'];?>"/>	<?php }?><input type="file" name="obat_pic"></td>
		<td><input type="text" style="display:none;" value="<?php echo $row['obat_pic'];?>" name="obat_pics"></td>
	</tr>
	<tr>
		<td><input type="submit" value="Submit"></td>
	</tr>

</table>
</form>
</body>
</html> 