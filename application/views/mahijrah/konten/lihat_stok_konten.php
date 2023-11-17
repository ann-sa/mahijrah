<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<?php   
echo "<div class='form_error'>";
echo validation_errors();
echo "</div>";  
?>    

<!-- =============================================== -->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>Stok Barang</h1>
      <ol class="breadcrumb">
        <li><a href="<?php echo base_url(); ?>index.php/mahijrah"><i class="fa fa-home"></i> Awal</a></li>
        <li class="active"> Stok <?php echo $judul;?></li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">

<!--CIPUT RAJUT-->
<!--START-->
<?php if($judul=="Ciput Rajut") { ?>
      <div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Ciput Rajut 1 Warna</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse">
              <i class="fa fa-plus"></i></button>
          </div>
        </div>
        <div class="box-body">


      <table id="example1"class="table table-bordered table-striped">
    <thead>
            <tr>
        <th>No.</th>
        <th>Warna</th>
        <th>Jumlah Stok</th>  
      </tr>
    </thead>
    <tbody>
<?php $no=1; foreach ($crj01 as $stok) {
?>
                <tr>
                  <td><?php echo $no;?></td>
                  <td><?php echo $stok->warna;?></td>
                  <td><?php echo $stok->jumlah;?></td>
                </tr>
<?php $no++; } ?>  
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

<!-- START -->
      <div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Ciput Rajut 2 Warna</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse">
              <i class="fa fa-plus"></i></button>
          </div>
        </div>
        <div class="box-body">


      <table id="example2" class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>No.</th>
        <th>Warna</th>
        <th>Jumlah Stok</th>  
      </tr>
    </thead>
    <tbody>

<?php $no=1; foreach ($crj02 as $stok) {
?>
                <tr>
                  <td><?php echo $no;?></td>
                  <td><?php echo $stok->warna;?></td>
                  <td><?php echo $stok->jumlah;?></td>
                </tr>
<?php $no++; } ?>    
        </tbody>
      </table>

        </div>
        <!-- /.box-body -->
        <div class="box-footer">

        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
<!-- END-->

<!-- START-->
      <div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Ciput Rajut 4 Warna</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse">
              <i class="fa fa-plus"></i></button>
          </div>
        </div>
        <div class="box-body">


      <table id="example3" class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>No.</th>
        <th>Warna</th>
        <th>Jumlah Stok</th>  
      </tr>
    </thead>
    <tbody>

<?php $no=1; foreach ($crj04 as $stok) {
?>
                <tr>
                  <td><?php echo $no;?></td>
                  <td><?php echo $stok->warna;?></td>
                  <td><?php echo $stok->jumlah;?></td>
                </tr>
<?php $no++; } ?>
        </tbody>
      </table>

        </div>
        <!-- /.box-body -->
        <div class="box-footer">

        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
      <!--END-->
<!-- END 



  CIPUT RAJUT -->
<?php } ?>

<!--HANDSOCK-->
<!--START-->
<?php if($judul=="Handsock") { ?>
      <div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Handsock Jempol</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse">
              <i class="fa fa-plus"></i></button>
          </div>
        </div>
        <div class="box-body">


      <table id="example1"class="table table-bordered table-striped">
    <thead>
            <tr>
        <th>No.</th>
        <th>Warna</th>
        <th>Jumlah Stok</th>  
      </tr>
    </thead>
    <tbody>
<?php $no=1; foreach ($hsk01 as $stok) {
?>
                <tr>
                  <td><?php echo $no;?></td>
                  <td><?php echo $stok->warna;?></td>
                  <td><?php echo $stok->jumlah;?></td>
                </tr>
<?php $no++; } ?>  
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

<!-- START -->
      <div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Handsock Cincin</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse">
              <i class="fa fa-plus"></i></button>
          </div>
        </div>
        <div class="box-body">


      <table id="example2" class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>No.</th>
        <th>Warna</th>
        <th>Jumlah Stok</th>  
      </tr>
    </thead>
    <tbody>

<?php $no=1; foreach ($hsk02 as $stok) {
?>
                <tr>
                  <td><?php echo $no;?></td>
                  <td><?php echo $stok->warna;?></td>
                  <td><?php echo $stok->jumlah;?></td>
                </tr>
<?php $no++; } ?>    
        </tbody>
      </table>

        </div>
        <!-- /.box-body -->
        <div class="box-footer">

        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
<!-- END-->

<!-- START-->
      <div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Sarung Tangan</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse">
              <i class="fa fa-plus"></i></button>
          </div>
        </div>
        <div class="box-body">


      <table id="example3" class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>No.</th>
        <th>Warna</th>
        <th>Jumlah Stok</th>  
      </tr>
    </thead>
    <tbody>

<?php $no=1; foreach ($stg as $stok) {
?>
                <tr>
                  <td><?php echo $no;?></td>
                  <td><?php echo $stok->warna;?></td>
                  <td><?php echo $stok->jumlah;?></td>
                </tr>
<?php $no++; } ?>
        </tbody>
      </table>

        </div>
        <!-- /.box-body -->
        <div class="box-footer">

        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
      <!--END-->
<!-- END HANDSOCK -->
<?php } ?>

