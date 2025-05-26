<?php if($colors) { ?>

    <?php if ($colorasproduct_method == 0) { ?>
        <div class="slider_colors_wrapper">
            <?php if (!empty($colorasproduct_title)) { ?>
                <div class="colorasprod_title"><?php echo $colorasproduct_title; ?></div>
            <?php } ?>
            <div class="color_slider">
                <?php foreach ($colors as $color) { ?>
                <<?= ($product_id == $color['product_id']) ? 'div' : 'a'; ?> href="<?php echo $color['href']; ?>" class="<?php echo ($color['quantity'] == 0) ? 'color_noquan' : ''; ?> slider_block <?php if ($product_id == $color['product_id']) { echo "active"; }?>">
                <div class="clr_img"><img src="<?php echo $color['image']; ?>" alt="<?php echo $color['name']; ?>" title="<?php echo $color['name']; ?>"></div>
                <div class="clr_text <?php if ($colorasproduct_price == 1) { ?>price<?php } ?>">
                    <div class="clr_color"></div>
                    <div class="clr_name"><?php echo $color['colors']; ?></div>
                    <?php if ($colorasproduct_price == 1) { ?> <div class="clr_price"><?php echo $color['price']; ?></div> <?php } ?>
                </div>
            </<?= ($product_id == $color['product_id']) ? 'div' : 'a'; ?>>
            <?php } ?>
        </div>
        </div>
    <?php } else if ($colorasproduct_method == 1) { ?>
        <div class="slider_colors_wrapper">
            <?php if (!empty($colorasproduct_title)) { ?>
                <div class="colorasprod_title"><?php echo $colorasproduct_title; ?></div>
            <?php } ?>
            <div class="color_slider">
                <?php foreach ($colors as $color) { ?>

                <<?= ($product_id == $color['product_id']) ? 'div' : 'a'; ?> href="<?php echo $color['href']; ?>" title="<?php echo $color['name']; ?>" class="<?php echo ($color['quantity'] == 0) ? 'color_noquan' : ''; ?> slider_block <?php if ($product_id == $color['product_id']) { echo "active"; }?>">
                <div class="clr_text dots <?php if ($colorasproduct_price == 1) { ?>price<?php } ?>">
                    <div class="clr_color dots" <?php if ($color['htmlerror'] == 0) { ?>style="background: #<?php echo $color['htmlcolor']; ?>;"> <?php } else { ?> style="background: url(<?php echo $color['htmlcolor']; ?>);"> <?php } ?></div>
                    <div class="clr_name"><?php echo $color['colors']; ?></div>
                    <?php if ($colorasproduct_price == 1) { ?>  <div class="clr_price"><?php echo $color['price']; ?></div> <?php } ?>
                </div>
            </<?= ($product_id == $color['product_id']) ? 'div' : 'a'; ?>>
            <?php } ?>
        </div>
        </div>
    <?php }  else if ($colorasproduct_method == 2) { ?>
        <div class="slider_colors_wrapper">
            <?php if (!empty($colorasproduct_title)) { ?>
                <div class="colorasprod_title"><?php echo $colorasproduct_title; ?></div>
            <?php } ?>
            <div class="color_slider">
                <?php foreach ($colors as $color) { ?>

                <<?= ($product_id == $color['product_id']) ? 'div' : 'a'; ?> href="<?php echo $color['href']; ?>" title="<?php echo $color['name']; ?>" class="<?php echo ($color['quantity'] == 0) ? 'color_noquan' : ''; ?> slider_block <?php if ($product_id == $color['product_id']) { echo "active"; }?>">
                <div class="clr_text dots <?php if ($kra == 1) { echo 'c_vid1'; } else if ($kra == 2) { echo 'c_vid2'; } else if ($kra == 3) { echo 'c_vid3'; } ?>">
                    <div class="clr_color dots <?php if ($kra == 1) { echo 'c_vid1'; } else if ($kra == 2) { echo 'c_vid2'; } else if ($kra == 3) { echo 'c_vid3'; } ?>" <?php if ($color['htmlerror'] == 0) { ?>style="background: #<?php echo $color['htmlcolor']; ?>;"> <?php } else { ?> style="background: url(<?php echo $color['htmlcolor']; ?>);"> <?php } ?></div>
                </div>
                <div class="slider_block-tip"><?php echo $color['colors']; ?></div>
            </<?= ($product_id == $color['product_id']) ? 'div' : 'a'; ?>>
            <?php } ?>
        </div>
        </div>
    <?php } ?>
<?php } ?>

<script>
    <?php if (!empty($colorasproduct_selector)) { ?>
    $('.slider_colors_wrapper').fadeOut(0);
    $(document).ready(function () {
        var module_color = $('.slider_colors_wrapper');
        $(module_color).appendTo('<?php echo $colorasproduct_selector; ?>');
        $('.slider_colors_wrapper').fadeIn(50);
    });
    <?php } ?>
</script>