<?php echo $header; ?>

  <section id="hero">

    <?php echo $content_top; ?>

  </section>
  <?php if($products) { ?>
    <section id="home_products">
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
              <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');return false;" href="#" >
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                  <g clip-path="url(#clip0_33263_25458)"><path fill-rule="evenodd" clip-rule="evenodd" d="M3.73889 1.23062C3.63983 1.23062 3.30411 1.23062 3.30411 1.23062C3.30411 1.23062 3.30411 1.57594 3.30411 1.71979V13.4074L7.99955 9.846L12.6956 13.4076V1.71996C12.6956 1.57612 12.6956 1.2308 12.6956 1.2308C12.6956 1.2308 12.3599 1.2308 12.2608 1.2308L3.73889 1.23062ZM2 0C2 0 3.2614 -0.000176013 3.73889 -0.000176013L12.2608 0C12.7383 0 14 0.000612825 14 0.000612825C14 0.000612825 14 1.27791 14 1.71996V16L7.99998 11.4609L2.00052 15.9998L1.99976 1.71979C1.99976 1.27774 2 0 2 0Z" fill="#676560"></path>
                  </g><defs><clipPath id="clip0_33263_25458"><rect width="16" height="16" fill="white"></rect></clipPath></defs>
                </svg>
              </a>
            </div>
          </div>
 
        </div>
      <?php } ?>
    </section>
  <?php } ?>
  <div class="home_pagination">
    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
  </div>
  <script src="catalog/view/javascript/scrollHandler.js"></script>
<?php echo $footer; ?>