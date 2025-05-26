<?php
class ModelCatalogSizes extends Model {
    public function addSizes($data) {
        $this->db->query("INSERT INTO " . DB_PREFIX . "sizes SET sort_order = '" . (int)$data['sort_order'] . "'");

        $sizes_id = $this->db->getLastId();

        foreach ($data['sizes_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "sizes_description SET 
                sizes_id = '" . (int)$sizes_id . "', 
                language_id = '" . (int)$language_id . "', 
                text = '" . $this->db->escape($value['text']) . "', 
                name = '" . $this->db->escape($value['name']) . "'");
        }

        return $sizes_id;
    }

    public function editSizes($sizes_id, $data) {
        $this->db->query("UPDATE " . DB_PREFIX . "sizes SET sort_order = '" . (int)$data['sort_order'] . "' WHERE sizes_id = '" . (int)$sizes_id . "'");

        $this->db->query("DELETE FROM " . DB_PREFIX . "sizes_description WHERE sizes_id = '" . (int)$sizes_id . "'");

        foreach ($data['sizes_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "sizes_description SET 
            sizes_id = '" . (int)$sizes_id . "', 
            language_id = '" . (int)$language_id . "', 
            text = '" . $this->db->escape($value['text']) . "', 
            name = '" . $this->db->escape($value['name']) . "'");
        }
    }

    public function deleteSizes($sizes_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "sizes WHERE sizes_id = '" . (int)$sizes_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "sizes_description WHERE sizes_id = '" . (int)$sizes_id . "'");
    }

    public function getSizes($sizes_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sizes WHERE sizes_id = '" . (int)$sizes_id . "'");

        return $query->row;
    }

    public function getSizess($data = array()) {
        $sql = "SELECT * FROM " . DB_PREFIX . "sizes ag LEFT JOIN " . DB_PREFIX . "sizes_description agd ON (ag.sizes_id = agd.sizes_id) WHERE agd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

        $sort_data = array(
            'agd.name',
            'ag.sort_order'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY agd.name";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getSizesDescriptions($sizes_id) {
        $sizes_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sizes_description WHERE sizes_id = '" . (int)$sizes_id . "'");

        foreach ($query->rows as $result) {
            $sizes_data[$result['language_id']] = array(
                'name' => $result['name'],
                'text' => $result['text']
            );
        }

        return $sizes_data;
    }

    public function getTotalSizess() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "sizes");

        return $query->row['total'];
    }
}