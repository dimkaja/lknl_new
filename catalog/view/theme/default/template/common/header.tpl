<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title;  ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>

<link rel="stylesheet" href="/catalog/view/theme/default/stylesheet/reset.css" />
 <?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>

<meta name="robots" content="noindex,nofollow"/> 



<script src="/catalog/view/javascript/select2.min.js?v=<?php echo rand(1,57935673576); ?>" type="text/javascript"></script>
<link href="/catalog/view/theme/default/stylesheet/select2.min.css" rel="stylesheet" />

<link href="/catalog/view/theme/default/stylesheet/stylesheet.css?v=<?php echo rand(1,57935673576); ?>" rel="stylesheet">
<link href="/catalog/view/theme/default/stylesheet/search.css?v=<?php echo rand(1,57935673576); ?>" rel="stylesheet">
<link href="/catalog/view/theme/default/stylesheet/product_item.css?v=<?php echo rand(1,57935673576); ?>" rel="stylesheet">

<script src="catalog/view/javascript/common.js?v=<?php echo rand(1,57935673576); ?>" type="text/javascript"></script>

<link href="/catalog/view/theme/default/stylesheet/header.css?v=<?php echo rand(1,57935673576); ?>" rel="stylesheet">
</head>
<body class="<?php echo $class; ?>">

