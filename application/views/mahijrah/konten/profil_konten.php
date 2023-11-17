<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>

<!-- START Modal Ganti Foto Profil -->
<div class="modal fade" id="2019gantifotoprofil">
  <div class="modal-dialog modal-sm">
	<div class="modal-content">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		  <span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title">Ganti Foto Profil</h4>
	  </div>
	  <div class="modal-body">
		
		
<form role="form" method="POST" action="<?php echo base_url(); ?>index.php/mahijrah/new_foto_profil/" enctype="multipart/form-data">

		<div class="form-group">
			<input type="file" name="fotoprofil">
		</div>
		<div class="form-group">
		<button type="submit" class="btn btn-block btn-primary"><i class="fa fa-upload"></i> Upload dan Ganti Foto</button>
		</div>
		<div class="form-group">
		<button type="button" class="btn btn-block btn-default" data-dismiss="modal">Batal</button>
		</div>

</form>
	  </div>
	</div>
  </div>
</div>
<!-- END Modal Ganti Foto Profil -->

<!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">

      <h1>Profil</h1>
    	
            <ol class="breadcrumb">
        <li><a href="<?php echo base_url(); ?>index.php/mahijrah"><i class="fa fa-home"></i> Awal</a></li>
      </ol>
    </section>



    <!-- Main content -->
    <section class="content">
<?php include"additional_info.php"; ?> <!-- FILE INFO POP-UP -->
<div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Lihat Profil</h3>
		  

        </div>
		
        <div class="col-md-8 box-body">
    <?php
  foreach ($data_user as $biodata)
  {
	  $tgll = $biodata->tgl_lahir;
	  $tgl_d = date('d', strtotime($tgll));
	  $tgl_m = date('m', strtotime($tgll));
	  $tgl_Y = date('Y', strtotime($tgll));
	  
	  if($tgl_m=='01')$bulan_lahir="Januari";
	  else if($tgl_m=='02')$bulan_lahir="Februari";
	  else if($tgl_m=='03')$bulan_lahir="Maret";
	  else if($tgl_m=='04')$bulan_lahir="April";
	  else if($tgl_m=='05')$bulan_lahir="Mei";
	  else if($tgl_m=='06')$bulan_lahir="Juni";
	  else if($tgl_m=='07')$bulan_lahir="Juli";
	  else if($tgl_m=='08')$bulan_lahir="Agustus";
	  else if($tgl_m=='09')$bulan_lahir="September";
	  else if($tgl_m=='10')$bulan_lahir="Oktober";
	  else if($tgl_m=='11')$bulan_lahir="November";
	  else if($tgl_m=='12')$bulan_lahir="Desember";
?>
   
			<div class="form-group">
				<img src="<?php echo base_url(); ?>assets/foto_profil/<?php echo $biodata->foto_profil;?>" alt="User Image" height="250px">
            </div>
			<table class="table">
			
				<tr>
                  <td width="30%">ID Admin</td>
                  <td>: <?php echo $biodata->ID_admin;?></td>
                </tr>

				<tr>
                  <td width="30%">Username</td>
                  <td>: <?php echo $biodata->username;?></td>
                </tr>
				
				<tr>
                  <td>Nama</td>
                  <td>: <?php echo $biodata->nama;?></td>
                </tr>
				
				<tr>
                  <td>Email</td>
                  <td>: <?php echo $biodata->email;?></td>
                </tr>
				
				<tr>
                  <td>Jenis Kelamin</td>
                  <td>: <?php echo $biodata->jenis_kelamin;?></td>
                </tr>
				
				<tr>
                  <td>Tanggal Lahir</td>
                  <td>: <?php echo $tgl_d.' '.$bulan_lahir.' '.$tgl_Y;?></td>
                </tr>
				
              </table>
<?php }?>

<br>


<a data-toggle="modal" data-target="#2019gantifotoprofil" title="Ubah foto" class="btn btn-default"><i class="fa fa-picture-o"></i> Ubah foto</a>    
<a href="<?php echo base_url(); ?>index.php/mahijrah/editprofil" title="Edit profil" class="btn btn-default"><i class="fa fa-edit"></i> Edit profil</a> 




        <!-- /.box-footer-->
      </div>
	  <div class="box-footer"></div>
</div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
</div>
  <!-- /.content-wrapper -->
