<?php 
class Mahijrah extends CI_Controller{

    function __construct()
	{
        parent::__construct();
        if(! $this->session->userdata('logged')){
            redirect('Auth');
        }
        $this->load->model('M_Mahijrah');
		$this->load->library('form_validation');
        $this->load->helper(array('Form', 'Cookie', 'String'));
    }

	public function index()
	{
		redirect(base_url("index.php/mahijrah/home"));
	}

	public function home()
	{
		$judul = "home";
		
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);
		
		$data['judul'] = $judul;
		$this->load->view('mahijrah/home', $data);
	}
	
	public function profil()
	{
		$judul = "profil";
		
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);
		
		$data['judul'] = $judul;
		$this->load->view('mahijrah/profil', $data);
	}
	
	public function editprofil()
	{
		$judul = "profil";
		
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);
		
		$data['judul'] = $judul;
		$this->load->view('mahijrah/editprofil', $data);
	}
	
	public function simpaneditprofil()
	{
		$judul = "profil";
		
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);
		
		$data['judul'] = $judul;
		
		$this->form_validation->set_rules('email', 'Email', 'required|valid_email');
		$this->form_validation->set_rules('nama', 'Nama', 'trim|required|min_length[6]');
		$this->form_validation->set_rules('jenis_kelamin', 'Jenis Kelamin', 'required');
		$this->form_validation->set_rules('tgl_lahir', 'Tanggal Lahir', 'required');
		
		if ($this->form_validation->run() == FALSE) {
        $this->load->view('mahijrah/editprofil', $data);
        } else {
		
			$nama = $this->input->post('nama');
			$email = $this->input->post('email');
			$tgl_lahir = $this->input->post('tgl_lahir');
			$jk = $this->input->post('jenis_kelamin');
			
			$data = array(
				'nama'	=> $nama,
				'email'		=> $email,
				'tgl_lahir'	=> $tgl_lahir,
				'jenis_kelamin'	=> $jk
			);

			$where = array('ID_admin' => $ID_admin);

			$this->M_Mahijrah->editprofil($where,$data,'admin');
			redirect('mahijrah/profil?info=Profil%20Anda%20berhasil%20diedit.');
		}
	}
	
	public function new_foto_profil()
	{
		$ID_admin = $this->session->userdata('ID_admin');
		
		//START upload FILE

		$uploadfoto = $this->M_Mahijrah->upload_foto_profil("fotoprofil");

		if($uploadfoto['result'] == "success")
		{
			$link_fotonya = $uploadfoto['file']['file_name'];
		}
		else
		{
			$data['message'] = $uploadfoto['error'];
			echo $data['message'];
			exit;
		}
		//END upload FILE
		
		$data = array(
			'foto_profil'	=> $link_fotonya
		);

		$where = array('ID_admin' => $ID_admin);

		$this->M_Mahijrah->editprofil($where,$data,'admin');
		redirect('mahijrah/profil?info=Foto Profil%20Anda%20berhasil%20diedit.');
		
	}

	public function input_detail_bahan()
	{

		$judul = "Bahan";
		$detail = $this->input->post('detail');
		
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);
		$data['pilihan'] = $detail;
		
		$data['judul'] = $judul;
		
		$this->load->view('mahijrah/input_detail', $data);
	}

	public function input_detail_barang()
	{

		$judul = "Barang";
		$detail = $this->input->post('detail');
		
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);
		$data['pilihan'] = $detail;
		
		$data['judul'] = $judul;
		
		$this->load->view('mahijrah/input_detail', $data);
	}

	public function input_detail_model()
	{

		$judul = "Model";
		$detail = $this->input->post('detail');
		
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);
		$data['pilihan'] = $detail;
		
		$data['judul'] = $judul;
		
		$this->load->view('mahijrah/input_detail', $data);
	}

	public function input_detail_ukuran()
	{

		$judul = "Ukuran";
		$detail = $this->input->post('detail');
		
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);
		$data['pilihan'] = $detail;
		
		$data['judul'] = $judul;
		
		$this->load->view('mahijrah/input_detail', $data);
	}

	public function input_detail_warna()
	{

		$judul = "Warna";
		$detail = $this->input->post('detail');
		
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);
		$data['pilihan'] = $detail;
		
		$data['judul'] = $judul;
		
		$this->load->view('mahijrah/input_detail', $data);
	}

	public function simpaninput_detail()
	{
		$barang = $this->input->post('Barang');
		$bahan = $this->input->post('Bahan');
		$model = $this->input->post('Model');
		$ukuran = $this->input->post('Ukuran');
		$warna = $this->input->post('Warna');
		
		if($barang) {
			$kode = $this->input->post('kode_Barang');
			$data = array();
			$index = 0;
			foreach($kode as $code){
			      array_push($data, array(
			      	'kode_barang'		=> $code,
					'nama_barang'		=> $barang[$index]
			      ));
      
      			$index++;
      		}
			$this->M_Mahijrah->insert_multi('barang',$data);

			$judul = "Barang";		
			$ID_admin = $this->session->userdata('ID_admin');
			$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);	
			$data['judul'] = $judul;
			//$this->load->view('mahijrah/input_detail', $data);
			redirect('mahijrah/input_detail_barang?info=Detail%20Barang%20berhasil%20diinput.');
		}
		elseif($bahan) {
			$kode = $this->input->post('kode_Bahan');
			$data = array();
			$index = 0;
			foreach($kode as $code){
			      array_push($data, array(
			      	'kode_bahan'		=> $code,
					'nama_bahan'		=> $bahan[$index]
			      ));
      
      			$index++;
      		}
			$this->M_Mahijrah->insert_multi('detail_bahan',$data);

			$judul = "Bahan";		
			$ID_admin = $this->session->userdata('ID_admin');
			$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);	
			$data['judul'] = $judul;
			//$this->load->view('mahijrah/input_detail', $data);
			redirect('mahijrah/input_detail_bahan?info=Detail%20Bahan%20berhasil%20diinput.');
		}
		elseif($model) {
			$kode = $this->input->post('kode_Model');
			$data = array();
			$index = 0;
			foreach($kode as $code){
			      array_push($data, array(
			      	'kode_model'		=> $code,
					'nama_model'		=> $model[$index]
			      ));
      
      			$index++;
      		}
			$this->M_Mahijrah->insert_multi('model_barang',$data);

			$judul = "Model";		
			$ID_admin = $this->session->userdata('ID_admin');
			$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);	
			$data['judul'] = $judul;
			//$this->load->view('mahijrah/input_detail', $data);
			redirect('mahijrah/input_detail_model?info=Detail%20Model%20berhasil%20diinput.');
		}
		elseif($ukuran) {
			$kode = $this->input->post('kode_Ukuran');
			$data = array();
			$index = 0;
			foreach($kode as $code){
			      array_push($data, array(
			      	'kode_ukuran'		=> $code,
					'ukuran'			=> $ukuran[$index]
			      ));
      
      			$index++;
      		}
			$this->M_Mahijrah->insert_multi('ukuran',$data);

			$judul = "Ukuran";		
			$ID_admin = $this->session->userdata('ID_admin');
			$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);	
			$data['judul'] = $judul;
			//$this->load->view('mahijrah/input_detail', $data);
			redirect('mahijrah/input_detail_ukuran?info=Detail%20Ukuran%20berhasil%20diinput.');
		}
		elseif($warna) {
			$kode = $this->input->post('kode_Warna');
			$data = array();
			$index = 0;
			foreach($kode as $code){
			      array_push($data, array(
			      	'kode_warna'		=> $code,
					'warna'				=> $warna[$index]
			      ));
      
      			$index++;
      		}
			$this->M_Mahijrah->insert_multi('warna',$data);

			$judul = "Warna";		
			$ID_admin = $this->session->userdata('ID_admin');
			$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);	
			$data['judul'] = $judul;
			//$this->load->view('mahijrah/input_detail', $data);
			redirect('mahijrah/input_detail_warna?info=Detail%20Warna%20berhasil%20diinput.');
		}
	}

	public function new_transaksi_beli()
	{
		$data['judul'] = "Beli";
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);

		//pembuat identifier
		date_default_timezone_set("Asia/Jakarta");
		$tgl = date("Y-m-d");
		$waktu = date("his");
		$kode0 = rand(10000,99999);
		$kode1 = $ID_admin.$tgl.$waktu.$kode0;
		$identifier = md5($kode1);

		$this->create_transaksi_beli($ID_admin,$identifier);

		$p3 = $this->M_Mahijrah->beli_by_identifier($identifier);
		foreach($p3 AS $p4)
		{
			$id_beli = $p4->id_beli;
		}
		redirect(base_url("index.php/mahijrah/input_transaksi_beli/$id_beli"));
	}

	public function create_transaksi_beli($ID_admin,$identifier)
	{
		$this->M_Mahijrah->masukkan("transaksi_beli",[
			'admin_id'		=>	$ID_admin,
			'identifier'	=>	$identifier
			]);

	}

	public function input_transaksi_beli($id_beli)
	{
		$data['judul'] = "Beli";
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);
		$data['beli'] = $this->M_Mahijrah->beli_by_id($id_beli);
		$ID_admin = $this->session->userdata('ID_admin');
		$data['bahan'] = $this->M_Mahijrah->ambil_bahan();
		$data['barang'] = $this->M_Mahijrah->ambil_barang();
		$data['model'] = $this->M_Mahijrah->ambil_model();
		$data['warna'] = $this->M_Mahijrah->ambil_warna();
		$data['ukuran'] = $this->M_Mahijrah->ambil_ukuran();
		$this->load->view('mahijrah/input_transaksi_beli', $data);

	}

	public function new_transaksi_jual()
	{
		$data['judul'] = "Jual";
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);

		//pembuat identifier
		date_default_timezone_set("Asia/Jakarta");
		$tgl = date("Y-m-d");
		$waktu = date("his");
		$kode0 = rand(10000,99999);
		$kode1 = $ID_admin.$tgl.$waktu.$kode0;
		$identifier = md5($kode1);

		$this->create_transaksi_jual($ID_admin,$identifier);

		$p3 = $this->M_Mahijrah->jual_by_identifier($identifier);
		foreach($p3 AS $p4)
		{
			$id_jual = $p4->id_jual;
		}
		redirect(base_url("index.php/mahijrah/input_transaksi_jual/$id_jual"));
	}

	public function create_transaksi_jual($ID_admin,$identifier)
	{
		$this->M_Mahijrah->masukkan("transaksi_jual",[
			'admin_id'		=>	$ID_admin,
			'identifier'	=>	$identifier
			]);

	}

	public function input_transaksi_jual($id_jual)
	{
		$data['judul'] = "Jual";
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);
		$data['jual'] = $this->M_Mahijrah->jual_by_id($id_jual);
		$ID_admin = $this->session->userdata('ID_admin');
		$data['bahan'] = $this->M_Mahijrah->ambil_bahan();
		$data['barang'] = $this->M_Mahijrah->ambil_barang();
		$data['model'] = $this->M_Mahijrah->ambil_model();
		$data['warna'] = $this->M_Mahijrah->ambil_warna();
		$data['ukuran'] = $this->M_Mahijrah->ambil_ukuran();
		$this->load->view('mahijrah/input_transaksi_jual', $data);

	}

	public function simpaninput_transaksi() {
		$jual = $this->input->post('jual');
		$beli = $this->input->post('beli');
		$barang 	= $this->input->post('kode_barang');
		$warna 		= $this->input->post('kode_warna');
		$ukuran 	= $this->input->post('kode_ukuran');
		$model 		= $this->input->post('kode_model');
		$bahan 		= $this->input->post('kode_bahan');
		$jlh_brg	= $this->input->post('jlh_barang');
		$p3 = $this->M_Mahijrah->ambil_jlhbrg($barang,$warna,$ukuran,$model,$bahan);

		if($jual=="Jual") {
			$id = $this->input->post('id_jual');
			$data = array(
				'id_jual'		=> $id,
				'tgl_jual'		=> $this->input->post('tgl_jual'),
				'nama_pembeli'	=> $this->input->post('nama_pembeli'),
				'kode_barang'	=> $barang,
				'kode_bahan'	=> $bahan,
				'kode_warna'	=> $warna,
				'kode_model'	=> $model,
				'kode_ukuran'	=> $ukuran,
				'jlh_barang'	=> $jlh_brg,
				'harga_jual'	=> $this->input->post('harga_jual')
			);

			$where_detail = array(
				'kode_barang'	=> $barang,
				'kode_bahan'	=> $bahan,
				'kode_model'	=> $model,
				'kode_ukuran'	=> $ukuran,
				'kode_warna'	=> $warna
			);
			$cek_db = $this->M_Mahijrah->check("detail_barang",$where_detail)->num_rows();
			if($cek_db != NULL) {
				foreach($p3 AS $p4){
					$jlh = $p4->jumlah;
				}
				if(intval($jlh)<=0) {
					redirect(base_url("index.php/mahijrah/input_transaksi_jual/$id?info=Stok barang tidak ada."));
				}
				elseif(intval($jlh)>0) {
					if(intval($jlh_brg)<=intval($jlh)) {
						$jlh_next 	=  intval($jlh) - intval($jlh_brg);
						$data_harga = array(
							'jumlah'		=> $jlh_next
						);

						$this->M_Mahijrah->edit_db($where_detail,$data_harga,'detail_barang');
					}
					elseif(intval($jlh_brg)>intval($jlh)){
						redirect(base_url("index.php/mahijrah/input_transaksi_jual/$id?info=Jumlah barang yang terjual melebihi stok barang yang ada."));
					}
				}
			}

			$this->M_Mahijrah->masukkan('detail_transaksi_jual',$data);
			redirect(base_url("index.php/mahijrah/input_transaksi_jual/$id?info=Transaksi Berhasil Diinput."));
		}

		elseif($beli=="Beli") {
			$id = $this->input->post('id_beli');
			$data = array(
				'id_beli'		=> $id,
				'tgl_beli'		=> $this->input->post('tgl_beli'),
				'nama_penjual'	=> $this->input->post('nama_penjual'),
				'kode_barang'	=> $barang,
				'kode_bahan'	=> $bahan,
				'kode_warna'	=> $warna,
				'kode_model'	=> $model,
				'kode_ukuran'	=> $ukuran,
				'jlh_barang'	=> $jlh_brg,
				'harga_beli'	=> $this->input->post('harga_beli'),
				'harga_jual'	=> $this->input->post('harga_jual')
			);

			$data_alldb = array(
				'kode_barang'	=> $barang,
				'kode_bahan'	=> $bahan,
				'kode_warna'	=> $warna,
				'kode_model'	=> $model,
				'kode_ukuran'	=> $ukuran,
				'jumlah'		=> $jlh_brg,
				'harga'			=> $this->input->post('harga_jual')
			);

			$where_detail = array(
				'kode_barang'	=> $barang,
				'kode_bahan'	=> $bahan,
				'kode_model'	=> $model,
				'kode_ukuran'	=> $ukuran,
				'kode_warna'	=> $warna
			);
			$cek_db = $this->M_Mahijrah->check("detail_barang",$where_detail)->num_rows();
			if($cek_db == NULL) {
				$this->M_Mahijrah->masukkan('detail_barang',$data_alldb);
				//redirect(base_url("index.php/TU/pegawaiTU?info=Pegawai TU berhasil ditambahkan."));
			}
			else {
				foreach($p3 AS $p4) {
					$jlh = $p4->jumlah;
				}
				$jlh_next 	=  intval($jlh) + intval($jlh_brg);

				$data_hj = array(
				'harga'			=> $this->input->post('harga_jual'),
				'jumlah'		=> $jlh_next
				);

				$this->M_Mahijrah->edit_db($where_detail,$data_hj,'detail_barang');
				redirect(base_url("index.php/mahijrah/input_transaksi_beli/$id?info=Transaksi Berhasil Diinput."));
			}

			$this->M_Mahijrah->masukkan('detail_transaksi_beli',$data);
			redirect(base_url("index.php/mahijrah/input_transaksi_beli/$id?info=Transaksi Berhasil Diinput."));
		}
	}

	public function stok_ciput()
	{
		$crj01 = "CRJ01";
		$crj02 = "CRJ02";
		$crj04 = "CRJ04";

		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);
		$data['judul'] = "Ciput Rajut";
		$data['crj01'] = $this->M_Mahijrah->stok_crj01();
		//$this->db->free_db_resource();
		$data['crj02'] = $this->M_Mahijrah->stok_crj02();
		//$this->db->free_db_resource();
		$data['crj04'] = $this->M_Mahijrah->stok_crj04();
		$this->load->view('mahijrah/lihat_stok', $data);
	}

	public function stok_handsock()
	{
		$hsk01 = "HSK01";
		$hsk02 = "HSK02";
		$stg   = "STG";
		$data['judul'] = "Handsock";
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);
		$data['hsk01'] = $this->M_Mahijrah->stok_hsk01();
		//$this->db->free_db_resource();
		$data['hsk02'] = $this->M_Mahijrah->stok_hsk02();
		//$this->db->free_db_resource();
		$data['stg'] = $this->M_Mahijrah->stok_stg();
		$this->load->view('mahijrah/lihat_stok', $data);
	}

	public function stok_kaoskaki()
	{
		$ksk01 = "KSK01";
		$ksk11 = "KSK01";
		$ksk02 = "KSK02";
		$nln   = "NLN";
		$ply   = "PLY";
		$data['judul'] = "Kaos Kaki";
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);
		$data['ksk02'] = $this->M_Mahijrah->stok_ksk02();
		//$this->db->free_db_resource();
		$data['ksk01'] = $this->M_Mahijrah->stok_ksk01();
		//$this->db->free_db_resource();
		$data['ksk11'] = $this->M_Mahijrah->stok_ksk11();
		$this->load->view('mahijrah/lihat_stok', $data);
	}

	public function stok_niqab()
	{
		$nqb01 = "NQB01";
		$nqb02 = "NQB02";
		$nqb03 = "NQB03";
		$data['judul'] = "Niqab";
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);
		$data['nqb01'] = $this->M_Mahijrah->stok_nqb01();
		//$this->db->free_db_resource();
		$data['nqb02'] = $this->M_Mahijrah->stok_nqb02();
		//$this->db->free_db_resource();
		$data['nqb03'] = $this->M_Mahijrah->stok_nqb03();
		$this->load->view('mahijrah/lihat_stok', $data);
	}
	
	public function pembukuan()
	{
		$judul = "pembukuan";
		
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);
		$data['data_beli'] = $this->M_Mahijrah->ambil_beli();
		$data['data_jual'] = $this->M_Mahijrah->ambil_jual();
		$data['beli'] = $this->M_Mahijrah->ambil_totalbeli();
		$data['jual'] = $this->M_Mahijrah->ambil_totaljual();
		$beli = $this->M_Mahijrah->total_beli();
		$jual = $this->M_Mahijrah->total_jual();
		foreach($beli AS $p4) {
					$jlh_beli = $p4->total;
				}
				foreach($jual AS $p4) {
					$jlh_jual = $p4->total;
				}
		$total = intval($jlh_jual)-intval($jlh_beli);
		$data['total'] = $total;
		$data['judul'] = $judul;
		
		$this->load->view('mahijrah/pembukuan', $data);
	}

	public function print_rekap()
	{
		$judul="pembukuan";
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);
		$data['jual'] =  $this->M_Mahijrah->jual_per_bulan();
		$data['beli'] =  $this->M_Mahijrah->beli_per_bulan();
		$data['pembeli'] =  $this->M_Mahijrah->daftar_pembeli();
		$data['barang'] =  $this->M_Mahijrah->barang_terlaris();
		$data['total_jual'] = $this->M_Mahijrah->total_jual();
		$data['total_beli'] = $this->M_Mahijrah->total_beli();
		$data['judul'] = $judul;
		foreach($this->M_Mahijrah->total_beli() AS $p4) {
					$jlh_beli = $p4->total;
				}
				foreach($this->M_Mahijrah->total_jual() AS $p4) {
					$jlh_jual = $p4->total;
				}
		$total = intval($jlh_jual)-intval($jlh_beli);
		$data['total'] = $total;
		$this->load->view('mahijrah/print_rekap', $data);
	}

	public function log()
	{
		$judul = "log";
		
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] =  $this->M_Mahijrah->ambil_user($ID_admin);
		$data['log_aktivitas'] = $this->M_Mahijrah->ambil_log();
		$data['log_beli'] = $this->M_Mahijrah->log_beli();
		$data['log_jual'] = $this->M_Mahijrah->log_jual();
		$data['judul'] = $judul;
		
		$this->load->view('mahijrah/log',$data);
	}

	public function cari_by_tgl() {
		$tgl = $this->input->post('tgl');
		$judul = "Transaksi";
		$ID_admin = $this->session->userdata('ID_admin');
		$data['data_user'] = $this->M_Mahijrah->ambil_user($ID_admin);
		$data['data_beli'] = $this->M_Mahijrah->transaksibeli_by_tgl($tgl);
		$data['data_jual'] = $this->M_Mahijrah->transaksijual_by_tgl($tgl);

		$data['beli'] = $this->M_Mahijrah->ambil_totalbeli_by_tgl($tgl);
		$data['jual'] = $this->M_Mahijrah->ambil_totaljual_by_tgl($tgl);
		$data['judul'] = $judul;
		$this->load->view('mahijrah/transaksi',$data);
	}
}

?>