<!--KAOS KAKI-->
<!--START-->
<?php if($judul=="Kaos Kaki") { ?>
      <div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Kaos Kaki Polos Nylon</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse">
              <i class="fa fa-plus"></i></button>
          </div>
        </div>
        <div class="box-body">


      <table id="example1"class="table table-bordered table-striped">
    <thead>
            <tr>
        <th>No.</th>
        <th>Warna</th>
        <th>Jumlah Stok</th>  
      </tr>
    </thead>
    <tbody>
<?php $no=1; foreach ($ksk01 as $stok) {
?>
                <tr>
                  <td><?php echo $no;?></td>
                  <td><?php echo $stok->warna;?></td>
                  <td><?php echo $stok->jumlah;?></td>
                </tr>
<?php $no++; } ?>  
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

<!-- START -->
      <div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Kaos Kaki Polos Polyster</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse">
              <i class="fa fa-plus"></i></button>
          </div>
        </div>
        <div class="box-body">


      <table id="example2" class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>No.</th>
        <th>Warna</th>
        <th>Jumlah Stok</th>  
      </tr>
    </thead>
    <tbody>

<?php $no=1; foreach ($ksk11 as $stok) {
?>
                <tr>
                  <td><?php echo $no;?></td>
                  <td><?php echo $stok->warna;?></td>
                  <td><?php echo $stok->jumlah;?></td>
                </tr>
<?php $no++; } ?>    
        </tbody>
      </table>

        </div>
        <!-- /.box-body -->
        <div class="box-footer">

        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
<!-- END-->

<!-- START-->
      <div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Kaos Kaki Motif</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse">
              <i class="fa fa-plus"></i></button>
          </div>
        </div>
        <div class="box-body">


      <table id="example3" class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>No.</th>
        <th>Warna</th>
        <th>Jumlah Stok</th>  
      </tr>
    </thead>
    <tbody>

<?php $no=1; foreach ($ksk02 as $stok) {
?>
                <tr>
                  <td><?php echo $no;?></td>
                  <td><?php echo $stok->warna;?></td>
                  <td><?php echo $stok->jumlah;?></td>
                </tr>
<?php $no++; } ?>
        </tbody>
      </table>

        </div>
        <!-- /.box-body -->
        <div class="box-footer">

        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
      <!--END-->
<!-- END KAOS KAKI -->
<?php } ?>

<!--NIQAB-->
<!--START-->
<?php if($judul=="Niqab") { ?>
<!-- START OF SURAT KELUAR -->
      <div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Niqab Tali 2 Layer</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse">
              <i class="fa fa-plus"></i></button>
          </div>
        </div>
        <div class="box-body">


      <table id="example1"class="table table-bordered table-striped">
    <thead>
            <tr>
        <th>No.</th>
        <th>Warna</th>
        <th>Jumlah Stok</th>  
      </tr>
    </thead>
    <tbody>
<?php $no=1; foreach ($nqb01 as $stok) {
?>
                <tr>
                  <td><?php echo $no;?></td>
                  <td><?php echo $stok->warna;?></td>
                  <td><?php echo $stok->jumlah;?></td>
                </tr>
<?php $no++; } ?>  
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

<!-- START -->
      <div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Niqab Bandana Biasa</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse">
              <i class="fa fa-plus"></i></button>
          </div>
        </div>
        <div class="box-body">


      <table id="example2" class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>No.</th>
        <th>Warna</th>
        <th>Jumlah Stok</th>  
      </tr>
    </thead>
    <tbody>

<?php $no=1; foreach ($nqb02 as $stok) {
?>
                <tr>
                  <td><?php echo $no;?></td>
                  <td><?php echo $stok->warna;?></td>
                  <td><?php echo $stok->jumlah;?></td>
                </tr>
<?php $no++; } ?>    
        </tbody>
      </table>

        </div>
        <!-- /.box-body -->
        <div class="box-footer">

        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
<!-- END-->

<!-- START-->
      <div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Niqab Bandana Poni</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse">
              <i class="fa fa-plus"></i></button>
          </div>
        </div>
        <div class="box-body">


      <table id="example3" class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>No.</th>
        <th>Warna</th>
        <th>Jumlah Stok</th>  
      </tr>
    </thead>
    <tbody>

<?php $no=1; foreach ($nqb03 as $stok) {
?>
                <tr>
                  <td><?php echo $no;?></td>
                  <td><?php echo $stok->warna;?></td>
                  <td><?php echo $stok->jumlah;?></td>
                </tr>
<?php $no++; } ?>
        </tbody>
      </table>

        </div>
        <!-- /.box-body -->
        <div class="box-footer">

        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
      <!--END-->
<!-- CIPUT RAJUT -->
<?php } ?>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
