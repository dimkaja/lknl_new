<?php
class ControllerAccountWishList extends Controller {
	public function index() {
		

		$this->load->language('account/wishlist');

		$this->load->model('account/wishlist');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');



               //remove product from wishlist by guest
            if (isset($this->request->get['remove_cookie_wishlist'])) {

		    $wishlist = isset($_COOKIE['cookieWishlist']) ? json_decode($_COOKIE['cookieWishlist'],1) : [];
		    $wishlist = array_unique($wishlist);
		    foreach ($wishlist as $k => $value){
		        if($value == $this->request->get['remove_cookie_wishlist']){
		            unset($wishlist[$k]);
                }
            }
                setcookie('cookieWishlist', json_encode($wishlist), time()+3600*24*365,'/');

                $this->response->redirect($this->url->link('account/wishlist'));
            }
            /*end remove product from wishlist by guest*/



            
		if (isset($this->request->get['remove'])) {
			// Remove Wishlist
			$this->model_account_wishlist->deleteWishlist($this->request->get['remove']);

			$this->session->data['success'] = $this->language->get('text_remove');

			$this->response->redirect($this->url->link('account/wishlist'));
		}

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('account/wishlist')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_empty'] = $this->language->get('text_empty');

		$data['column_image'] = $this->language->get('column_image');
		$data['column_name'] = $this->language->get('column_name');
		$data['column_model'] = $this->language->get('column_model');
		$data['column_stock'] = $this->language->get('column_stock');
		$data['column_price'] = $this->language->get('column_price');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_remove'] = $this->language->get('button_remove');

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['products'] = array();

		
            if ($this->customer->isLogged()) {
                $results = $this->model_account_wishlist->getWishlist();
                }else{
                 $wishlist = isset($_COOKIE['cookieWishlist']) ? json_decode($_COOKIE['cookieWishlist'],1) : [];
                 $wishlist = array_unique($wishlist);
                    $results = [];
                    foreach ($wishlist as $value){
                        $results[]['product_id'] = $value;
                    }
            }
            

		foreach ($results as $result) {
			$product_info = $this->model_catalog_product->getProduct($result['product_id']);

			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_wishlist_width'), $this->config->get($this->config->get('config_theme') . '_image_wishlist_height'));
				} else {
					$image = false;
				}

				if ($product_info['quantity'] <= 0) {
					$stock = $product_info['stock_status'];
				} elseif ($this->config->get('config_stock_display')) {
					$stock = $product_info['quantity'];
				} else {
					$stock = $this->language->get('text_instock');
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				$data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'      => $image,
					'name'       => $product_info['name'],
					'model'      => $product_info['model'],
					'stock'      => $stock,
					'price'      => $price,
					'special'    => $special,
					'href'       => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
					'remove'     => $this->customer->isLogged() ? $this->url->link('account/wishlist', 'remove=' . $product_info['product_id']) : $this->url->link('account/wishlist', 'remove_cookie_wishlist=' . $product_info['product_id'])
				);
			} else {
				$this->model_account_wishlist->deleteWishlist($result['product_id']);
			}
		}

		$data['continue'] = $this->url->link('account/account', '', true);

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('account/wishlist', $data));
	}


	public function add() {
		$this->load->language('account/wishlist');

		$json = array();

		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
			if ($this->customer->isLogged()) {
				// Edit customers cart
				
				$this->load->model('account/wishlist');

				$this->model_account_wishlist->addWishlist($this->request->post['product_id']);

				$json['success'] = sprintf($this->language->get('text_success'), $this->url->link('product/product', 'product_id=' . (int)$this->request->post['product_id']), $product_info['name'], $this->url->link('account/wishlist'));

				$json['total'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
			} else {
				if (!isset($this->session->data['wishlist'])) {
					$this->session->data['wishlist'] = array();
				}

				$this->session->data['wishlist'][] = $this->request->post['product_id'];

                 /*add product in wishlist by guest*/
                $wishlist = isset($_COOKIE['cookieWishlist']) ? json_decode($_COOKIE['cookieWishlist'],1) : [];
                $wishlist = array_unique($wishlist);
                $wishlist_total = count($wishlist);
                  if(!in_array($this->request->post['product_id'], $wishlist)){
                    $this->load->model('catalog/product');
                    $product_info = $this->model_catalog_product->getProduct($this->request->post['product_id']);
                    if($product_info){
                     $wishlist[] = $this->request->post['product_id'];
                        $wishlist_total += 1;
                     }
                }

                 setcookie('cookieWishlist', json_encode($wishlist), time()+3600*24*365, '/');

                $wishlist = isset($_COOKIE['cookieWishlist']) ? json_decode($_COOKIE['cookieWishlist'],1) : [];
                $wishlist = array_unique($wishlist);
                /*end add product in wishlist by guest*/
            

				$this->session->data['wishlist'] = array_unique($this->session->data['wishlist']);

				$json['success'] = sprintf($this->language->get('text_success'), $this->url->link('product/product', 'product_id=' . (int)$this->request->post['product_id']), $product_info['name'], $this->url->link('account/wishlist'));

				// 
            $json['total'] = sprintf($this->language->get('text_wishlist'), $wishlist_total);
            

				$json['total'] = count($this->session->data['wishlist']);

			}
			
			$this->load->model('catalog/product');

			$product_info = $this->model_catalog_product->getProduct($this->request->post['product_id']);
			$json['product_name'] = $product_info['name'];


			
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$product_info['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$product_info['price'] = false;
			}

			if ((float)$product_info['special']) {
				$product_info['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$product_info['special'] = false;
			}

			$product_info['href'] = $this->url->link('product/product',  'product_id=' . $product_info['product_id']);

			$json['product'] = $product_info;

		}

	


		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	
	public function remove() {

		$json = array();

		$customer_id = $this->customer->getId();

		$product_id = $this->request->post['product_id'];

		if ($this->customer->isLogged()) {

			$this->db->query("DELETE FROM ".DB_PREFIX."customer_wishlist WHERE product_id = '".(int)$product_id."' AND customer_id = '".(int)$customer_id."'");



		} else {

			$new_wishlists = array_values($this->session->data['wishlist']);

			if(isset($new_wishlists)){
				for($i = 0; $i < count($new_wishlists);$i++){
					
					if($new_wishlists[$i] == $product_id) {
						unset($new_wishlists[$i]);
					}

				}

				$this->session->data['wishlist'] = $new_wishlists;
			}


		}
		
		$json['total'] = count($this->session->data['wishlist']);

		$json['product_id'] = $product_id;

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
