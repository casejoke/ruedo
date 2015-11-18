<?php
class ControllerAccountAccount extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/account', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}
		$this->load->language('account/account');
		$this->load->model('account/customer');
		$this->load->model('catalog/statistic');
		$this->load->model('catalog/season');
		$this->load->model('catalog/occasion_group');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('tool/image');
		$this->load->model('tool/upload');
		$main_image_path = 'catalog/default/account.jpg';
		if (is_file(DIR_IMAGE . $main_image_path)) {
			$data['main_image']= $this->model_tool_image->resize($main_image_path, 1920,1280,'h');
		}else {
			$data['main_image'] = $this->model_tool_image->resize('placeholder.png', 1920,1280,'h');
		}


		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', 'SSL')
		);

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
 
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_my_account'] = $this->language->get('text_my_account');
		$data['text_my_orders'] = $this->language->get('text_my_orders');
		$data['text_my_newsletter'] = $this->language->get('text_my_newsletter');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_reward'] = $this->language->get('text_reward');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_recurring'] = $this->language->get('text_recurring');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['edit'] = $this->url->link('account/edit', '', 'SSL');
		$data['password'] = $this->url->link('account/password', '', 'SSL');
		$data['address'] = $this->url->link('account/address', '', 'SSL');
		$data['wishlist'] = $this->url->link('account/wishlist');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['return'] = $this->url->link('account/return', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');
		$data['recurring'] = $this->url->link('account/recurring', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');
		if ($this->config->get('reward_status')) {
			$data['reward'] = $this->url->link('account/reward', '', 'SSL');
		} else {
			$data['reward'] = '';
		}


		if ($this->request->server['REQUEST_METHOD'] != 'POST') {
			$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
		}
		$data['firstname'] = $customer_info['firstname'];
		$data['lastname'] = $customer_info['lastname'];
		$data['email'] = $customer_info['email'];
		$data['telephone'] = $customer_info['telephone'];

		// Custom Fields
		$this->load->model('account/custom_field');

		$data['custom_fields'] = $this->model_account_custom_field->getCustomFields($this->config->get('config_customer_group_id'));
		$data['account_custom_field'] = unserialize($customer_info['custom_field']);

		

		if (!empty($customer_info) && !empty($customer_info['image'])){
			if(preg_match('/http/', $customer_info['image'])){
				$data['image'] = $customer_info['image'];
			}else{
				$upload_info = $this->model_tool_upload->getUploadByCode($customer_info['image']);
				$filename = $upload_info['filename'];
				$data['image'] = $this->model_tool_upload->resize($filename , 360, 490, 'h');
			}
		}else{
			$data['image'] = $this->model_tool_image->resize('account.jpg', 360, 490, 'h');
		}
		
		//получим список сезонов
		//выведем архивные сезоны status = 0
		$filter_data = array();
		$filter_data = array(
		//	'filter_status' => 0
		);
		$data['seasons'] = array();
		$result_seasons  = array();
		$result_seasons = $this->model_catalog_season->getSeasons($filter_data);
		foreach ($result_seasons as  $sv) {
			$data['seasons'][$sv['season_id']] = array(
				'season_title' => $sv['title']
			);
		}

		//получим активный сезон 
		$season_active = $this->model_catalog_season->getActiveSeason();
		
		//получаем активные форматы
		$occasion_group_active = $this->model_catalog_occasion_group->getActiveOccasionGroup();
		$data['occasion_groups'] = array();
		foreach ($occasion_group_active as $occasion_group) {
			$data['occasion_groups'][] = array(
				'occasion_group_id' => $occasion_group['occasion_group_id'],
				'occasion_title' 	=> $occasion_group['title']
			);
		}
		//получим статистику для данного сезона

		$active_season_id 		=	$season_active['season_id'];

		$customer_id 	= $this->customer->getId();

		$list_statistics_for_customer = $this->model_catalog_statistic->getStatForCustomerAndSeasons($customer_id);

		

		$result_list_statistics = array();
		foreach ($data['occasion_groups'] as $occasion_group) {

			foreach ($list_statistics_for_customer as $stat) {

				if($stat['occasion_group_id'] == $occasion_group['occasion_group_id']){

					$result_group_list_statistics[$stat['season_id']][$stat['occasion_group_id']][] = array(
						'occasion_id'		=>$stat['occasion_id'],
						'occasion_group_id'	=>$stat['occasion_group_id'],					//игровые дни
						'goal' 				=> $stat['goal'],		//гол
			            'pass' 				=> $stat['pass'],		//пасс
			            'mvp'  				=> $stat['mvp']			//игрок дня
			        );

				} 

			}
		}
		
		

		$final_list_statistics = array();


		foreach ($result_seasons as  $sv) {
			if(!empty($result_group_list_statistics[$sv['season_id']])){

				foreach ($data['occasion_groups'] as $occasion_group) {

					if(!empty($result_group_list_statistics[$sv['season_id']][$occasion_group['occasion_group_id']])){
						/**************************************************************************/
						foreach ($result_group_list_statistics[$sv['season_id']][$occasion_group['occasion_group_id']] as $value_stat) {
							/**************************************************************************/
							if(!empty($final_list_statistics[$sv['season_id']][$occasion_group['occasion_group_id']] )){
		    					/**************************************************************************/
					          	$final_list_statistics[$sv['season_id']][$occasion_group['occasion_group_id']]= array(
					            	'day'   => ($final_list_statistics[$sv['season_id']][$occasion_group['occasion_group_id']]['day']+1),         //игровые дни
					            	'goal'  => $final_list_statistics[$sv['season_id']][$occasion_group['occasion_group_id']]['goal'] + $value_stat['goal'],    //гол
					                'pass'  => $final_list_statistics[$sv['season_id']][$occasion_group['occasion_group_id']]['pass'] + $value_stat['pass'],    //пасс
					                'mvp'   => $final_list_statistics[$sv['season_id']][$occasion_group['occasion_group_id']]['mvp']  + $value_stat['mvp']      //игрок дня
				              	);
					        } else{
					          	$final_list_statistics[$sv['season_id']][$occasion_group['occasion_group_id']]= array(
						            'day'   => 1,         //игровые дни
						            'goal'  => $value_stat['goal'],   //гол
						            'pass'  => $value_stat['pass'],   //пасс
						            'mvp'   => $value_stat['mvp']     //игрок дня
				              	);
				              	/**************************************************************************/
					        }
							/**************************************************************************/
						}//прокутили форматы
						/**************************************************************************/
					}//проверили 
					
				}//прокутили форматы

			}
		}

		




		$max_points = 15;
		$data['list_statistics'] = array();
		//для активного сезона
		if(!empty($final_list_statistics[$active_season_id] )){
			foreach ($final_list_statistics[$active_season_id] as $og => $player) {
				if((int)(($player['goal']+$player['pass'])/$player['day']) >= $max_points){
					$k_e_percent = 95;
				}else{
					$k_e_percent = (int)(((($player['goal']+$player['pass'])/$player['day'])*100)/$max_points);
				}
				$all_day = $this->model_catalog_statistic->getTotalOccasions($active_season_id);
				$data['list_statistics'][$og ] = array(
					'season_title' => $data['seasons'][$active_season_id]['season_title'],
					'day'   	=> $player['day'],         //игровые дни
		            'goal'  	=> $player['goal'],   //гол
		            'pass'  	=> $player['pass'],   //пасс
		            'mvp'   	=> $player['mvp'],     //игрок дня
		            'max_day'	=> $all_day,
		            'k_day_percent'		=>  (int)(($player['day']*100)/$all_day),
					'k_res'		=>  number_format( $player['goal']/$player['day'], 2, '.', ''),
		            'k_res_percent'		=>  (int)((($player['goal']/$player['day'])*100)/$max_points),
		            'k_pass'		=>  number_format( $player['pass']/$player['day'], 2, '.', ''),
		            'k_pass_percent'		=>  (int)((($player['pass']/$player['day'])*100)/$max_points),
		            'k_e'		=>  number_format( ($player['goal']+$player['pass'])/$player['day'], 2, '.', ''),
		            'k_e_percent'		=>  $k_e_percent,
				);
			}
		}

		//подтяенм стату для архивных сезонов
		$data['list_statistics_for_as'] = array();
		foreach ($result_seasons as  $sav) {

			$season_id =  $sav['season_id'];
			if(!empty($final_list_statistics[$season_id] ) && $season_id != $active_season_id){
				foreach ($final_list_statistics[$season_id] as $og => $player) {

					if((int)(($player['goal']+$player['pass'])/$player['day']) >= $max_points){
						$k_e_percent = 95;
					}else{
						$k_e_percent = (int)(((($player['goal']+$player['pass'])/$player['day'])*100)/$max_points);
					}
					$all_day = $this->model_catalog_statistic->getTotalOccasions($season_id);
					$data['list_statistics_for_as'][$season_id][$og ] = array(
						'season_title' => $sav['title'],
						'day'   	=> $player['day'],         //игровые дни
			            'goal'  	=> $player['goal'],   //гол
			            'pass'  	=> $player['pass'],   //пасс
			            'mvp'   	=> $player['mvp'],     //игрок дня
			            'max_day'	=> $all_day,
			            'k_day_percent'		=>  (int)(($player['day']*100)/$all_day),
						'k_res'		=>  number_format( $player['goal']/$player['day'], 2, '.', ''),
			            'k_res_percent'		=>  (int)((($player['goal']/$player['day'])*100)/$max_points),
			            'k_pass'		=>  number_format( $player['pass']/$player['day'], 2, '.', ''),
			            'k_pass_percent'		=>  (int)((($player['pass']/$player['day'])*100)/$max_points),
			            'k_e'		=>  number_format( ($player['goal']+$player['pass'])/$player['day'], 2, '.', ''),
			            'k_e_percent'		=>  $k_e_percent,
					);
				}
			}
		}
	 

		

		$this->document->addScript('catalog/view/javascript/account.js');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');


		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/account.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/account.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/account.tpl', $data));
		}
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function upload() {
		$this->load->language('tool/upload');

		$json = array();

		if (!empty($this->request->files['file']['name']) && is_file($this->request->files['file']['tmp_name'])) {
			// Sanitize the filename
			$filename = basename(preg_replace('/[^a-zA-Z0-9\.\-\s+]/', '', html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8')));

			// Validate the filename length
			if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 64)) {
				$json['error'] = $this->language->get('error_filename');
			}

			// Allowed file extension types
			$allowed = array();

			$extension_allowed = preg_replace('~\r?\n~', "\n", $this->config->get('config_file_ext_allowed'));

			$filetypes = explode("\n", $extension_allowed);

			foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}

			if (!in_array(strtolower(substr(strrchr($filename, '.'), 1)), $allowed)) {
				$json['error'] = $this->language->get('error_filetype');
			}

			// Allowed file mime types
			$allowed = array();

			$mime_allowed = preg_replace('~\r?\n~', "\n", $this->config->get('config_file_mime_allowed'));

			$filetypes = explode("\n", $mime_allowed);

			foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}

			if (!in_array($this->request->files['file']['type'], $allowed)) {
				$json['error'] = $this->language->get('error_filetype');
			}

			// Check to see if any PHP files are trying to be uploaded
			$content = file_get_contents($this->request->files['file']['tmp_name']);

			if (preg_match('/\<\?php/i', $content)) {
				$json['error'] = $this->language->get('error_filetype');
			}

			// Return any upload error
			if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
				$json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
			}
		} else {
			$json['error'] = $this->language->get('error_upload');
		}

		if (!$json) {
			
			$code = md5(mt_rand());
			if (!$this->customer->isLogged()) {
				$file = $filename. '.' . $code ;
			}else{
				$customer_id = $this->customer->getId();
				$folder_name = md5($customer_id).'/';
				//создаем папку с назанием 
				if (!is_dir(DIR_UPLOAD . $folder_name)) {
					mkdir(DIR_UPLOAD . $folder_name, 0777);
				}
				$file = $folder_name . $filename. '.' . $code ;
				//code поправить!!!!!!!
			}
			
			move_uploaded_file($this->request->files['file']['tmp_name'], DIR_UPLOAD . $file  );

			// Hide the uploaded file name so people can not link to it directly.
			$this->load->model('tool/upload');
			$this->load->model('account/customer');

			$json['code'] = $this->model_tool_upload->addUpload($filename, $file);

			//добавим изображение в аватар
			$this->model_account_customer->changeAvatar($json['code']);

			//рендерим изображение если это оно
			$json['thumb'] = $this->model_tool_upload->resize($file , 360, 490, 'h');

			$json['success'] = $this->language->get('text_upload');
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}