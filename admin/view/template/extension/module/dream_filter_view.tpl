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
<h3><?= $language['text_template']; ?></h3>
<div class="row">
    <div class="col-sm-8">
        <div class="form-group">
            <label class="col-sm-3 control-label" for="view-template">
                <?= $language['entry_template']; ?>
            </label>
            <div class="col-sm-9">
                <select id="view-template" name="view[template]" class="form-control collapse-select">
                    <?php foreach($templates as $val => $name) { ?>
                        <option value="<?= $val ?>" <?= ($view['template'] == $val) ? 'selected' : '' ?>>
                            <?= $name ?>
                        </option>
                    <?php } ?>
                </select>
            </div>
        </div>
        <div id="view-template-vertical" class="collapse view-template-collapse val-vertical <?= $view['template'] == 'vertical' ? 'in' : '' ?>">
            <div class="form-group">
                <label class="col-sm-3 control-label" for="truncate-mode">
                    <?= $language['truncate_mode']; ?>
                </label>
                <div class="col-sm-9">
                    <select id="truncate-mode" name="view[truncate_mode]" class="form-control collapse-select">
                        <option value="none" <?= $view['truncate_mode'] == 'none' ? 'selected' : '' ?>><?= $language['truncate_mode_none']; ?></option>
                        <option value="height" <?= $view['truncate_mode'] == 'height' ? 'selected' : '' ?>><?= $language['truncate_mode_height']; ?></option>
                        <option value="element" <?= $view['truncate_mode'] == 'element' ? 'selected' : '' ?>><?= $language['truncate_mode_el']; ?></option>
                    </select>
                </div>
            </div>
            <div id="truncate-mode-height" class="collapse truncate-mode-collapse val-height <?= $view['truncate_mode'] == 'height' ? 'in' : '' ?>">
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="truncate-view">
                        <?= $language['truncate_view']; ?>
                    </label>
                    <div class="col-sm-9">
                        <select id="truncate-view" name="view[truncate_view]" class="form-control">
                            <option value="standart" <?= $view['truncate_view'] == 'standart' ? 'selected' : '' ?>><?= $language['truncate_view_standart']; ?></option>
                            <option value="scrollbar" <?= $view['truncate_view'] == 'scrollbar' ? 'selected' : '' ?>><?= $language['truncate_view_scrollbar']; ?></option>
                        </select>
                    </div>
                </div>
                <div class="form-group" style="border: none">
                    <label class="col-sm-3 control-label" for="truncate-height">
                        <?= $language['truncate_height']; ?>
                    </label>
                    <div class="col-sm-9">
                        <div class="input-group">
                            <input type="text" name="view[truncate_height]" placeholder="<?= $language['truncate_height']; ?>" value="<?= $view['truncate_height'] ?>" id="truncate-height" class="form-control">
                            <span class="input-group-addon">px</span>
                        </div>
                        <?php if (!empty($errors['truncate_height'])) { ?>
                            <div class="text-danger"><?= $errors['truncate_height']; ?></div>
                        <?php } ?>
                    </div>
                </div>
            </div>
            <div id="truncate-mode-element" class="collapse truncate-mode-collapse val-element <?= $view['truncate_mode'] == 'element' ? 'in' : '' ?>">
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="truncate-text-show">
                        <?= $language['truncate_text_show']; ?>
                    </label>
                    <div class="col-sm-9">
	                    <?php foreach ($languages as $lang) { ?>
                            <div class="input-group">
                                    <span class="input-group-addon">
                                        <img src="language/<?= $lang['code'] . '/' . $lang['code']; ?>.png" title="<?= $lang['name']; ?>"/>
                                    </span>
                                <input type="text"
                                       name="view[truncate_text_show][<?= $lang['language_id']; ?>]"
                                       value="<?= $view['truncate_text_show'][$lang['language_id']]; ?>"
                                       placeholder="<?= $language['truncate_text_show']; ?>"
                                       id="truncate-text-show<?= $lang['language_id']; ?>"
                                       class="form-control"/>
                            </div>
		                    <?php if (!empty($errors['truncate_text_show'][$lang['language_id']])) { ?>
                                <div class="text-danger"><?= $errors['truncate_text_show'][$lang['language_id']]; ?></div>
		                    <?php } ?>
	                    <?php } ?>
                    </div>
                </div>
                <div class="form-group" style="border: none">
                    <label class="col-sm-3 control-label" for="truncate-text-hide">
                        <?= $language['truncate_text_hide']; ?>
                    </label>
                    <div class="col-sm-9">
	                    <?php foreach ($languages as $lang) { ?>
                            <div class="input-group">
                                    <span class="input-group-addon">
                                        <img src="language/<?= $lang['code'] . '/' . $lang['code']; ?>.png" title="<?= $lang['name']; ?>"/>
                                    </span>
                                <input type="text"
                                       name="view[truncate_text_hide][<?= $lang['language_id']; ?>]"
                                       value="<?= $view['truncate_text_hide'][$lang['language_id']]; ?>"
                                       placeholder="<?= $language['truncate_text_hide']; ?>"
                                       id="truncate-text-hide<?= $lang['language_id']; ?>"
                                       class="form-control"/>
                            </div>
		                    <?php if (!empty($errors['truncate_text_hide'][$lang['language_id']])) { ?>
                                <div class="text-danger"><?= $errors['truncate_text_hide'][$lang['language_id']]; ?></div>
		                    <?php } ?>
	                    <?php } ?>
                    </div>
                </div>
                <div class="form-group" style="border: none">
                    <label class="col-sm-3 control-label" for="truncate-elements">
                        <?= $language['truncate_elements']; ?>
                    </label>
                    <div class="col-sm-9">
                        <input type="text" name="view[truncate_elements]" placeholder="<?= $language['truncate_elements']; ?>" value="<?= $view['truncate_elements'] ?>" id="truncate-elements" class="form-control">
                        <?php if (!empty($errors['truncate_elements'])) { ?>
                            <div class="text-danger"><?= $errors['truncate_elements']; ?></div>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
        <div id="view-template-horizontal" class="collapse view-template-collapse val-horizontal <?= $view['template'] == 'horizontal' ? 'in' : '' ?>">
            <div class="form-group">
                <label class="col-sm-3 control-label" for="truncate-hrz-mode">
                    <?= $language['truncate_mode']; ?>
                </label>
                <div class="col-sm-9">
                    <select id="truncate-hrz-mode" name="view[truncate_hrz_mode]" class="form-control img-select collapse-select">
                        <option value="none" <?= $view['truncate_hrz_mode'] == 'none' ? 'selected' : '' ?>><?= $language['truncate_mode_none']; ?></option>
                        <option value="width" <?= $view['truncate_hrz_mode'] == 'width' ? 'selected' : '' ?>><?= $language['truncate_mode_width']; ?></option>
                    </select>
                </div>
            </div>
            <div id="truncate-hrz-mode-width" class="collapse truncate-hrz-mode-collapse val-width <?= $view['truncate_hrz_mode'] == 'width' ? 'in' : '' ?>">
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="truncate-hrz-view">
                        <?= $language['truncate_view']; ?>
                    </label>
                    <div class="col-sm-9">
                        <select id="truncate-hrz-view" name="view[truncate_hrz_view]" class="form-control">
                            <option value="standart" <?= $view['truncate_hrz_view'] == 'standart' ? 'selected' : '' ?>><?= $language['truncate_view_standart']; ?></option>
                            <option value="scrollbar" <?= $view['truncate_hrz_view'] == 'scrollbar' ? 'selected' : '' ?>><?= $language['truncate_view_scrollbar']; ?></option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="view-bootstrap">
                <span data-toggle="tooltip" title="<?= $language['help_bootstrap']; ?>"><?= $language['entry_bootstrap']; ?></span>
            </label>
            <div class="col-sm-9">
                <select id="view-bootstrap" name="view[bootstrap]" class="form-control">
                    <option value="1" <?= $view['bootstrap'] ? 'selected' : '' ?>><?= $language['val_yes']; ?></option>
                    <option value="0" <?= $view['bootstrap'] ? '' : 'selected' ?>><?= $language['val_no']; ?></option>
                </select>
            </div>
        </div>
    </div>
    <div class="col-sm-4">
        <img id="template-image" class="img-responsive"/>
    </div>
</div>
<hr class="row"/>
<h3><?= $language['text_skin']; ?></h3>
<div class="row">
    <div class="col-sm-8">
        <div class="form-group">
            <label class="col-sm-3 control-label" for="view-skin">
                <?= $language['entry_skin']; ?>
            </label>
            <div class="col-sm-9">
                <select id="view-skin" name="view[skin]" class="form-control img-select">
                    <?php foreach($skins as $val => $name) { ?>
                        <option value="<?= $val ?>" <?= ($view['skin'] == $val) ? 'selected' : '' ?>>
                            <?= $name ?>
                        </option>
                    <?php } ?>
                </select>
            </div>
        </div>
        <div class="form-group" style="border: none">
            <label class="col-sm-3 control-label" for="view-cscheme">
                <?= $language['entry_color_scheme']; ?>
            </label>
            <div class="col-sm-9">
                <select id="view-cscheme" name="view[color]" class="form-control img-select">
                    <?php foreach($color_schemes as $val => $name) { ?>
                        <option value="<?= $val ?>" <?= ($view['color'] == $val) ? 'selected' : '' ?>>
                            <?= $name ?>
                        </option>
                    <?php } ?>
                </select>
            </div>
        </div>
    </div>
    <div class="col-sm-4">
        <img id="skin-image" class="img-responsive"/>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label" for="view-button">
        <?= $language['entry_button_theme']; ?>
    </label>
    <div class="col-sm-6">
        <select id="view-button" name="view[button]" class="form-control img-select">
            <?php foreach($buttons as $val => $name) { ?>
                <option value="<?= $val ?>" <?= ($view['button'] == $val) ? 'selected' : '' ?>>
                    <?= $name ?>
                </option>
            <?php } ?>
        </select>
    </div>
    <div class="col-sm-4">
        <img id="button-image" class="img-responsive"/>
    </div>
</div>
<div class="form-group" style="border: none">
    <label class="col-sm-2 control-label" for="view-loader">
        <?= $language['entry_loader']; ?>
    </label>
    <div class="col-sm-6">
        <select id="view-loader" name="view[loader]" class="form-control collapse-select">
            <?php foreach($loaders as $val => $loader) { ?>
                <option value="<?= $val ?>" <?= ($view['loader'] == $val) ? 'selected' : '' ?>>
                    <?= $loader['title'] ?>
                </option>
            <?php } ?>
        </select>
    </div>
    <div class="col-sm-4">
        <?php foreach($loaders as $val => $loader) { ?>
            <div id="view-loader-<?= $val ?>" class="collapse view-loader-collapse val-<?= $val . ($view['loader'] == $val ? ' in' : '') ?>">
                <div class="loader">
                    <div class="loader-inner <?= $val ?>">
                        <?php for($i = 0; $i < $loader['count']; $i++) { ?>
                            <div></div>
                        <?php } ?>
                    </div>
                </div>
            </div>
        <?php } ?>
    </div>
</div>
<hr class="row"/>
<h3><?= $language['text_slider']; ?></h3>
<div class="form-group">
    <label class="col-sm-2 control-label" for="view-grid">
        <?= $language['entry_grid']; ?>
    </label>
    <div class="col-sm-6">
        <select id="view-grid" name="view[grid]" class="form-control img-select">
            <option value="1" <?= $view['grid'] ? 'selected' : '' ?>><?= $language['entry_on']; ?></option>
            <option value="0" <?= $view['grid'] ? '' : 'selected' ?>><?= $language['entry_off']; ?></option>
        </select>
    </div>
    <div class="col-sm-4">
        <img id="slider-image" class="img-responsive" style="margin: -15px auto"/>
    </div>
</div>
<div class="form-group" style="border: none">
    <label class="col-sm-2 control-label" for="view-shadow">
        <?= $language['entry_shadow']; ?>
    </label>
    <div class="col-sm-6">
        <select id="view-shadow" name="view[shadow]" class="form-control img-select">
            <option value="1" <?= $view['shadow'] ? 'selected' : '' ?>><?= $language['val_yes']; ?></option>
            <option value="0" <?= $view['shadow'] ? '' : 'selected' ?>><?= $language['val_no']; ?></option>
        </select>
    </div>
    <div class="col-sm-4">
        <img id="shadow-image" class="img-responsive" style="margin: -15px auto"/>
    </div>
</div>
<hr class="row"/>
<h3><?= $language['text_filter']; ?></h3>
<div class="form-group">
    <label class="col-sm-2 control-label" for="view-picked">
        <?= $language['entry_picked']; ?>
    </label>
    <div class="col-sm-6">
        <select id="view-picked" name="view[show_picked]" class="form-control img-select">
            <option value="1" <?= $view['show_picked'] ? 'selected' : '' ?>><?= $language['entry_on']; ?></option>
            <option value="0" <?= $view['show_picked'] ? '' : 'selected' ?>><?= $language['entry_off']; ?></option>
        </select>
    </div>
    <div class="col-sm-4">
        <img id="picked-image" class="img-responsive"/>
    </div>
</div>
<div class="form-group" style="border: none">
    <label class="col-sm-2 control-label" for="view-count">
        <?= $language['entry_counter']; ?>
    </label>
    <div class="col-sm-6">
        <select id="view-count" name="view[show_count]" class="form-control img-select">
            <option value="1" <?= $view['show_count'] ? 'selected' : '' ?>><?= $language['entry_on']; ?></option>
            <option value="0" <?= $view['show_count'] ? '' : 'selected' ?>><?= $language['entry_off']; ?></option>
        </select>
    </div>
    <div class="col-sm-4">
        <img id="count-image" class="img-responsive"/>
    </div>
</div>
<div class="form-group" style="border: none">
    <label class="col-sm-2 control-label" for="view-null">
        <?= $language['entry_disable_null']; ?>
    </label>
    <div class="col-sm-6">
        <select id="view-null" name="view[disable_null]" class="form-control img-select">
            <option value="leave" <?= $view['disable_null'] == 'leave' ? 'selected' : '' ?>><?= $language['val_null_leave']; ?></option>
            <option value="disable" <?= $view['disable_null'] == 'disable' ? 'selected' : '' ?>><?= $language['val_null_disable']; ?></option>
            <option value="hide" <?= $view['disable_null'] == 'hide' ? 'selected' : '' ?>><?= $language['val_null_hide']; ?></option>
        </select>
    </div>
    <div class="col-sm-4">
        <img id="null-image" class="img-responsive"/>
    </div>
</div>
<hr class="row"/>
<h3><?= $language['text_mobile']; ?></h3>
<div class="form-group">
    <label class="col-sm-2 control-label" for="view-mobile-mode">
        <?= $language['entry_mobile']; ?>
    </label>
    <div class="col-sm-10">
        <select id="view-mobile-mode" name="view[mobile][mode]" class="form-control collapse-select">
            <option value="none" <?= $view['mobile']['mode'] == 'none' ? 'selected' : '' ?>><?= $language['mobile_mode_none']; ?></option>
            <option value="button" <?= $view['mobile']['mode'] == 'button' ? 'selected' : '' ?>><?= $language['mobile_mode_button']; ?></option>
            <option value="fixed" <?= $view['mobile']['mode'] == 'fixed' ? 'selected' : '' ?>><?= $language['mobile_mode_fixed']; ?></option>
        </select>
    </div>
</div>
<div id="view-mobile-screen" class="collapse view-mobile-mode-collapse val-button val-fixed <?= ($view['mobile']['mode'] == 'button' || $view['mobile']['mode'] == 'fixed') ? 'in' : '' ?>">
    <div class="form-group">
        <label class="col-sm-2 control-label" for="mobile-screen-width">
            <?= $language['mobile_screen_width']; ?>
        </label>
        <div class="col-sm-10">
            <div class="input-group">
                <input type="text" name="view[mobile][width]" value="<?= $view['mobile']['width']; ?>" id="mobile-screen-width" class="form-control"/>
                <span class="input-group-addon">px</span>
            </div>
            <?php if (!empty($errors['screen_width'])) { ?>
                <div class="text-danger"><?= $errors['screen_width']; ?></div>
            <?php } ?>
        </div>
    </div>
    <div class="form-group" style="border-top: none">
        <label class="col-sm-2 control-label" for="mobile-button-text">
            <?= $language['mobile_button_text']; ?>
        </label>
        <div class="col-sm-10">
	        <?php foreach ($languages as $lang) { ?>
                <div class="input-group">
                    <span class="input-group-addon">
                        <img src="language/<?= $lang['code'] . '/' . $lang['code']; ?>.png" title="<?= $lang['name']; ?>"/>
                    </span>
                    <textarea name="view[mobile][button_text][<?= $lang['language_id'] ?>]" id="mobile-button-text<?= $lang['language_id'] ?>" class="form-control" rows="2" style="resize:vertical"><?= $view['mobile']['button_text'][$lang['language_id']]; ?></textarea>
                </div>
	        <?php } ?>
        </div>
    </div>
</div>
<div id="view-mobile-fixed" class="collapse view-mobile-mode-collapse val-fixed <?= ($view['mobile']['mode'] == 'fixed') ? 'in' : '' ?>">
	<div class="form-group" style="border-top: none">
		<label class="col-sm-2 control-label" for="mobile-autoclose">
			<?= $language['mobile_autoclose']; ?>
		</label>
		<div class="col-sm-10">
			<select id="view-shadow" name="view[mobile][autoclose]" class="form-control">
				<option value="1" <?= $view['mobile']['autoclose'] ? 'selected' : '' ?>><?= $language['val_yes']; ?></option>
				<option value="0" <?= $view['mobile']['autoclose'] ? '' : 'selected' ?>><?= $language['val_no']; ?></option>
			</select>
		</div>
	</div>
	<div class="form-group" style="border-top: none">
        <label class="col-sm-2 control-label" for="mobile-backdrop">
            <?= $language['mobile_backdrop']; ?>
        </label>
        <div class="col-sm-10">
            <select id="mobile-backdrop" name="view[mobile][backdrop]" class="form-control">
                <option value="1" <?= $view['mobile']['backdrop'] ? 'selected' : '' ?>><?= $language['val_yes']; ?></option>
                <option value="0" <?= $view['mobile']['backdrop'] ? '' : 'selected' ?>><?= $language['val_no']; ?></option>
            </select>
        </div>
    </div>
	<div class="form-group" style="border-top: none">
        <label class="col-sm-2 control-label" for="mobile-side">
            <?= $language['mobile_side']; ?>
        </label>
        <div class="col-sm-10">
            <select id="mobile-side" name="view[mobile][side]" class="form-control">
                <option value="left" <?= $view['mobile']['side'] == 'left' ? 'selected' : '' ?>><?= $language['mobile_side_left']; ?></option>
                <option value="right" <?= $view['mobile']['side'] == 'right' ? 'selected' : '' ?>><?= $language['mobile_side_right']; ?></option>
            </select>
        </div>
    </div>
    <div class="form-group" style="border-top: none">
        <label class="col-sm-2 control-label" for="mobile-indenting-top">
            <?= $language['mobile_indenting_top']; ?>
        </label>
        <div class="col-sm-10">
            <div class="input-group">
                <input type="text" name="view[mobile][indenting_top]" value="<?= $view['mobile']['indenting_top']; ?>" id="mobile-indenting-top" class="form-control"/>
                <span class="input-group-addon">px</span>
            </div>
            <?php if (!empty($errors['indenting_top'])) { ?>
                <div class="text-danger"><?= $errors['indenting_top']; ?></div>
            <?php } ?>
        </div>
    </div>
    <div class="form-group" style="border-top: none">
        <label class="col-sm-2 control-label" for="mobile-indenting-bottom">
            <?= $language['mobile_indenting_bottom']; ?>
        </label>
        <div class="col-sm-10">
            <div class="input-group">
                <input type="text" name="view[mobile][indenting_bottom]" value="<?= $view['mobile']['indenting_bottom']; ?>" id="mobile-indenting-bottom" class="form-control"/>
                <span class="input-group-addon">px</span>
            </div>
            <?php if (!empty($errors['indenting_bottom'])) { ?>
                <div class="text-danger"><?= $errors['indenting_bottom']; ?></div>
            <?php } ?>
        </div>
    </div>
    <div class="form-group" style="border-top: none">
        <label class="col-sm-2 control-label" for="mobile-indenting-button">
            <?= $language['mobile_indenting_button']; ?>
        </label>
        <div class="col-sm-10">
            <div class="input-group">
                <input type="text" name="view[mobile][indenting_button]" value="<?= isset($view['mobile']['indenting_button']) ? $view['mobile']['indenting_button'] : 0; ?>" id="mobile-indenting-button" class="form-control"/>
                <span class="input-group-addon">px</span>
            </div>
            <?php if (!empty($errors['indenting_button'])) { ?>
                <div class="text-danger"><?= $errors['indenting_button']; ?></div>
            <?php } ?>
        </div>
    </div>
</div>
<hr class="row"/>
<h3><?= $language['text_images']; ?></h3>
<div class="form-group">
    <label class="col-sm-2 control-label" for="view-imagewidth">
        <?= $language['entry_width']; ?>
    </label>
    <div class="col-sm-4">
        <div class="input-group">
            <input type="text" name="view[image_width]" value="<?= $view['image_width']; ?>" id="view-imagewidth" class="form-control"/>
            <span class="input-group-addon">px</span>
        </div>
    </div>
    <label class="col-sm-2 control-label" for="view-imageheight">
        <?= $language['entry_height']; ?>
    </label>
    <div class="col-sm-4">
        <div class="input-group">
            <input type="text" name="view[image_height]" value="<?= $view['image_height']; ?>" id="view-imageheight" class="form-control"/>
            <span class="input-group-addon">px</span>
        </div>
    </div>
</div>