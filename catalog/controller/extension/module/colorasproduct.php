<?php
class ControllerExtensionModuleColorasproduct extends Controller {
	public function index() {
		$this->load->language('extension/module/colorasproduct');

		$data['heading_title'] = 'ColorAsProduct 1.7 - цвета товара как отдельные товары';
		$this->load->model('catalog/product');

	    // Цвет
			
			$data['colors'] = array();
			$data['product_id'] = $this->request->get['product_id'];
			$resultz = $this->model_catalog_product->getProductColor($this->request->get['product_id']);

			$width = $this->config->get('colorasproduct_width');
			$height = $this->config->get('colorasproduct_height');

			$data['kra'] = $this->config->get('colorasproduct_kra');
			$data['colorasproduct_title'] = $this->config->get('colorasproduct_title');

			if (empty($width)) {
			    $width = 170;
            }
            if (empty($height)) {
                $height = 90;
            }

			foreach ($resultz as $result) {

                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $width, $height);
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $width, $height);
                }

                $sql = $this->model_catalog_product->getProduct($result['product_id']);

				if (!empty($sql['special'])) {
                  $price = $sql['special'];
                } else {
				  $price = $sql['price'];
                }

                if (!empty($sql['htmlcolor'])) {
				    $htmlcolor = $sql['htmlcolor'];
                    $htmlerror = 0;
                } else {
				    $htmlcolor = $this->model_tool_image->resize($result['image'], 34, 34);
                    $htmlerror = 1;
                }

				$data['colors'][] = array(
					'product_id'  => $result['product_id'],
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'colors'      => $sql['colorasprod'],
					'image'       => $image,
					'htmlcolor'   => $htmlcolor,
					'quantity'    => $sql['quantity'],
					'name'        => $sql['name'],
					'htmlerror'   => $htmlerror,
					'price'       => $this->currency->format($this->tax->calculate($price, $sql['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
				);

			}
            asort($data['colors']);

			$data['colorasproduct_method'] = nl2br($this->config->get('colorasproduct_method'));
			$data['colorasproduct_price'] = nl2br($this->config->get('colorasproduct_price'));

			$styles = nl2br($this->config->get('colorasproduct_style'));
			$stylesmin = nl2br($this->config->get('colorasproduct_stylemin'));

            $data['colorasproduct_selector'] = nl2br($this->config->get('colorasproduct_selector'));

        if ($styles == 0) {
            $this->document->addStyle('catalog/view/theme/default/stylesheet/colorasproduct.css');
        }
		return $this->load->view('extension/module/colorasproduct', $data);
	}
}