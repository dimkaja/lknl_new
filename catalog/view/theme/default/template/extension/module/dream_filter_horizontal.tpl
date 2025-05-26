<?php
/**
 * Dream Filter v2.6
 * @link http://dreamfilter.ru/
 * @license Commercial
 * @copyright Copyright (c) 2016-2023 reDream
 * @author Ivan Grigorev <ig@redream.ru>
 *
 * @var array $view
 * @var array $settings
 * @var array $language
 * @var array $filters
 * @var array $filters_json
 * @var array $picked
 * @var array $popper
 * @var array $hidden
 * @var array $callback
 * @var string $title
 * @var string $route
 * @var string $path
 * @var string $sort
 * @var string $order
 * @var string $limit
 * @var string $js
 * @var string $loader
 */
?>
<section class="dream-filter filter-horizontal rdf-side-<?= $view['mobile']['side'] ?>" id="<?= $settings['widget_id'] ?>">
    <?php if($view['mobile']['mode'] !== 'none') { ?>
        <button id="<?= $view['mobile']['button_id'] ?>" type="button" class="btn btn-block rdf-mobile-toggle <?= $view['btn-primary'] ?>">
            <?= html_entity_decode($mobile_button_text) ?>
        </button>
    <?php } ?>
    <form id="<?= $settings['form_id'] ?>" class="rdf-form form-horizontal" action="<?= $settings['form_action'] ?>" method="get" enctype="multipart/form-data">
        <?php foreach ($hidden as $name => $value) { ?>
            <input type="hidden" name="<?= $name ?>" value="<?= $value ?>">
        <?php } ?>
        <?php if($title) : ?>
            <div class="rdf-header">
                <h3><?= $title ?></h3>
            </div>
        <?php endif; ?>
        <div class="rdf-body">
            <?php if($filters) { ?>
                <div class="rdf-filters">
                    <div class="rdf-picked">
                        <?php foreach ($picked as $pick) { ?>
                            <button type="button" data-clear="<?= $pick['id'] ?>" class="btn btn-default btn-xs">
                                <?= ($pick['name'] ? $pick['name'] . ': ' : '') . $pick['value'] ?><i>&times;</i>
                            </button>
                        <?php } ?>
                    </div>
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <?php foreach($filters as $filter) { ?>
                                    <div id="<?= $filter['id'] ?>" class="form-group" <?= $filter['hide'] ? 'style="display:none"' : '' ?>>
                                        <label class="col-sm-2 rdf-control-label"><?= $filter['title'] ?></label>
                                        <div class="col-sm-10 rdf-filter-container">
                                            <div class="rdf-group <?= $filter['truncate'] ?>">
                                                <?php switch($filter['type']) {
                                                    case 'field': ?>
                                                        <div class="input-group">
                                                            <input type="text"
                                                                   name="<?= $filter['name'] ?>"
                                                                   id="<?= $filter['input_id'] ?>"
                                                                   value="<?= $filter['value'] ?>"
                                                                   class="form-control"
                                                                   placeholder="<?= $filter['title'] ?>"
                                                                   data-id="<?= $filter['id'] ?>"
                                                            />
                                                            <?= $filter['value'] ? '<span class="rdf-clear input-group-addon" data-clear="' . $filter['id'] . '">&times;</span>' : '' ?>
                                                        </div>
                                                    <?php break; ?>
                                                    <?php case 'slider': ?>
                                                        <div class="irs-notinit slidewrapper">
                                                            <input type="hidden" id="<?= $filter['input_id'] ?>" value="<?= $filter['value'] ?>" name="<?= $filter['name'] ?>" data-id="<?= $filter['id'] ?>"/>
                                                        </div>
                                                    <?php break; ?>
                                                    <?php case 'slider_entry': ?>
                                                        <div class="input-group range-group">
                                                            <?= $filter['prefix'] ? '<span class="input-group-addon">' . $filter['prefix'] . '</span>' : ''; ?>
                                                            <input id="<?= $filter['input_id'] ?>-min" min="<?= isset($filter['values']['range_min']) ? $filter['values']['range_min'] : $filter['values']['min']; ?>" placeholder="<?= isset($filter['values']['range_min']) ? $filter['values']['range_min'] : $filter['values']['min']; ?>" value="<?= isset($filter['values']['from']) ? $filter['values']['from'] : ''; ?>" type="text" class="form-control">
                                                            <span class="input-group-addon">-</span>
                                                            <input id="<?= $filter['input_id'] ?>-max" max="<?= isset($filter['values']['range_max']) ? $filter['values']['range_max'] : $filter['values']['max']; ?>" placeholder="<?= isset($filter['values']['range_max']) ? $filter['values']['range_max'] : $filter['values']['max']; ?>" value="<?= isset($filter['values']['to']) ? $filter['values']['to'] : ''; ?>" type="text" class="form-control">
                                                            <?= $filter['postfix'] ? '<span class="input-group-addon">' . $filter['postfix'] . '</span>' : ''; ?>
                                                        </div>
                                                        <div class="irs-notinit slidewrapper">
                                                            <input type="hidden" id="<?= $filter['input_id'] ?>" value="<?= $filter['value'] ?>" name="<?= $filter['name'] ?>" data-id="<?= $filter['id'] ?>"/>
                                                        </div>
                                                    <?php break; ?>
                                                    <?php case 'select': ?>
                                                        <?php $checked = false; ?>
                                                        <div class="input-group">
                                                            <select name="<?= $filter['name'] ?>" id="<?= $filter['input_id'] ?>" data-id="<?= $filter['id'] ?>" class="form-control">
                                                                <option value=""><?= $language['text_none'] ?></option>
                                                                <?php foreach($filter['values'] as $k => $value) { ?>
                                                                    <option id="<?= $value['id'] ?>" value="<?= $value['val'] ?>" <?= $value['attributes'] ?> <?= $value['hide'] ? 'style="display:none"' : '' ?>>
                                                                        <?= $value['name'] ?>&nbsp;
                                                                        <?= $value['count'] ? '('.$value['count'].')' : '' ?>
                                                                    </option>
                                                                    <?php if($value['checked']) {$checked = true;} ?>
                                                                <?php } ?>
                                                            </select>
                                                            <?= $checked ? '<span class="rdf-clear input-group-addon" data-clear="' . $filter['id'] . '">&times;</span>' : '' ?>
                                                        </div>
                                                    <?php break; ?>
                                                    <?php case 'type_single': ?>
                                                        <?php $value = reset($filter['values']); ?>
                                                        <div id="<?= $value['id'] ?>" class="checkbox rdf-val" <?= $value['hide'] ? 'style="display:none"' : '' ?>>
                                                            <label>
                                                                <input type="checkbox" name="<?= $filter['name'] ?>" value="<?= $value['val'] ?>" <?= $value['attributes'] ?>>
                                                                <span><?= $value['name'] ?></span>
                                                            </label>
                                                            <?= $value['checked'] ? '<span class="rdf-clear" data-clear="' . $value['id'] . '">&times;</span>' : '' ?>
                                                            <span class="rdf-label"><?= $value['count'] ?></span>
                                                        </div>
                                                    <?php break; ?>
                                                    <?php case 'checkbox': ?>
                                                        <?php foreach($filter['values'] as $k => $value) { ?>
                                                            <div id="<?= $value['id'] ?>" class="checkbox rdf-val" <?= $value['hide'] ? 'style="display:none"' : '' ?>>
                                                                <label>
                                                                    <input type="checkbox" name="<?= $filter['name'] ?>[]" value="<?= $value['val'] ?>" <?= $value['attributes'] ?>>
                                                                    <span><?= $value['name'] ?></span>
                                                                </label>
                                                                <?= $value['checked'] ? '<span class="rdf-clear" data-clear="' . $value['id'] . '">&times;</span>' : '' ?>
                                                                <span class="rdf-label"><?= $value['count'] ?></span>
                                                            </div>
                                                        <?php } ?>
                                                    <?php break; ?>
                                                    <?php case 'radio': ?>
                                                        <?php foreach($filter['values'] as $k => $value) { ?>
                                                            <div id="<?= $value['id'] ?>" class="radio rdf-val" <?= $value['hide'] ? 'style="display:none"' : '' ?>>
                                                                <label>
                                                                    <input name="<?= $filter['name'] ?>" type="radio" value="<?= $value['val'] ?>" <?= $value['attributes'] ?>>
                                                                    <span><?= $value['name'] ?></span>
                                                                </label>
                                                                <?= $value['checked'] ? '<span class="rdf-clear" data-clear="' . $value['id'] . '">&times;</span>' : '' ?>
                                                                <span class="rdf-label"><?= $value['count'] ?></span>
                                                            </div>
                                                        <?php } ?>
                                                        <?php break; ?>
                                                    <?php case 'image': ?>
                                                        <?php foreach($filter['values'] as $k => $value) { ?>
                                                            <div id="<?= $value['id'] ?>" class="image-filter rdf-val" <?= $value['hide'] ? 'style="display:none"' : '' ?>>
                                                                <label>
                                                                    <input type="radio" name="<?= $filter['name'] ?>" value="<?= $value['val'] ?>" <?= $value['attributes'] ?>>
                                                                    <img class="img-responsive" src="<?= $value['image']; ?>" alt="<?= $value['name']; ?>"/>
                                                                    <span><?= $value['name'] ?></span>
                                                                </label>
                                                                <?= $value['checked'] ? '<span class="rdf-clear" data-clear="' . $value['id'] . '">&times;</span>' : '' ?>
                                                                <span class="rdf-label"><?= $value['count'] ?></span>
                                                            </div>
                                                        <?php } ?>
                                                        <?php break; ?>
                                                    <?php case 'multiimage': ?>
                                                        <?php foreach($filter['values'] as $k => $value) { ?>
                                                            <div id="<?= $value['id'] ?>" class="image-filter rdf-val" <?= $value['hide'] ? 'style="display:none"' : '' ?>>
                                                                <label>
                                                                    <input type="checkbox" name="<?= $filter['name'] ?>[]" value="<?= $value['val'] ?>" <?= $value['attributes'] ?>>
                                                                    <img class="img-responsive" src="<?= $value['image']; ?>" alt="<?= $value['name']; ?>"/>
                                                                    <span><?= $value['name'] ?></span>
                                                                </label>
                                                                <?= $value['checked'] ? '<span class="rdf-clear" data-clear="' . $value['id'] . '">&times;</span>' : '' ?>
                                                                <span class="rdf-label"><?= $value['count'] ?></span>
                                                            </div>
                                                        <?php } ?>
                                                    <?php break; ?>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                </div>
            <?php } ?>
        </div>
        <?php if($settings['reset_btn'] || $settings['search_mode'] == 'manual') { ?>
            <div class="rdf-footer">
                <?php if($settings['reset_btn']) { ?>
                    <button id="<?= $settings['reset_id'] ?>" type="reset" class="btn <?= $view['btn-reset'] ?>" data-loading-text="<?= $language['text_loading'] ?>" data-reset-text="<?= $reset_btn_text ?>"><?= $reset_btn_text ?></button>
                <?php } ?>
                <?php if($settings['search_mode'] == 'manual') { ?>
                    <button type="submit" class="btn <?= $view['btn-primary'] ?>" data-loading-text="<?= $language['text_loading'] ?>" data-reset-text="<?= $search_btn_text ?>"><?= $search_btn_text ?></button>
                <?php } ?>
            </div>
        <?php } ?>
    </form>
    <?php if($popper['enable']) { ?>
        <div class="popper" id="<?= $popper['id'] ?>">
            <span></span>
            <button id="<?= $popper['button_id'] ?>" class="btn btn-block <?= $view['btn-primary'] ?>" data-loading-text="<?= $language['text_loading'] ?>" data-reset-text="<?= $popper['button'] ?>">
                <?= $popper['button'] ?>
            </button>
            <div class="popper-arrow"></div>
        </div>
    <?php } ?>
</section>
<script type="text/javascript">
    $(document).ready(function () {
        $("#<?= $settings['form_id'] ?>").dreamFilter({
	        module: <?= $settings['module_id'] ?>,
	        widget_id: "<?= $settings['widget_id'] ?>",
	        search_mode: "<?= $settings['search_mode']  ?>",
	        disable_null: "<?= $view['disable_null'] ?>",
	        show_count: <?= $view['show_count'] ? 'true' : 'false' ?>,
	        show_picked: <?= $view['show_picked'] ? 'true' : 'false' ?>,
	        loader: "<?= $loader ?>",
	        truncate: <?= json_encode($view['truncate']) ?>,
	        mobile: <?= json_encode($view['mobile']) ?>,
	        ajax: <?= json_encode($settings['ajax']) ?>,
            popper: <?= json_encode($popper) ?>,
            filters: <?= json_encode($filters_json) ?>,
        <?php if($callback['before']) { ?>
            callbackBefore: <?= $callback['before'] ?>,
        <?php } ?>
        <?php if($callback['after']) { ?>
            callbackAfter: <?= $callback['after'] ?>,
        <?php } ?>
        });
        <?= $js ?>
    });
</script>
<style>
    <?php if($view['mobile']['mode'] !== 'none') { ?>
        @media (max-width: <?= $view['mobile']['width'] ?>px) {
            #<?= $settings['form_id'] ?> .rdf-body {
                display: none;
            }
        }
        @media (max-width: <?= $view['mobile']['width'] - 1 ?>px) {
            #<?= $settings['widget_id'] ?> .rdf-mobile-toggle {
                display: block;
            }
        }
    <?php } ?>
</style>