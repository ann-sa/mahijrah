<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>

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
        Hasil Pencarian
            
      </h1>
            <ol class="breadcrumb">
        <li><a href="<?php echo base_url(); ?>index.php/mahijrah"><i class="fa fa-home"></i> Awal</a></li>
        <li class="active"> Hasil Pencarian</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Transaksi Beli per Barang</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse">
              <i class="fa fa-plus"></i></button>
          </div>
        </div>
        <div class="box-body">


      <table id="example1"class="table table-bordered table-striped">
    <thead>

            <tr>
              <th>Tanggal Beli</th>
              <th>Nama Penjual</th>
              <th>Jenis Barang</th>
              <th>Bahan</th>
              <th>Model</th>
              <th>Ukuran</th>
              <th>Warna</th>
              <th>Jumlah Barang</th>
              <th>Harga Beli</th>
              <th>Total Harga</th>
            </tr>
    </thead>
    <tbody>
    <?php foreach($data_beli as $buy) { 
      $tgl = $buy->tgl_beli;
      $date = date('d F Y', strtotime($tgl));
      $tgll = $buy->tgl_beli;
  
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
      
  $tgl = $tgl_d.' '.$bulan.' '.$tgl_Y;
      ?>
          <tr>
            <td><?php echo $tgl;?></td>
            <td><?php echo $buy->nama_penjual;?></td>
            <td><?php echo $buy->nama_barang;?></td>
            <td><?php echo $buy->nama_bahan;?></td>
            <td><?php echo $buy->nama_model;?></td>
            <td><?php echo $buy->ukuran;?></td>
            <td><?php echo $buy->warna;?></td>
            <td><?php echo $buy->jlh_barang;?></td>
            <td><?php echo 'Rp. '.number_format($buy->harga_beli, 0, '', '.');?></td>
            <td><?php echo 'Rp. '.number_format($buy->total, 0, '', '.');?></td>
          </tr>
        <?php } ?>
        </tbody>
      </table>

        </div>
        <!-- /.box-body -->
        <div class="box-footer">

        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
<!-- END -->

<!--JUAL-->
      <div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Transaksi Jual per Barang</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse">
              <i class="fa fa-plus"></i></button>
          </div>
        </div>
        <div class="box-body">


      <table id="example2"class="table table-bordered table-striped">
    <thead>
            <tr>
              <th>Tanggal Jual</th>
              <th>Nama Pembeli</th>
              <th>Jenis Barang</th>
              <th>Bahan</th>
              <th>Model</th>
              <th>Ukuran</th>
              <th>Warna</th>
              <th>Jumlah Barang</th>
              <th>Harga Jual</th>
              <th>Total Harga</th>
      </tr>
    </thead>
    <tbody>
<?php foreach($data_jual as $sell) { 
      $tgl = $sell->tgl_jual;
      $date = date('d F Y', strtotime($tgl));
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
      
  $tgl = $tgl_d.' '.$bulan.' '.$tgl_Y;
  ?>
            <tr>
            <td><?php echo $tgl;?></td>
            <td><?php echo $sell->nama_pembeli;?></td>
            <td><?php echo $sell->nama_barang;?></td>
            <td><?php echo $sell->nama_bahan;?></td>
            <td><?php echo $sell->nama_model;?></td>
            <td><?php echo $sell->ukuran;?></td>
            <td><?php echo $sell->warna;?></td>
            <td><?php echo $sell->jlh_barang;?></td>
            <td><?php echo 'Rp. '.number_format($sell->harga_jual, 0, '', '.');?></td>
            <td><?php echo 'Rp. '.number_format($sell->total, 0, '', '.');?></td>
          </tr>
        <?php } ?>
        </tbody>
      </table>

        </div>
        <!-- /.box-body -->
        <div class="box-footer">

        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
<!-- END -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


