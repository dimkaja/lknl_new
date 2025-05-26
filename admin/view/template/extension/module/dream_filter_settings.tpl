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
<h3><?= $language['text_module']; ?></h3>
<div class="form-group">
    <label class="col-sm-2 control-label" for="settings-mode">
        <?= $language['entry_mode']; ?>
    </label>
    <div class="col-sm-10">
        <select id="settings-mode" name="settings[mode]" class="form-control">
            <option value="ajax" <?= $settings['mode'] == 'ajax' ? 'selected' : '' ?>><?= $language['val_mode_ajax']; ?></option>
            <option value="reload" <?= $settings['mode'] == 'reload' ? 'selected' : '' ?>><?= $language['val_mode_reload']; ?></option>
        </select>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label" for="settings-searchmode">
        <?= $language['entry_searchmode']; ?>
    </label>
    <div class="col-sm-10">
        <select id="settings-searchmode" name="settings[search_mode]" class="form-control collapse-select">
            <option value="auto" <?= $settings['search_mode'] == 'auto' ? 'selected' : '' ?>><?= $language['val_automode']; ?></option>
            <option value="manual" <?= $settings['search_mode'] == 'manual' ? 'selected' : '' ?>><?= $language['val_manualmode']; ?></option>
        </select>
    </div>
</div>
<div id="settings-searchmode-manual" class="collapse settings-searchmode-collapse val-manual <?= $settings['search_mode'] == 'manual' ? 'in' : '' ?>">
    <div class="form-group">
        <label class="col-sm-2 control-label" for="settings-usepopper">
            <?= $language['entry_popper']; ?>
        </label>
        <div class="col-sm-10">
            <select id="settings-usepopper" name="settings[use_popper]" class="form-control">
                <option value="1" <?= $settings['use_popper'] ? 'selected' : '' ?>><?= $language['val_yes']; ?></option>
                <option value="0" <?= $settings['use_popper'] ? '' : 'selected' ?>><?= $language['val_no']; ?></option>
            </select>
        </div>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label" for="settings-minvalues">
        <?= $language['entry_min_values']; ?>
    </label>
    <div class="col-sm-10">
        <input id="settings-minvalues" type="number" min="1" step="1" name="settings[min_values]" value="<?= $settings['min_values'] ?>" class="form-control">
	    <?php if (!empty($errors['min_values'])) { ?>
            <div class="text-danger"><?= $errors['min_values']; ?></div>
	    <?php } ?>
    </div>
</div>
<hr class="row"/>
<h3><?= $language['text_categories']; ?></h3>
<div class="form-group">
    <label class="col-sm-2 control-label" for="settings-categories">
        <span data-toggle="tooltip" title="<?= $language['help_categories']; ?>"><?= $language['entry_categories']; ?></span>
    </label>
    <div class="col-sm-10">
        <input type="text" placeholder="<?= $language['entry_categories']; ?>" id="settings-categories" class="form-control" />
        <div id="categories" class="well well-sm" style="height: 150px; overflow: auto;">
            <?php foreach ($categories as $id => $category) { ?>
                <div id="category<?= $id; ?>"><i class="fa fa-minus-circle"></i> <?= $category; ?>
                    <input type="hidden" name="settings[categories][]" value="<?= $id; ?>"/>
                </div>
            <?php } ?>
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" name="settings[categories_child]" value="1" <?= $settings['categories_child'] ? 'checked' : '' ?>> <?= $language['entry_child'] ?>
            </label>
        </div>
    </div>
</div>
<div class="form-group" style="border: none">
    <label class="col-sm-2 control-label" for="settings-excategories">
        <span data-toggle="tooltip" title="<?= $language['help_categories']; ?>"><?= $language['entry_categories_ex']; ?></span>
    </label>
    <div class="col-sm-10">
        <input type="text" placeholder="<?= $language['entry_categories_ex']; ?>" id="settings-excategories" class="form-control" />
        <div id="excategories" class="well well-sm" style="height: 150px; overflow: auto;">
            <?php foreach ($excategories as $id => $category) { ?>
                <div id="excategory<?= $id; ?>"><i class="fa fa-minus-circle"></i> <?= $category; ?>
                    <input type="hidden" name="settings[excategories][]" value="<?= $id; ?>"/>
                </div>
            <?php } ?>
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" name="settings[excategories_child]" value="1" <?= $settings['excategories_child'] ? 'checked' : '' ?>> <?= $language['entry_child'] ?>
            </label>
        </div>
    </div>
</div>