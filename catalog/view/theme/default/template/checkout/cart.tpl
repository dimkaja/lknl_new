<?php echo $header; ?>
<link href="/catalog/view/theme/default/stylesheet/cart_page.css" rel="stylesheet" />

<link rel="stylesheet" href="/catalog/view/theme/default/stylesheet/swiper.css?v=<?php echo rand(1,57935673576); ?>">
<script src="/catalog/view/javascript/swiper.js?v=<?php echo rand(1,57935673576); ?>"></script>

  <div id="cart_content">

    <div class="cart_switcher">
      <div class="switch_item cart_switch active" data-value="cart_box">
        <div class="switch_item_box">
          <img src="/image/cart.svg" alt="cart">
          <span><?php echo $count_cart; ?></span>
        </div>

      </div>
      <div class="switch_item wish_switch" data-value="wish_box">
        <div class="switch_item_box">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
            <g clip-path="url(#clip0_33263_25458)"><path fill-rule="evenodd" clip-rule="evenodd" d="M3.73889 1.23062C3.63983 1.23062 3.30411 1.23062 3.30411 1.23062C3.30411 1.23062 3.30411 1.57594 3.30411 1.71979V13.4074L7.99955 9.846L12.6956 13.4076V1.71996C12.6956 1.57612 12.6956 1.2308 12.6956 1.2308C12.6956 1.2308 12.3599 1.2308 12.2608 1.2308L3.73889 1.23062ZM2 0C2 0 3.2614 -0.000176013 3.73889 -0.000176013L12.2608 0C12.7383 0 14 0.000612825 14 0.000612825C14 0.000612825 14 1.27791 14 1.71996V16L7.99998 11.4609L2.00052 15.9998L1.99976 1.71979C1.99976 1.27774 2 0 2 0Z" fill="#676560"></path>
            </g><defs><clipPath id="clip0_33263_25458"><rect width="16" height="16" fill="white"></rect></clipPath></defs>
          </svg>
          <span><?php echo $count_wishlist; ?></span>
        </div>
      
      </div>

    </div>
    <div class="cart_swiper_pagination"></div>
    <div class="cart_content_box">
      <div class="swiper-wrapper">
        <div class="cart_content swiper-slide" data-value="cart">
          <div class="cart_content_title">
            <p>корзина (<?php echo $count_cart; ?>)</p>
            <a class="delivery_info" href="/articles/oplata-i-dostavka">условия доставки<img src="/image/back.svg" alt="arrow"> </a>
          </div>
          <div class="cart_content_info">
            <?php if($products) { ?>
              <?php foreach($products as $product) { ?>
                <div class="product_item">
                  <img class="delete" data-product="<?php echo $product['cart_id']; ?>" data-event="cart" src="/image/cross.svg" alt="close button">
                  <div class="product_img">
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
                  </div>
                  <div class="product_info">
                    <p class="product_sku"><?php echo $product['sku']; ?></p>
                    <p class="product_title"><?php echo $product['name']; ?></p>
                 
                    <?php if($product['options']) { ?>
                      <div class="options">
                        <div class="product_option">
                          <div class="product_option_select">размер -  <?php echo $product['option'][0]['value']; ?> <img src="/image/arrow-down-no-extra-space.svg" alt="<?php echo $product['option'][0]['value']; ?>" /></div>
                            <div class="product_option_list">
                            <?php foreach($product['options'] as $options) { ?>
                                <?php foreach($options['product_option_value'] as $option) { ?>
                                  <?php if($product['option'][0]['value'] == $option['name']) { ?>
                                    <div class="product_option_item active" cart-id="<?php echo $product['cart_id']; ?>" data-option="<?php echo $options['product_option_id']; ?>" value="<?php echo $option['product_option_value_id']; ?>"><?php echo $option['name']; ?></div>
                                  <?php } else { ?>
                                    <div class="product_option_item" cart-id="<?php echo $product['cart_id']; ?>"  data-option="<?php echo $options['product_option_id']; ?>" value="<?php echo $option['product_option_value_id']; ?>"><?php echo $option['name']; ?></div>
                                  <?php } ?>
                               
                                <?php } ?>
                              <?php } ?>
                            </div>
                          </div>
                   
                      </div>
                    <?php } ?>
                    <?php $product_id = $product['product_id']; ?>

                    <?php if($product['in_wish']) { ?>
                      <?php $wish_status = 'open'; ?>

                        <a class="wishlist_product_btn wishlist_btn <?php echo $wish_status; ?>" data-product="<?php echo $product_id; ?>" onclick="wishlist.remove('<?php echo $product_id; ?>');return false;" href="#">
                    <?php } else { ?>
                      <?php $wish_status = ''; ?>
                      <a class="wishlist_product_btn wishlist_btn <?php echo $wish_status; ?>" data-product="<?php echo $product_id; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');return false;" href="#">
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
                    <div class="product_price">
                      <?php if($product['special']) { ?>
                        <p class="price"><?php echo $product['special']; ?></p>
                        <p class="old_price"><?php echo $product['price']; ?></p>
                      <?php } else { ?>
                        <p class="price"><?php echo $product['price']; ?></p>
                      <?php } ?>
                    </div>
                  </div>
                </div>
              <?php } ?>
            <?php } ?>
          </div>
          <?php if($products) { ?>
            <div class="checkout_total">
              <button class="checkout_content_btn" onclick="document.location.href = '<?php echo $checkout; ?>'" type="button">
                <div class="checkout_content_title">
                  <p>оформить</p>  
                </div>
                <div class="checkout_content_total">
      
                  <span class="cart_total"><?php echo $cart_total; ?></span>
      
                </div>
              
              </button>
            </div>
          <?php } ?>
        </div>


        <div class="cart_content swiper-slide" data-value="wish">
          <div class="cart_content_info">
            <?php if($wish_products) { ?>
              <?php foreach($wish_products as $wish_product) { ?>

                <div class="wish_product">
                  <img class="delete" data-event="wishlist" data-product="<?php echo $wish_product['product_id']; ?>" src="/image/cross.svg" alt="close button">
                  <div class="product_img">
                    <a href="<?php echo $wish_product['href']; ?>"><img src="<?php echo $wish_product['thumb']; ?>" alt="<?php echo $wish_product['name']; ?>" /></a>
                  </div>
                  <p class="product_title"><?php echo $wish_product['name']; ?></p>
                  <div class="product_price">
                    <?php if($wish_product['special']) { ?>
                      <p class="price"><?php echo $wish_product['special']; ?></p>
                      <p class="old_price"><?php echo $wish_product['price']; ?></p>
                    <?php } else { ?>
                      <p class="price"><?php echo $wish_product['price']; ?></p>
                    <?php } ?>
                  </div>
                </div>

              <?php } ?>
            <?php } ?>

        </div>
      </div>

    </div>

  </div>


  <script>

    var swiper = new Swiper(".cart_content_box", {
      pagination: {
        el: ".cart_swiper_pagination",
        clickable: true,
        renderBullet: function (index, className) {
      
          return '<span class="switch_item ' + className + '">' + $('.switch_item').eq(index).html() + "</span>";
        },
      },
    });

      $(document).mouseup(function(e) {
        var container = $(".product_option_list.open");
        if (!container.is(e.target) && container.has(e.target).length === 0) {
          $('.product_option_list.open').removeClass('open');
        }
      });

      $(document).ready(function(){

        const url = new URL(window.location.href); 
        const params = new URLSearchParams(url.search);

        var index = params.get('index');

        if(index == 1) {

          setTimeout(() => {
            $('.cart_swiper_pagination .switch_item:last-child').trigger('click');
          }, 100);
         
        }

        $('body').on('click','button.notify_delete',function(){
          var getEvent = $(this).parent().parent().find('.event').text().trim();
          var productData = $(this).parent().parent().find('.product_data').text().trim();

          if(getEvent == 'wishlist'){


            // $.ajax({
            //     url: 'index.php?route=account/wishlist/remove',
            //     type: 'post',
            //     data: {product_id:productData},
            //     dataType: 'json',
            //     beforeSend: function(data) {
            //       console.log(data);
            //     },
            //     success: function(json) {
            //       console.log(json);

            //       if(json['product_id']){
            //         $('.delete[data-product='+json['product_id']+']').parent().remove();

            //         $('.modal_notify').hide();
            //         $('.notify_overlay').hide();

            //         if(json['count_cart'] < 1){
            //           json['count_cart'] = 0;
            //         }

            //         $('.switch_item:first-child span').html(json['count_cart']);

            //         $('.switch_item:last-child .switch_item_box span').html(json['total']);
			      //       	$('.wish_btn span').html(json['total']);

            //         $('.cart_content_info .product_info a.wishlist_btn[data-product='+productData+']').removeClass('open');

            //         var onClickAttr = $('.wishlist_product_btn[data-product='+productData+']').attr('onclick');

            //         var newAttr = onClickAttr.replace("remove", "add");
            //         $('.wishlist_product_btn[data-product='+productData+']').attr('onclick',newAttr);

            //         if(json['total']){
            //           $('.wish_btn').addClass('open');
            //         } else {
            //           $('.wish_btn').removeClass('open');
            //         }


            //       }

            //     }
            //   });

          }   

          if(getEvent == 'cart'){

              $.ajax({
                url: 'index.php?route=checkout/cart/remove',
                type: 'post',
                data: {key:productData},
                dataType: 'json',
                beforeSend: function(data) {
                  console.log(data);
                },
                success: function(json) {
                  console.log(json);

                  if(json['cart_id']){
                    $('.delete[data-product='+json['cart_id']+']').parent().remove();

                    $('.modal_notify').hide();
                    $('.notify_overlay').hide();

                    if(json['count_cart'] < 1){
                      json['count_cart'] = 0;
                    }

                    $('.switch_item:first-child span').html(json['count_cart']);
                    $('.cart_btn span').html(json['count_cart']);
                  }

                }
              });

          }

        });
        
        $('body').on('click','.wish_product img.delete',function(){

          var productData = $(this).attr('data-product');

          $.ajax({
                url: 'index.php?route=account/wishlist/remove',
                type: 'post',
                data: {product_id:productData},
                dataType: 'json',
                beforeSend: function(data) {
                  console.log(data);
                },
                success: function(json) {
                  console.log(json);

                  if(json['product_id']){
                    $('.delete[data-product='+json['product_id']+']').parent().remove();

                    $('.modal_notify').hide();
                    $('.notify_overlay').hide();

                    if(json['count_cart'] < 1){
                      json['count_cart'] = 0;
                    }

                    $('.switch_item:first-child span').html(json['count_cart']);

                    $('.switch_item:last-child .switch_item_box span').html(json['total']);
			            	$('.wish_btn span').html(json['total']);

                    $('.cart_content_info .product_info a.wishlist_btn[data-product='+productData+']').removeClass('open');

                    var onClickAttr = $('.wishlist_product_btn[data-product='+productData+']').attr('onclick');

                    var newAttr = onClickAttr.replace("remove", "add");
                    $('.wishlist_product_btn[data-product='+productData+']').attr('onclick',newAttr);

                    if(json['total']){
                      $('.wish_btn').addClass('open');
                    } else {
                      $('.wish_btn').removeClass('open');
                    }


                  }

                }
              });

        });

        
        $('body').on('click','.product_item img.delete',function(){



          var getEvent = $(this).attr('data-event');
          var getProductData = $(this).attr('data-product');

          $('.modal_notify').fadeIn();
          $('.notify_overlay').fadeIn();

          $('.modal_notify .event').html(getEvent);
          $('.modal_notify .product_data').html(getProductData);


        });

        $('.notify_cancel, .notify_overlay').click(function(){
          $('.modal_notify').fadeOut();
          $('.notify_overlay').fadeOut();
        });

        $('.product_option .product_option_select').click(function(){
          $('.product_option_list.open').removeClass('open');
          $(this).parent().find('.product_option_list').addClass('open');
        });

        $('.product_option_list .product_option_item').click(function(){
          $(this).parent().find('.product_option_item').removeClass('active');
          $(this).addClass('active');
          $(this).parent().removeClass('open');

          $(this).parent().parent().find('.product_option_select').html('размер - ' + $(this).text().trim() + ' <img src="/image/arrow-down-no-extra-space.svg" alt="S">');

          var cart_id = $(this).attr('cart-id');

          var option_value_id = $(this).attr('data-option');
          var product_option_value_id = $(this).attr('value');



              $.ajax({
                    url: 'index.php?route=checkout/cart/updateSize',
                    type: 'post',
                    data: {cart_id:cart_id,option_value_id:option_value_id,product_option_value_id:product_option_value_id},
                    dataType: 'json',
                    beforeSend: function(data) {
                      console.log(data);
                    },
                    success: function(json) {

                    }

              });

          });
      });
</script>

<div class="modal_notify">
  <span class="event" style="display:none"></span>
  <span class="product_data" style="display:none"></span>
  <div class="notify_title">Вы уверены?</div>
  <div class="notify_desc">подтвердите, что хотите удалить товар из корзины</div>
  <div class="notify_btns">
    <button class="notify_delete">удалить</button>
    <button class="notify_cancel">отмена</button>
  </div>

</div>
<div class="notify_overlay"></div>

<?php echo $footer; ?>
