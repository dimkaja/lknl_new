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
 * @var $stores array
 * @var $breadcrumbs array
 * @var $header string
 * @var $column_left string
 * @var $footer string
 * @var $pluginpath string
 * @var $language array
 * @var $hpm_module bool
 */
?>
<div class="alert alert-info">
    <?= $language['attention_config'] ?>
</div>
<div class="row">
	<?php if(count($stores) > 1) { ?>
        <div class="col-md-3">
            <ul class="nav nav-pills nav-stacked" id="config-nav">
                <?php foreach ($stores as $store_id => $store) { ?>
                    <li<?= $store_id == 0 ? ' class="active"' : '' ?>>
                        <a href="#tab-store<?= $store_id ?>" data-toggle="tab" aria-expanded="true"><?= $store['name'] ?></a>
                    </li>
                <?php } ?>
            </ul>
        </div>
	<?php } ?>
    <div class="<?= count($stores) > 1 ? 'col-md-9' : 'col-md-12' ?>">
        <div class="tab-content">
	        <?php foreach ($stores as $store_id => $store) { ?>
                <?php $config = $store['config'] ?>
                <div class="tab-pane fade<?= $store_id == 0 ? ' in active' : '' ?>" id="tab-store<?= $store_id ?>">
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="config-product-mode<?= $store_id ?>">
			                <?= $language['entry_product_mode']; ?>
                        </label>
                        <div class="col-sm-9">
                            <select id="config-product-mode<?= $store_id ?>" name="config[<?= $store_id ?>][rdrf_product_mode]" class="form-control">
                                <option value="default" <?= $config['rdrf_product_mode'] == 'default' ? 'selected' : '' ?>><?= $language['val_default']; ?></option>
                                <option value="alternately" <?= $config['rdrf_product_mode'] == 'alternately' ? 'selected' : '' ?>><?= $language['val_alternately']; ?></option>
                            </select>
                            <br/>
                            <div class="alert alert-info"><?= $language['help_product_mode'] ?></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="config-subcategories<?= $store_id ?>">
			                <?= $language['entry_sub_categories']; ?>
                        </label>
                        <div class="col-sm-9">
                            <select id="config-subcategories<?= $store_id ?>" name="config[<?= $store_id ?>][rdrf_sub_categories]" class="form-control">
                                <option value="1" <?= $config['rdrf_sub_categories'] ? 'selected' : '' ?>><?= $language['val_yes']; ?></option>
                                <option value="0" <?= $config['rdrf_sub_categories'] ? '' : 'selected' ?>><?= $language['val_no']; ?></option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="config-notavailable<?= $store_id ?>">
			                <?= $language['entry_notavailable']; ?>
                        </label>
                        <div class="col-sm-9">
                            <select id="config-notavailable<?= $store_id ?>" name="config[<?= $store_id ?>][rdrf_notavailable]" class="form-control">
                                <option value="none" <?= $config['rdrf_notavailable'] == 'none' ? 'selected' : '' ?>><?= $language['val_default']; ?></option>
                                <option value="end" <?= $config['rdrf_notavailable'] == 'end' ? 'selected' : '' ?>><?= $language['val_at_end']; ?></option>
                                <option value="hide" <?= $config['rdrf_notavailable'] == 'hide' ? 'selected' : '' ?>><?= $language['val_hide']; ?></option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="config-option-qty<?= $store_id ?>">
                            <span data-toggle="tooltip" title="<?= $language['help_option_qty']; ?>"><?= $language['entry_option_qty']; ?></span>
                        </label>
                        <div class="col-sm-9">
                            <select id="config-option-qty<?= $store_id ?>" name="config[<?= $store_id ?>][rdrf_option_qty]" class="form-control">
                                <option value="1" <?= $config['rdrf_option_qty'] ? 'selected' : '' ?>><?= $language['val_yes']; ?></option>
                                <option value="0" <?= $config['rdrf_option_qty'] ? '' : 'selected' ?>><?= $language['val_no']; ?></option>
                            </select>
                        </div>
                    </div>
	                <?php if($hpm_module) { ?>
		                <div class="form-group">
			                <label class="col-sm-3 control-label" for="config-group-hpm-counters<?= $store_id ?>">
				                <?= $language['entry_hpm_counters']; ?>
			                </label>
			                <div class="col-sm-9">
				                <select id="config-group-hpm-counters<?= $store_id ?>" name="config[<?= $store_id ?>][rdrf_group_hpm_counters]" class="form-control">
					                <option value="1" <?= $config['rdrf_group_hpm_counters'] ? 'selected' : '' ?>><?= $language['val_yes']; ?></option>
					                <option value="0" <?= $config['rdrf_group_hpm_counters'] ? '' : 'selected' ?>><?= $language['val_no']; ?></option>
				                </select>
			                </div>
		                </div>
	                <?php } ?>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="config-ignore-space<?= $store_id ?>">
                            <span data-toggle="tooltip" title="<?= $language['help_space']; ?>"><?= $language['entry_ignore_space']; ?></span>
                        </label>
                        <div class="col-sm-9">
                            <select id="config-ignore-space<?= $store_id ?>" name="config[<?= $store_id ?>][rdrf_ignore_space]" class="form-control">
                                <option value="0" <?= $config['rdrf_ignore_space'] == 0 ? 'selected' : '' ?>><?= $language['val_no']; ?></option>
                                <option value="1" <?= $config['rdrf_ignore_space'] == 1 ? 'selected' : '' ?>><?= $language['val_yes']; ?></option>
                                <option value="full" <?= $config['rdrf_ignore_space'] == 'full' ? 'selected' : '' ?>><?= $language['val_ignore_space_full']; ?></option>
                            </select>
	                        <?php if (!empty($errors['ignore_space'][$store_id])) { ?>
                                <div class="text-danger"><?= $errors['ignore_space'][$store_id]; ?></div>
	                        <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="config-cache<?= $store_id ?>">
			                <?= $language['entry_cache_status']; ?>
                        </label>
                        <div class="col-sm-9">
                            <select id="config-cache<?= $store_id ?>" name="config[<?= $store_id ?>][rdrf_cachestatus]" class="form-control collapse-select">
                                <option value="1" <?= $config['rdrf_cachestatus'] ? 'selected' : '' ?>><?= $language['val_yes']; ?></option>
                                <option value="0" <?= $config['rdrf_cachestatus'] ? '' : 'selected' ?>><?= $language['val_no']; ?></option>
                            </select>
                        </div>
                    </div>
                    <div id="config-cache<?= $store_id ?>-1" class="collapse config-cache<?= $store_id ?>-collapse val-1 <?= $config['rdrf_cachestatus'] ? 'in' : '' ?>">
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="config-cachehours<?= $store_id ?>">
				                <?= $language['entry_cache_time'] ?>
                            </label>
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <input type="number" name="config[<?= $store_id ?>][rdrf_cachetime]" value="<?= $config['rdrf_cachetime']; ?>" id="config-cachehours<?= $store_id ?>" class="form-control"/>
                                    <span class="input-group-addon"><?= $language['text_hours'] ?></span>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <button type="button" onclick="cleanCache($(this), <?= $store_id ?>)" class="btn btn-primary btn-block"><?= $language['text_clean_cache'] ?></button>
                            </div>
                        </div>
	                    <?php if (!empty($errors['cache_time'][$store_id])) { ?>
                            <div class="text-danger"><?= $errors['cache_time'][$store_id]; ?></div>
	                    <?php } ?>
                    </div>
                    <hr class="row"/>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">
	                        <?= $language['text_license']; ?>
                        </label>
                        <div class="col-sm-9">
                            <div class="row">
                                <div class="col-sm-8">
                                    <div id="license-status<?= $store_id ?>">
	                                    <?php if(!empty($license['errors'][$store_id])) { ?>
                                            <div class="alert alert-danger">
                                                <i class="fa fa-exclamation-circle"></i>
                                                <?php foreach ($license['errors'][$store_id] as $error) { ?>
                                                    <?= $error ?><br/>
                                                <?php } ?>
                                            </div>
	                                    <?php } elseif(!empty($config['rdrf_license']['note'])) { ?>
                                            <div class="alert alert-success">
			                                    <?= $config['rdrf_license']['note'] ?>
                                            </div>
	                                    <?php } else { ?>
                                            <div class="alert alert-danger">
                                                <i class="fa fa-exclamation-circle"></i> <?= $language['text_no_license']; ?>
                                            </div>
	                                    <?php } ?>
                                    </div>
                                </div>
                                <div class="col-sm-4">
	                                <?php if($config['rdrf_license']) { ?>
                                        <button type="button" onclick="resetLicense($(this), <?= $store_id ?>)" class="btn btn-danger btn-block"><?= $language['text_reset_license'] ?></button>
	                                <?php } else { ?>
                                        <button type="button" onclick="getLicense($(this), '<?= $store_id ?>')" class="btn btn-success btn-block"><?= $language['button_license'] ?></button>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
	        <?php } ?>
        </div>
    </div>
</div>