<header>
    <div class="header_box">
        <?php if($route != 'common/home' && $route != 'product/category') { ?>
          <button class="back_to_page" onclick="history.back()"><svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M2.48848 8.65002L6.87886 13.0404L5.95962 13.9596L0 8.00002L5.95962 2.04041L6.87886 2.95964L2.48848 7.35002H16V8.65002H2.48848Z" fill="#676560"></path></svg></button>
        <?php } ?>


        <?php if($route != 'checkout/auth') { ?>
          <div class="header_item logo">
              <?php if ($logo) { ?>
                  <?php if ($home == $og_url) { ?>
                    <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
                  <?php } else { ?>
                    <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                  <?php } ?>
                <?php } else { ?>
                  <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
              <?php } ?>
          </div>
          <div class="header_item btns">
              <div class="search_btn">
                  <?php echo $search; ?>
              </div>
              <?php if($count_cart) { ?>
                <?php $class_cart = 'open'; ?>
              <?php } else { ?>
                <?php $class_cart = ''; ?>
              <?php } ?>
              <div class="cart_btn <?php echo $class_cart; ?>" onclick="location.href = '<?php echo $cart_link; ?>'">
            
                    <img src="/image/cart.svg" alt="cart">
                    <span><?php echo $count_cart; ?></span>
      
              </div>

              <?php if($count_wish) { ?>
                <?php $class_wish = 'open'; ?>
              <?php } else { ?>
                <?php $class_wish = ''; ?>
              <?php } ?>

              <div class="wish_btn <?php echo $class_wish; ?>" onclick="location.href = '<?php echo $wish_link; ?>'">
            
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                    <g clip-path="url(#clip0_33263_25458)"><path fill-rule="evenodd" clip-rule="evenodd" d="M3.73889 1.23062C3.63983 1.23062 3.30411 1.23062 3.30411 1.23062C3.30411 1.23062 3.30411 1.57594 3.30411 1.71979V13.4074L7.99955 9.846L12.6956 13.4076V1.71996C12.6956 1.57612 12.6956 1.2308 12.6956 1.2308C12.6956 1.2308 12.3599 1.2308 12.2608 1.2308L3.73889 1.23062ZM2 0C2 0 3.2614 -0.000176013 3.73889 -0.000176013L12.2608 0C12.7383 0 14 0.000612825 14 0.000612825C14 0.000612825 14 1.27791 14 1.71996V16L7.99998 11.4609L2.00052 15.9998L1.99976 1.71979C1.99976 1.27774 2 0 2 0Z" fill="#676560"></path>
                    </g><defs><clipPath id="clip0_33263_25458"><rect width="16" height="16" fill="white"></rect></clipPath></defs>
                  </svg>
                    <span><?php echo $count_wish; ?></span>
      
              </div>
    
              <div class="menu_btn">
                <img src="/image/menu.svg" alt="Menu" />
            </div>
          </div>
        <?php } else { ?>

          <div class="header_item logo auth">
            <h1>Авторизация</h1>
            <p class="р1_subtitle">введите номер телефона, на него
              поступит звонок</p>
          </div>

        <?php } ?>
       
    </div>

    
    <div id="top_menu">
      <div class="top_menu_params">
        <div class="search_btn">
            <?php echo $search; ?>
        </div>
        <div class="header_item logo">
            <?php if ($logo) { ?>
                <?php if ($home == $og_url) { ?>
                  <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
                <?php } else { ?>
                  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                <?php } ?>
              <?php } else { ?>
                <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
            <?php } ?>
        </div>
        <div class="close"><img src="/image/cross.svg" alt="close button"></div>
      </div>
      <nav>
        <div class="nav_top_values">
          <?php if($cities) { ?>  
            <div class="cities">
              <div class="city_select">
                <?php if($store_selected) { ?>
                 <div class="city_selected"><?php echo $store_selected['name']; ?></div>
                <?php } else  { ?>
                  <div class="city_selected">Интернет-магазин</div>
                <?php } ?> 
                <ul>
     
                  <?php if($store_selected) { ?>

                    <?php foreach($cities as $city) { ?>  
               
                      <?php if($city['store_id'] == $store_selected['store_id']) { ?>
                        
                        <li data-value="<?php echo $city['store_id']; ?>" class="checked"><?php echo $city['name']; ?></li>
                      <?php } else { ?>
                        <li data-value="<?php echo $city['store_id']; ?>"><?php echo $city['name']; ?></li>
                      <?php } ?>
                     
                    <?php } ?>  
                    <?php if($store_selected['store_id'] == 0) { ?>
                      <li data-value="0" class="checked">Интернет-магазин</li>
                    <?php } else { ?>
                      <li data-value="0">Интернет-магазин</li>
                    <?php } ?>
                    

                  <?php } else { ?>
                    <?php foreach($cities as $city) { ?>  
                      <?php if($city['store_id'] == $store_selected) { ?>
                        <li data-value="<?php echo $city['store_id']; ?>" class="checked"><?php echo $city['name']; ?></li>
                      <?php } else { ?>
                        <li data-value="<?php echo $city['store_id']; ?>"><?php echo $city['name']; ?></li>
                      <?php } ?>
                     
                    <?php } ?>  
                    <li data-value="0" class="checked">Интернет-магазин</li>
                  <?php } ?>

                </ul>
              </div>

            </div>   
           <?php } ?>  

           <?php if($informations) { ?>
            <div class="info_content">
              <div class="info_btn">+ИНФО</div>
              <div class="info_list">
                <?php foreach($informations as $information) { ?>
                    <a href="<?php echo $information['href']; ?>"><?php echo $information['name']; ?></a>
                <?php } ?>
              </div>
            </div>


           <?php } ?>
        </div>
        <ul class="menu_categories">

 
          <?php foreach ($categories as $category) { ?>
              <?php if ($category['children']) { ?>
  
              <li class="dropdown">
                <a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>

                <div class="dropdown-menu">
                  <div class="dropdown-inner">
  
                    <ul class="list-unstyled">
                      <li><a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $category['text_all']; ?></a></li>
                      <?php foreach ($category['children'] as $child) { ?>
                      <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                      <?php } ?>
                    </ul>
            
                  </div>
                </div>
              </li>
              <?php } else { ?>
              <li class="no_d"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
              <?php } ?>
            <?php } ?>
          </ul>
        
      </nav>
      <div class="nav_bottom_values">
        <a class="lk_link" href="/profile"><img src="/image/profile.svg" alt="Личный кабинет"><span>личный кабинет</span></a>
        <a href="https://api.whatsapp.com/send/?phone=79050221220&text&type=phone_number&app_absent=0">Чат</a>
      </div>
    </div>

</header>
