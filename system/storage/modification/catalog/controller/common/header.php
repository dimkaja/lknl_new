<?php
class ControllerCommonHeader extends Controller {

	public function index() {
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		
		if(isset($this->session->data['store'])){
			$store_id = $this->session->data['store'];
		} else {
			$store_id = 0;
		} 

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');
		$data['og_url'] = (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));
		$data['og_image'] = $this->document->getOgImage();

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());

			$data['count_wish'] = $this->model_account_wishlist->getTotalWishlist();
		} else {
			
      $wishlist = isset($_COOKIE['cookieWishlist']) ? json_decode($_COOKIE['cookieWishlist'],1) : [];
      $wishlist = array_unique($wishlist);
        $data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), count($wishlist));
        

			if(isset($this->session->data['wishlist'])){
				$data['count_wish'] = count($this->session->data['wishlist']);
			} else {
				$data['count_wish'] = 0;
			}
	
		}

		$this->load->model('catalog/product');

		$data['cities'] = $this->model_catalog_product->getStores();

		$data['count_cart'] = $this->cart->countProducts();

		$informations = array();

		$informations[] = array(
			'name' => 'Доставка',
			'href' => $this->url->link('information/information','information_id=6')
		);
		$informations[] = array(
			'name' => 'Избранное',
			'href' => $this->url->link('account/wishlist')
		);
		$informations[] = array(
			'name' => 'Контакты',
			'href' => $this->url->link('information/contact')
		);
		$informations[] = array(
			'name' => 'Оплата',
			'href' => $this->url->link('information/information','information_id=7')
		);
		$informations[] = array(
			'name' => 'Магазины',
			'href' => $this->url->link('information/magazines')
		);

		$data['informations'] = $informations;

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_page'] = $this->language->get('text_page');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();
		
		$categories = $this->model_catalog_category->getCategories();

		foreach ($categories as $category) {
			$category_id = $category['category_id'];
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				if($children){
					foreach ($children as $child) {

						$child_category_info = $this->model_catalog_category->getCategory($child['category_id']);


						$filter_data = array(
							'filter_category_id'  => $child['category_id'],
							'filter_sub_category' => true
						);
	
						$children_data[] = array(
							'name'  => $child_category_info['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
							'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
						);
					}
				}
	

				// Level 1
				$data['categories'][] = array(
					'name'     => $category_info['name'],
					'children' => $children_data,
					'text_all' => $category_info['text_all'],
					'column'   => $category_info['column'] ? $category_info['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category_info['category_id'])
				);
			}
		}



		$data['store_selected'] = $this->model_catalog_category->getStore($store_id);
		


		// if(!isset($this->session->data['store'])){
		// 	$categories = $this->model_catalog_category->getCategories(0);

		// 	foreach ($categories as $category) {
		// 		if ($category['top']) {
		// 			// Level 2
		// 			$children_data = array();
	
		// 			$children = $this->model_catalog_category->getCategories($category['category_id']);
	
		// 			foreach ($children as $child) {
		// 				$filter_data = array(
		// 					'filter_category_id'  => $child['category_id'],
		// 					'filter_sub_category' => true
		// 				);
	
		// 				$children_data[] = array(
		// 					'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
		// 					'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
		// 				);
		// 			}
	
		// 			// Level 1
		// 			$data['categories'][] = array(
		// 				'name'     => $category['name'],
		// 				'children' => $children_data,
		// 				'column'   => $category['column'] ? $category['column'] : 1,
		// 				'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
		// 			);
		// 		}
		// 	}

		// 	$data['store_selected'] = $this->model_catalog_category->getStore(0);

			

		// } else {
		// 	$store_id = $this->session->data['store'];
		// 	$categories = $this->model_catalog_category->getCategoriesByStore($store_id);

		

		// 	foreach($categories as $category){

		// 		$category_id = $category['category_id'];
		// 		$category_info = $this->model_catalog_category->getCategory($category_id);
		
		// 		if ($category_info['top']) {
		// 			// Level 2
		// 			$children_data = array();
	
		// 			$children = $this->model_catalog_category->getCategoriesChildByStore($store_id,$category_info['category_id']);
				
		// 			foreach ($children as $child) {
		// 				$filter_data = array(
		// 					'filter_category_id'  => $child['category_id'],
		// 					'filter_sub_category' => true
		// 				);
	
		// 				$children_data[] = array(
		// 					'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
		// 					'href'  => $this->url->link('product/category', 'path=' . $category_info['category_id'] . '_' . $child['category_id'])
		// 				);
		// 			}
			
		// 			// Level 1
		// 			$data['categories'][] = array(
		// 				'name'     => $category_info['name'],
		// 				'children' => $children_data,
		// 				'text_all' => $category_info['text_all'],
		// 				'column'   => $category_info['column'] ? $category_info['column'] : 1,
		// 				'href'     => $this->url->link('product/category', 'path=' . $category_info['category_id'])
		// 			);
		// 		}
		// 	}
		// 	echo '<pre>';
		// 	print_r($categories);
		// 	echo '</pre>';
		// 	$data['store_selected'] = $this->model_catalog_category->getStore($this->session->data['store']);

		// }




		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');
		$data['cart_link'] = $this->url->link('checkout/cart');
		$data['wish_link'] = $this->url->link('checkout/cart','index=1');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;

			$data['route'] = $this->request->get['route'];

		} else {
			$data['class'] = 'common-home';
			$data['route'] = '';
		}

		return $this->load->view('common/header', $data);
	}
	

	public function selectCity() {

		// ini_set('display_errors', 1);
		// ini_set('display_startup_errors', 1);
		// ini_set('log_errors', true);
		// error_reporting(E_ALL);

		$json = array();

		$store_id = $this->request->post['store_id'];
		

		if(isset($this->session->data['store'])){
			unset($this->session->data['store']);
		}


		$this->session->data['store'] = $store_id;

		$this->load->model('catalog/category');
		$this->load->model('catalog/product');



		$data['categories'] = array();
		
		$categories = $this->model_catalog_category->getCategories();

		foreach ($categories as $category) {
			$category_id = $category['category_id'];
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				if($children){
					foreach ($children as $child) {

						$child_category_info = $this->model_catalog_category->getCategory($child['category_id']);


						$filter_data = array(
							'filter_category_id'  => $child['category_id'],
							'filter_sub_category' => true
						);
	
						$children_data[] = array(
							'name'  => $child_category_info['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
							'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
						);
					}
				}
	

				// Level 1
				$data['categories'][] = array(
					'name'     => $category_info['name'],
					'children' => $children_data,
					'text_all' => $category_info['text_all'],
					'column'   => $category_info['column'] ? $category_info['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category_info['category_id'])
				);
			}
		}
		$page = 1;
		$limit = 2;

		$filter_data = array(
			'store_id'              => $store_id,
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit
		);


		$products = $this->model_catalog_product->getProductsForHomeByStore($filter_data);

		$data['products'] = array();

		$this->load->model('tool/image');

		foreach($products as $product){


			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($product['price'], 0, $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$price = false;
			}

			if ((float)$product['special']) {
				$special = $this->currency->format($this->tax->calculate($product['special'], 0, $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$special = false;
			}

			if ($product['image']) {
				$image = '/image/'.$product['image'];
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
			}
			if ($product['prev_image']) {
				$prev_image = '/image/'.$product['prev_image'];
			} else {
				$prev_image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
			}

			$data['products'][] = array(
				'product_id' => $product['product_id'],
				'name' => $product['name'],
				'image' => $image,
				'prev_image' => $prev_image,
				'product_id' => $product['name'],
				'price' => $price,
				'special' => $special,
				'href'        => $this->url->link('product/product',  'product_id=' . $product['product_id'])
 			);

		}

		$json['categories'] = $data['categories'];
		$json['products'] = $data['products'];

		$filter_data = array(
			'store_id'              => $store_id
		);

		$product_total = $this->model_catalog_product->getProductsForHomeByStoreTotal($filter_data);

		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('common/home', 'page={page}');

		$json['pagination'] = $pagination->render();

		$json['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

		// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
		if ($page == 1) {
			$this->document->addLink($this->url->link('common/home', true), 'canonical');
		} elseif ($page == 2) {
			$this->document->addLink($this->url->link('common/home', true), 'prev');
		} else {
			$this->document->addLink($this->url->link('common/home','page='. ($page - 1), true), 'prev');
		}

		if ($limit && ceil($product_total / $limit) > $page) {
			$this->document->addLink($this->url->link('common/home', 'page='. ($page + 1), true), 'next');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}

}
