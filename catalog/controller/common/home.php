<?php
class ControllerCommonHome extends Controller {
	public function index() {

			ini_set('display_errors', 1);
		ini_set('display_startup_errors', 1);
		ini_set('log_errors', true);
		error_reporting(E_ALL);

		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

		$data['start'] = 0;
		$data['limit'] = 20;

		$this->load->model('catalog/product');



		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
		} else {
			$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
		}


		if(isset($this->session->data['store'])){
			$store_id = $this->session->data['store'];
		} else {
			$store_id = 0;
		}

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



		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$filter_data = array(
			'store_id'              => $store_id
		);

		$product_total = $this->model_catalog_product->getProductsForHomeByStoreTotal($filter_data);

		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('common/home', 'page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

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

		$this->response->setOutput($this->load->view('common/home', $data));
	}

	public function lazyProductsForHomeByStore() {

		$json = array();

		$json['test'] = $this->request->post;

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}
}
