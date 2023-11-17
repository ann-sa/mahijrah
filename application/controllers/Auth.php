<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 
class Auth extends CI_Controller {
    
    public function __construct() {
        parent::__construct();
        $this->load->model('Auth_model');
        $this->load->library('form_validation');
        $this->load->helper(array('Form', 'Cookie', 'String'));
    }
 
    public function index()
    {
        // ambil cookie
        $cookie = get_cookie('acode');
        
        // cek session
        if ($this->session->userdata('logged')) {
            redirect('mahijrah');
        } else if($cookie <> '') {
            // cek cookie
            $row = $this->Auth_model->get_by_cookie($cookie)->row();
            if ($row) {
                $this->_daftarkan_session($row);
            } else {
                $data = array(
                     'ID_admin' => set_value('ID_admin'),
                     'password' => set_value('password'),
                     'remember' => set_value('remember'),
                     'message' => $this->session->flashdata('message'),
                );
                $this->load->view('header');
                $this->load->view('login', $data);    
            }
        } else {
            $data = array(
                'ID_admin' => set_value('ID_admin'),
                'password' => set_value('password'),
                'remember' => set_value('remember'),
                'message' => $this->session->flashdata('message'),
            );

             
             $this->load->view('login', $data);            
        }
    }
        
    public function login() // remember me utk mengambil kode cookienya
    {
        $ID_admin = $this->input->post('ID_admin');
        $password = $this->input->post('password');
        $remember = $this->input->post('remember');
        
        $row = $this->Auth_model->login($ID_admin, $password)->row();
        
        if ($row) {
            // login berhasil
            // 1. Buat Cookies jika remember di check
            if ($remember) {
                $key = random_string('alnum', 64);
                set_cookie('acode', $key, 3600*24*30); // set expired 30 hari kedepan
                
                // simpan key di database
                $update_key = array(
                    'cookie' => $key
                );
                $this->Auth_model->update($update_key, $row->ID_admin);
            }
            
            $this->_daftarkan_session($row);
        } else {
            // login gagal
            $this->session->set_flashdata('message','Login Gagal');
            $this->index();
        }
        
    }
    
    public function _daftarkan_session($row) {
        // 1. Daftarkan Session
        $sess = array(
            'logged' => TRUE,
            'ID_admin' => $row->ID_admin,
            'username' => $row->username,
        );
        $this->session->set_userdata($sess);
            
        // 2. Redirect ke home
        redirect('mahijrah');        
    }
        
    public function logout()
    {
        // delete cookie dan session
        delete_cookie('acode');
        $this->session->sess_destroy();
        redirect('Auth');
    }
        
}