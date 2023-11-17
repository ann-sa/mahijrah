<?php 
class M_Mahijrah extends CI_Model{
	
	public function ambil_user($ID_admin)
	{
		$data = "SELECT * FROM admin WHERE ID_admin = '$ID_admin'";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function ambil_log() {
		$data = "SELECT * FROM log_aktivitas";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function total_beli() {
		$query = $this->db->query("SELECT jlhbarangbeli() AS total");
		return $query->result();
	}

	public function beli_per_bulan() {
		$query = $this->db->query("CALL beli_per_bulan()");
		mysqli_next_result($this->db->conn_id);
		return $query->result();
	}

	public function jual_per_bulan() {
		$query = $this->db->query("CALL jual_per_bulan()");
		mysqli_next_result($this->db->conn_id);
		return $query->result();
	}

	public function daftar_pembeli() {
		$query = $this->db->query("CALL daftar_pembeli()");
		mysqli_next_result($this->db->conn_id);
		return $query->result();
	}

	public function barang_terlaris() {
		$query = $this->db->query("CALL barang_terlaris()");
		mysqli_next_result($this->db->conn_id);
		return $query->result();
	}

	public function log_beli() {
		$query = $this->db->query("SELECT * FROM log_beli");
		return $query->result();
	}

	public function log_jual() {
		$query = $this->db->query("SELECT * FROM log_jual");
		return $query->result();
	}

	public function total_jual() {
		$query = $this->db->query("SELECT jlhbarangjual() AS total");
		return $query->result();
	}

	public function ambil_totalbeli() {
		$data = "SELECT * FROM listpembelian";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function ambil_totaljual() {
		$data = "SELECT * FROM listpenjualan";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function ambil_beli() {
		$data = "SELECT * FROM qbarangbeli";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function ambil_jual() {
		$data = "SELECT * FROM qbarangjual";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function ambil_detailbrg()
	{
		$data = "SELECT * FROM detail_barang";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function ambil_jlhbrg($barang,$warna,$ukuran,$model,$bahan)
	{
		$data = "SELECT * FROM detail_barang WHERE kode_barang='$barang' AND kode_warna='$warna' AND kode_model='$model' AND kode_ukuran='$ukuran' AND kode_bahan='$bahan'";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function check($tabel,$where)
	{

		return $this->db->get_where($tabel,$where);
	}
	

	public function ambil_bahan()
	{
		$data = "SELECT * FROM detail_bahan";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function ambil_barang()
	{
		$data = "SELECT * FROM barang";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function ambil_model()
	{
		$data = "SELECT * FROM model_barang";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function ambil_warna()
	{
		$data = "SELECT * FROM warna";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function ambil_ukuran()
	{
		$data = "SELECT * FROM ukuran";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function ambil_transaksibeli() {
		$data = "SELECT * FROM transaksibeli";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function ambil_transaksijual() {
		$data = "SELECT * FROM transaksijual";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function stok_crj01() {
		$query = $this->db->query("CALL crj01()");
		mysqli_next_result($this->db->conn_id);
		return $query->result();
	}

	public function stok_crj02() {
		$query = $this->db->query("CALL crj02()");
		mysqli_next_result($this->db->conn_id);
		return $query->result();
	}

	public function stok_crj04() {
		$query = $this->db->query("CALL crj04()");
		mysqli_next_result($this->db->conn_id);
		return $query->result();
	}

	public function stok_hsk01() {
		$query = $this->db->query("CALL hsk01()");
		mysqli_next_result($this->db->conn_id);
		return $query->result();
	}

	public function stok_hsk02() {
		$query = $this->db->query("CALL hsk02()");
		mysqli_next_result($this->db->conn_id);
		return $query->result();
	}

	public function stok_stg() {
		$query = $this->db->query("CALL stg()");
		mysqli_next_result($this->db->conn_id);
		return $query->result();
	}

	public function stok_ksk01() {
		$query = $this->db->query("CALL ksk01()");
		mysqli_next_result($this->db->conn_id);
		return $query->result();
	}

	public function stok_ksk02() {
		$query = $this->db->query("CALL ksk02()");
		mysqli_next_result($this->db->conn_id);
		return $query->result();
	}

	public function stok_ksk11() {
		$query = $this->db->query("CALL ksk11()");
		mysqli_next_result($this->db->conn_id);
		return $query->result();
	}

	public function stok_nqb01() {
		$query = $this->db->query("CALL nqb01()");
		mysqli_next_result($this->db->conn_id);
		return $query->result();
	}

	public function stok_nqb02() {
		$query = $this->db->query("CALL nqb02()");
		mysqli_next_result($this->db->conn_id);
		return $query->result();
	}

	public function stok_nqb03() {
		$query = $this->db->query("CALL nqb03()");
		mysqli_next_result($this->db->conn_id);
		return $query->result();
	}

	public function ambil_stok($barang) {
		$data = "SELECT detail_barang.harga, detail_barang.jumlah,
				warna.warna
				FROM detail_barang, warna
				WHERE
				detail_barang.kode_barang = '$barang'
				AND
				detail_barang.kode_warna = warna.kode_warna";
		$query = $this->db->query($data);
		return $query->result();
	}
	
	public function insert_multi($tabel,$data)
    {
		$this->db->insert_batch($tabel,$data);
    }

    public function masukkan($tabel,$data)
    {
		$this->db->insert($tabel,$data);
    }
	
	public function upload_foto_profil($apanya)
	{
		$upload_config = array(
			'upload_path'   =>  './assets/foto_profil/',
            'allowed_types' =>  'jpg|jpeg|gif|png|JPG|JPEG|GIF|PNG',
            'max_size'      =>  '100000',
            'remove_space'  =>  TRUE,
        );

        $this->load->library('upload', $upload_config);
		
		if($this->upload->do_upload($apanya))
		{
			$return = array('result' => 'success', 'file' => $this->upload->data(), 'error' => '');
			return $return;
		}
		else
		{
			$return = array('result' => 'failed', 'file' => '', 'error' => $this->upload->display_errors());
			return $return;
		}
	}
	
	public function editprofil($where,$data,$table){
		$this->db->where($where);
		$this->db->update($table,$data);
	}

	public function edit_db($where,$data,$table){
		$this->db->where($where);
		$this->db->update($table,$data);
	}

	public function beli_by_identifier($identifier)
	{
		$data = "SELECT * FROM transaksi_beli WHERE identifier='$identifier'";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function beli_by_id($id)
	{
		$data = "SELECT * FROM transaksi_beli WHERE id_beli='$id'";
		$query = $this->db->query($data);
		return $query->result();
	}


	public function jual_by_identifier($identifier)
	{
		$data = "SELECT * FROM transaksi_jual WHERE identifier='$identifier'";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function jual_by_id($id)
	{
		$data = "SELECT * FROM transaksi_jual WHERE id_jual='$id'";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function transaksijual_by_tgl($tgl) {
		$data = "SELECT detail_transaksi_jual.jlh_barang*detail_transaksi_jual.harga_jual AS total, detail_transaksi_jual.nama_pembeli, detail_transaksi_jual.tgl_jual, detail_transaksi_jual.jlh_barang, detail_transaksi_jual.harga_jual,
				barang.nama_barang, detail_bahan.nama_bahan, model_barang.nama_model, ukuran.ukuran, warna.warna
				FROM detail_transaksi_jual, barang, detail_bahan, model_barang, ukuran, warna
				WHERE
				detail_transaksi_jual.kode_barang = barang.kode_barang
				AND
				detail_transaksi_jual.kode_bahan = detail_bahan.kode_bahan
				AND
				detail_transaksi_jual.kode_model = model_barang.kode_model
				AND
				detail_transaksi_jual.kode_ukuran = ukuran.kode_ukuran
				AND
				detail_transaksi_jual.kode_warna = warna.kode_warna
				AND detail_transaksi_jual.tgl_jual = '$tgl'";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function transaksibeli_by_tgl($tgl) {
		$data = "SELECT detail_transaksi_beli.jlh_barang*detail_transaksi_beli.harga_beli AS total, detail_transaksi_beli.nama_penjual, detail_transaksi_beli.tgl_beli, detail_transaksi_beli.jlh_barang, detail_transaksi_beli.harga_beli,
				barang.nama_barang, detail_bahan.nama_bahan, model_barang.nama_model, ukuran.ukuran, warna.warna
				FROM detail_transaksi_beli, barang, detail_bahan, model_barang, ukuran, warna
				WHERE
				detail_transaksi_beli.kode_barang = barang.kode_barang
				AND
				detail_transaksi_beli.kode_bahan = detail_bahan.kode_bahan
				AND
				detail_transaksi_beli.kode_model = model_barang.kode_model
				AND
				detail_transaksi_beli.kode_ukuran = ukuran.kode_ukuran
				AND
				detail_transaksi_beli.kode_warna = warna.kode_warna
				AND detail_transaksi_beli.tgl_beli = '$tgl'";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function ambil_totalbeli_by_tgl($tgl) {
		$data = "SELECT SUM(detail_transaksi_beli.jlh_barang) AS jlh, SUM(jlh_barang*harga_beli) AS total, nama_penjual, jlh_barang, tgl_beli FROM detail_transaksi_beli WHERE tgl_beli = '$tgl' GROUP BY id_beli";
		$query = $this->db->query($data);
		return $query->result();
	}

	public function ambil_totaljual_by_tgl($tgl) {
		$data = "SELECT SUM(detail_transaksi_jual.jlh_barang) AS jlh, SUM(jlh_barang*harga_jual) AS total, nama_pembeli, jlh_barang, tgl_jual FROM detail_transaksi_jual WHERE tgl_jual = '$tgl' GROUP BY id_jual";
		$query = $this->db->query($data);
		return $query->result();
	}

}
?>