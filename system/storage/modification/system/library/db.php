<?php
 
            // Lightning, set session length to 1 month 
            if (!session_id() && !headers_sent()) { 
                ini_set("session.cookie_lifetime", time() + 60 * 60 * 24 * 5 * 365); 
                if (ini_get("session.gc_maxlifetime") < 60 * 60 * 24 * 30) ini_set("session.gc_maxlifetime", 60 * 60 * 24 * 30); 
            } 
 
            if (defined("LIGHT_ENABLED") or (!defined("LIGHT_FRONTEND") and (!file_exists(DIR_LOGS.'cv') or isset($_GET["li_sql"])))) {if (defined('DIR_CATALOG')) $b = DIR_CATALOG; else $b = DIR_APPLICATION; $b .= 'controller/extension/lightning/beta.php'; if (file_exists($b)) require_once $b;} // Lightning  
#[\AllowDynamicProperties] 
class DB {
	private $adaptor;

	public function __construct($adaptor, $hostname, $username, $password, $database, $port = NULL) {
 if ($database == DB_DATABASE) { global $db; $db = $this; if (function_exists('Wbu')) { $this->db = Wbu(); $this->adaptor = $this->db; $this->driver = $this->db; $this->dw_adaptor = $this->db; return; }} // Lightning 
		$class = 'DB\\' . $adaptor;

		if (class_exists($class)) {
			$this->adaptor = new $class($hostname, $username, $password, $database, $port);
		} else {
			throw new \Exception('Error: Could not load database adaptor ' . $adaptor . '!');
		}
	}

	public function query($sql, $params = array()) {
 if (strpos((string)$sql, "customer_id = '0') AND date_added < DATE_SUB(NOW(), INTERVAL 1 HOUR)")) $sql = str_replace("INTERVAL 1 HOUR", "INTERVAL 30 DAY", (string)$sql); // Lightning, set cart storage time for 1 month 
		return $this->adaptor->query($sql, $params);
	}

	public function escape($value) {
		return $this->adaptor->escape($value);
	}

	public function countAffected() {
		return $this->adaptor->countAffected();
	}

	public function getLastId() {
		return $this->adaptor->getLastId();
	}
	
	public function connected() {
		return $this->adaptor->connected();
	}
}