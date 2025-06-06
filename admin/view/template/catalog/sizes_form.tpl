<?php echo $header; ?><?php echo $column_left; ?>
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" form="form-attribute-group" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                    <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
                <h1><?php echo $heading_title; ?></h1>
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
        </div>
        <div class="container-fluid">
            <?php if ($error_warning) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            <?php } ?>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
                </div>
                <div class="panel-body">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-attribute-group" class="form-horizontal">
                        <div class="form-group required">
                            <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>
                            <div class="col-sm-10">
                                <?php foreach ($languages as $language) { ?>
                                    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                        <input type="text" name="sizes_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($sizes_description[$language['language_id']]) ? $sizes_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control" />
                                    </div>
                                    <?php if (isset($error_name[$language['language_id']])) { ?>
                                        <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                                    <?php } ?>
                                <?php } ?>
                            </div>
                        </div>

                        <?php foreach ($languages as $language) { ?>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label">Текст<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></label>
                                <div class="col-sm-10">
                                    <textarea name="sizes_description[<?php echo $language['language_id']; ?>][text]" placeholder="Текст" id="input-text<?php echo $language['language_id']; ?>" data-lang="<?php echo $lang; ?>" class="form-control summernote"><?php echo isset($sizes_description[$language['language_id']]) ? $sizes_description[$language['language_id']]['text'] : ''; ?></textarea>
                                </div>
                            </div>
                        <?php } ?>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<script>
    <?php foreach ($languages as $language) { ?>
    ckeditorInit('input-text<?php echo $language['language_id']; ?>', getURLVar('token'));
    <?php } ?>
</script>
<?php echo $footer; ?>