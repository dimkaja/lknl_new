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
<div class="alert alert-info">
    <strong><?= $language['text_attention'] ?>!</strong> <?= $language['attention_ajax'] ?>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label" for="settings-selector">
        <?= $language['entry_selector']; ?>
    </label>
    <div class="col-sm-10">
        <input type="text" name="settings[selector]" value="<?= $settings['selector']; ?>" id="settings-selector" class="form-control"/>
        <?php if (!empty($errors['selector'])) { ?>
            <div class="text-danger"><?= $errors['selector']; ?></div>
        <?php } ?>
    </div>
</div>
<div class="form-group" style="border: none">
    <label class="col-sm-2 control-label" for="ajax-pushstate">
        <span data-toggle="tooltip" title="" data-original-title="<?= $language['help_pushstate']; ?>">
            <?= $language['entry_pushstate']; ?>
        </span>
    </label>
    <div class="col-sm-10">
        <select id="ajax-pushstate" name="settings[pushstate]" class="form-control">
            <option value="1" <?= $settings['pushstate'] ? 'selected' : '' ?>><?= $language['entry_use']; ?></option>
            <option value="0" <?= $settings['pushstate'] ? '' : 'selected' ?>><?= $language['entry_not_use']; ?></option>
        </select>
    </div>
</div>
<div class="form-group" style="border: none">
    <label class="col-sm-2 control-label" for="ajax-pagination">
        <span data-toggle="tooltip" title="" data-original-title="<?= $language['help_ajax_pagination']; ?>">
            <?= $language['entry_ajax_pagination']; ?>
        </span>
    </label>
    <div class="col-sm-10">
        <select id="ajax-pagination" name="settings[ajax_pagination]" class="form-control collapse-select">
            <option value="1" <?= $settings['ajax_pagination'] ? 'selected' : '' ?>><?= $language['entry_use']; ?></option>
            <option value="0" <?= $settings['ajax_pagination'] ? '' : 'selected' ?>><?= $language['entry_not_use']; ?></option>
        </select>
    </div>
</div>
<div id="ajax-pagination-1" class="collapse ajax-pagination-collapse val-1 <?= $settings['ajax_pagination'] ? 'in' : '' ?>">
    <div class="form-group">
        <label class="col-sm-2 control-label" for="pagination_selector">
            <?= $language['entry_pageselector']; ?>
        </label>
        <div class="col-sm-10">
            <input type="text" name="settings[pagination_selector]" value="<?= $settings['pagination_selector']; ?>" id="pagination_selector" class="form-control"/>
            <?php if (!empty($errors['pagination_selector'])) { ?>
                <div class="text-danger"><?= $errors['pagination_selector']; ?></div>
            <?php } ?>
        </div>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label" for="ajax-sorter">
        <span data-toggle="tooltip" title="" data-original-title="<?= $language['help_ajax_sorter']; ?>">
            <?= $language['entry_ajax_sorter']; ?>
        </span>
    </label>
    <div class="col-sm-10">
        <select id="ajax-sorter" name="settings[ajax_sorter]" class="form-control collapse-select">
            <option value="1" <?= $settings['ajax_sorter'] ? 'selected' : '' ?>><?= $language['entry_use']; ?></option>
            <option value="0" <?= $settings['ajax_sorter'] ? '' : 'selected' ?>><?= $language['entry_not_use']; ?></option>
        </select>
    </div>
</div>
<div id="ajax-sorter-1" class="collapse ajax-sorter-collapse val-1 <?= $settings['ajax_sorter'] ? 'in' : '' ?>">
    <div class="form-group">
        <label class="col-sm-2 control-label" for="sorter-selector">
            <?= $language['entry_sorterselector']; ?>
        </label>
        <div class="col-sm-10">
            <input type="text" name="settings[sorter_selector]" value="<?= $settings['sorter_selector']; ?>" id="sorter-selector" class="form-control"/>
            <?php if (!empty($errors['sorter_selector'])) { ?>
                <div class="text-danger"><?= $errors['sorter_selector']; ?></div>
            <?php } ?>
        </div>
    </div>
    <div class="form-group" style="border: none">
        <label class="col-sm-2 control-label" for="sorter-type">
            <?= $language['entry_sorter_type']; ?>
        </label>
        <div class="col-sm-10">
            <select id="sorter-type" name="settings[sorter_type]" class="form-control">
                <option value="select" <?= $settings['sorter_type'] == 'select' ? 'selected' : '' ?>><?= $language['val_select']; ?></option>
                <option value="button" <?= $settings['sorter_type'] == 'button' ? 'selected' : '' ?>><?= $language['val_button']; ?></option>
            </select>
        </div>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label" for="ajax-limit">
        <span data-toggle="tooltip" title="" data-original-title="<?= $language['help_ajax_limit']; ?>">
            <?= $language['entry_ajax_limit']; ?>
        </span>
    </label>
    <div class="col-sm-10">
        <select id="ajax-limit" name="settings[ajax_limit]" class="form-control collapse-select">
            <option value="1" <?= $settings['ajax_limit'] ? 'selected' : '' ?>><?= $language['entry_use']; ?></option>
            <option value="0" <?= $settings['ajax_limit'] ? '' : 'selected' ?>><?= $language['entry_not_use']; ?></option>
        </select>
    </div>
