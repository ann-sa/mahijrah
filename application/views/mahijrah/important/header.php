<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<div class="modal fade" id="keluar">
  <div class="modal-dialog modal-sm">
     <div class="modal-content">
        <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title">Konfirmasi Keluar</h4>
        </div>
          <div class="modal-body">
          <p>Anda yakin ingin keluar ?</p>
           <center><a href="<?php echo base_url(); ?>index.php/auth/logout" class="btn btn-danger"><i class="glyphicon glyphicon-ok"></i> Ya</a>
           <button type="button" class="btn btn-default" data-dismiss="modal">Tidak</button>
      </center>
      </div>
     </div>
  </div>
</div>
<header class="main-header">
    <!-- Logo -->
        <a href="<?php echo base_url(); ?>index.php/mahijrah/" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b><?php echo $namaweb; ?></b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b><?php echo $namaweb; ?></b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

	  <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Control Sidebar Toggle Button -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span class="hidden-xs"><i class="glyphicon glyphicon-search"></i></span>
            </a>
              <ul class="dropdown-menu">
 <!-- Menu Body -->
            <li class="user-body">
              <p>Cari berdasarkan tanggal</p>
              <form method="post" action="<?php echo base_url(); ?>index.php/mahijrah/cari_by_tgl">
                <table>
                  <tr>
                    <td>
                      <input type="date" class="form-control" name="tgl">
                    </td>
                    <td>
                      <button type="submit" class="btn btn-default">Cari</button>
                    </td>
                  </tr>
                </table>
              </form>
            </li>
            <!-- Menu Footer-->
            </li>
            </ul>
          <!-- User Account: style can be found in dropdown.less -->
              <?php
  foreach ($data_user as $pengguna)
  {
?>
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <img id="employeePhoto" src="<?php echo base_url(); ?>assets/foto_profil/<?php echo $pengguna->foto_profil;?>" class="user-image" onerror="defaultPhoto(this)" alt="User Image" />
            <span class="hidden-xs"><?php echo $pengguna->username;?></span>
            </a>
              <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
              <img id="employeePhoto2" src="<?php echo base_url(); ?>assets/foto_profil/<?php echo $pengguna->foto_profil;?>" class="img-circle" onerror="defaultPhoto(this)" alt="User Image" />
              <p>
              <label id="employeeName"><?php echo $pengguna->username;?></label>
              <small>
               <label id="employeePosition">Admin</label>
              </small>
             </p>
             </li>
           <?php } ?>
 <!-- Menu Body -->
            <li class="user-body"></li>
            <!-- Menu Footer-->
            <li class="user-footer">
            <div class="pull-left">
            <a href="<?php echo base_url(); ?>index.php/mahijrah/profil" class="btn btn-default btn-flat"><i class="fa fa-user"></i>&nbsp;&nbsp;Profil Admin</a>
            </div>
            <div class="pull-right">
            <a href="" data-toggle="modal" data-target="#keluar" class="btn btn-default btn-flat"><i class="fa fa-sign-out"></i>&nbsp;Keluar</a>
            </div>
            </li>
            </ul>

          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>

        </ul>
      </div>

      
    </nav>
  </header>

  <!-- =============================================== -->
  <!-- Left side column. contains the sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <ul class="sidebar-menu" data-widget="tree">
       <li <?php if($judul=="home")echo"class='active'";?>>
          <a href="<?php echo base_url(); ?>index.php/mahijrah">
            <i class="fa fa-home"></i> <span>Awal</span>
          </a>
        </li>
        <li class="header">Menu
        <li <?php if($judul=="Bahan")echo"class='active treeview'";elseif($judul=="Barang")echo"class='active treeview'";elseif($judul=="Model")echo"class='active treeview'";elseif($judul=="Ukuran")echo"class='active treeview'";elseif($judul=="Warna")echo"class='active treeview'"?> class="treeview">
            <a href="#">
              <i class="fa fa-plus"></i>
              <span>Input Detail</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li <?php if($judul=="Bahan") echo "class='active'";?>><a href="<?php echo base_url(); ?>index.php/mahijrah/input_detail_bahan"><i class="fa fa-circle-o"></i> Bahan</a></li>
               <li <?php if($judul=="Barang") echo "class='active'";?>><a href="<?php echo base_url(); ?>index.php/mahijrah/input_detail_barang"><i class="fa fa-circle-o"></i> Barang</a></li>
              <li <?php if($judul=="Model") echo "class='active'";?>><a href="<?php echo base_url(); ?>index.php/mahijrah/input_detail_model"><i class="fa fa-circle-o"></i> Model</a></li>
              <li <?php if($judul=="Ukuran") echo "class='active'";?>><a href="<?php echo base_url(); ?>index.php/mahijrah/input_detail_ukuran"><i class="fa fa-circle-o"></i> Ukuran</a></li>
              <li <?php if($judul=="Warna") echo "class='active'";?>><a href="<?php echo base_url(); ?>index.php/mahijrah/input_detail_warna"><i class="fa fa-circle-o"></i> Warna</a></li>
            </ul>
          </li>

        <li <?php if($judul=="Jual")echo"class='active treeview'";elseif($judul=="Beli")echo"class='active treeview'"?> class="treeview">
            <a href="#">
              <i class="fa fa-file-text"></i>
              <span>Input Transaksi</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li <?php if($judul=="Beli") echo "class='active'";?>><a href="<?php echo base_url(); ?>index.php/mahijrah/new_transaksi_beli"><i class="fa fa-circle-o"></i> Beli</a></li>
              <li <?php if($judul=="Jual") echo "class='active'";?>><a href="<?php echo base_url(); ?>index.php/mahijrah/new_transaksi_jual"><i class="fa fa-circle-o"></i> Jual</a></li>
            </ul>
          </li>

        <li <?php if($judul=="Ciput Rajut")echo"class='active treeview'";elseif($judul=="Handsock")echo"class='active treeview'";elseif($judul=="Kaos Kaki")echo"class='active treeview'";elseif($judul=="Niqab")echo"class='active treeview'"?> class="treeview">
            <a href="#">
              <i class="fa fa-shopping-bag"></i>
              <span>Stok Barang</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li <?php if($judul=="Ciput Rajut") echo "class='active'";?>><a href="<?php echo base_url(); ?>index.php/mahijrah/stok_ciput"><i class="fa fa-circle-o"></i> Ciput Rajut</a></li>
              <li <?php if($judul=="Handsock") echo "class='active'";?>><a href="<?php echo base_url(); ?>index.php/mahijrah/stok_handsock"><i class="fa fa-circle-o"></i> Handsock</a></li>
              <li <?php if($judul=="Kaos Kaki") echo "class='active'";?>><a href="<?php echo base_url(); ?>index.php/mahijrah/stok_kaoskaki"><i class="fa fa-circle-o"></i> Kaos Kaki</a></li>
              <li <?php if($judul=="Niqab") echo "class='active'";?>><a href="<?php echo base_url(); ?>index.php/mahijrah/stok_niqab"><i class="fa fa-circle-o"></i> Niqab</a></li>
              
            </ul>
          </li>

           <li <?php if($judul=="pembukuan")echo"class='active'";?>>
          <a href="<?php echo base_url(); ?>index.php/mahijrah/pembukuan">
            <i class="fa fa-file-text"></i> <span>Pembukuan</span>
          </a>
        </li>

        <li <?php if($judul=="log")echo"class='active'";?>>
          <a href="<?php echo base_url(); ?>index.php/mahijrah/log">
            <i class="fa fa-info"></i> <span>Log</span>
          </a>
        </li>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
