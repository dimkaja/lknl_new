<?php
/**
 * Dream Filter v2.6
 * @link http://dreamfilter.ru/
 * @license Commercial
 * @copyright Copyright (c) 2016-2023 reDream
 * @author Ivan Grigorev <ig@redream.ru>
 */
/**
 * @var $language array
 * @var $version string
 * @var $updates_btn string
 */
?>
<table class="table">
    <tbody>
        <tr>
            <td class="text-right"><b><?= $language['text_version'] ?>:</b></td>
            <td class="text-left"><?= $version ?></td>
        </tr>
        <tr>
            <td class="text-right"><b><?= $language['text_support'] ?>:</b></td>
            <td class="text-left"><a href="mailto:oc@redream.ru">oc@redream.ru</a></td>
        </tr>
        <tr>
            <td class="text-right"><b><?= $language['text_developer'] ?>:</b></td>
            <td class="text-left"><a href="https://redream.ru" target="_blank">https://redream.ru</a></td>
        </tr>
    </tbody>
</table>
<div class="text-center">
    <button type="button" onclick="checkUpdates($(this))" class="btn btn-info"><?= $language['button_updates'] ?></button>
</div>
<script type="text/javascript"><!--
function checkUpdates(btn) {
    btn.siblings('.alert').remove();
    $.ajax({
        url: '<?= html_entity_decode($updates_btn) ?>',
        dataType: 'json',
        processData: false,
        beforeSend : function() {
            btn.button('loading');
        },
        success: function (data) {
            if(data.result) {
                btn.after('<br/><br/><div class="alert alert-success"><i class="fa fa-check-circle"></i> ' +
                    data.result +
                    '<button type="button" class="close" data-dismiss="alert">&times; </button></div>'
                );
            } else if(data.errors.length) {
                var errors = '';
                $.each(data.errors, function(key, error) {
                    errors += '<div class="alert alert-danger">' + error + '</div>';
                });
                btn.after('<br/><br/>' + errors);
            } else {
                btn.after('<br/><br/><div class="alert alert-info"><?= $language['no_updates'] ?></div>');
            }
        },
        complete : function() {
            btn.button('reset');
        }
    });
}
--></script>
