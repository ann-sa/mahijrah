<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<div class="modal fade" id="cb">
  <div class="modal-dialog modal-sm">
     <div class="modal-content">
        <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title">Konfirmasi Batal</h4>
        </div>
          <div class="modal-body">
          <p>Anda yakin ingin membatalkan edit profil?</p>
           <center><a href="<?php echo base_url(); ?>index.php/mahijrah/profil" class="btn btn-danger"><i class="glyphicon glyphicon-ok"></i> Ya</a>
           <button type="button" class="btn btn-default" data-dismiss="modal">Tidak</button>
      </center>
      </div>
     </div>
  </div>
</div>
<!-- =============================================== -->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Profil
      </h1>
        <ol class="breadcrumb">
        <li><a href="<?php echo base_url(); ?>index.php/mahijrah"><i class="fa fa-home"></i> Awal</a></li>
        <li class="active"> Edit Profil</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-12">
          <!-- general form elements -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Edit Profil</h3>
            </div>

<?php		
echo "<div class='form_error'>";
echo validation_errors();
echo "</div>";	
?>		

            <!-- /.box-header -->
            <!-- form start -->
<?php
// var_dump($data_user);
  foreach ($data_user as $pengguna)
  {
    ?>
  
            <form role="form" method="POST" action="<?php echo base_url(); ?>index.php/mahijrah/simpaneditprofil">
              <div class="col-md-8 box-body">
                
				
                
				
				
				
			<table class="table table-bordered">
			
                <tr>
                  <td width="30%">ID Admin</td>
                  <td><input type="text" class="form-control" name="username" value="<?php echo $pengguna->ID_admin ;?>"readonly></td>
                </tr>

				        <tr>
                  <td width="30%">Username</td>
                  <td><input type="text" class="form-control" name="username" value="<?php echo $pengguna->username ;?>"></td>
                </tr>
			
                <tr>
                  <td>Nama</td>
                  <td><input type="text" class="form-control" name="nama" required autofocus pattern="[a-zA-Z]+"  title="Please enter your name here" value="<?php echo $pengguna->nama ;?>"></td>
                </tr>
				
				<tr>
                  <td>Email</td>
                  <td><input type="text" class="form-control" name="email" value="<?php echo $pengguna->email ;?>"></td>
                </tr>
				
				<tr>
                  <td>Jenis Kelamin</td>
                  <td>
						<input type="radio" name="jenis_kelamin" value="Laki-laki" <?php if($pengguna->jenis_kelamin == "Laki-laki")echo"checked" ;?>> Laki-laki
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="jenis_kelamin" value="Perempuan" <?php if($pengguna->jenis_kelamin == "Perempuan")echo"checked" ;?>> Perempuan
					</td>
                </tr>
				
				<tr>
                  <td>Tanggal Lahir</td>
                  <td><input type="date" class="form-control" name="tgl_lahir" value="<?php echo $pengguna->tgl_lahir ;?>"></td>
                </tr>
				
              </table>
				
				
				
				
				
				<br>
				<button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-ok"></i> Simpan</button>
        <a href="" data-toggle="modal" data-target="#cb" title="Batal" class="btn btn-default">Batal</a> 
              </div>
              <!-- /.box-body -->


              <div class="box-footer">
                
              </div>
            </form>

<?php }?>
          </div>
        </div>
        <!--/.col (right) -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
