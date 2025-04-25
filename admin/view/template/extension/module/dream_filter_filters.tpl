<?php
/**
 * Dream Filter v2.6
 * @link http://dreamfilter.ru/
 * @license Commercial
 * @copyright Copyright (c) 2016-2023 reDream
 * @author Ivan Grigorev <ig@redream.ru>
 */
/**
 * @var $errors array
 * @var $filters array
 * @var $params array
 * @var $language array
 * @var $languages array
 * @var $templates array
 * @var $skins array
 * @var $color_schemes array
 * @var $buttons array
 * @var $loaders array
 * @var $view array
 * @var $settings array
 * @var $categories array
 * @var $excategories array
 * @var $filter_forms array
 * @var $filter_form_new string
 * @var $breadcrumbs array
 * @var $header string
 * @var $column_left string
 * @var $footer string
 * @var $pluginpath string
 *
 * @var $action string
 * @var $apply string
 * @var $cancel string
 * @var $activate string
 * @var $generate string
 * @var $token string
 *
 * @var $name string
 * @var $title string
 * @var $status string
 */
?>

<div class="row">
    <div class="col-sm-6 col-sm-offset-3">
        <div id="filters-list" class="list-group">
            <?php foreach ($filters as $i => $filter) { ?>
                <div id="filter-<?= $i ?>" class="list-group-item" data-id="<?= $i ?>">
                    <?= current($filter['name']) ?>
                    <input type="hidden" name="filters[<?= $i ?>][filter_by]" value="<?= $filter['filter_by'] ?>"/>
                    <input type="hidden" name="filters[<?= $i ?>][type]" value="<?= $filter['type'] ?>"/>
	                <?php foreach ($languages as $lang) { ?>
                        <input type="hidden" name="filters[<?= $i ?>][name][<?= $lang['language_id'] ?>]" value="<?= $filter['name'][$lang['language_id']] ?>"/>
	                <?php } ?>
                    <input type="hidden" name="filters[<?= $i ?>][open]" value="<?= $filter['open'] ?>"/>
                    <?php if(isset($filter['item_id'])) { ?>
                        <input type="hidden" name="filters[<?= $i ?>][item_id]" value="<?= $filter['item_id'] ?>"/>
                    <?php } ?>
                    <?php if(isset($filter['item_name'])) { ?>
                        <input type="hidden" name="filters[<?= $i ?>][item_name]" value="<?= $filter['item_name'] ?>"/>
                    <?php } ?>
                    <?php if(isset($filter['sort_order'])) { ?>
                        <input type="hidden" name="filters[<?= $i ?>][sort_order]" value="<?= $filter['sort_order'] ?>"/>
                    <?php } ?>
                    <?php if(isset($filter['add'])) { ?>
                        <?php foreach ($filter['add'] as $key => $val) { ?>
                            <input type="hidden" name="filters[<?= $i ?>][add][<?= $key ?>]" value="<?= $val ?>"/>
                        <?php } ?>
                    <?php } ?>
                    <div class="btn-group pull-right">
                        <button title="<?= $language['filter_edit'] ?>" type="button" class="btn btn-xs btn-success" data-toggle="modal" data-target="#filter-modal-<?= $i ?>">
                            <i class="fa fa-pencil"></i>
                        </button>
                        <button title="<?= $filter['open'] ? $language['filter_open'] : $language['filter_close'] ?>" type="button" class="btn btn-xs btn-info open-toggle" data-open="<?= $filter['open'] ?>">
                            <i class="<?= $filter['open'] ? 'fa fa-bars' : 'fa fa-minus' ?>"></i>
                        </button>
                        <button title="<?= $language['filter_delete'] ?>" type="button" class="btn btn-xs btn-danger delete-filter">
                            <i class="fa fa-close"></i>
                        </button>
                    </div>
                </div>
            <?php } ?>
        </div>
        <div class="list-group">
            <input id="settings-resetbtn" type="hidden" name="settings[reset_btn]" value="<?= $settings['reset_btn']; ?>">
            <div class="btn btn-block btn-default">
                <?php $i = 0; ?>
	            <?php foreach ($languages as $lang) { ?>
                    <div class="popover-parent clearfix">
                        <img src="language/<?= $lang['code'] . '/' . $lang['code']; ?>.png" title="<?= $lang['name']; ?>"/>
                        <span class="popover-value"><?= $settings['reset_btn_text'][$lang['language_id']]; ?></span>
                        <input class="popover-input" type="hidden" name="settings[reset_btn_text][<?= $lang['language_id'] ?>]" value="<?= $settings['reset_btn_text'][$lang['language_id']]; ?>">
                        <div class="btn-group pull-right">
                            <?php if($i == 0) { ?>
                                <button id="reset-toggle" title="<?= $settings['reset_btn'] ? $language['text_show'] : $language['text_hide'] ?>" type="button" class="btn btn-xs btn-info">
                                    <i class="<?= $settings['reset_btn'] ? 'fa fa-eye' : 'fa fa-eye-slash' ?>"></i>
                                </button>
                            <?php } ?>
                            <button title="<?= $language['filter_edit'] ?>" type="button" class="btn btn-xs btn-success popover-edit" data-toggle="popover">
                                <i class="fa fa-pencil"></i>
                            </button>
                        </div>
                    </div>
		            <?php $i++; ?>
                <?php } ?>
            </div>
            <div class="btn btn-block btn-default">
                <?php foreach ($languages as $lang) { ?>
                    <div class="popover-parent clearfix">
                        <img src="language/<?= $lang['code'] . '/' . $lang['code']; ?>.png" title="<?= $lang['name']; ?>"/>
                        <span class="popover-value"><?= $settings['search_btn_text'][$lang['language_id']]; ?></span>
                        <input id="search-btn-text<?= $lang['language_id']; ?>" class="popover-input" type="hidden" name="settings[search_btn_text][<?= $lang['language_id'] ?>]" value="<?= $settings['search_btn_text'][$lang['language_id']]; ?>">
                        <div class="btn-group pull-right">
                            <button title="<?= $language['filter_edit'] ?>" type="button" class="btn btn-xs btn-success popover-edit" data-toggle="popover">
                                <i class="fa fa-pencil"></i>
                            </button>
                        </div>
                    </div>
	            <?php } ?>
            </div>
        </div>
        <button type="button" class="btn btn-block btn-primary" data-toggle="modal" data-target="#filter-modal-new">
            <i class="fa fa-plus"></i> <?= $language['text_add_filter'] ?>
        </button>
    </div>
</div>