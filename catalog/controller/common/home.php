<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}
		$this->load->model('catalog/occasion');
		$this->load->model('catalog/occasion_group');
		$this->load->model('tool/image');

		//подтянем фильтр
		//получаем активные форматы
		$occasion_group_active = $this->model_catalog_occasion_group->getActiveOccasionGroup();
		$data['occasion_groups'] = array();
		foreach ($occasion_group_active as $occasion_group) {
			$data['occasion_groups'][] = array(
				'occasion_group_id' => $occasion_group['occasion_group_id'],
				'link' => 'type_'.$occasion_group['occasion_group_id'],
				'title' => $occasion_group['title']
			);
		}

		$filter_data = array(
			'filter_status'    => 1,
			'sort' => 'd.occasion_date',
			'order' => 'ASC'
		);
	 	$occasions = $this->model_catalog_occasion->getOccasions($filter_data);
	 	$data['occasions'] = array();
		foreach ($occasions as $occasion) {
			foreach ($occasion_to_group as $occasion_to_group_val) {
				if( $occasion['occasion_id'] == $occasion_to_group_val['occasion_id']){
					
					$isset_best_price = ((int)$occasion['best_price'] > 0 )?true:false;
					$data['occasions'][$occasion_to_group_val['occasion_group_id']][] = array (
						'occasion_id' => $occasion['occasion_id'],
						'title' 		=> html_entity_decode($occasion['title'], ENT_QUOTES),
						'min_title' 		=> html_entity_decode($occasion['min_title'], ENT_QUOTES),
						'occasion_group_id' => $occasion_to_group_val['occasion_group_id'],
						'image'			=> $image,
					);
				}
			}
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