</div>
<div id="ajax-limit-1" class="collapse ajax-limit-collapse val-1 <?= $settings['ajax_limit'] ? 'in' : '' ?>">
    <div class="form-group">
        <label class="col-sm-2 control-label" for="limit-selector">
            <?= $language['entry_limitselector']; ?>
        </label>
        <div class="col-sm-10">
            <input type="text" name="settings[limit_selector]" value="<?= $settings['limit_selector']; ?>" id="limit-selector" class="form-control"/>
            <?php if (!empty($errors['limit_selector'])) { ?>
                <div class="text-danger"><?= $errors['limit_selector']; ?></div>
            <?php } ?>
        </div>
    </div>
    <div class="form-group" style="border: none">
        <label class="col-sm-2 control-label" for="limit-type">
            <?= $language['entry_limit_type']; ?>
        </label>
        <div class="col-sm-10">
            <select id="limit-type" name="settings[limit_type]" class="form-control">
                <option value="select" <?= $settings['limit_type'] == 'select' ? 'selected' : '' ?>><?= $language['val_select']; ?></option>
                <option value="button" <?= $settings['limit_type'] == 'button' ? 'selected' : '' ?>><?= $language['val_button']; ?></option>
            </select>
        </div>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label" for="ajax-scroll">
        <?= $language['entry_ajax_scroll']; ?>
    </label>
    <div class="col-sm-10">
        <select id="ajax-scroll" name="settings[ajax_scroll]" class="form-control collapse-select">
            <option value="1" <?= $settings['ajax_scroll'] ? 'selected' : '' ?>><?= $language['val_yes']; ?></option>
            <option value="0" <?= $settings['ajax_scroll'] ? '' : 'selected' ?>><?= $language['val_no']; ?></option>
        </select>
    </div>
</div>
<div id="ajax-scroll-1" class="collapse ajax-scroll-collapse val-1 <?= $settings['ajax_scroll'] ? 'in' : '' ?>">
    <div class="form-group">
        <label class="col-sm-2 control-label" for="scroll-offset">
            <?= $language['entry_offset_top']; ?>
        </label>
        <div class="col-sm-10">
            <div class="input-group">
                <input type="text" name="settings[scroll_offset]" value="<?= $settings['scroll_offset']; ?>" id="scroll-offset" class="form-control"/>
                <span class="input-group-addon">px</span>
                <?php if (!empty($errors['scroll_offset'])) { ?>
                    <div class="text-danger"><?= $errors['scroll_offset']; ?></div>
                <?php } ?>
            </div>
        </div>
    </div>
</div>
<hr class="row"/>
<h3><?= $language['text_callback']; ?></h3>
<div class="form-group">
    <label class="col-sm-2 control-label">
        <input type="checkbox" name="settings[callback_before_enable]" value="1" <?= $settings['callback_before_enable'] ? 'checked="checked"' : '' ?>/>
        <?= $language['entry_callback_before']; ?>
    </label>
    <div class="col-sm-10">
        <textarea name="settings[callback_before]" id="callback-before"><?= $settings['callback_before'] ?></textarea>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">
        <input type="checkbox" name="settings[callback_after_enable]" value="1" <?= $settings['callback_after_enable'] ? 'checked="checked"' : '' ?>/>
        <?= $language['entry_callback_after']; ?>
    </label>
    <div class="col-sm-10">
        <textarea name="settings[callback_after]" id="callback-after"><?= $settings['callback_after'] ?></textarea>
    </div>
</div>