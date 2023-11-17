<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require "important/assets.php";

$print="no";
if(isset($_GET['print']))$print=$_GET['print'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Preview Pembukuan (Bahasa Indonesia)</title>
	<style>
@page { size: auto;  margin: 0mm; }
	.kopsurat
	{
	   line-height:0.68;
	}

	hr
	{
		border-color: gray;
		border-width: 3px;
	}
	</style>
</head>
<div class="box-body col-md-7">
<div align="left">
<table>
	<tr>
		<td align="center" width="135"><img src="<?php echo base_url(); ?>assets/ico/header.png?>" width="250px"></td>
		<td>&nbsp;&nbsp;&nbsp;</td>
		<td align="center">
			<br>
			<p class="kopsurat"><font size="4">REKAPITULASI DATA PENJUALAN TAHUN 2019</font></p>
			<p class="kopsurat"><font size="4"><b>TOKO MAKKAH AL-HIJRAH</b></font></p>
			<p class="kopsurat"><font size="4">MUSLIMAH WEAR SINCE 2018 by RAF&AN</font></p>
		</td>
	</tr>
</table>

<hr>
	<body style="font-family: Times New Roman; font-size: 12pt;" <?php if($print=="yes")echo"onload=window.print()";?>>

		<div style="margin:0 50px 0 50px;text-align:justify;line-height:28px">
			<p>Rekapitulasi penjualan dalam satu tahun setiap bulannya adalah sebagai berikut:</p>
<table class="table table-bordered table-striped">
	<tr>
	<th><center>Tanggal</center></th>
	<th><center>Jumlah Terjual</center></th>
	<th><center>Total Harga</center></th>
</tr>
		<?php
foreach ($jual as $sell)
{
	$tgll = $sell->tgl_jual;
	
			$tgl_d = date('d', strtotime($tgll));
			$tgl_m = date('m', strtotime($tgll));
			$tgl_Y = date('Y', strtotime($tgll));

			if($tgl_m=='01')$bulan="Januari";
			else if($tgl_m=='02')$bulan="Februari";
			else if($tgl_m=='03')$bulan="Maret";
			else if($tgl_m=='04')$bulan="April";
			else if($tgl_m=='05')$bulan="Mei";
			else if($tgl_m=='06')$bulan="Juni";
			else if($tgl_m=='07')$bulan="Juli";
			else if($tgl_m=='08')$bulan="Agustus";
			else if($tgl_m=='09')$bulan="September";
			else if($tgl_m=='10')$bulan="Oktober";
			else if($tgl_m=='11')$bulan="November";
			else if($tgl_m=='12')$bulan="Desember";
			
	$tgl = $bulan.' '.$tgl_Y;
	
	
	
	$jlh = $sell->jlh_barang;
	$tot = 'Rp. '.number_format($sell->total, 0, '', '.');
	
	
?>



				<tr>
				<td><?php echo $tgl;?></td>
				<td align="center"><?php echo $jlh;?></td>
				<td align="right"><?php echo $tot;?></td>
				</tr>			
<?php
}
?>
<?php foreach($total_jual as $totall) { 
		$totalll = 'Rp. '.number_format($totall->total, 0, '', '.');
		?>
<tr><td colspan="2" align="right">Jumlah : </td>
	
<td align="right"><?php echo $totalll;?></td></tr>
<?php } ?>
			</table>
			<!--end-->


			<p>Rekapitulasi pembelian dalam satu tahun setiap bulannya adalah sebagai berikut:</p>
<table class="table table-bordered table-striped">
	<tr>
	<th><center>Tanggal</center></th>
	<th><center>Jumlah Dibeli</center></th>
	<th><center>Total Harga</center></th>
</tr>
		<?php
foreach ($beli as $sell)
{
	$tgll = $sell->tgl_beli;
	
			$tgl_d = date('d', strtotime($tgll));
			$tgl_m = date('m', strtotime($tgll));
			$tgl_Y = date('Y', strtotime($tgll));

			if($tgl_m=='01')$bulan="Januari";
			else if($tgl_m=='02')$bulan="Februari";
			else if($tgl_m=='03')$bulan="Maret";
			else if($tgl_m=='04')$bulan="April";
			else if($tgl_m=='05')$bulan="Mei";
			else if($tgl_m=='06')$bulan="Juni";
			else if($tgl_m=='07')$bulan="Juli";
			else if($tgl_m=='08')$bulan="Agustus";
			else if($tgl_m=='09')$bulan="September";
			else if($tgl_m=='10')$bulan="Oktober";
			else if($tgl_m=='11')$bulan="November";
			else if($tgl_m=='12')$bulan="Desember";
			
	$tgl = $bulan.' '.$tgl_Y;
	
	
	
	$jlh = $sell->jlh_barang;
	$tot = 'Rp. '.number_format($sell->total, 0, '', '.');
	
	
?>



				<tr>
				<td><?php echo $tgl;?></td>
				<td align="center"><?php echo $jlh;?></td>
				<td align="right"><?php echo $tot;?></td>
				</tr>			
<?php
}
?>
<?php foreach($total_beli as $totall) { 
		$totalll = 'Rp. '.number_format($totall->total, 0, '', '.');
		?>
<tr><td colspan="2" align="right">Jumlah : </td>
	
<td align="right"><?php echo $totalll;?></td></tr>
<?php } ?>
			</table>
			<!--end-->
			<p>Dapat disimpulkan bahwa dari jumlah kedua transaksi di atas maka total pendapatan toko Makkah Al-Hijrah adalah <b><?php echo 'Rp. '.number_format($total, 0, '', '.');?></b>.</p>
		</div>
<br><br><br><br><br><br>
<table>
	<tr>
		<td align="center" width="135"><img src="<?php echo base_url(); ?>assets/ico/header.png?>" width="250px"></td>
		<td>&nbsp;&nbsp;&nbsp;</td>
		<td align="center">
			<br>
			<p class="kopsurat"><font size="4">REKAPITULASI DATA PENJUALAN TAHUN 2019</font></p>
			<p class="kopsurat"><font size="4"><b>TOKO MAKKAH AL-HIJRAH</b></font></p>
			<p class="kopsurat"><font size="4">MUSLIMAH WEAR SINCE 2018 by RAF&AN</font></p>
		</td>
	</tr>
</table>
<hr>

	<body style="font-family: Times New Roman; font-size: 12pt;" <?php if($print=="yes")echo"onload=window.print()";?>>

		<div style="margin:0 50px 0 50px;text-align:justify;line-height:28px">
			<p>Rekapitulasi frekuensi nama pembeli dalam transaksi jual adalah sebagai berikut:</p>
<table class="table table-bordered table-striped">
	<tr>
	<th><center>Nama Pembeli</center></th>
	<th><center>Frekuensi</center></th>
</tr>
		<?php
foreach ($pembeli as $sell)
{	
?>
				<tr>
				<td ><?php echo $sell->nama_pembeli;?></td>
				<td align="center"><?php echo $sell->frekuensi_beli;?></td>
				</tr>			
<?php
}
?>
			</table>
			<p>Dapat disimpulkan bahwa 3 nama di atas adalah nama pembeli yang paling banyak membeli barang di toko Makkah Al-Hijrah dan berhak mendapatkan reward jika tersedia.</p>
			<!--end-->
		</div>
		<br><br><br>
			<table>
	<tr>
		<td align="center" width="135"><img src="<?php echo base_url(); ?>assets/ico/header.png?>" width="250px"></td>
		<td>&nbsp;&nbsp;&nbsp;</td>
		<td align="center">
			<br>
			<p class="kopsurat"><font size="4">REKAPITULASI DATA PENJUALAN TAHUN 2019</font></p>
			<p class="kopsurat"><font size="4"><b>TOKO MAKKAH AL-HIJRAH</b></font></p>
			<p class="kopsurat"><font size="4">MUSLIMAH WEAR SINCE 2018 by RAF&AN</font></p>
		</td>
	</tr>
</table>
<hr>

	<body style="font-family: Times New Roman; font-size: 12pt;" <?php if($print=="yes")echo"onload=window.print()";?>>

		<div style="margin:0 50px 0 50px;text-align:justify;line-height:28px">
			<p>Rekapitulasi frekuensi barang yang dibeli dalam transaksi jual adalah sebagai berikut:</p>
<table class="table table-bordered table-striped">
	<tr>
	<th><center>Nama Barang</center></th>
	<th><center>Frekuensi Dibeli</center></th>
</tr>
		<?php
foreach ($barang as $sell)
{	
?>
				<tr>
				<td><?php echo $sell->nama_barang;?></td>
				<td align="center"><?php echo $sell->frekuensi_dibeli;?></td>
				</tr>			
<?php
}
?>
			</table>
			<p>Barang yang sedikit peminat sebaiknya diproduksi dalam jumlah yang sedikit dan barang yang banyak peminat sebaiknya diproduksi dalam jumlah yang lebih banyak dari sebelumnya.</p>
			<?php
			date_default_timezone_set("Asia/Jakarta");
			$tgl = date("d-m-Y");
			$tgll = $tgl;
	
			$tgl_d = date('d', strtotime($tgll));
			$tgl_m = date('m', strtotime($tgll));
			$tgl_Y = date('Y', strtotime($tgll));

			if($tgl_m=='01')$bulan="Januari";
			else if($tgl_m=='02')$bulan="Februari";
			else if($tgl_m=='03')$bulan="Maret";
			else if($tgl_m=='04')$bulan="April";
			else if($tgl_m=='05')$bulan="Mei";
			else if($tgl_m=='06')$bulan="Juni";
			else if($tgl_m=='07')$bulan="Juli";
			else if($tgl_m=='08')$bulan="Agustus";
			else if($tgl_m=='09')$bulan="September";
			else if($tgl_m=='10')$bulan="Oktober";
			else if($tgl_m=='11')$bulan="November";
			else if($tgl_m=='12')$bulan="Desember";
			
	$tglll = $tgl_m.' '.$bulan.' '.$tgl_Y;

			 ?>
<p align="right">Medan, <?php echo $tglll;?></p>

		<?php
foreach ($data_user as $user)
{	
?>
<br>
<p align="right"><?php echo $user->nama;?> (Admin)</p>
<?php  } ?>
</div>
</div>
</body>
</html>
