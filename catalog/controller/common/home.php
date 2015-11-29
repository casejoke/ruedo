<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}
		$this->load->model('localisation/language');
		$this->load->model('catalog/occasion');
		$this->load->model('catalog/occasion_group');
		$this->load->model('tool/image');
		$this->load->model('catalog/place');

		/***************** проекты **********************/
		//подтянем фильтр
		//получаем активные форматы
		$occasion_group_active = $this->model_catalog_occasion_group->getActiveOccasionGroup();
		$data['occasion_groups'] = array();
		foreach ($occasion_group_active as $occasion_group) {
			$data['occasion_groups'][$occasion_group['occasion_group_id']] = array(
				'occasion_group_id' => $occasion_group['occasion_group_id'],
				'link' => 'type_'.$occasion_group['occasion_group_id'],
				'title' 		=> $occasion_group['title']
			);
		}
		
		$filter_data = array(
			'filter_status'    => 1,
			'sort' => 'd.occasion_date',
			'order' => 'ASC'
		);
		
		//получаем список с occasion_to_occasion_group
		$occasions_to_occasion_groups = $this->model_catalog_occasion->getOccasionsToOccasionGroups();
		$occasion_to_group = array();
		foreach ($occasions_to_occasion_groups as $og) {

			$occasion_to_group[$og['occasion_id']][] = array(
				'occasion_id' 		=> $og['occasion_id'],
				'occasion_group_id' => $og['occasion_group_id']
			);
		}
		
		$language_results = $this->model_localisation_language->getLanguages();
		$language_code = $this->language->get('code');
		foreach ($language_results as $result) {
			if ($result['code'] == $language_code) {
				$language_id = $result['language_id'];
			}
		}
		//получим изображения для проекта
		$project_images = $this->model_catalog_occasion->getOccasionsImages();

		$data['images'] = array();
	/*	foreach ($project_images as $p_image) {
			$data['images'][] = array(
				'title' 			=> $p_image['occasion_image_description'][$language_id]['title'],
				'image_full' 	=> $this->model_tool_image->resize($place_image['image'], 1920,1280,'w'),
				'image' 			=> $this->model_tool_image->resize($place_image['image'], 950,450,'w')
			);
		}*/

	

	 	$occasions = $this->model_catalog_occasion->getOccasions($filter_data);
	 	$data['occasions'] = array();
		foreach ($occasions as $occasion) {
			$filter_type = '';
			$title  = '';
			if(!empty($occasion_to_group[$occasion['occasion_id']])){
				foreach ($occasion_to_group[$occasion['occasion_id']] as $occasion_to_group_val) {
					$filter_type = $filter_type.' '.'project_type_'.$occasion_to_group_val['occasion_group_id'];
					$title = $title.' '.$data['occasion_groups'][$occasion_to_group_val['occasion_group_id']]['title'].' /';
				}
			}
			
			$images_project = array();
			if( !empty($project_images[$occasion['occasion_id']]) ){

				foreach ($project_images[$occasion['occasion_id']] as $piv) {
					$images_project[] = array(
						'title' 			=> $piv['occasion_image_description'][$language_id]['title'],
						'image_preview' 	=> $this->model_tool_image->resize($piv['image'], 270,200,'h'),
						'image' 			=> $this->model_tool_image->resize($piv['image'], 950,450,'w')
					);
				}
			}
			if (!empty($images_project)) {
				$image = $images_project[0]['image_preview'];
			}else {
				$image = $this->model_tool_image->resize('placeholder.png', 270,200,'w');
			}
			//собственно сами проекты
			$data['occasions'][] = array (
						'occasion_id' 			=> $occasion['occasion_id'],
						'class'					=> $filter_type,
						'title' 				=> html_entity_decode($occasion['title'], ENT_QUOTES),
						'min_title' 		    => html_entity_decode($occasion['min_title'], ENT_QUOTES),
						'description' 		    => html_entity_decode($occasion['description'], ENT_QUOTES),
						'occasion_group_id' => $occasion_to_group_val['occasion_group_id'],
						'image'							=> $image,
						'images_project'   => $images_project,
						'project_title'		=> $title
			);
				
			
		}

		/***************** услуги **********************/
		//получим активные места услуги
		$filter_data = array(
			'filter_status'    => 1
		);

		$places = $this->model_catalog_place->getPlaces($filter_data);
		$data['places'] = array();
		foreach ($places as $place) {
			if (!empty($place['image'])) {
				$image= '/image/'.$place['image'];
			}else{
				$image = $this->model_tool_image->resize('placeholder.png', 150,194,'w');
			}
			$data['places'][] = array(
				'place_id' => $place['place_id'],
				'place_title' => $place['title'],
				'place_description' => html_entity_decode($place['description'], ENT_QUOTES),
				'place_image' => $image,
			);
		}




		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/home.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/home.tpl', $data));
		}
	}
}