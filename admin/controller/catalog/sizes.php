<?php
class ControllerCatalogSizes extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('catalog/sizes');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/sizes');

        $this->getList();
    }

    public function add() {
        $this->load->language('catalog/sizes');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/sizes');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_catalog_sizes->addSizes($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/sizes', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getForm();
    }

    public function edit() {
        $this->load->language('catalog/sizes');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/sizes');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_catalog_sizes->editSizes($this->request->get['sizes_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/sizes', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getForm();
    }

    public function delete() {
        $this->load->language('catalog/sizes');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/sizes');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $sizes_id) {
                $this->model_catalog_sizes->deleteSizes($sizes_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/sizes', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getList();
    }

    protected function getList() {
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'agd.name';
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

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/sizes', 'token=' . $this->session->data['token'] . $url, true)
        );

        $data['add'] = $this->url->link('catalog/sizes/add', 'token=' . $this->session->data['token'] . $url, true);
        $data['delete'] = $this->url->link('catalog/sizes/delete', 'token=' . $this->session->data['token'] . $url, true);

        $data['sizess'] = array();

        $filter_data = array(
            'sort'  => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );

        $sizes_total = $this->model_catalog_sizes->getTotalSizess();

        $results = $this->model_catalog_sizes->getSizess($filter_data);

        foreach ($results as $result) {
            $data['sizess'][] = array(
                'sizes_id' => $result['sizes_id'],
                'name'               => $result['name'],
                'sort_order'         => $result['sort_order'],
                'edit'               => $this->url->link('catalog/sizes/edit', 'token=' . $this->session->data['token'] . '&sizes_id=' . $result['sizes_id'] . $url, true)
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['column_name'] = $this->language->get('column_name');
        $data['column_sort_order'] = $this->language->get('column_sort_order');
        $data['column_action'] = $this->language->get('column_action');

        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array)$this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $url = '';

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_name'] = $this->url->link('catalog/sizes', 'token=' . $this->session->data['token'] . '&sort=agd.name' . $url, true);
        $data['sort_sort_order'] = $this->url->link('catalog/sizes', 'token=' . $this->session->data['token'] . '&sort=ag.sort_order' . $url, true);

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $sizes_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('catalog/sizes', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($sizes_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($sizes_total - $this->config->get('config_limit_admin'))) ? $sizes_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $sizes_total, ceil($sizes_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/sizes_list', $data));
    }

    protected function getForm() {

        //CKEditor
        if ($this->config->get('config_editor_default')) {
            $this->document->addScript('view/javascript/ckeditor/ckeditor.js');
            $this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');
        } else {
            $this->document->addScript('view/javascript/summernote/summernote.js');
            $this->document->addScript('view/javascript/summernote/lang/summernote-' . $this->language->get('lang') . '.js');
            $this->document->addScript('view/javascript/summernote/opencart.js');
            $this->document->addStyle('view/javascript/summernote/summernote.css');
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_form'] = !isset($this->request->get['sizes_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['name'])) {
            $data['error_name'] = $this->error['name'];
        } else {
            $data['error_name'] = array();
        }

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/sizes', 'token=' . $this->session->data['token'] . $url, true)
        );

        if (!isset($this->request->get['sizes_id'])) {
            $data['action'] = $this->url->link('catalog/sizes/add', 'token=' . $this->session->data['token'] . $url, true);
        } else {
            $data['action'] = $this->url->link('catalog/sizes/edit', 'token=' . $this->session->data['token'] . '&sizes_id=' . $this->request->get['sizes_id'] . $url, true);
        }

        $data['cancel'] = $this->url->link('catalog/sizes', 'token=' . $this->session->data['token'] . $url, true);

        if (isset($this->request->get['sizes_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $sizes_info = $this->model_catalog_sizes->getSizes($this->request->get['sizes_id']);
        }

        $this->load->model('localisation/language');

        $data['languages'] = $this->model_localisation_language->getLanguages();

        if (isset($this->request->post['sizes_description'])) {
            $data['sizes_description'] = $this->request->post['sizes_description'];
        } elseif (isset($this->request->get['sizes_id'])) {
            $data['sizes_description'] = $this->model_catalog_sizes->getSizesDescriptions($this->request->get['sizes_id']);
        } else {
            $data['sizes_description'] = array();
        }

        /*print_r($data['sizes_description']);
        die;*/

        if (isset($this->request->post['sort_order'])) {
            $data['sort_order'] = $this->request->post['sort_order'];
        } elseif (!empty($sizes_info)) {
            $data['sort_order'] = $sizes_info['sort_order'];
        } else {
            $data['sort_order'] = '';
        }


        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/sizes_form', $data));
    }

    protected function validateForm() {
        if (!$this->user->hasPermission('modify', 'catalog/sizes')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        foreach ($this->request->post['sizes_description'] as $language_id => $value) {
            if ((utf8_strlen($value['name']) < 3) || (utf8_strlen($value['name']) > 64)) {
                $this->error['name'][$language_id] = $this->language->get('error_name');
            }
        }

        return !$this->error;
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'catalog/sizes')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        $this->load->model('catalog/attribute');

        foreach ($this->request->post['selected'] as $sizes_id) {
            $attribute_total = $this->model_catalog_attribute->getTotalAttributesBySizesId($sizes_id);

            if ($attribute_total) {
                $this->error['warning'] = sprintf($this->language->get('error_attribute'), $attribute_total);
            }
        }

        return !$this->error;
    }
}
