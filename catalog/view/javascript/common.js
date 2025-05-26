

function getURLVar(key) {
	var value = [];

	var query = document.location.search.split('?');

	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');

			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}

		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
}


$(document).mouseup(function(e) {
	var container = $(".options.multi");
	if (!container.is(e.target) && container.has(e.target).length === 0) {
	  $('.option_size_list').fadeOut();
	}
});

$(document).ready(function() {

	$('.wishlist_product_btn').click(function(){
		
	

		var productId = $(this).attr('data-product');
		$('.wishlist_product_btn[data-product='+productId+']').toggleClass('open');
		console.log(productId);

		if($(this).hasClass('open')){
			var onClickAttr = $('.wishlist_product_btn[data-product='+productId+']').attr('onclick');

			var newAttr = onClickAttr.replace("add", "remove");
			$('.wishlist_product_btn[data-product='+productId+']').attr('onclick',newAttr);

		} else {
			var onClickAttr = $('.wishlist_product_btn[data-product='+productId+']').attr('onclick');

			var newAttr = onClickAttr.replace("remove", "add");
			$('.wishlist_product_btn[data-product='+productId+']').attr('onclick',newAttr);
		}
	

	});

	if($('.swiper').length > 0){
		const swiper = new Swiper('.swiper', {
			pagination: {
			el: '.swiper-pagination',
			type: 'bullets',
			clickable: true
		  },
		});
	}


	$('.options.multi').click(function(e){
		console.log('class '+e.target.className);
		console.log('tag '+e.target.tagName);
		if(e.target.className == 'options multi' || e.target.className == 'option_values_btn' || e.target.tagName == 'IMG' || e.target.tagName == 'SPAN'){
			$('.option_size_list').fadeToggle();
		} else {
			$('.option_size_list').fadeOut();
		}

	});

	$('.city_switch_item').click(function(){
		$('.city_switch_item').removeClass('open');
		$(this).addClass('open');


	
	});

	$('.option_size_list .radio label').click(function(){
		$('.option_size_list .radio label').removeClass('checked');
		$(this).addClass('checked');
		$('.option_values_btn > span').html($(this).text().trim());
	});

	$('body').on('click','.filters_picked .btn',function(){
		var attrBtn = $(this).attr('data-clear');
		$('.dream-filter .rdf-picked button[data-clear="'+attrBtn+'"]').trigger('click');
		$(this).remove();
		$('#rdrf-form32').submit();
		console.log(attrBtn);

		if($('.panel-collapse:not(.cur_magazine) label input[type="checkbox"]:checked').length == 0){
			$('button.filter_products span.clear_filters').remove();
			$('.categories_top').removeClass('select_box');
			$('.selected_category').after($('.categories_top_content'));
		}
	});


	$('body').on('click','.filter_products span.clear_filters',function(){
		$('button#rdrf-reset32').trigger('click');
		$(this).remove();

		$('.filters_picked').html('');
		
			
		$('.categories_top').removeClass('select_box');

		$('.selected_category').after($('.categories_top_content'));

	});

	$('body').on('click','.categories_top.select_box .selected_category',function(){
		$('.categories_top_content').slideToggle();
	});

	$('body').on('click','.dream-filter button#rdrf-popper-btn32',function(){


		localStorage.setItem('clickToFilterBtn',true);


	});
	$('body').on('click','.dream-filter .panel-body  label',function(){
		console.log($(this).parent().parent().parent().parent().parent().attr('class'));
		if($(this).parent().parent().parent().parent().parent().hasClass('cur_magazine')){

			var magLength = $(this).parent().parent().find('input[type="checkbox"]:checked').length;

			if(magLength <= 0){
				$('.magazines_text span').html('');
				$('.magazines_text').removeClass('m_checked');
			} else {
				$('.magazines_text').addClass('m_checked');
				$('.magazines_text span').html('('+magLength+')');
			}
			
		}
	});

	$('body').on('click','.magazines_select .cities ul li',function(){

		$('.magazines_select .cities ul li').removeClass('checked');
		$(this).addClass('checked');
		
		$('.magazines_select .cities .city_selected').html($(this).text().trim());

		var curMagazine = $(this).text().trim();

		if($('.rdf-filters').length > 0){
			$('.magazines_text').removeClass('m_checked');
			$('.rdf-filters .panel-group .panel').each(function(){
				var titleParam = $(this).find('.panel-title').text().trim();

				if(curMagazine == titleParam){
					$('.rdf-filters .panel-collapse.collapse:not(.in)').removeClass('show');
					var optionLength =$(this).find('input[type="checkbox"]').length;

					$('.magazines_text').addClass('m_checked');
					$('.magazines_text span').html('('+optionLength+')');

					$('.rdf-filters .panel-group .panel').find('input[type="checkbox"]').prop('checked',false);
					$(this).find('input[type="checkbox"]').removeAttr('disabled');
					$(this).find('input[type="checkbox"]').prop('checked',true);

					$(this).find('input[type="checkbox"]:first-child').change();

					$('#rdrf-form32').submit();

					$(this).find('.panel-collapse.collapse').addClass('show cur_magazine');

					setTimeout(function(){
						var textBtn = $('.dream-filter .popper span').text().trim();

						var textBtnSplit = textBtn.split(' ');
	
						var countProduct = textBtnSplit[1]
						
						$('.dream-filter .popper button').text('Показать' + ' ('+countProduct+')');

					},300);
					
					$('#top_menu .city_select ul li').each(function(){
						var curstore = $(this).text().trim();
				
						if(curMagazine == curstore) {
							$('#top_menu .city_select ul li').removeClass('checked');

							$(this).addClass('checked');
							var store_id = $(this).attr('data-value');
							

					$.ajax({
						url: 'index.php?route=common/header/selectCity',
						type: 'post',
						data: 'store_id=' + store_id,
						dataType: 'json',
						beforeSend: function() {
							
						},
						complete: function(data) {
							console.log(data);
						},
						success: function(json) {
							console.log(json);
								if(json['categories']){
									
									var categories = '';
				
									for(key in json['categories']) {
				 
										var category_name = json['categories'][key].name;
										var category_href = json['categories'][key].href;
										var category_text_all = json['categories'][key].text_all;
										console.log('category_text_all ' + category_text_all);
										if(json['categories'][key]['children'] && json['categories'][key]['children'] != ''){
				
											categories += '<li class="dropdown">';
											categories += '<a href="'+category_href+'" class="dropdown-toggle" data-toggle="dropdown">'+category_name+'</a>';
				
											categories += '	<div class="dropdown-menu">';
											categories += '<div class="dropdown-inner">';
											
											categories += '	<ul class="list-unstyled">';


											categories += '<li><a href="'+category_href+'" class="see-all">'+category_text_all+'</a></li>';

												for(child in json['categories'][key]['children']) {
				
													var category_name_child = json['categories'][key]['children'][child].name;
													var category_href_child = json['categories'][key]['children'][child].href;
				
													categories += '<li><a href="'+category_href_child+'">'+category_name_child+'</a></li>';
												}
											
												categories += '</ul>';
											
												categories += '</div>';
												categories += '</div>';
												categories += '</li>';
				
										} else {
											categories += '<li><a href="'+category_href+'">'+category_name+'</a></li>';
										}
									
				
									}
									$('.menu_categories').html(categories);
								}
								if(json['products']){
									
									var products = '';
				
									for(key in json['products']) {
				
										var product_product_id = json['products'][key].product_id;
										var product_name = json['products'][key].name;
										var product_href = json['products'][key].href;
										var product_image = json['products'][key].image;
										var product_prev_image = json['products'][key].prev_image;
										var product_price = json['products'][key].price;
										var product_special = json['products'][key].special;
				
										if(product_special) {
											product_price = product_special;
										}
				
										products += '<div class="product_item">';
										products += '<div class="product_images">'
										products += '<a href="'+product_href+'">';
										products += '<img src="'+product_image+'" alt="'+product_name+'">';
										products += '</a>';
										products += '<a href="'+product_href+'">';
										products += '<img src="'+product_prev_image+'" alt="'+product_name+'">';
										products += '</a>';
										products += '</div>';
										products += '<div class="product_bottom_params">';
										products += '<div class="product_prices">';
										products += '<div class="product_name">'+product_name+'</div>';
										products += '<div class="price">'+product_price+'</div>';
										products += '</div>';
										products += '<div class="wishlist_content">';
										products += '<a class="wishlist_product_btn" onclick="wishlist.add(\''+product_name+'\');return false;" href="#">';
										products += '<svg class="wish_noactive" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">';
										products += '<g clip-path="url(#clip0_33263_25458)"><path fill-rule="evenodd" clip-rule="evenodd" d="M3.73889 1.23062C3.63983 1.23062 3.30411 1.23062 3.30411 1.23062C3.30411 1.23062 3.30411 1.57594 3.30411 1.71979V13.4074L7.99955 9.846L12.6956 13.4076V1.71996C12.6956 1.57612 12.6956 1.2308 12.6956 1.2308C12.6956 1.2308 12.3599 1.2308 12.2608 1.2308L3.73889 1.23062ZM2 0C2 0 3.2614 -0.000176013 3.73889 -0.000176013L12.2608 0C12.7383 0 14 0.000612825 14 0.000612825C14 0.000612825 14 1.27791 14 1.71996V16L7.99998 11.4609L2.00052 15.9998L1.99976 1.71979C1.99976 1.27774 2 0 2 0Z" fill="#676560"></path>';
										products += '</g><defs><clipPath id="clip0_33263_25458"><rect width="16" height="16" fill="white"></rect></clipPath></defs>';
										products += '</svg>';

										products += '<svg class="wish_active" width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">';
										products += '<g clip-path="url(#clip0_33263_39327)">';
										products += '<path fill-rule="evenodd" clip-rule="evenodd" d="M2 0C2 0 3.2614 -0.000176013 3.73889 -0.000176013L12.2608 0C12.7383 0 14 0.000612825 14 0.000612825C14 0.000612825 14 1.27791 14 1.71996V16L7.99998 11.4609L2.00052 15.9998L1.99976 1.71979C1.99976 1.27774 2 0 2 0Z" fill="#676560"></path>';
										products += '</g>';
										products += '<defs>';
										products += '<clipPath id="clip0_33263_39327">';
										products += '	<rect width="16" height="16" fill="white"></rect>';
										products += '</clipPath>';
										products += '</defs>';
										products += '</svg>';

										products += '</a>';
										products += '</div>';
										products += '</div>';
										products += '</div>';
				
									}
									$('.menu_categories').html(categories);
									$('#home_products').html(products);
									
									_nextPageUrl = getNextPageUrlFromPagination($('ul.pagination'));
									//console.log(_nextPageUrl);
								
									HidePagination();
								
									if (_nextPageUrl) {
										$(window).off('scroll', ScrollHandler).on('scroll', ScrollHandler);
									}
				
									$('.home_pagination').html('<div class="col-sm-6 text-left">'+json['pagination']+'</div><div class="col-sm-6 text-right">'+json['results']+'</div>');
								}
							}
						});

							$('nav .city_selected').html(curMagazine);
								
							$('.categories_top .filters_picked').html('');
							$('button.filter_products span.clear_filters').remove();
						}
						
					});

		

				}

			});

		}

		return false;
	});
	$('body').on('click','.filter_products',function(e){
		
	
		if(e.target.className == 'filter_products'){
			$('section.dream-filter').fadeIn();
			$('section.dream-filter').toggleClass('open');
			$('.rdf-filters .panel-group .panel input[type="checkbox"]:first-child').change();


		}


		

		return false;
	});
	$('body').on('click','.close_filter',function(){
		
		$('section.dream-filter').hide();
		$('section.dream-filter').removeClass('open');

		return false;
	});
	$('body').on('click','nav ul.menu_categories li.dropdown a.dropdown-toggle',function(){
		$(this).parent().toggleClass('open');


		$(this).parent().find('.dropdown-menu').slideToggle();

		return false;
	});


	$('div#search input[type="text"]').keyup(function(){
		$('.search_content button').remove();
		$('.search_content').html('<button class="btn btn-default btn-lg" type="button">'+$(this).val()+'</button>');
	});

	$('div#search .search_box .close').click(function(){
		$(this).parent().find('input[type="text"]').val('');
		$('.search_content button').html('');
	});

	$('.search_button').click(function(){
		$('header #search').toggleClass('open');
		$('header #search').fadeIn();
	});
	$('button.back_btn').click(function(){
		$('header #search').toggleClass('open');
		$('header #search').fadeOut();
	});

	$('.city_select').click(function(e){

			$(this).find('ul').slideToggle(300);

	});
	$('.info_btn').click(function(e){
			$(this).toggleClass('open');
			$(this).parent().find('.info_list').slideToggle(300);

			if($(this).hasClass('open')){
				$(this).html('-ИНФО');
			} else {
				$(this).html('+ИНФО');
			}

	});



	$('#top_menu .city_select ul li').click(function(){
		$('#top_menu .city_select ul li').removeClass('checked');


		$(this).toggleClass('checked');

		var curVal = $('#top_menu .city_select ul li.checked').text().trim();
		var store_id = $('#top_menu .city_select ul li.checked').attr('data-value');

		$('nav .city_selected').html(curVal);
	
		$.ajax({
			url: 'index.php?route=common/header/selectCity',
			type: 'post',
			data: 'store_id=' + store_id,
			dataType: 'json',
			beforeSend: function() {
				
			},
			complete: function(data) {
				console.log(data);
			},
			success: function(json) {
				console.log(json);
				if(json['categories']){
					
					var categories = '';

					for(key in json['categories']) {

						var category_name = json['categories'][key].name;
						var category_href = json['categories'][key].href;
						var category_text_all = json['categories'][key].text_all;
						console.log('category_text_all ' + category_text_all);
						if(json['categories'][key]['children'] && json['categories'][key]['children'] != ''){

							categories += '<li class="dropdown">';
							categories += '<a href="'+category_href+'" class="dropdown-toggle" data-toggle="dropdown">'+category_name+'</a>';

							categories += '	<div class="dropdown-menu">';
							categories += '<div class="dropdown-inner">';
							
							categories += '	<ul class="list-unstyled">';
							categories += '<li><a href="'+category_href+'" class="see-all">'+category_text_all+'</a></li>';
								for(child in json['categories'][key]['children']) {

									var category_name_child = json['categories'][key]['children'][child].name;
									var category_href_child = json['categories'][key]['children'][child].href;

									categories += '<li><a href="'+category_href_child+'">'+category_name_child+'</a></li>';
								}
							
								categories += '</ul>';
							
								categories += '</div>';
								categories += '</div>';
								categories += '</li>';

						} else {
							categories += '<li><a href="'+category_href+'">'+category_name+'</a></li>';
						}
					

					}
					$('.menu_categories').html(categories);
				}
				if(json['products']){
					
					var products = '';

					for(key in json['products']) {

						var product_product_id = json['products'][key].product_id;
						var product_name = json['products'][key].name;
						var product_href = json['products'][key].href;
						var product_image = json['products'][key].image;
						var product_prev_image = json['products'][key].prev_image;
						var product_price = json['products'][key].price;
						var product_special = json['products'][key].special;

						if(product_special) {
							product_price = product_special;
						}

						products += '<div class="product_item">';
						products += '<div class="product_images">'
						products += '<a href="'+product_href+'">';
						products += '<img src="'+product_image+'" alt="'+product_name+'">';
						products += '</a>';
						products += '<a href="'+product_href+'">';
						products += '<img src="'+product_prev_image+'" alt="'+product_name+'">';
						products += '</a>';
						products += '</div>';
						products += '<div class="product_bottom_params">';
						products += '<div class="product_prices">';
						products += '<div class="product_name">'+product_name+'</div>';
						products += '<div class="price">'+product_price+'</div>';
						products += '</div>';
						products += '<div class="wishlist_content">';
						products += '<a class="wishlist_product_btn" onclick="wishlist.add(\''+product_name+'\');return false;" href="#">';
						products += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">';
						products += '<g clip-path="url(#clip0_33263_25458)"><path fill-rule="evenodd" clip-rule="evenodd" d="M3.73889 1.23062C3.63983 1.23062 3.30411 1.23062 3.30411 1.23062C3.30411 1.23062 3.30411 1.57594 3.30411 1.71979V13.4074L7.99955 9.846L12.6956 13.4076V1.71996C12.6956 1.57612 12.6956 1.2308 12.6956 1.2308C12.6956 1.2308 12.3599 1.2308 12.2608 1.2308L3.73889 1.23062ZM2 0C2 0 3.2614 -0.000176013 3.73889 -0.000176013L12.2608 0C12.7383 0 14 0.000612825 14 0.000612825C14 0.000612825 14 1.27791 14 1.71996V16L7.99998 11.4609L2.00052 15.9998L1.99976 1.71979C1.99976 1.27774 2 0 2 0Z" fill="#676560"></path>';
						products += '</g><defs><clipPath id="clip0_33263_25458"><rect width="16" height="16" fill="white"></rect></clipPath></defs>';
						products += '</svg>';

						products += '<svg class="wish_active" width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">';
						products += '<g clip-path="url(#clip0_33263_39327)">';
						products += '<path fill-rule="evenodd" clip-rule="evenodd" d="M2 0C2 0 3.2614 -0.000176013 3.73889 -0.000176013L12.2608 0C12.7383 0 14 0.000612825 14 0.000612825C14 0.000612825 14 1.27791 14 1.71996V16L7.99998 11.4609L2.00052 15.9998L1.99976 1.71979C1.99976 1.27774 2 0 2 0Z" fill="#676560"></path>';
						products += '</g>';
						products += '<defs>';
						products += '<clipPath id="clip0_33263_39327">';
						products += '	<rect width="16" height="16" fill="white"></rect>';
						products += '</clipPath>';
						products += '</defs>';
						products += '</svg>';

						products += '</a>';
						products += '</div>';
						products += '</div>';
						products += '</div>';

					}
					$('.menu_categories').html(categories);
					$('#home_products').html(products);
					
					_nextPageUrl = getNextPageUrlFromPagination($('ul.pagination'));
					//console.log(_nextPageUrl);
				
					HidePagination();
				
					if (_nextPageUrl) {
						$(window).off('scroll', ScrollHandler).on('scroll', ScrollHandler);
					}

					$('.home_pagination').html('<div class="col-sm-6 text-left">'+json['pagination']+'</div><div class="col-sm-6 text-right">'+json['results']+'</div>');
				}
			}
		});


		if($('.magazines_select').length > 0){

			var citySelected = $('.nav_top_values .cities .city_selected').text().trim();

			$('.magazines_select .cities .city_selected').html(citySelected);

			var magazines_select = $('.magazines_select .cities .city_selected').text().trim();

		

			var curMagazine = magazines_select;

			if($('.rdf-filters').length > 0){
				$('.magazines_text').removeClass('m_checked');
				$('.rdf-filters .panel-group .panel').each(function(){
					var titleParam = $(this).find('.panel-title').text().trim();
		
					if(curMagazine == titleParam){

						console.log('magazines_select ' + titleParam + ' curMagazine ' + curMagazine);

						$('.rdf-filters .panel-collapse.collapse:not(.in)').removeClass('show');
						var optionLength =$(this).find('input[type="checkbox"]').length;
		
						$('.magazines_text').addClass('m_checked');
						$('.magazines_text span').html('('+optionLength+')');
		
						$('.rdf-filters .panel-group .panel').find('input[type="checkbox"]').prop('checked',false);
						$(this).find('input[type="checkbox"]').removeAttr('disabled');
						$(this).find('input[type="checkbox"]').prop('checked',true);
		
						// $(this).find('input[type="checkbox"]:first-child').change();
						setTimeout(function(){
							$('#rdrf-form32').submit();
						},1);
				
		
						$(this).find('.panel-collapse.collapse').addClass('show cur_magazine');
		
						setTimeout(function(){
							var textBtn = $('.dream-filter .popper span').text().trim();
		
							var textBtnSplit = textBtn.split(' ');
		
							var countProduct = textBtnSplit[1]
							
							// $('.dream-filter .popper button').text('Показать' + ' ('+countProduct+')');
		
						},300);
					
				
						$('.categories_top .filters_picked').html('');
						$('button.filter_products span.clear_filters').remove();
					}
		
				});
				$('.magazines_select .cities ul li').removeClass('checked');
				$('.magazines_select .cities ul li').each(function(){
					var titleCity = $(this).text().trim();

					if(titleCity == curMagazine){
						$(this).addClass('checked');
					}
				});

				
		
			}

		}


	});

	$('.header_box .menu_btn').click(function(){
		$('#top_menu').toggleClass('open');
	});
	$('div#top_menu .top_menu_params .close').click(function(){
		$('#top_menu').toggleClass('open');
	});

	// Highlight any found errors
	$('.text-danger').each(function() {
		var element = $(this).parent().parent();

		if (element.hasClass('form-group')) {
			element.addClass('has-error');
		}
	});

	// Currency
	$('#form-currency .currency-select').on('click', function(e) {
		e.preventDefault();

		$('#form-currency input[name=\'code\']').val($(this).attr('name'));

		$('#form-currency').submit();
	});

	// Language
	$('#form-language .language-select').on('click', function(e) {
		e.preventDefault();

		$('#form-language input[name=\'code\']').val($(this).attr('name'));

		$('#form-language').submit();
	});

	/* Search */
	$('#search input[name=\'search\']').parent().find('button').on('click', function() {
		var url = $('base').attr('href') + 'index.php?route=product/search';

		var value = $('header #search input[name=\'search\']').val();

		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}

		location = url;
	});
	/* Search */
	$('div#search .search_content').on('click','button',function() {
		console.log('clicked');
		var url = $('base').attr('href') + 'index.php?route=product/search';

		var value = $('header #search input[name=\'search\']').val();

		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}

		location = url;
	});

	$('#search input[name=\'search\']').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('header #search input[name=\'search\']').parent().find('button').trigger('click');
		}
	});

	// Menu
	$('#menu .dropdown-menu').each(function() {
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();

		var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 10) + 'px');
		}
	});

	// Product List
	$('#list-view').click(function() {
		$('#content .product-grid > .clearfix').remove();

		$('#content .row > .product-grid').attr('class', 'product-layout product-list col-xs-12');
		$('#grid-view').removeClass('active');
		$('#list-view').addClass('active');

		localStorage.setItem('display', 'list');
	});

	// Product Grid
	$('#grid-view').click(function() {
		// What a shame bootstrap does not take into account dynamically loaded columns
		var cols = $('#column-right, #column-left').length;

		if (cols == 2) {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');
		} else if (cols == 1) {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12');
		} else {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12');
		}

		$('#list-view').removeClass('active');
		$('#grid-view').addClass('active');

		localStorage.setItem('display', 'grid');
	});

	if (localStorage.getItem('display') == 'list') {
		$('#list-view').trigger('click');
		$('#list-view').addClass('active');
	} else {
		$('#grid-view').trigger('click');
		$('#grid-view').addClass('active');
	}

	// Checkout
	$(document).on('keydown', '#collapse-checkout-option input[name=\'email\'], #collapse-checkout-option input[name=\'password\']', function(e) {
		if (e.keyCode == 13) {
			$('#collapse-checkout-option #button-login').trigger('click');
		}
	});

	// // tooltips on hover
	// $('[data-toggle=\'tooltip\']').tooltip({container: 'body',trigger: 'hover'});

	// // Makes tooltips work on ajax generated content
	// $(document).ajaxStop(function() {
	// 	$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
	// });
});

