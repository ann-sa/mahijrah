<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<div class="modal fade" id="btl">
  <div class="modal-dialog modal-sm">
     <div class="modal-content">
        <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title">Konfirmasi Batal</h4>
        </div>
          <div class="modal-body">
          <p>Anda yakin ingin membatalkan input detail?</p>
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
        Input Detail
      </h1>
            <ol class="breadcrumb">
        <li><a href="<?php echo base_url(); ?>index.php/mahijrah"><i class="fa fa-home"></i> Awal</a></li>
        <li class="active"> Input Detail</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <?php include"additional_info.php"; ?> <!-- FILE INFO POP-UP -->
      <div class="row">
        <!-- left column -->
        <div class="col-md-12">
          <!-- general form elements -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Input <?php echo $judul;?></h3>
            </div>

<!-- /.box-header -->
<!-- form start -->
      <form role="form" method="POST" action="<?php echo base_url(); ?>index.php/mahijrah/simpaninput_detail">
              <div class="col-md-8 box-body">     
                <button type="button" class="btn btn-primary" id="btn-tambah-form">Tambah Data Form</button>
                <button type="button" class="btn btn-danger" id="btn-reset-form">Reset Form</button><br><br>   
              <table class="table table-bordered">
                <tr>
                  <td width="15%">Kode <?php echo $judul;?></td>
                  <td width="35%"><input type="text" class="form-control" name="kode_<?php echo $judul; ?>[]"></td>
                </tr>
      
                <tr>
                  <td><?php echo $judul;?></td>
                  <td><input type="text" class="form-control" name="<?php echo $judul; ?>[]"></td>
                </tr> 
              </table>
        
        <br><br>

      <div id="insert-form"></div>

            <!-- Kita buat textbox untuk menampung jumlah data form -->
  <input type="hidden" id="jumlah-form" value="1">
  
  <script>
  $(document).ready(function(){ // Ketika halaman sudah diload dan siap
    $("#btn-tambah-form").click(function(){ // Ketika tombol Tambah Data Form di klik
      var jumlah = parseInt($("#jumlah-form").val()); // Ambil jumlah data form pada textbox jumlah-form
      var nextform = jumlah + 1; // Tambah 1 untuk jumlah form nya
      
      // Kita akan menambahkan form dengan menggunakan append
      // pada sebuah tag div yg kita beri id insert-form
      $("#insert-form").append("<table class='table table-bordered'>" +
        "<tr>" +
        "<td width='15%'>Kode <?php echo $judul;?></td>" +
        "<td width='35%'><input type='text' class='form-control' name='kode_<?php echo $judul; ?>[]'></td>" +
        "</tr>" +
        "<tr>" +
        "<td><?php echo $judul;?></td>" +
        "<td><input type='text' class='form-control' name='<?php echo $judul; ?>[]'></td>" +
        "</tr>" +
        "</table>" +
        "<br><br>");
      
      $("#jumlah-form").val(nextform); // Ubah value textbox jumlah-form dengan variabel nextform
    });
    
    // Buat fungsi untuk mereset form ke semula
    $("#btn-reset-form").click(function(){
      $("#insert-form").html(""); // Kita kosongkan isi dari div insert-form
      $("#jumlah-form").val("1"); // Ubah kembali value jumlah form menjadi 1
    });
  });
  </script>

        <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Simpan</button>
        <a href="" data-toggle="modal" data-target="#btl" title="Batal" class="btn btn-default">Batal</a> 
              </div>
              <!-- /.box-body -->

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
