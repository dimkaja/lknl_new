<?php echo $header; ?>


<link href="/catalog/view/theme/default/stylesheet/category_page.css?v=<?php echo rand(1,679486783567); ?>" rel="stylesheet" />
<link href="/catalog/view/theme/default/stylesheet/filter.css?v=<?php echo rand(1,679486783567); ?>" rel="stylesheet" />
<div class="product_content_wrapper">

  <div class="product_content_box">
 
    <div id="content" ><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>

      <?php if ($top_categories) { ?>
  

        <div class="categories_top">
          <div class="selected_category"><?php echo $current_category['name']; ?></div>




          <?php if(count($top_categories) > 1) { ?>
            <div class="categories_top_content">
           

              <?php foreach ($top_categories as $category) { ?>
                <?php if($current_category['category_id'] == $category['category_id']) { ?>
                  <div data-value="<?php echo $category['category_id']; ?>" class="category_item checked"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></div>
                <?php } else { ?>
                  <div data-value="<?php echo $category['category_id']; ?>" class="category_item"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></div>
                <?php } ?>
               
                <?php } ?>
            </div>
          <?php } ?>
        
            <div class="filters_picked"></div>
        </div>

      <?php } ?>
      <?php if ($products) { ?>
      
      <div class="product_content">
        <?php foreach ($products as $product) { ?>
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
                  <a class="wishlist_product_btn <?php echo $wish_status; ?>" data-product="<?php echo $product['product_id']; ?>" onclick="wishlist.remove('<?php echo $product['product_id']; ?>');return false;" href="#" >
                <?php } else { ?>
                  <?php $wish_status = ''; ?>
                  <a class="wishlist_product_btn <?php echo $wish_status; ?>" data-product="<?php echo $product['product_id']; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');return false;" href="#" >
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
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<button class="filter_products">ФИЛЬТР</button>

<script src="catalog/view/javascript/scrollHandler.js"></script>
<?php echo $footer; ?>
