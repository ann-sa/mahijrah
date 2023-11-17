<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth_model extends CI_Model{
	private $table="admin";
	private $pk="ID_admin";
	public function __construct(){
		parent::__construct();
	}
	//ambil data dari database yang usernamenya $username dan passwordnya password
	public function login($ID_admin,$password)
	{
		$this->db->where('ID_admin',$ID_admin);
		$this->db->where('password',md5($password));
		return $this->db->get($this->table);
	}

	//membuat session dari cookie
	public function buatsession_cookie($ID_admin){
	//$tis->db->select(‘id’,’username’);
	$this->db->where('ID_admin',$ID_admin);
	$data = $this->db->get('admin');
	return $data->row();
	}
	public function validasi($ID_admin){
	$this->db->where('ID_admin',$ID_admin);
	return $this->db->get('admin')->num_rows();
	}
	public function data_user(){
	$this->db->where('ID_admin !=',$this->session->userdata['ID_admin']);
	$data= $this->db->get('admin');
	return $data->result_array();
	}

	//update user
	public function update($data,$ID_admin)
	{
	    $this->db->where($this->pk,$ID_admin);
	    $this->db->update($this->table,$data);
	}
	public function get_by_cookie($cookie)
	{
		$this->db->where('cookie',$cookie);
		return $this->db->get($this->table);
	}
}