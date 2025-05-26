<?php echo $header; ?>

<link rel="stylesheet" href="/catalog/view/theme/default/stylesheet/swiper.css?v=<?php echo rand(1,57935673576); ?>">

<link rel="stylesheet" href="/catalog/view/theme/default/stylesheet/product_page.css?v=<?php echo rand(1,57935673576); ?>">
<script src="/catalog/view/javascript/swiper.js?v=<?php echo rand(1,57935673576); ?>"></script>
<script src="catalog/view/javascript/scrollHandler_product.js?v=<?php echo rand(1,57935673576); ?>"></script>


  <section id="product">
    <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
    <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
    <div class="product_images swiper">
      <div class="swiper-wrapper">
        <?php if ($thumb || $images) { ?>
          <?php if ($thumb) { ?>
            <div class="big_image swiper-slide">
              <a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>">
                <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
              </a>
            </div>
            <?php } ?>
            <?php if ($images) { ?>
                <?php foreach ($images as $image) { ?>
                <div class="image-additional swiper-slide">
                  <a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> 
                    <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                  </a>
                </div>
                <?php } ?>          
            <?php } ?>
        <?php } ?>
      </div>
      <div class="swiper-pagination"></div>
      <div class="sku">Арт. <?php echo $sku; ?></div>
    </div>
    <div class="product_card_info_top">
      <div class="chat_btn">
          <img src="/image/message.svg" alt="message" />
      </div>
      <div class="chat_content">
        <div class="chat_content_item" style="top: 582px; left: 292.5px; transform-origin: left bottom;">
          <a class="ChatMenuItem_root__D8jpm" href="https://wa.me/79050221220?text=https://lookonline.ru/?product=futbolka-svobodnogo-kroia-happy-things-zelenyi">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
              <g clip-path="url(#clip0_31110_155382)">
              <path fill-rule="evenodd" clip-rule="evenodd" d="M6.00104 4.92185C5.76738 4.91132 5.47974 4.95321 5.2889 5.14405C4.89993 5.53302 4.80894 6.25507 5.05993 7.16914C5.30387 8.05751 5.83502 8.97037 6.43227 9.5676C7.02951 10.1649 7.9424 10.6961 8.83081 10.94C9.7449 11.1911 10.467 11.1001 10.856 10.7111C11.0467 10.5203 11.0886 10.2328 11.0782 9.99903C11.0778 9.99813 11.077 9.99663 11.0757 9.99449C11.0707 9.98635 11.0592 9.97218 11.038 9.95704L10.1647 9.33379C10.1647 9.33377 10.1647 9.3338 10.1647 9.33379C10.0874 9.27869 9.98154 9.28741 9.91435 9.35452L9.3245 9.94443C9.20123 10.0677 9.01889 10.1108 8.85351 10.0556C8.49235 9.93521 7.63179 9.55711 7.03735 8.96267C6.4429 8.36823 6.0648 7.5076 5.9444 7.14643C5.88928 6.98106 5.93232 6.79874 6.05559 6.67548L6.64547 6.08564C6.64546 6.08564 6.64548 6.08563 6.64547 6.08564C6.71257 6.0185 6.72139 5.91264 6.66627 5.83535C6.66626 5.83534 6.66628 5.83536 6.66627 5.83535L6.04307 4.96207C6.02793 4.94086 6.01375 4.92933 6.00558 4.92432C6.00345 4.92301 6.00195 4.92226 6.00104 4.92185ZM4.63808 4.49322C5.10665 4.02465 5.72554 3.98759 6.04627 4.00255C6.38155 4.0182 6.63855 4.21201 6.79227 4.42742C6.79227 4.42742 6.79227 4.42742 6.79227 4.42742L7.41547 5.3007C7.73182 5.74409 7.68146 6.35125 7.29633 6.73643L6.91855 7.11418C7.06878 7.46034 7.339 7.96267 7.68817 8.31185C8.03734 8.66102 8.53964 8.93123 8.88579 9.08147L9.26349 8.70372C9.64869 8.31864 10.2558 8.26817 10.6992 8.58452L11.5724 9.20772C11.5724 9.2077 11.5725 9.20775 11.5724 9.20772C11.788 9.36149 11.9818 9.61851 11.9975 9.9537C12.0124 10.2743 11.9754 10.8934 11.5068 11.3619C10.7568 12.1119 9.59755 12.1051 8.58707 11.8276C7.5509 11.543 6.49599 10.933 5.78144 10.2184C5.06687 9.50387 4.45689 8.44899 4.17238 7.41285C3.89491 6.40239 3.88815 5.24315 4.63808 4.49322Z" fill="#676560"/>
              <path fill-rule="evenodd" clip-rule="evenodd" d="M0 8C0 3.58172 3.58172 0 8 0C12.4183 0 16 3.58172 16 8C16 12.4183 12.4183 16 8 16C6.60897 16 5.29959 15.6446 4.15913 15.0193L0.491822 15.4882L0.980719 11.8409C0.355433 10.7004 0 9.39103 0 8ZM8 0.976526C4.12104 0.976526 0.976526 4.12104 0.976526 8C0.976526 9.28009 1.31854 10.4788 1.91584 11.5114C1.97419 11.6123 1.99454 11.7307 1.97321 11.8452L1.47413 14.5259L4.15476 14.0268C4.26933 14.0055 4.38775 14.0258 4.48862 14.0842C5.52118 14.6815 6.71991 15.0235 8 15.0235C11.879 15.0235 15.0235 11.879 15.0235 8C15.0235 4.12104 11.879 0.976526 8 0.976526Z" fill="#676560"/>
              </g>
              <defs>
              <clipPath id="clip0_31110_155382">
              <rect width="16" height="16" fill="white"/>
              </clipPath>
              </defs>
              </svg>
            <p>WhatsApp</p>
          </a>
          <a class="ChatMenuItem_root__D8jpm" href="https://t.me/lookonlinebot">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
              <path d="M13.8897 1.0013C13.6958 1.01067 13.5133 1.06923 13.351 1.13481H13.3487C13.1842 1.20274 12.402 1.5447 11.2141 2.06234C10.0261 2.58232 8.48433 3.25688 6.95379 3.92676C3.89722 5.26418 0.892496 6.58052 0.892496 6.58052L0.928561 6.56646C0.928561 6.56646 0.721183 6.63673 0.504789 6.79132C0.394338 6.86627 0.272616 6.96933 0.166673 7.13094C0.0607296 7.29256 -0.0249268 7.54083 0.006631 7.79614C0.0584757 8.22945 0.328969 8.48944 0.522822 8.63232C0.718929 8.77754 0.906021 8.84546 0.906021 8.84546H0.910529L3.72817 9.83154C3.8544 10.2531 4.58698 12.7547 4.7628 13.3308C4.86649 13.6752 4.96793 13.8906 5.09415 14.0546C5.15502 14.1389 5.22715 14.2092 5.3128 14.2654C5.34662 14.2865 5.38268 14.3029 5.41875 14.3169C5.43002 14.324 5.44129 14.3263 5.45481 14.3286L5.42551 14.3216C5.43453 14.324 5.44129 14.331 5.44805 14.3333C5.47059 14.3404 5.48637 14.3427 5.51567 14.3474C5.96199 14.4879 6.32039 14.1998 6.32039 14.1998L6.34068 14.1834L8.00421 12.6094L10.7925 14.8322L10.8557 14.8603C11.4372 15.125 12.0255 14.9774 12.3366 14.7175C12.6499 14.4551 12.7717 14.1202 12.7717 14.1202L12.7919 14.0663L14.9469 2.59637C15.0077 2.31296 15.0235 2.04829 14.9559 1.79064C14.8883 1.53299 14.7147 1.29174 14.5051 1.16292C14.2932 1.03175 14.0835 0.991935 13.8897 1.0013ZM13.8311 2.23098C13.8288 2.26846 13.8356 2.26377 13.8198 2.33638V2.34341L11.6852 13.6939C11.6762 13.7103 11.6604 13.7454 11.6175 13.7806C11.5725 13.818 11.5364 13.8415 11.3493 13.7642L7.93884 11.0472L5.87858 12.9983L6.31137 10.1267C6.31137 10.1267 11.6536 4.95266 11.8835 4.73015C12.1135 4.50764 12.0368 4.46079 12.0368 4.46079C12.0526 4.18909 11.6897 4.38116 11.6897 4.38116L4.66362 8.90402L4.66137 8.89231L1.29373 7.71416V7.71182C1.29147 7.71182 1.28696 7.70948 1.28471 7.70948C1.28696 7.70948 1.30274 7.70245 1.30274 7.70245L1.32078 7.69308L1.33881 7.68605C1.33881 7.68605 4.34579 6.36972 7.40236 5.0323C8.9329 4.36242 10.4747 3.68785 11.6604 3.16787C12.846 2.65024 13.7229 2.2708 13.7725 2.24972C13.8198 2.23098 13.7973 2.23098 13.8311 2.23098Z" fill="#676560"/>
              </svg>
            <p>Telegram</p>
          </a>
          <a class="ChatMenuItem_root__D8jpm" href="https://ig.me/m/look.online">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
              <g clip-path="url(#clip0_31110_155375)">
              <path fill-rule="evenodd" clip-rule="evenodd" d="M12.5128 4.1752C12.6714 4.1752 12.8 4.09687 12.8 4.0002C12.8 3.90352 12.6714 3.8252 12.5128 3.8252V3.2002C11.7878 3.2002 11.2 3.55834 11.2 4.0002C11.2 4.44205 11.7878 4.8002 12.5128 4.8002V4.1752Z" fill="#676560"/>
              <path fill-rule="evenodd" clip-rule="evenodd" d="M12.1436 3.2002C12.5061 3.2002 12.8 3.55834 12.8 4.0002C12.8 4.44205 12.5061 4.8002 12.1436 4.8002V4.1752C12.0643 4.1752 12 4.09687 12 4.0002C12 3.90352 12.0643 3.8252 12.1436 3.8252V3.2002Z" fill="#676560"/>
              <path fill-rule="evenodd" clip-rule="evenodd" d="M8 5.07958C6.3871 5.07958 5.07958 6.3871 5.07958 8C5.07958 9.6129 6.3871 10.9204 8 10.9204C9.6129 10.9204 10.9204 9.6129 10.9204 8C10.9204 6.3871 9.6129 5.07958 8 5.07958ZM4 8C4 5.79086 5.79086 4 8 4C10.2091 4 12 5.79086 12 8C12 10.2091 10.2091 12 8 12C5.79086 12 4 10.2091 4 8Z" fill="#676560"/>
              <path fill-rule="evenodd" clip-rule="evenodd" d="M0 4.80851C0 2.15284 2.15284 0 4.80851 0H11.1915C13.8471 0 16 2.15284 16 4.80851V11.1915C16 13.8471 13.8471 16 11.1915 16H4.80851C2.15284 16 0 13.8471 0 11.1915V4.80851ZM4.80851 1.10638C2.76388 1.10638 1.10638 2.76388 1.10638 4.80851V11.1915C1.10638 13.2361 2.76388 14.8936 4.80851 14.8936H11.1915C13.2361 14.8936 14.8936 13.2361 14.8936 11.1915V4.80851C14.8936 2.76388 13.2361 1.10638 11.1915 1.10638H4.80851Z" fill="#676560"/>
              </g>
              <defs>
              <clipPath id="clip0_31110_155375">
              <rect width="16" height="16" fill="white"/>
              </clipPath>
              </defs>
              </svg>
            <p>Instagram</p>
          </a>
        </div>
      </div>
      
      <div class="product_content_item">
        <h1><?php echo $heading_title; ?></h1>
        <div class="price">
          <?php if($special) { ?>
            <p class="price"><?php echo $special; ?></p>
            <p class="old_price"><?php echo $price; ?></p>
          <?php } else { ?>
            <p class="price"><?php echo $price; ?></p>
          <?php } ?>
          
        </div>

       
      </div>
      <?php if($in_wish_item) { ?>
        <?php $wish_status = 'open'; ?>
        <a class="wishlist_product_btn <?php echo $wish_status; ?>" onclick="wishlist.remove('<?php echo $product_id; ?>');return false;" href="#" >
      <?php } else { ?>
        <?php $wish_status = ''; ?>
        <a class="wishlist_product_btn <?php echo $wish_status; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');return false;" href="#" >
      <?php } ?>
   
        <svg class="wish_noactive" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
          <g clip-path="url(#clip0_33263_25458)"><path fill-rule="evenodd" clip-rule="evenodd" d="M3.73889 1.23062C3.63983 1.23062 3.30411 1.23062 3.30411 1.23062C3.30411 1.23062 3.30411 1.57594 3.30411 1.71979V13.4074L7.99955 9.846L12.6956 13.4076V1.71996C12.6956 1.57612 12.6956 1.2308 12.6956 1.2308C12.6956 1.2308 12.3599 1.2308 12.2608 1.2308L3.73889 1.23062ZM2 0C2 0 3.2614 -0.000176013 3.73889 -0.000176013L12.2608 0C12.7383 0 14 0.000612825 14 0.000612825C14 0.000612825 14 1.27791 14 1.71996V16L7.99998 11.4609L2.00052 15.9998L1.99976 1.71979C1.99976 1.27774 2 0 2 0Z" fill="#676560"></path>
          </g><defs><clipPath id="clip0_33263_25458"><rect width="16" height="16" fill="white"></rect></clipPath></defs>
        </svg>

        <svg class="wish_active" width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
          <g clip-path="url(#clip0_33263_39327)">
            <path fill-rule="evenodd" clip-rule="evenodd" d="M2 0C2 0 3.2614 -0.000176013 3.73889 -0.000176013L12.2608 0C12.7383 0 14 0.000612825 14 0.000612825C14 0.000612825 14 1.27791 14 1.71996V16L7.99998 11.4609L2.00052 15.9998L1.99976 1.71979C1.99976 1.27774 2 0 2 0Z" fill="#676560"></path>
          </g>
          <defs>
            <clipPath id="clip0_33263_39327">
              <rect width="16" height="16" fill="white"></rect>
            </clipPath>
          </defs>
        </svg>
      </a>

    </div>
    <div class="colors_info_text"><span class="colors_title">Цвет: <?php echo $colorasprod; ?></span><span class="colors_sku">Арт: <?php echo $sku; ?></span></div>
    <div class="product_colors">

      <?php if (isset($colors) && $colors) { ?>

            <?php if ($colorasproduct_method == 0) { ?>
                <div class="slider_colors_wrapper">
                    <div class="color_slider">
                        <?php foreach ($colors as $color) { ?>
                        <<?= ($product_id == $color['product_id']) ? 'div' : 'a'; ?> href="<?php echo $color['href']; ?>" class="<?php echo ($color['quantity'] == 0) ? '' : ''; ?> slider_block <?php if ($product_id == $color['product_id']) { echo "active"; }?>">
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
                <div class="color_slider">
                    <?php foreach ($colors as $color) { ?>
                    <<?= ($product_id == $color['product_id']) ? 'div' : 'a'; ?> href="<?php echo $color['href']; ?>" class="<?php echo ($color['quantity'] == 0) ? '' : ''; ?> slider_block <?php if ($product_id == $color['product_id']) { echo "active"; }?>">
                    <div class="clr_text dots <?php if ($colorasproduct_price == 1) { ?>price<?php } ?>">
                            <div class="clr_color dots 222" <?php if ($color['htmlerror'] == 0) { ?>style="background: #<?php echo $color['htmlcolor']; ?>;" <?php } else { ?> style="background: url(<?php echo $color['htmlcolor']; ?>);" <?php } ?>></div>
                        <div class="clr_name"><?php echo $color['colors']; ?></div>
                        <?php if ($colorasproduct_price == 1) { ?>  <div class="clr_price"><?php echo $color['price']; ?></div> <?php } ?>
                    </div>
                </<?= ($product_id == $color['product_id']) ? 'div' : 'a'; ?>>
                <?php } ?>
            </div>
        </div>
        <?php }  else if ($colorasproduct_method == 2) { ?>
            <div class="slider_colors_wrapper">
                <div class="color_slider">
                    <?php foreach ($colors as $color) { ?>
                        <?php if ($product_id == $color['product_id']) { ?>
                            <a href="#" onclick="return false" class="<?php echo ($color['quantity'] == 0) ? '' : ''; ?> slider_block active">
                                <div class="clr_text dots" data-toggle="tooltip" data-original-title="<?php echo $color['colors']; ?>">
                                    <div class="clr_color dots 1222" <?php if ($color['htmlerror'] == 0) { ?>style="background: #<?php echo $color['htmlcolor']; ?>;" <?php } else { ?> style="background: url(<?php echo $color['htmlcolor']; ?>);" <?php } ?>></div>
                                </div>
                            </a>
                        <?php } ?>
                    <?php } ?>
                    <?php foreach ($colors as $color) { ?>
                        <?php if ($product_id != $color['product_id']) { ?>
                            <a href="<?php echo $color['href']; ?>" class="<?php echo ($color['quantity'] == 0) ? '' : ''; ?> slider_block">
                                <div class="clr_text dots" data-toggle="tooltip" data-original-title="<?php echo $color['colors']; ?>">
                                    <div class="clr_color dots" <?php if ($color['htmlerror'] == 0) { ?>style="background: #<?php echo $color['htmlcolor']; ?>;" <?php } else { ?> style="background: url(<?php echo $color['htmlcolor']; ?>);" <?php } ?>></div>
                                </div>
                            </a>
                        <?php } ?>
                    <?php } ?>
                </div>
            </div>
        <?php } ?>
    <?php } ?>

    </div>

    <?php if($options) { ?>

      <?php foreach ($options as $option) { ?>
          <?php if($option['name'] == 'Размер') { ?>
        
            <?php if(count($option['product_option_value']) > 1) { ?>

                <?php $class = 'multi'; ?>
              <?php } else { ?>
                <?php $class = 'single'; ?>
              <?php } ?>
          <?php } ?>
        <?php } ?>
    <?php } ?>
    <div class="product_options">
      <div class="options <?php echo $class; ?>">
     
        <?php if($options) { ?>

            <?php foreach ($options as $option) { ?>
                <?php if($option['name'] == 'Размер') { ?>
              
                  <?php if(count($option['product_option_value']) > 1) { ?>

                    <div class="option_values">
                      <button class="option_values_btn"><span>выберите размер</span><img src="/image/arrow-down-no-extra-space.svg" alt="chevron icon"></button>
                      <div class="option_size_list">
                        <?php foreach ($option['product_option_value'] as $option_value) { ?>

                          <?php if(!$option_value['quantity_pb_msc'] && 
                          !$option_value['quantity_1tv_msc'] &&
                          !$option_value['quantity_nk_msc'] &&
                          !$option_value['quantity_dlg_msc'] &&
                          !$option_value['quantity_bd_msc'] &&
                          !$option_value['quantity_tp_msc'] &&
                          !$option_value['quantity_s_spb'] &&
                          !$option_value['quantity_f_spb'] &&
                          !$option_value['quantity_d_kzn'] &&
                          !$option_value['quantity_pp_kzn']
                          
                          ) { ?>

                            <?php $classOption = 'no_available_option'; ?>

                          <?php } else { ?>
                            <?php $classOption = ''; ?>
                          <?php } ?>

                          <div class="radio <?php echo $classOption; ?>">
                            <label>
                              <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                              
                              <?php echo $option_value['name']; ?>
    
                            </label>
                          </div>
                        <?php } ?>
                      </div>
                    </div>
  

                <?php } else { ?>
                  <div class="option_value">
                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                      <div class="radio">
                        <label>
                          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" checked="checked" />
                                    
                          <?php echo $option_value['name']; ?>
    
                        </label>
                      </div>
                    <?php } ?>
                  </div>
                <?php } ?>


              <?php } ?>

            <?php } ?>


        <?php } ?>
      </div>

      <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?><svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M8.00017 0C6.19292 0 4.72786 1.45204 4.72786 3.24323V3.45952H4.06124C3.26063 3.45952 3.09077 3.46032 3.09077 3.46032L2.11429 14.4313C2.08819 14.8047 2 15.9996 2 15.9996C2 15.9996 2.94303 16 3.38753 16H12.6131C13.0576 16 14 15.9996 14 15.9996C14 15.9996 13.9124 14.8047 13.8864 14.4313L12.9077 3.45968C12.9077 3.45968 12.74 3.45952 11.9394 3.45952H11.2725V3.24323C11.2725 1.45204 9.80739 0 8.00017 0ZM9.96356 4.75681V5.83781H11.2725V4.75681H11.8727C11.8864 4.78146 11.9026 4.82358 11.9068 4.884L12.5806 14.521C12.5864 14.6046 12.5659 14.6676 12.5464 14.7027H3.45425C3.43476 14.6676 3.41424 14.6046 3.42009 14.521L4.09379 4.88399C4.09802 4.82354 4.11424 4.78146 4.12795 4.75681H4.72786V5.83781H6.03678V4.75681H9.96356ZM9.96356 3.45952V3.24323C9.96356 2.16852 9.0845 1.29729 8.00017 1.29729C6.91582 1.29729 6.03678 2.16852 6.03678 3.24323V3.45952H9.96356Z" fill="#EEEDEA"></path></svg></button>
    </div>
    <div class="product_page_info_item">
      <button class="magazines_available">наличие в магазинах 
        
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
        <path fill-rule="evenodd" clip-rule="evenodd" d="M2.48848 8.65002L6.87886 13.0404L5.95962 13.9596L0 8.00002L5.95962 2.04041L6.87886 2.95964L2.48848 7.35002H16V8.65002H2.48848Z" fill="#676560"/>
        </svg>
      
      </button>
      <button class="product_info_btn">о товаре
        
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
        <path fill-rule="evenodd" clip-rule="evenodd" d="M2.48848 8.65002L6.87886 13.0404L5.95962 13.9596L0 8.00002L5.95962 2.04041L6.87886 2.95964L2.48848 7.35002H16V8.65002H2.48848Z" fill="#676560"/>
        </svg>
      
      </button>
      <button class="product_info_size_btn">размерная сетка
        
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
        <path fill-rule="evenodd" clip-rule="evenodd" d="M2.48848 8.65002L6.87886 13.0404L5.95962 13.9596L0 8.00002L5.95962 2.04041L6.87886 2.95964L2.48848 7.35002H16V8.65002H2.48848Z" fill="#676560"/>
        </svg>
      
      </button>
    </div>

    <?php if($products) { ?>
      <p class="more_title">MORE</p>
      <div class="featured_products">
        <?php foreach($products as $product) { ?>

          <div class="product_item">
            <div class="product_images">
              <a href="<?php echo $product['href']; ?>">
                <img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" />
              </a>
              <a href="<?php echo $product['href']; ?>">
                <img src="<?php echo $product['prev_image']; ?>" alt="<?php echo $product['name']; ?>" />
              </a>
            </div>
            <div class="product_bottom_params">
              <div class="product_prices">
                <div class="product_name"><?php echo $product['name']; ?></div>
                <?php if($product['special']) { ?>
                  <div class="price"><?php echo $product['special']; ?></div>
                <?php } else { ?>
                  <div class="price"><?php echo $product['price']; ?></div>
                 <?php } ?>
              </div>
              <div class="wishlist_content">

                 <?php if($product['in_wish']) { ?>
                  <?php $wish_status = 'open'; ?>
                  <a class="wishlist_product_btn <?php echo $wish_status; ?>" onclick="wishlist.remove('<?php echo $product['product_id']; ?>');return false;" href="#" >
                <?php } else { ?>
                  <?php $wish_status = ''; ?>
                  <a class="wishlist_product_btn <?php echo $wish_status; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');return false;" href="#" >
                <?php } ?>

               
                  <svg class="wish_noactive" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                    <g clip-path="url(#clip0_33263_25458)"><path fill-rule="evenodd" clip-rule="evenodd" d="M3.73889 1.23062C3.63983 1.23062 3.30411 1.23062 3.30411 1.23062C3.30411 1.23062 3.30411 1.57594 3.30411 1.71979V13.4074L7.99955 9.846L12.6956 13.4076V1.71996C12.6956 1.57612 12.6956 1.2308 12.6956 1.2308C12.6956 1.2308 12.3599 1.2308 12.2608 1.2308L3.73889 1.23062ZM2 0C2 0 3.2614 -0.000176013 3.73889 -0.000176013L12.2608 0C12.7383 0 14 0.000612825 14 0.000612825C14 0.000612825 14 1.27791 14 1.71996V16L7.99998 11.4609L2.00052 15.9998L1.99976 1.71979C1.99976 1.27774 2 0 2 0Z" fill="#676560"></path>
                    </g><defs><clipPath id="clip0_33263_25458"><rect width="16" height="16" fill="white"></rect></clipPath></defs>
                  </svg>

                  <svg class="wish_active" width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g clip-path="url(#clip0_33263_39327)">
                      <path fill-rule="evenodd" clip-rule="evenodd" d="M2 0C2 0 3.2614 -0.000176013 3.73889 -0.000176013L12.2608 0C12.7383 0 14 0.000612825 14 0.000612825C14 0.000612825 14 1.27791 14 1.71996V16L7.99998 11.4609L2.00052 15.9998L1.99976 1.71979C1.99976 1.27774 2 0 2 0Z" fill="#676560"></path>
                    </g>
                    <defs>
                      <clipPath id="clip0_33263_39327">
                        <rect width="16" height="16" fill="white"></rect>
                      </clipPath>
                    </defs>
                  </svg>
                </a>
              </div>
            </div>
   
          </div>

          <?php } ?>
      </div>
    <?php } ?>
