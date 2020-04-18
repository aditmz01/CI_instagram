<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class feed extends CI_Controller {
	
	function __construct(){
		parent::__construct();
		$this->load->model('model_IG');
		$this->load->library('session');
	}

	public function index()
	{
		if($this->session->userdata('username')){
			// $dataUser = $this->model_IG->get_datafoto();
			$data = $this->model_IG->get_profile($this->session->userdata('username'));
			$this->load->view('feed',$data);
		}else{
			redirect('/login');
		}
	}
	
	public function logout(){
		$this->session->sess_destroy();
		redirect('/login'); 
	}
	public function upload(){
		$config['upload_path']          = './assets/uploads/';
		$config['allowed_types']        = 'gif|jpg|png';
		$config['max_size']             = 0;
		$config['max_width']            = 0;
		$config['max_height']           = 0;
 
		$this->load->library('upload', $config);
		$this->upload->initialize($config);
		$file = array('upload_data' => $this->upload->data());
			$data = [
				"url" => $this->input->post('username', true),
				"caption" => $this->input->post('password', true),
				"profile_pic" => $this->upload->data('file_name')
			];
    	if($this->model_IG->insert_foto($data)){
      		redirect('/feed');
    	}
		
	}
}
?>