<?php
class ModelCatalogCategory extends Model {
	public function getCategory($category_id) {

		if(isset($this->session->data['store'])){
			$store_id = $this->session->data['store'];
		} else {
			$store_id = 0;
		} 

		
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.category_id = '" . (int)$category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$store_id . "' AND c.status = '1'");

		return $query->row;
	}

	public function getCategories($parent_id = 0) {

		if(isset($this->session->data['store'])){
			$store_id = $this->session->data['store'];
		} else {
			$store_id = 0;
		} 

		

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$store_id . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)");

		return $query->rows;
	}

	public function getCategoriesByStore($store_id) {

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_to_store c2s WHERE c2s.store_id = '".(int)$store_id."'");


		return $query->rows;

	}
	public function getChildCategoriesByStore($store_id,$category_id) {

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$store_id . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)");

	

		return $query->rows;

	}
	public function getParentCategory($store_id = 0, $category_id = 0) {

		$query = $this->db->query("SELECT c.parent_id FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON(c2s.category_id = c.category_id) WHERE c.category_id = '".(int)$category_id."' AND c2s.store_id = '".(int)$store_id."'");
		// $sql = "SELECT c.parent_id FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON(c2s.category_id = c.category_id) WHERE c.category_id = '".(int)$category_id."' AND c2s.store_id = '".(int)$store_id."'";
		// echo '<pre>';
		// 	print_r($sql);
	
		// 	echo '</pre>';
		return $query->row['parent_id'];

	}
	public function getCategoriesChildByStore($store_id,$category_id) {

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON(c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON(c2s.category_id = cd.category_id) WHERE c.parent_id = '".(int)$category_id."' AND c2s.store_id = '".(int)$store_id."'");

		return $query->rows;

	}
	public function getStore($store_id) {

		if($store_id){
			$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "store WHERE store_id = '" . (int)$store_id . "'");

			return $query->row;

		} else {

			$store_info['store_id'] = 0;
			$store_info['name'] = 'Интернет-магазин';
			$store_info['url'] = 'lknl-dev.ru';
			$store_info['ssl'] = '';


			return $store_info;
		}


		
	}
	public function getCategoryFilters($category_id) {

		if(isset($this->session->data['store'])){
			$store_id = $this->session->data['store'];
		} else {
			$store_id = 0;
		} 


		$implode = array();

		$query = $this->db->query("SELECT filter_id FROM " . DB_PREFIX . "category_filter WHERE category_id = '" . (int)$category_id . "'");

		foreach ($query->rows as $result) {
			$implode[] = (int)$result['filter_id'];
		}

		$filter_group_data = array();

		if ($implode) {
			$filter_group_query = $this->db->query("SELECT DISTINCT f.filter_group_id, fgd.name, fg.sort_order FROM " . DB_PREFIX . "filter f LEFT JOIN " . DB_PREFIX . "filter_group fg ON (f.filter_group_id = fg.filter_group_id) LEFT JOIN " . DB_PREFIX . "filter_group_description fgd ON (fg.filter_group_id = fgd.filter_group_id) WHERE f.filter_id IN (" . implode(',', $implode) . ") AND fgd.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY f.filter_group_id ORDER BY fg.sort_order, LCASE(fgd.name)");

			foreach ($filter_group_query->rows as $filter_group) {
				$filter_data = array();

				$filter_query = $this->db->query("SELECT DISTINCT f.filter_id, fd.name FROM " . DB_PREFIX . "filter f LEFT JOIN " . DB_PREFIX . "filter_description fd ON (f.filter_id = fd.filter_id) WHERE f.filter_id IN (" . implode(',', $implode) . ") AND f.filter_group_id = '" . (int)$filter_group['filter_group_id'] . "' AND fd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY f.sort_order, LCASE(fd.name)");

				foreach ($filter_query->rows as $filter) {
					$filter_data[] = array(
						'filter_id' => $filter['filter_id'],
						'name'      => $filter['name']
					);
				}

				if ($filter_data) {
					$filter_group_data[] = array(
						'filter_group_id' => $filter_group['filter_group_id'],
						'name'            => $filter_group['name'],
						'filter'          => $filter_data
					);
				}
			}
		}

		return $filter_group_data;
	}

	public function getCategoryLayoutId($category_id) {

		if(isset($this->session->data['store'])){
			$store_id = $this->session->data['store'];
		} else {
			$store_id = 0;
		} 

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_to_layout WHERE category_id = '" . (int)$category_id . "' AND store_id = '" . (int)$store_id . "'");

		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return 0;
		}
	}

	public function getTotalCategoriesByCategoryId($parent_id = 0) {

		if(isset($this->session->data['store'])){
			$store_id = $this->session->data['store'];
		} else {
			$store_id = 0;
		} 

		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND c2s.store_id = '" . (int)$store_id . "' AND c.status = '1'");

		return $query->row['total'];
	}
}