// Cart add remove functions
var cart = {
	'add': function(product_id, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				$('.alert, .text-danger').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					// Need to set timeout otherwise it wont update the total
					setTimeout(function () {
						$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
					}, 100);

					$('html, body').animate({ scrollTop: 0 }, 'slow');

					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'update': function(key, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				
			},
			complete: function() {
		
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
				}, 100);
				
				var now_location = String(document.location.pathname);

				if ((now_location == '/cart/') || (now_location == '/checkout/') || (getURLVar('route') == 'checkout/cart') || (getURLVar('route') == 'checkout/checkout')) {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}

var voucher = {
	'add': function() {

	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}

var wishlist = {
	'add': function(product_id) {
		console.log($(this));
		$.ajax({
			url: 'index.php?route=account/wishlist/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {

				

				$('.alert').remove();

				$('body').append('<div class="success_wrapper_note"><div class="success_in_cart"></div></div>');


				var html = '<div class="in_cart_content" onclick="location.href = \'/cart\'">';
				html +=  '<div class="in_cart_product_info">';
				html +=  '<p class="title">'+json['product_name']+'</p>';
				html +=  '<p class="desc">Товар добавлен в избранное</p>';
				html += '</div>';
				html += '</div>';


			   
	
				$('.success_in_cart').html(html);
		 
				$('.success_wrapper_note').animate({top:'-=10px',opacity:'1'},150);
		   
				setTimeout(function(){
				  $('.success_wrapper_note').fadeOut(300);
				  $('.success_wrapper_note').remove();
				},3000);

				$('.switch_item:last-child .switch_item_box span').html(json['total']);
				$('.wish_btn span').html(json['total']);

				if(json['total']){
					$('.wish_btn').addClass('open');
				} else {
					$('.wish_btn').removelass('open');
				}

				if($('.cart_content').length > 0){
					if(json['product']){
						
						var html = '<div class="wish_product">';
						html += '<img class="delete" data-event="wishlist" data-product="'+product_id+'" src="/image/cross.svg" alt="close button">';
						html += '<div class="product_img">';
						html += '<a href="'+json['product']['href']+'"><img src="/image/'+json['product']['image']+'" alt="'+json['product']['name']+'" /></a>';
						html += '</div>';
						html += '<p class="product_title">'+json['product']['name']+'</p>';
						html += '<div class="product_price">';

						if(json['product']['special']){
							html += '<p class="price">'+json['product']['special']+'</p>';
							html += '<p class="old_price">'+json['product']['price']+'</p>';
						} else {
							html += '<p class="price">'+json['product']['price']+'</p>';
						}
						
						html += '</div>';
					  html += '</div>';

						$('.cart_content:last-child .cart_content_info').append(html);

					}
				}
				
			


			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function(product_id) {

		$.ajax({
			url: 'index.php?route=account/wishlist/remove',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {

				console.log(json);
				$('.switch_item:last-child .switch_item_box span').html(json['total']);
				$('.wish_btn span').html(json['total']);

				if(json['total']){
					$('.wish_btn').addClass('open');
				} else {
					$('.wish_btn').removeClass('open');
				}

				if($('.wish_product').length > 0){
					$('.wish_product .delete[data-product='+product_id+']').parent().remove();
				}

			}

		});

	}
}

var compare = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=product/compare/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					$('#compare-total').html(json['total']);

					$('html, body').animate({ scrollTop: 0 }, 'slow');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function() {

	}
}

/* Agree to Terms */
$(document).delegate('.agree', 'click', function(e) {
	e.preventDefault();

	$('#modal-agree').remove();

	var element = this;

	$.ajax({
		url: $(element).attr('href'),
		type: 'get',
		dataType: 'html',
		success: function(data) {
			html  = '<div id="modal-agree" class="modal">';
			html += '  <div class="modal-dialog">';
			html += '    <div class="modal-content">';
			html += '      <div class="modal-header">';
			html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
			html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
			html += '      </div>';
			html += '      <div class="modal-body">' + data + '</div>';
			html += '    </div';
			html += '  </div>';
			html += '</div>';

			$('body').append(html);

			$('#modal-agree').modal('show');
		}
	});
});

// Autocomplete */
(function($) {
	$.fn.autocomplete = function(option) {
		return this.each(function() {
			this.timer = null;
			this.items = new Array();

			$.extend(this, option);

			$(this).attr('autocomplete', 'off');

			// Focus
			$(this).on('focus', function() {
				this.request();
			});

			// Blur
			$(this).on('blur', function() {
				setTimeout(function(object) {
					object.hide();
				}, 200, this);
			});

			// Keydown
			$(this).on('keydown', function(event) {
				switch(event.keyCode) {
					case 27: // escape
						this.hide();
						break;
					default:
						this.request();
						break;
				}
			});

			// Click
			this.click = function(event) {
				event.preventDefault();

				value = $(event.target).parent().attr('data-value');

				if (value && this.items[value]) {
					this.select(this.items[value]);
				}
			}

			// Show
			this.show = function() {
				var pos = $(this).position();

				$(this).siblings('ul.dropdown-menu').css({
					top: pos.top + $(this).outerHeight(),
					left: pos.left
				});

				$(this).siblings('ul.dropdown-menu').show();
			}

			// Hide
			this.hide = function() {
				$(this).siblings('ul.dropdown-menu').hide();
			}

			// Request
			this.request = function() {
				clearTimeout(this.timer);

				this.timer = setTimeout(function(object) {
					object.source($(object).val(), $.proxy(object.response, object));
				}, 200, this);
			}

			// Response
			this.response = function(json) {
				html = '';

				if (json.length) {
					for (i = 0; i < json.length; i++) {
						this.items[json[i]['value']] = json[i];
					}

					for (i = 0; i < json.length; i++) {
						if (!json[i]['category']) {
							html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
						}
					}

					// Get all the ones with a categories
					var category = new Array();

					for (i = 0; i < json.length; i++) {
						if (json[i]['category']) {
							if (!category[json[i]['category']]) {
								category[json[i]['category']] = new Array();
								category[json[i]['category']]['name'] = json[i]['category'];
								category[json[i]['category']]['item'] = new Array();
							}

							category[json[i]['category']]['item'].push(json[i]);
						}
					}

					for (i in category) {
						html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';

						for (j = 0; j < category[i]['item'].length; j++) {
							html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
						}
					}
				}

				if (html) {
					this.show();
				} else {
					this.hide();
				}

				$(this).siblings('ul.dropdown-menu').html(html);
			}

			$(this).after('<ul class="dropdown-menu"></ul>');
			$(this).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));

		});
	}
})(window.jQuery);
