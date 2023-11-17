<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>

<!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Log
      </h1>
            <ol class="breadcrumb">
        <li><a href="<?php echo base_url(); ?>index.php/mahijrah"><i class="fa fa-home"></i> Awal</a></li>
        <li class="active"> Log</li>
      </ol>
    </section>

    <!-- Main content -->
     <!-- Main content -->
    <section class="content">
<!--BELI-->
      <div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Log Detail</h3>

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
              <th>Aktivitas</th>
              <th>Detail Aktivitas</th>
              <th>Waktu</th>
            </tr>
    </thead>
    <tbody>
    <?php $no=1; foreach($log_aktivitas as $log) {  
      ?>
          <tr>
            <td><?php echo $no;?></td>
            <td><?php echo $log->perihal;?></td>
            <td><?php echo $log->detail;?></td>
            <td><?php echo $log->waktu;?></td>
          </tr>
        <?php $no++;} ?>
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

<!--BELI-->
      <div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Log Transaksi Beli</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse">
              <i class="fa fa-plus"></i></button>
          </div>
        </div>
        <div class="box-body">


      <table id="example2"class="table table-bordered table-striped">
    <thead>

            <tr>
              <th>No.</th>
              <th>Aktivitas</th>
              <th>Detail Aktivitas</th>
              <th>Waktu</th>
              <th>ID Admin</th>
            </tr>
    </thead>
    <tbody>
    <?php $no=1; foreach($log_beli as $log) {  
      ?>
          <tr>
            <td><?php echo $no;?></td>
            <td><?php echo $log->perihal;?></td>
            <td><?php echo $log->detail;?></td>
            <td><?php echo $log->waktu;?></td>
            <td><?php echo $log->admin_id;?></td>
          </tr>
        <?php $no++;} ?>
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

<!--BELI-->
      <div class="box collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Log Transaksi Jual</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse">
              <i class="fa fa-plus"></i></button>
          </div>
        </div>
        <div class="box-body">


      <table id="example3"class="table table-bordered table-striped">
    <thead>

            <tr>
              <th>No.</th>
              <th>Aktivitas</th>
              <th>Detail Aktivitas</th>
              <th>Waktu</th>
              <th>ID Admin</th>
            </tr>
    </thead>
    <tbody>
    <?php $no=1; foreach($log_jual as $log) {  
      ?>
          <tr>
            <td><?php echo $no;?></td>
            <td><?php echo $log->perihal;?></td>
            <td><?php echo $log->detail;?></td>
            <td><?php echo $log->waktu;?></td>
            <td><?php echo $log->admin_id;?></td>
          </tr>
        <?php $no++;} ?>
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
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
