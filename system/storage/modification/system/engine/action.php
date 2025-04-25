<?php
 
if (defined('DIR_CATALOG') && !empty($_POST) && (empty($_GET['route']) || $_GET['route'] == 'common/login')) { global $login_checked; if (empty($login_checked)) { $login_checked = 1; $f = DIR_CACHE . 'lightning_llt'; $d = ''; if (isset($_SERVER['HTTP_ACCEPT'])) $d .= $_SERVER['HTTP_ACCEPT']; if (isset($_SERVER['HTTP_ACCEPT_LANGUAGE'])) $d .= $_SERVER['HTTP_ACCEPT_LANGUAGE']; if (is_file($f) && filemtime($f) >= time() - 3 && file_get_contents($f) == $d) { file_put_contents($f, $d); exit; }file_put_contents($f, $d);}} if (!defined('DIR_CATALOG') && file_exists($li = DIR_APPLICATION.'controller/extension/lightning/gamma.php')) require_once($li); // Lightning 
class Action {
	private $id;
 public $lid; // Lightning 
	private $route;
	private $method = 'index';

	public function __construct($route) {
 $this->lid = $route; // Lightning 
		$this->id = $route;
		
		$parts = explode('/', preg_replace('/[^a-zA-Z0-9_\/]/', '', (string)$route));

		// Break apart the route
		while ($parts) {
			$file = DIR_APPLICATION . 'controller/' . implode('/', $parts) . '.php';

			if (is_file($file)) {
				$this->route = implode('/', $parts);		
				
				break;
			} else {
				$this->method = array_pop($parts);
			}
		}
	}
	
	public function getId() {
		return $this->id;
	}
	
	public function execute($registry, array $args = array()) {
 if (function_exists('Wkn') and Wkp()) return Wkn($args, $this->route, $this->method); // Lightning 
 if (function_exists('Wfa')) { $p = Wfa($this->route, $args); if ($r = Wfv()) return $r;}// Lightning 
		// Stop any magical methods being called
		if (substr($this->method, 0, 2) == '__') {
			return new \Exception('Error: Calls to magic methods are not allowed!');
		}

		$file = DIR_APPLICATION . 'controller/' . $this->route . '.php';		
		$class = 'Controller' . preg_replace('/[^a-zA-Z0-9]/', '', $this->route);
		
		// Initialize the class
		if (is_file($file)) {
			include_once(modification($file));
		
			$controller = new $class($registry);
		} else {
			return new \Exception('Error: Could not call ' . $this->route . '/' . $this->method . '!');
		}
		
		$reflection = new ReflectionClass($class);
		
		if ($reflection->hasMethod($this->method) && $reflection->getMethod($this->method)->getNumberOfRequiredParameters() <= count($args)) {
			 $r = call_user_func_array (array($controller, $this->method), $args);
 if (function_exists('Wfw')) Wfw($this->route, $p, $r); return $r; 
		} else {
			return new \Exception('Error: Could not call ' . $this->route . '/' . $this->method . '!');
		}
	}
}
