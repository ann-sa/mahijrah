<!DOCTYPE html>
<html lang="en">

  <head>

	<title>Login</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<meta content="" name="keywords">
	<meta content="" name="description">

    
    <!-- Bootstrap core CSS -->
    <link href="<?= base_url('asset/vendor/bootstrap/css/bootstrap.min.css')?>" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="<?= base_url('asset/vendor/font-awesome/css/font-awesome.min.css')?>" rel="stylesheet" type="text/css">




  </head>

<body background="<?= base_url('asset/bg5.jpg')?>">
<br><br><br>
<section id="about">
      <div class="container">
        <div class="row">
          <div class="col-md-4 mx-auto text-center" style="background-color: #FFFFff; border-radius: 20px;">

          <br>
		  <img src="<?= base_url('assets/ico/header.png')?>" width="90%" class="img-circle">
<br>
            <h1 class="section-heading">Login</h1>
            
            <?php echo $message ?>
        
                 <p class="text-faded mb-4">  
                 <br> 
                    <?php
                    echo form_open(site_url('Auth/login'));
                    ?>
                        <div class="form-group">
                            <?php echo form_input('ID_admin', $ID_admin, 'class="form-control" placeholder="ID Admin" required') ?>
                        </div>
                        <div class="form-group">
                            <?php echo form_password('password', $password, 'class="form-control" placeholder="Password" required') ?>
                        </div>
                        
                        <div class="checkbox">
                            <label>
                                <?php echo form_checkbox('remember', TRUE, $remember) ?> Ingat Saya
                            </label>


                            <br>
                            <br>
                        </div>
                        <?php  echo form_submit('submit', 'Sign In', 'class="btn btn-primary btn-xl js-scroll-trigger"') ?>
                        
                  <?php  echo form_close();
                    ?>
             
                    <br>
                      

<br>
            </div>
        </div>
      </div>
    </section>


            </p>
          </div>

        </div>
       
    </section>

    <!-- Bootstrap core JavaScript -->
    <script src="<?= base_url('asset/vendor/jquery/jquery.min.js')?>"></script>
    <script src="<?=base_url('asset/vendor/bootstrap/js/bootstrap.bundle.min.js')?>"></script>

</body>

</html>