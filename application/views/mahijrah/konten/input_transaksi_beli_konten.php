<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<div class="modal fade" id="cancel">
  <div class="modal-dialog modal-sm">
     <div class="modal-content">
        <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title">Konfirmasi Batal</h4>
        </div>
          <div class="modal-body">
          <p>Anda yakin ingin membatalkan input transaksi?</p>
           <center><a href="<?php echo base_url(); ?>index.php/mahijrah" class="btn btn-danger"><i class="glyphicon glyphicon-ok"></i> Ya</a>
           <button type="button" class="btn btn-default" data-dismiss="modal">Tidak</button>
      </center>
      </div>
     </div>
  </div>
</div>
<!-- =============================================== -->
<?php   
echo "<div class='form_error'>";
echo validation_errors();
echo "</div>";  
?>    

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Input Transaksi
      </h1>
            <ol class="breadcrumb">
        <li><a href="<?php echo base_url(); ?>index.php/mahijrah"><i class="fa fa-home"></i> Awal</a></li>
        <li class="active"> Input Transaksi Beli</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <?php include"additional_info.php";?>
      <div class="row">
        <!-- left column -->
        <div class="col-md-12">
          <!-- general form elements -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Transaksi Beli</h3>
            </div>

            <!-- form start -->
            <!-- /.box-body -->
            <form role="form" method="POST" action="<?php echo base_url(); ?>index.php/mahijrah/simpaninput_transaksi">
              <div class="col-md-8 box-body"> 
              <input type="text" name="beli" value="Beli" readonly hidden>
                <table class="table table-bordered">
                <?php foreach ($beli as $buy) {
                      ?>
                      <input type="text" name="id_beli" value="<?php echo $buy->id_beli;?>" readonly hidden>
                 <tr>
                  <td>Tanggal Beli</td>
                  <td><input type="date" class="form-control" name="tgl_beli" ></td>
                </tr>
              <?php }?>

                <tr>
                  <td>Nama Penjual</td>
                  <td><input type="text" class="form-control" name="nama_penjual"></td>
                </tr>

                <tr>
                  <td width="15%">Jenis Barang</td>
                  <td width="35%">
                    <select name="kode_barang" class="form-control">
                      
                      <?php foreach ($barang as $brg) {
                      ?>
                      <option value="<?php echo $brg->kode_barang;?>"><?php echo $brg->nama_barang;?></option>
                      <?php } ?>
                    </select>
                  </td>
                </tr>

                <tr>
                  <td width="15%">Bahan</td>
                  <td width="35%">
                  <select name="kode_bahan" class="form-control">
                    
                    <?php foreach ($bahan as $bhn) {
                    ?>
                    <option value="<?php echo $bhn->kode_bahan;?>"><?php echo $bhn->nama_bahan;?></option>
                    <?php } ?>
                    </select>
                  </td>
                </tr>

                <tr>
                  <td width="15%">Model</td>
                  <td width="35%">
                  <select name="kode_model" class="form-control">
                    
                    <?php foreach ($model as $mode) {
                    ?>
                    <option value="<?php echo $mode->kode_model;?>"><?php echo $mode->nama_model;?></option>
                    <?php } ?>
                    </select>
                  </td>
                </tr>

                <tr>
                  <td width="15%">Ukuran</td>
                  <td width="35%">
                  <select name="kode_ukuran" class="form-control">
                    
                    <?php foreach ($ukuran as $size) {
                    ?>
                    <option value="<?php echo $size->kode_ukuran;?>"><?php echo $size->ukuran;?></option>
                    <?php } ?>
                    </select>
                  </td>
                </tr>

                <tr>
                  <td width="15%">Warna</td>
                  <td width="35%">
                  <select name="kode_warna" class="form-control">
                    
                    <?php foreach ($warna as $color) {
                    ?>
                    <option value="<?php echo $color->kode_warna;?>"><?php echo $color->warna;?></option>
                    <?php } ?>
                    </select>
                  </td>
                </tr>

                <tr>
                  <td width="15%">Jumlah Barang</td>
                  <td width="35%"><input type="number" class="form-control" name="jlh_barang"></td>
                </tr>

                <tr>
                  <td width="15%">Harga Beli</td>
                  <td width="35%"><input type="number" class="form-control" name="harga_beli"></td>
                </tr> 

                <tr>
                  <td width="15%">Harga Jual</td>
                  <td width="35%"><input type="number" class="form-control" name="harga_jual"></td>
                </tr> 
                
              </table>
        
              <br>

              <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Simpan</button>
              <a href="" data-toggle="modal" data-target="#cancel" title="Batal" class="btn btn-default">Batal</a> 
              </div>
              <div class="box-footer">
                
              </div>
              </form>
          </div>
        </div>
        <!--/.col (right) -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
