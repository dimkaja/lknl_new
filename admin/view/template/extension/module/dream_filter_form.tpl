<?php
/**
 * Dream Filter v2.6
 * @link http://dreamfilter.ru/
 * @license Commercial
 * @copyright Copyright (c) 2016-2023 reDream
 * @author Ivan Grigorev <ig@redream.ru>
 */
/**
 * @var string $id
 * @var string $action
 * @var string $token
 * @var string $modal_title
 * @var array $language
 * @var array $languages
 * @var array $params
 * @var array $filter_types
 * @var array $filter
 */
?>
<div id="filter-modal-<?= $id ?>" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <form
            id="filter-form-<?= $id ?>"
            action="<?= $action; ?>"
            method="post"
            enctype="multipart/form-data"
            class="filter-form modal-content form-horizontal"
            data-id="<?= $id ?>"
        >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><?= $modal_title ?></h4>
            </div>
            <div class="modal-body">
                <input type="hidden" name="open" value="<?= isset($filter['open']) ? $filter['open'] : 1 ?>"/>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="filter_by_<?= $id ?>">
                        <?= $language['filter_by']; ?>
                    </label>
                    <div class="col-sm-9" data-validate="filter_by">
                        <select id="filter_by_<?= $id ?>" name="filter_by" class="form-control form-filter-by">
                            <option value="0"><?= $language['text_none']; ?></option>
                            <?php foreach ($params as $val => $by) { ?>
                                <option value="<?= $val ?>" <?= (isset($filter['filter_by']) && $filter['filter_by'] == $val) ? 'selected' : '' ?>><?= $by['label']; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div id="filter_collapse_<?= $id ?>" class="from-filter-collapse collapse<?= (isset($filter['filter_by']) && !empty($filter['filter_by'])) ? ' in' : '' ?>">
                    <?php if(isset($filter['filter_by']) && !empty($filter['filter_by'])) { ?>
                        <hr class="row">
	                    <?php if(isset($params[$filter['filter_by']]['autocomplete'])) { ?>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="filter_item_<?= $id ?>">
				                    <?= $params[$filter['filter_by']]['autocomplete']['label']; ?>
                                </label>
                                <div class="col-sm-9" data-validate="item_id">
                                    <input type="text" id="filter_item_<?= $id ?>" name="item_name" value="<?= isset($filter['item_name']) ? $filter['item_name'] : '' ?>" placeholder="<?= $params[$filter['filter_by']]['autocomplete']['label']; ?>" class="form-control"/>
                                    <input type="hidden" id="filter_item_<?= $id ?>_id" name="item_id" value="<?= $filter['item_id'] ?>"/>
                                </div>
                            </div>
	                    <?php } ?>
                        <?php if(isset($filter['name'])) { ?>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="filter_name_<?= $id ?>">
                                    <?= $language['entry_name']; ?>
                                </label>
                                <div class="col-sm-9" data-validate="name">
                                    <?php foreach ($languages as $lang) { ?>
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <img src="language/<?= $lang['code'] . '/' . $lang['code']; ?>.png" title="<?= $lang['name']; ?>"/>
                                            </span>
                                            <input type="text"
                                                   name="name[<?= $lang['language_id']; ?>]"
                                                   value="<?= $filter['name'][$lang['language_id']]; ?>"
                                                   placeholder="<?= $language['entry_name']; ?>"
                                                   id="filter_name_<?= $id . '_' . $lang['language_id']; ?>"
                                                   class="form-control"/>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                        <?php } ?>
                        <?php if(isset($params[$filter['filter_by']]['types'])) { ?>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="filter_type_<?= $id ?>">
                                    <?= $language['filter_type']; ?>
                                </label>
                                <div class="col-sm-9">
                                    <select id="filter_type_<?= $id ?>" name="type" class="form-control">
                                        <?php foreach($params[$filter['filter_by']]['types'] as $val => $name) { ?>
                                            <option value="<?= $val ?>" <?= $filter['type'] == $val ? 'selected' : '' ?>>
                                                <?= $name ?>
                                            </option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                        <?php } ?>
                        <?php if(isset($params[$filter['filter_by']]['sort_types'])) { ?>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="filter_sort_<?= $id ?>">
                                    <?= $language['entry_sorter']; ?>
                                </label>
                                <div class="col-sm-9">
                                    <select id="filter_sort_<?= $id ?>" name="sort_order" class="form-control">
                                        <?php foreach($params[$filter['filter_by']]['sort_types'] as $val => $name) { ?>
                                            <option value="<?= $val ?>" <?= $filter['sort_order'] == $val ? 'selected' : '' ?>>
                                                <?= $name ?>
                                            </option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                        <?php } ?>
                        <?php if(isset($params[$filter['filter_by']]['additional'])) { ?>
                            <?php foreach ($params[$filter['filter_by']]['additional'] as $additional) { ?>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="filter_<?= $additional['name'] . '_' . $id ?>">
                                        <?= $additional['label']; ?>
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="<?= $additional['type']; ?>"
											id="filter_<?= $additional['name'] . '_' . $id ?>"
											name="add[<?= $additional['name'] ?>]"
											value="<?= isset($filter['add'][$additional['name']]) ? $filter['add'][$additional['name']] : $additional['default'] ?>"
											placeholder="<?= $additional['label']; ?>"
											class="form-control"/>
                                    </div>
                                </div>
                            <?php } ?>
                        <?php } ?>
                    <?php } ?>
                </div>
            </div>
            <div class="modal-footer">
                <button id="filter-apply_<?= $id ?>" type="button" class="btn btn-success filter-apply"><?= $language['text_apply'] ?></button>
            </div>
        </form>
    </div>
</div>
<?php if(isset($filter['filter_by']) && !empty($filter['filter_by']) && isset($params[$filter['filter_by']]['autocomplete'])) { ?>
    <script>
        $('#filter_item_<?= $id ?>').autocomplete({
            'source': function(request, response) {
                $.ajax({
                    url: '<?= $params[$filter['filter_by']]['autocomplete']['url']; ?>&filter_name=' +  encodeURIComponent(request),
                    dataType: 'json',
                    success: function(json) {
                        response($.map(json, function(item) {
                            return {
                                <?php if(isset($params[$filter['filter_by']]['autocomplete']['category'])) { ?>
                                category: item.<?= $params[$filter['filter_by']]['autocomplete']['category'] ?>,
                                <?php } ?>
                                label: item.name,
                                value: item.id
                            }
                        }));
                    }
                });
            },
            'select': function(item) {
                $('#filter_item_<?= $id ?>').val(item['label']);
                $('#filter_item_<?= $id ?>_id').val(item['value']);
	            <?php foreach ($languages as $lang) { ?>
                    if($('#filter_name_<?= $id . '_' . $lang['language_id'] ?>').val() == '') {
                        $('#filter_name_<?= $id . '_' . $lang['language_id'] ?>').val(item['label']);
                    }
	            <?php } ?>
            }
        });
    </script>
<?php } ?>