<div class="pagination"><?php echo $pagination; ?></div>
  </section>

  <div class="modal_product_info">
    <div class="close_modal">Скрыть</div>
    <div class="cities_switch_hide">
      <?php $l = 0; ?>
      <?php foreach($cities as $city) { ?>
        <?php if($city['store_id'] != 0) { ?>

          <?php if($l == 0) { ?>
              <?php $city_open = 'open'; ?>
          <?php } else { ?>
            <?php $city_open = ''; ?>
          <?php } ?>
          <button class="city_switch_item <?php echo $city_open; ?>" data-city="<?php echo $city['store_id']; ?>"><?php echo $city['name']; ?></button>
        
        <?php } ?>
        <?php $l++; ?>
      <?php } ?>
    </div>
    <div class="cities_switch">
    
    </div>
    <div class="switch_cities_content">

      <?php $o = 0; ?>

      <?php if($adresses) { ?>
        <div class="swiper-wrapper">
        <?php foreach($adresses as $key => $address) { ?>
        
         
          <div class="city_magazine  swiper-slide" data-city="<?php echo $key; ?>">
        
              <?php foreach($address as $addr) { ?>

                  <div class="address ">
        
                    <p class="address_title"><?php echo $addr['address']; ?></p>
                    <p class="short_address_title"><?php echo $addr['short_address']; ?></p>
                    <div class="available_option">

                      <?php if($options) { ?>

                        <?php foreach ($options as $option) { ?>

                          <?php $all_quantity = 0; ?>

                            <?php if($option['name'] == 'Размер') { ?>
                              <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <?php $all_quantity += $option_value[$addr['type_quantity']]; ?>
                              <?php } ?>
                            <?php } ?>

                            <?php if($all_quantity > 0) { ?>
                              <?php if($option['name'] == 'Размер') { ?>
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                      <div class="product_option_item">
                          

                                            <div class="size_name"><?php echo $option_value['name']; ?></div>
                                    
                                            <div class="size_quantity"> 
                                              <?php $av_text = ''; ?>
                                      
                                            

                                              <?php if($option_value[$addr['type_quantity']] < 1) { ?>
                                                <?php $av_text = ''; ?>
                                              <?php } ?>
                                              
                                              <?php if($option_value[$addr['type_quantity']] > 0 && $option_value[$addr['type_quantity']] < 5) { ?>
                                                <?php $av_text = 'Мало'; ?>
                                              <?php } ?>
                                          
                                              <?php if($option_value[$addr['type_quantity']] > 4 && $option_value[$addr['type_quantity']] < 8) { ?>
                                                <?php $av_text = ''; ?>
                                              <?php } ?>
                                        
                                              <?php if($option_value[$addr['type_quantity']] > 8) { ?>
                                                <?php $av_text = ''; ?>
                                              <?php } ?>

                                         
                                                <?php echo $av_text; ?>  

                                            </div>

                                

                                      </div> 
                                
            
                                <?php } ?>
                              <?php } ?>
                            <?php } else { ?>

                              <div class="product_option_item">
                                <div class="size_name not_av">
                                  Нет в наличии
                                </div>
                             
                              </div>

                            <?php } ?>
                        <?php } ?>

                      <?php } ?>

                    </div>
                  </div>
              <?php } ?>
        
          </div>

          <?php $o++; ?>
  
      <?php } ?>
    </div>
    <div class="swiper-pagination"></div>
      <?php } ?>
    </div>
  </div>
  
  <div class="modal_product_info_details">
    <div class="close_modal">Скрыть</div>
    <div class="product_info_sizes_content">
      <?php if($sizes) { ?>
        <div class="sizex_box">
          <?php echo $sizes; ?>
        </div>
  
      <?php } ?>
    </div>
    <div class="cities_switch_hide">
      <?php $l = 0; ?>

    
      <button class="city_switch_item open" data-city="0">Интернет магазин</button>
      <?php foreach($cities as $city) { ?>
        <?php if($city['store_id'] != 0) { ?>

          <button class="city_switch_item <?php echo $city_open; ?>" data-city="<?php echo $city['store_id']; ?>"><?php echo $city['name']; ?></button>
        
        <?php } ?>
        <?php $l++; ?>
      <?php } ?>
  
    </div>
    <div class="cities_switch"></div>
    <div class="switch_cities_content">

      <?php $o = 0; ?>

      <?php if($adresses) { ?>
        <div class="swiper-wrapper">
          <div class="city_magazine  swiper-slide" data-city="0">
            
            <div class="address">
              <p class="address_title">Доставка: курьер, почта</p>
              <p class="short_address_title">Россия, Казахстан, Беларусь, Киргизия, Армения</p>
              <div class="available_option">


                <?php if($options) { ?>

                  <?php foreach ($options as $option) { ?>
                    
                      <?php if($option['name'] == 'Размер') { ?>
                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                              <div class="product_option_item">

                                <div class="size_name"><?php echo $option_value['name']; ?></div>
                        
                              </div> 
                        
    
                        <?php } ?>
                      <?php } ?>
                  <?php } ?>

                <?php } ?>

              </div>
            </div>

            <div class="address_product_info_text">
              <div class="address_product_info_sku">
                <p class="text_title_info">артикул</p>
                <p class="text_title_value"><?php echo $sku; ?></p>
              </div>
              <div class="address_product_info_color">
                <p class="text_title_info ">Цвет</p>
                <p class="text_title_value"><?php echo $colorasprod; ?></p>
              </div>
              <div class="address_product_info_attr">

                <?php if ($attribute_groups) { ?>
    
                      <?php foreach ($attribute_groups as $attribute_group) { ?>
            
                        <?php if($attribute_group['name'] == 'Основа') { ?>
                          <p class="text_title_info "><?php echo $attribute_group['name']; ?></p>
                          <div class="attr_item_content">
                          <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                      
                              <div class="attr_item">
                                <div class="attr_name"><?php echo $attribute['name']; ?></div>
                                <div class="attr_value"><?php echo $attribute['text']; ?></div>
                              </div>
                           
                      
                            <?php } ?>
                          </div>
                        <?php } ?>

                      <?php } ?>
    
                  <?php } ?>

                </div>

          
            </div>

          </div>
        <?php foreach($adresses as $key => $address) { ?>
        
         
          <div class="city_magazine  swiper-slide" data-city="<?php echo $key; ?>">
        
              <?php foreach($address as $addr) { ?>

                  <div class="address ">
        
                    <p class="address_title"><?php echo $addr['address']; ?></p>
                    <p class="short_address_title"><?php echo $addr['short_address']; ?></p>
                    <div class="available_option">

                      <?php if($options) { ?>

                        <?php foreach ($options as $option) { ?>

                          <?php $all_quantity = 0; ?>

                            <?php if($option['name'] == 'Размер') { ?>
                              <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <?php $all_quantity += $option_value[$addr['type_quantity']]; ?>
                              <?php } ?>
                            <?php } ?>

                            <?php if($all_quantity > 0) { ?>
                              <?php if($option['name'] == 'Размер') { ?>
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                      <div class="product_option_item">
                          

                                            <div class="size_name"><?php echo $option_value['name']; ?></div>
                                    
                                            <div class="size_quantity"> 
                                              <?php $av_text = ''; ?>
                                      
                                            

                                              <?php if($option_value[$addr['type_quantity']] < 1) { ?>
                                                <?php $av_text = ''; ?>
                                              <?php } ?>
                                              
                                              <?php if($option_value[$addr['type_quantity']] > 0 && $option_value[$addr['type_quantity']] < 5) { ?>
                                                <?php $av_text = 'Мало'; ?>
                                              <?php } ?>
                                          
                                              <?php if($option_value[$addr['type_quantity']] > 4 && $option_value[$addr['type_quantity']] < 8) { ?>
                                                <?php $av_text = ''; ?>
                                              <?php } ?>
                                        
                                              <?php if($option_value[$addr['type_quantity']] > 8) { ?>
                                                <?php $av_text = ''; ?>
                                              <?php } ?>

                                                <?php print_r($option_value[$addr['type_quantity']]); ?>
                                                <?php echo $av_text; ?>  

                                            </div>

                                

                                      </div> 
                                
            
                                <?php } ?>
                              <?php } ?>
                            <?php } else { ?>

                              <div class="product_option_item">
                                <div class="size_name not_av">
                                  Нет в наличии
                                </div>
                             
                              </div>

                            <?php } ?>
                        <?php } ?>

                      <?php } ?>

                    </div>
                  </div>
              <?php } ?>
              <div class="address_product_info_text">
                <div class="address_product_info_sku">
                  <p class="text_title_info">артикул</p>
                  <p class="text_title_value"><?php echo $sku; ?></p>
                </div>
                <div class="address_product_info_color">
                  <p class="text_title_info ">Цвет</p>
                  <p class="text_title_value"><?php echo $colorasprod; ?></p>
                </div>
                <div class="address_product_info_attr">
  
                  <?php if ($attribute_groups) { ?>
      
                        <?php foreach ($attribute_groups as $attribute_group) { ?>
              
                          <?php if($attribute_group['name'] == 'Основа') { ?>
                            <p class="text_title_info "><?php echo $attribute_group['name']; ?></p>
                            <div class="attr_item_content">
                            <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                        
                                <div class="attr_item">
                                  <div class="attr_name"><?php echo $attribute['name']; ?></div>
                                  <div class="attr_value"><?php echo $attribute['text']; ?></div>
                                </div>
                             
                        
                              <?php } ?>
                            </div>
                          <?php } ?>
  
                        <?php } ?>
      
                    <?php } ?>
  
                  </div>
  
            
              </div>
          </div>

          <?php $o++; ?>
  
      <?php } ?>
    </div>
    <div class="swiper-pagination"></div>
      <?php } ?>
    </div>
  </div>
  
  <div class="modal_product_info_sizes">
    <div class="close_modal">Скрыть</div>

    <div class="product_info_sizes_content">
      <?php if($sizes) { ?>
        <div class="sizex_box">
          <?php echo $sizes; ?>
        </div>
  
      <?php } ?>
    </div>
    
  </div>

