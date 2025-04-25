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
 * @var $filters_tab string
 * @var $view_tab string
 * @var $settings_tab string
 * @var $ajax_tab string
 * @var $config_tab string
 * @var $info_tab string
 *
 * @var $action string
 * @var $reset_btn string
 * @var $cache_btn string
 * @var $home string
 * @var $apply string
 * @var $cancel string
 * @var $activate string
 * @var $generate string
 * @var $token string
 *
 * @var $name string
 * @var $title string
 * @var $status string
 * @var $note string
 */
?>
<?= $header; ?>
<?= $column_left; ?>
<div id="content" xmlns="http://www.w3.org/1999/html">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <?php if($apply) { ?>
                    <button id="apply-button" type="button" data-url="<?= html_entity_decode($apply) ?>" data-form="form-rdrf" data-toggle="tooltip" data-loading-text="<i class='fa fa-refresh fa-spin'></i>" title="<?= $language['button_apply']; ?>" class="btn btn-success">
                        <i class="fa fa-check"></i>
                    </button>
                <?php } ?>
                <button type="button" onclick="$('#form-rdrf').submit()" data-toggle="tooltip" title="<?= $language['button_save']; ?>" class="btn btn-primary">
                    <i class="fa fa-save"></i>
                </button>
                <a href="<?= $cancel; ?>" data-toggle="tooltip" title="<?= $language['button_cancel']; ?>" class="btn btn-default">
                    <i class="fa fa-reply"></i>
                </a>
            </div>
            <h1><?= $language['heading_title']; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?= $breadcrumb['href']; ?>"><?= $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div id="module-container" class="container-fluid">
        <?php if (!empty($errors['warning'])) { ?>
            <div class="alert alert-danger">
                <i class="fa fa-exclamation-circle"></i> <?= $errors['warning']; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <?php if ($note) { ?>
            <div class="alert alert-info">
                <?= $note; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <i class="fa fa-pencil"></i> <?= $language['text_edit']; ?>
                </h3>
            </div>
            <div class="panel-body">
                <form action="<?= $action; ?>" method="post" enctype="multipart/form-data" id="form-rdrf" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-name">
                            <?= $language['entry_name']; ?>
                        </label>
                        <div class="col-sm-10">
                            <input type="text" name="name" value="<?= $name; ?>"
                               placeholder="<?= $language['entry_name']; ?>" id="input-name" class="form-control"/>
                            <?php if (!empty($errors['name'])) { ?>
                                <div class="text-danger"><?= $errors['name']; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-title">
                            <?= $language['entry_title']; ?>
                        </label>
                        <div class="col-sm-10">
	                        <?php foreach ($languages as $lang) { ?>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <img src="language/<?= $lang['code'] . '/' . $lang['code']; ?>.png"/>
                                    </span>
                                    <input type="text"
                                           name="title[<?= $lang['language_id']; ?>]"
                                           value="<?= $title[$lang['language_id']]; ?>"
                                           placeholder="<?= $language['entry_name']; ?>"
                                           id="input-title<?= $lang['language_id']; ?>"
                                           class="form-control"/>
                                </div>
		                        <?php if (!empty($errors['title'][$lang['language_id']])) { ?>
                                    <div class="text-danger"><?= $errors['title'][$lang['language_id']]; ?></div>
		                        <?php } ?>
	                        <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?= $language['entry_status']; ?></label>
                        <div class="col-sm-10">
                            <select name="status" id="input-status" class="form-control">
                                <option value="1" <?= $status ? 'selected' : '' ?>><?= $language['val_enabled']; ?></option>
                                <option value="0" <?= $status ? '' : 'selected' ?>><?= $language['val_disabled']; ?></option>
                            </select>
                        </div>
                    </div>
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#filters" data-toggle="tab">
                                <?= $language['text_filters']; ?>
                            </a>
                        </li>
                        <li>
                            <a href="#view" data-toggle="tab">
                                <?= $language['text_view']; ?>
                            </a>
                        </li>
                        <li>
                            <a href="#settings" data-toggle="tab">
                                <?= $language['text_settings']; ?>
                            </a>
                        </li>
                        <li <?= $settings['mode'] !== 'ajax' ? 'style="display: none"' : '' ?>>
                            <a href="#ajax" data-toggle="tab">
                                <?= $language['text_ajax']; ?>
                            </a>
                        </li>
                        <li>
                            <a href="#config" data-toggle="tab">
			                    <?= $language['text_config']; ?>
                            </a>
                        </li>
                        <li>
                            <a href="#info" data-toggle="tab">
			                    <?= $language['text_info']; ?>
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content" id="tab-content">
                        <div class="tab-pane fade in active" id="filters">
                            <?= $filters_tab ?>
                        </div>
                        <div class="tab-pane fade" id="view">
                            <?= $view_tab ?>
                        </div>
                        <div class="tab-pane fade" id="settings">
                            <?= $settings_tab ?>
                        </div>
                        <div class="tab-pane fade" id="ajax">
                            <?= $ajax_tab ?>
                        </div>
                        <div class="tab-pane fade" id="config">
		                    <?= $config_tab ?>
                        </div>
                        <div class="tab-pane fade" id="info">
                            <h2 class="text-center"><?= $language['heading_title'] ?></h2>
		                    <?= $info_tab ?>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php
echo $filter_form_new;

reset($languages);
foreach ($filter_forms as $filter_form) {
    echo $filter_form;
	reset($languages);
}

echo $footer;
?>
<script type="text/javascript">
$(document).on("click", "button.open-toggle", function() {
    if($(this).data("open")) {
        $(this).attr('title', '<?= $language['filter_close'] ?>');
        $(this).find('i').removeClass('fa-bars').addClass('fa-minus');
        $(this).closest('.list-group-item').find('input[name *= "open"]').val(0);
        $('#filter-form-' + $(this).closest('.list-group-item').data('id')).find('input[name="open"]').val(0);
        $(this).data("open", 0);
    } else {
        $(this).attr('title', '<?= $language['filter_open'] ?>');
        $(this).find('i').removeClass('fa-minus').addClass('fa-bars');
        $(this).closest('.list-group-item').find('input[name *= "open"]').val(1);
        $('#filter-form-' + $(this).closest('.list-group-item').data('id')).find('input[name="open"]').val(1);
        $(this).data("open", 1);
    }
});
$(document).on("click", "#reset-toggle", function() {
    var button = $(this),
        input = $('#settings-resetbtn');

    if(input.val() == 1) {
        button.attr('title', '<?= $language['text_hide'] ?>');
        button.find('i').removeClass('fa-eye').addClass('fa-eye-slash');
        input.val(0);
    } else {
        button.attr('title', '<?= $language['text_show'] ?>');
        button.find('i').removeClass('fa-eye-slash').addClass('fa-eye');
        input.val(1);
    }
});
$('#settings-categories').autocomplete({
    'source': function(request, response) {
        $.ajax({
            url: 'index.php?route=extension/module/dream_filter/autocomplete&type=category&token=<?= $token; ?>&filter_name=' +  encodeURIComponent(request),
            dataType: 'json',
            success: function(json) {
                response($.map(json, function(item) {
                    return {
                        label: item['name'],
                        value: item['category_id']
                    }
                }));
            }
        });
    },
    'select': function(item) {
        $('#settings-categories').val('');
        $('#category' + item['value']).remove();
        $('#excategory' + item['value']).remove();
        $('#categories').append('<div id="category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="settings[categories][]" value="' + item['value'] + '" /></div>');
    }
});
$(document).on('click', '#categories .fa-minus-circle', function() {
    $(this).parent().remove();
});
$('#settings-excategories').autocomplete({
    'source': function(request, response) {
        $.ajax({
            url: 'index.php?route=extension/module/dream_filter/autocomplete&type=category&token=<?= $token; ?>&filter_name=' +  encodeURIComponent(request),
            dataType: 'json',
            success: function(json) {
                response($.map(json, function(item) {
                    return {
                        label: item['name'],
                        value: item['category_id']
                    }
                }));
            }
        });
    },
    'select': function(item) {
        $('#settings-excategories').val('');
        $('#excategory' + item['value']).remove();
        $('#category' + item['value']).remove();
        $('#excategories').append('<div id="excategory' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="settings[excategories][]" value="' + item['value'] + '" /></div>');
    }
});
$(document).on('click', '#excategories .fa-minus-circle', function() {
    $(this).parent().remove();
});
$('.popover-edit').each(function() {
    var button = $(this);
    button.popover({
        placement: 'top',
        html: true,
        title: '<?= $language['filter_edit']; ?>',
        content: '<div class="form-group">' +
        '<input type="text" class="form-control" value="' + button.closest('.popover-parent').find('.popover-input').val() + '">' +
        '</div>'
    });
});

var filters_row = <?= count($filters) + 1 ?>;

$(document).on("click", ".filter-apply", function(e) {
    e.preventDefault();
    var button = $(this),
        form = button.closest('form'),
        id = form.data('id'),
        modal = button.closest('.modal'),
        row = filters_row;

    if(id !== 'new') {
        row = id;
    }

    $.ajax({
        url: form.attr('action'),
        type: 'post',
        data: form.serialize() + '&id=' + row,
        processData: false,
        dataType: 'json',
        beforeSend : function() {
            button.button('loading');
        },
        success: function (data) {
            if(data.errors) {
                $.each(data.errors, function(key, mess){
                    var validate = form.find('*[data-validate=\'' + key + '\']');
                    validate.find('.form-group:not(.has-error)').addClass('has-error');
                    if(validate.find('.text-danger').length < 1) {
                        validate.append('<div class="text-danger">' + mess + '</div>');
                    }
                });
            } else {

                form.find('.form-group.has-error .text-danger').remove();
                form.find('.form-group.has-error').removeClass('has-error');

                var html = '<div id="filter-' + row + '" class="list-group-item" data-id="' + row + '">';
                html +=     data.name[<?= current($languages)['language_id'] ?>];
                html += '   <input type="hidden" name="filters[' + row + '][filter_by]" value="' + data.filter_by + '"/>';
                html += '   <input type="hidden" name="filters[' + row + '][type]" value="' + data.type + '"/>';
                <?php foreach ($languages as $lang) { ?>
                html += '   <input type="hidden" name="filters[' + row + '][name][<?= $lang['language_id'] ?>]" value="' + data.name[<?= $lang['language_id'] ?>] + '"/>';
                <?php } ?>
                html += '   <input type="hidden" name="filters[' + row + '][open]" value="' + data.open + '"/>';
                if(data.item_id) {
                    html += '   <input type="hidden" name="filters[' + row + '][item_id]" value="' + data.item_id + '"/>';
                }
                if(data.item_name) {
                    html += '   <input type="hidden" name="filters[' + row + '][item_name]" value="' + data.item_name + '"/>';
                }
                if(data.sort_order) {
                    html += '   <input type="hidden" name="filters[' + row + '][sort_order]" value="' + data.sort_order + '"/>';
                }
                if(data.add) {
                    $.each(data.add, function( key, value ) {
                        html += '   <input type="hidden" name="filters[' + row + '][add][' + key + ']" value="' + value + '"/>';
                    });
                }
                html += '   <div class="btn-group pull-right">';
                html += '       <button title="<?= $language['filter_edit'] ?>" type="button" class="btn btn-xs btn-success" data-toggle="modal" data-target="#filter-modal-' + row + '">';
                html += '           <i class="fa fa-pencil"></i>';
                html += '       </button>';
                html += '       <button title="' + (data.open ? "<?= $language['filter_open'] ?>" : "<?= $language['filter_close'] ?>") + '" type="button" class="btn btn-xs btn-info open-toggle">';
                html += '           <i class="' + (data.open ? "fa fa-bars" : "fa fa-minus") + '"></i>';
                html += '       </button>';
                html += '       <button title="<?= $language['filter_delete'] ?>" type="button" class="btn btn-xs btn-danger delete-filter">';
                html += '           <i class="fa fa-close"></i>';
                html += '       </button>';
                html += '   </div>';
                html += '</div>';

                if(id === 'new') {
                    $('#filters-list').append(html);
                    if(data.modal) {
                        $('body').append(data.modal);
                    }
                    form.find('.from-filter-collapse').html('');
                    form.find('.form-filter-by').val(0);
                    filters_row++;
                } else {
                    $('#filter-' + row).replaceWith(html);
                }
                modal.modal('hide');
            }
        },
        complete : function() {
            button.button('reset');
        }
    });
});
$(document).on("change", "#settings-mode", function() {
    var id = $(this).attr('id');
    if($(this).val() === 'ajax') {
        $('a[href="#ajax"]').parent().fadeIn();
    } else {
        $('a[href="#ajax"]').parent().fadeOut();
    }
});
$(document).on("change", ".img-select", function() {
    var id = $(this).attr('id');
    $('#' + id + '-image').attr('src', '<?= $pluginpath ?>img/' + id + '/' + $(this).val() + '.png');
});
function cleanCache(btn, store_id) {
    $.ajax({
        url: '<?= html_entity_decode($cache_btn) ?>&store_id=' +  store_id,
        dataType: 'json',
        processData: false,
        beforeSend : function() {
            btn.button('loading');
        },
        success: function (data) {
            if(data.success) {
                $('#module-container').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' +
                    data.success +
                    '<button type="button" class="close" data-dismiss="alert">&times; </button></div>'
                );
            }
            $('#module-container > .alert').each(function(i) {
                var alert = $(this);
                setTimeout(function() {
                    alert.fadeOut(function(){ $(this).remove(); })
                }, i*300 + 10000);
            });
        },
        complete : function() {
            btn.button('reset');
        }
    });
}

function getLicense(btn, store_id) {
    $.ajax({
        url: '<?= html_entity_decode($activate) ?>&store_id=' +  store_id,
        type: 'post',
        data: '',
        beforeSend: function() {
            btn.button('loading');
        },
        success: function (data) {
            if(data.errors) {
                $('#license-status' +  store_id).html('<div class="alert alert-danger"></div>');
                $.each(data.errors, function(key, error) {
                    $('#license-status' +  store_id + ' .alert').append(error + '<br/>');
                });
            }
            if(data.result) {
                $('#license-status' +  store_id).html('<div class="alert alert-success">' + data.result + '</div>');
            }
        },
        error: function () {
            $('#errors').html('<div class="alert alert-danger"><?= $language['error_response'] ?></div>');
        },
        complete: function() {
            btn.button('reset');
        }
    });
}

function resetLicense(btn, store_id) {
    $.ajax({
        url: '<?= html_entity_decode($reset_btn) ?>&store_id=' +  store_id,
        dataType: 'json',
        processData: false,
        beforeSend : function() {
            btn.button('loading');
        },
        complete : function() {
            btn.button('reset');
            window.location.replace('<?= html_entity_decode($home) ?>');
        }
    });
}
</script>
<script type="text/javascript">
    $(document).on("change", ".filter-form .form-filter-by", function() {
        var val = $(this).val(),
            form = $(this).closest('form'),
            id = form.data('id'),
            html = '<hr class="row"/>';

        form.find('.from-filter-collapse').html('');
        form.find('.form-group.has-error .text-danger').remove();
        form.find('.form-group.has-error').removeClass('has-error');

        switch(val) {
        <?php foreach ($params as $key => $item) { ?>
            case "<?= $key ?>":

            <?php if(isset($item['autocomplete'])) { ?>
                html += '<div class="form-group">';
                html += '   <label class="col-sm-3 control-label" for="filter_item_' + id + '"><?= $item['autocomplete']['label']; ?></label>';
                html += '   <div class="col-sm-9" data-validate="item_id">';
                html += '       <input id="filter_item_' + id + '" type="text" name="item_name" placeholder="<?= $item['autocomplete']['label']; ?>" class="form-control" />';
                html += '       <input id="filter_item_' + id + '_id" type="hidden" name="item_id" />';
                html += '   </div>';
                html += '</div>';
            <?php } ?>

                html += '<div class="form-group">';
                html += '   <label class="col-sm-3 control-label" for="filter_name_' + id + '"><?= $language['entry_name']; ?></label>';
                html += '   <div class="col-sm-9" data-validate="name">';
                <?php foreach ($languages as $lang) { ?>
                html += '       <div class="input-group">';
                html += '           <span class="input-group-addon"><img src="language/<?= $lang['code'] . '/' . $lang['code']; ?>.png" title="<?= $lang['name']; ?>"/></span>';
                html += '           <input id="filter_name_' + id + '_<?= $lang['language_id'] ?>" name="name[<?= $lang['language_id'] ?>]" value="<?= $item['name'] ?>" placeholder="<?= $language['entry_name']; ?>" class="form-control"/>';
                html += '       </div>';
                <?php } ?>
                html += '   </div>';
                html += '</div>';

            <?php if(isset($item['types'])) { ?>
                html += '<div class="form-group">';
                html += '   <label class="col-sm-3 control-label" for="filter_type_' + id + '"><?= $language['filter_type']; ?></label>';
                html += '   <div class="col-sm-9">';
                html += '       <select id="filter_type_' + id + '" name="type" class="form-control">';
            <?php foreach ($item['types'] as $val => $name) { ?>
                html += '           <option value="<?= $val ?>"><?= $name ?></option>';
            <?php } ?>
                html += '       </select>';
                html += '   </div>';
                html += '</div>';
            <?php } ?>

            <?php if(isset($item['sort_types'])) { ?>
                html += '<div class="form-group">';
                html += '   <label class="col-sm-3 control-label" for="filter_sort_' + id + '"><?= $language['entry_sorter']; ?></label>';
                html += '   <div class="col-sm-9">';
                html += '       <select id="filter_sort_' + id + '" name="sort_order" class="form-control">';
            <?php foreach ($item['sort_types'] as $val => $name) { ?>
                html += '           <option value="<?= $val ?>"><?= $name ?></option>';
            <?php } ?>
                html += '       </select>';
                html += '   </div>';
                html += '</div>';
            <?php } ?>
            <?php if(isset($item['additional'])) { ?>
            <?php foreach ($item['additional'] as $additional) { ?>
                html += '<div class="form-group">';
                html += '   <label class="col-sm-3 control-label" for="filter_<?= $additional['name'] ?>_' + id + '"><?= $additional['label']; ?></label>';
                html += '   <div class="col-sm-9">';
                html += '       <input type="<?= $additional['type']; ?>" id="filter_<?= $additional['name'] ?>_' + id + '" name="add[<?= $additional['name'] ?>]" placeholder="<?= $additional['label']; ?>" value="<?= isset($additional['default']) ? $additional['default'] : '' ?>" class="form-control"/>';
                html += '   </div>';
                html += '</div>';
            <?php } ?>
            <?php } ?>
                form.find('.from-filter-collapse').html(html);

            <?php if(isset($item['autocomplete'])) { ?>
                $('#filter_item_' + id).autocomplete({
                    'source': function(request, response) {
                        $.ajax({
                            url: '<?= $item['autocomplete']['url']; ?>&filter_name=' +  encodeURIComponent(request),
                            dataType: 'json',
                            success: function(json) {
                                response($.map(json, function(item) {
                                    return {
                                        <?php if(isset($item['autocomplete']['category'])) { ?>
                                        category: item.<?= $item['autocomplete']['category'] ?>,
                                        <?php } ?>
                                        label: item.name,
                                        value: item.id
                                    }
                                }));
                            }
                        });
                    },
                    'select': function(item) {
                        $('#filter_item_' + id).val(item['label']);
                        $('#filter_item_' + id + '_id').val(item['value']);
	                    <?php foreach ($languages as $lang) { ?>
                            if($('#filter_name_' + id + '_<?= $lang['language_id'] ?>').val() === '') {
                                $('#filter_name_' + id + '_<?= $lang['language_id'] ?>').val(item['label']);
                            }
	                    <?php } ?>
                    }
                });
            <?php } ?>
                break;
        <?php } ?>
        }
        form.find('.from-filter-collapse').collapse('show');
    });
</script>
<script type="text/javascript">
    var editor1 = CodeMirror.fromTextArea(document.getElementById("callback-before"), {
        mode: "javascript",
        theme: "material",
        lineNumbers: true,
        matchBrackets: true,
        continueComments: "Enter",
        extraKeys: {"Ctrl-Q": "toggleComment"}
    });

    var editor2 = CodeMirror.fromTextArea(document.getElementById("callback-after"), {
        mode: "javascript",
        theme: "material",
        lineNumbers: true,
        matchBrackets: true,
        continueComments: "Enter",
        extraKeys: {"Ctrl-Q": "toggleComment"}
    });

    $(document).on('shown.bs.tab', 'a[href="#ajax"]', function () {
        editor1.refresh();
        editor2.refresh();
    });

    $(document).on('click', '#apply-button', function() {
        editor1.save();
        editor2.save();
        var btn = $(this),
            form = $('#' + btn.data('form'));
        $.ajax({
            url: btn.data('url'),
            type: 'post',
            data: form.serialize(),
            dataType: 'json',
            processData: false,
            beforeSend : function() {
                btn.button('loading');
            },
            success: function (data) {
                if(data.errors) {
                    $.each(data.errors, function(key, val){
                        $('#module-container').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' +
                            val +
                            '<button type="button" class="close" data-dismiss="alert">&times; </button></div>'
                        );
                    });
                }
                if(data.success) {
                    $('#module-container').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' +
                        data.success +
                        '<button type="button" class="close" data-dismiss="alert">&times; </button></div>'
                    );
                }
                $('#module-container > .alert').each(function(i) {
                    var alert = $(this);
                    setTimeout(function() {
                        alert.fadeOut(function(){ $(this).remove(); })
                    }, i*300 + 10000);
                });
            },
            complete : function() {
                btn.button('reset');
            }
        });
    });
</script>