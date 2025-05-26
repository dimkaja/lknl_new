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
 * @var $language array
 * @var $breadcrumbs array
 * @var $header string
 * @var $column_left string
 * @var $footer string
 *
 * @var $info_tab string
 * @var $cancel string
 * @var $activate string
 * @var $location string
 */
echo $header; ?>

<?= $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
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
    <div class="container-fluid">
        <div class="text-center">
            <h1><?= $language['text_welcome'] ?></h1>
            <hr/>
        </div>
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div id="errors">
                    <?php if(!empty($errors)) { ?>
                        <?php foreach ($errors as $error) { ?>
                            <div class="alert alert-danger text-center">
                                <h4><i class="fa fa-exclamation-circle"></i> <?= $error; ?></h4>
                            </div>
                        <?php } ?>
                    <?php } ?>
                </div>
                <?php if($activate) { ?>
                    <br/>
                    <div class="text-center">
                                <button id="btn-license" data-loading-text="<?= $language['text_loading'] ?>" class="btn btn-lg btn-success"><?= $language['button_license'] ?></button>
                    </div>
                <?php } ?>
                <br/>
	            <?= $info_tab; ?>
            </div>
        </div>
    </div>
</div>
<?= $footer; ?>
<?php if($activate) { ?>
    <script type="text/javascript">
        $(document).on("click", "#btn-license", function(e) {
            e.preventDefault();

            var btn = $(this);
            $('#errors').html('');
            $.ajax({
                url: '<?= html_entity_decode($activate) ?>',
                type: 'post',
                data: '',
                beforeSend: function() {
                    btn.button('loading');
                },
                success: function (data) {
                    if(data.result) {
                        window.location.replace('<?= html_entity_decode($location) ?>');
                    } else if(data.errors) {
                        $.each(data.errors, function(key, error) {
                            $('#errors').append('<div class="alert alert-danger">' + error + '</div>');
                        });
                    }
                },
                error: function () {
                    $('#errors').html('<div class="alert alert-danger"><?= $language['error_response'] ?></div>');
                },
                complete: function() {
                    btn.button('reset');
                }
            });
        });
    </script>
<?php } ?>