<script>

  $(document).ready(function(){

    $('.chat_btn').click(function(){
      $('.chat_content').toggleClass('open');
      $('.overlay_blur').toggleClass('open');
    });

    $('.overlay_blur').click(function(){
      $('.chat_content').toggleClass('open');
      $('.overlay_blur').toggleClass('open');
    });

    $('.magazines_available').click(function(){
        $('.modal_product_info').fadeIn();
      });
    $('.product_info_btn').click(function(){
        $('.modal_product_info_details').fadeIn();
      });
    $('.product_info_size_btn').click(function(){
        $('.modal_product_info_sizes').fadeIn();
      });

      

      $('.close_modal').click(function(){
        $('.modal_product_info_details').fadeOut();
        $('.modal_product_info').fadeOut();
        $('.modal_product_info_sizes').fadeOut();
      });

      const swiper = new Swiper('.modal_product_info .switch_cities_content', {
          pagination: {
          el: '.modal_product_info .cities_switch',
          type: 'bullets',
          clickable: true,
          renderBullet: function (index, className) {
            return '<button class="city_switch_item ' + className + '">' + $('.modal_product_info .cities_switch_hide .city_switch_item').eq((index - 1) + 1).text().trim() + "</button>";
          },
        },
      });
      const swiper1 = new Swiper('.modal_product_info_details .switch_cities_content', {
        pagination: {
        el: '.modal_product_info_details .cities_switch',
        type: 'bullets',
        clickable: true,
        renderBullet: function (index, className) {
          return '<button class="city_switch_item ' + className + '">' + $('.modal_product_info_details .cities_switch_hide .city_switch_item').eq((index - 1) + 1).text().trim() + "</button>";
        },
      },
    });
 


    $('#button-cart').on('click', function() {
      $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
        dataType: 'json',
        beforeSend: function() {

        },
        complete: function() {

        },
        success: function(json) {

       

          $('.alert, .text-danger').remove();
          $('.form-group').removeClass('has-error');

          if (json['error']) {

            if (json['error']['option']) {

              $('.option_size_list').fadeToggle();

            }

            if (json['error']['recurring']) {
              $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
            }

            // Highlight any found errors
            $('.text-danger').parent().addClass('has-error'); 

          }

          if (json['success']) {
            $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

            $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
            // json['success']
            $('body').append('<div class="success_wrapper_note"><div class="success_in_cart"></div></div>');


            var html = '<div class="in_cart_content" onclick="location.href = \'/cart\'">';
            html += '<div class="in_cart_image">';
            html +=  '<img src="'+$('.big_image a.thumbnail img').attr('src')+'" alt="'+$('h1').text().trim()+'" />';
            html +=  '</div>';
            html +=  '<div class="in_cart_product_info">';

            if($('.option_values_btn span').length > 0){
              html +=  '<p class="title">'+$('h1').text().trim()+'('+$('.option_values_btn span').text().trim()+') </p>';
            } 
     
            if($('.options.single label').length > 0){
              html +=  '<p class="title">'+$('h1').text().trim()+'('+$('.options.single label').text().trim()+') </p>';
            } 
 
     
            html +=  '<p class="desc">Товар добавлен в корзину</p>';
            html += '</div>';
            html += '</div>';
            html += '<div class="cart_icon">';
            html += '<div class="cart_icon_content">';
            html += '<img src="/image/cart.svg" alt="cart" />';
            html += '<span>'+json['count_cart']+'</span>';
            html += '</div>';
            html += '</div>';

            if(json['count_cart'] > 0){
              $('.cart_btn').addClass('open');
            } else {
              $('.cart_btn').removeClass('open');
            }

            $('.cart_btn span').html(json['count_cart']);
           

            $('.success_in_cart').html(html);
     
            $('.success_wrapper_note').animate({top:'-=10px',opacity:'1'},150);
       
            setTimeout(function(){
              $('.success_wrapper_note').fadeOut(300);
              $('.success_wrapper_note').remove();
            },3000);

            $('#cart > ul').load('index.php?route=common/cart/info ul li');
          }
        },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
      });
    });

  });

</script>
<div class="overlay_blur"></div>
<?php echo $footer; ?>
