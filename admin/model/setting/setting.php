<?php
class ModelSettingSetting extends Model {
	public function getSetting($code, $store_id = 0) {
		$setting_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `code` = '" . $this->db->escape($code) . "'");

		foreach ($query->rows as $result) {
			if (!$result['serialized']) {
				$setting_data[$result['key']] = $result['value'];
			} else {
				$setting_data[$result['key']] = json_decode($result['value'], true);
			}
		}

		return $setting_data;
	}

	public function getAdresses($store_id) {

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "store_addresses WHERE store_id = '" . (int)$store_id . "'");

		$this->load->model('localisation/language');

		$languages = $this->model_localisation_language->getLanguages();

		$adresses_data = array();

		if($query->num_rows){

			foreach($query->rows as $row){

				$adresses_data[$row['language_id']][] = array(
					'address' => $row['address'],
					'short_address' => $row['short_address'],
					'sort_order' => $row['sort_order']
				);

			}

		}

		return $adresses_data;

	}
	public function editSetting($code, $data, $store_id = 0) {


		$this->db->query("DELETE FROM `" . DB_PREFIX . "setting` WHERE store_id = '" . (int)$store_id . "' AND `code` = '" . $this->db->escape($code) . "'");
	

		$adresses = $data['address'];
		unset($data['address']);


		foreach ($data as $key => $value) {
			if (substr($key, 0, strlen($code)) == $code) {


				

				if (!is_array($value)) {

			
					$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `code` = '" . $this->db->escape($code) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape($value) . "'");
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `code` = '" . $this->db->escape($code) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape(json_encode($value, true)) . "', serialized = '1'");
				}
			}
		}
		$this->db->query("DELETE FROM `" . DB_PREFIX . "store_addresses` WHERE store_id = '" . (int)$store_id . "'");
		if($adresses){
		
		
			foreach($adresses as $key => $value){
				$value = array_values($value);
				for($i = 0; $i < count($value);$i++){

				
					
					$this->db->query("INSERT INTO ".DB_PREFIX."store_addresses SET 
					language_id = '".(int)$key."', 
					store_id = '".(int)$store_id."', 
					address	 = '".$this->db->escape($value[$i]['adress'])."',
					short_address	 = '".$this->db->escape($value[$i]['short_address'])."',
					sort_order = '".(int)$value[$i]['sort_order']."'
	
					");

				}
			

			}
		}
	}

	public function deleteSetting($code, $store_id = 0) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `code` = '" . $this->db->escape($code) . "'");
	}
	
	public function getSettingValue($key, $store_id = 0) {
		$query = $this->db->query("SELECT value FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `key` = '" . $this->db->escape($key) . "'");

		if ($query->num_rows) {
			return $query->row['value'];
		} else {
			return null;	
		}
	}
	
	public function editSettingValue($code = '', $key = '', $value = '', $store_id = 0) {
		if (!is_array($value)) {
			$this->db->query("UPDATE " . DB_PREFIX . "setting SET `value` = '" . $this->db->escape($value) . "', serialized = '0'  WHERE `code` = '" . $this->db->escape($code) . "' AND `key` = '" . $this->db->escape($key) . "' AND store_id = '" . (int)$store_id . "'");
		} else {
			$this->db->query("UPDATE " . DB_PREFIX . "setting SET `value` = '" . $this->db->escape(json_encode($value)) . "', serialized = '1' WHERE `code` = '" . $this->db->escape($code) . "' AND `key` = '" . $this->db->escape($key) . "' AND store_id = '" . (int)$store_id . "'");
		}
	}
}
