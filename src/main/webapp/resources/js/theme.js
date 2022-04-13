(function($) {
	'use strict';

	$(document).ready(function() {
		// Go-To-Top button
		$('.go-up').hide();
		$(window).on('scroll', function () {
			if ($(this).scrollTop() > 400) {
				$('.go-up').fadeIn();
			} else {
				$('.go-up').fadeOut();
			}
			
			return false;
		});
		$('.go-up a').on('click', function (e) {
			e.preventDefault();
			$("html, body").animate({
				scrollTop: 0
			}, 600);
			
			return false;
		});
		
		// Page loader
		$(window).load(function() {
			if ($('#page-loader').length) {
				setTimeout(function () {
					$('#page-loader').fadeOut();
				}, 500);
			}
		});
		
		// Fixed Header
		if ($('#top-header').attr('class').indexOf('fixed-header') != -1) {
			$(window).on('scroll', function() {
				if ($(window).scrollTop() > 120) {
					$('#top-header').addClass('fixed');
				} else {
					$('#top-header').removeClass('fixed');
				}
			
				return false;
			});
		}
		
		// Popup Background
		if ($('.popmake .background-popup').length) {
			$('.popmake').css('background', 'url(' + $('.popmake .background-popup img').attr('src') + ') no-repeat center center transparent');
			$('.popmake .background-popup').remove();
		}
		
		// Module Login in Homepage 1
		if ($(window).width() <= 991) {
			$('.home-1 .header_user_info').addClass('dropdown-over');
			$('.home-1 .header_user_info .links').addClass('dropdown-content');
		} else {
			$('.home-1 .header_user_info').removeClass('dropdown-over');
			$('.home-1 .header_user_info .links').removeClass('dropdown-content');
		}
		$(window).on('resize', function () {
			if ($(window).width() <= 991) {
				$('.home-1 .header_user_info').addClass('dropdown-over');
				$('.home-1 .header_user_info .links').addClass('dropdown-content');
			} else {
				$('.home-1 .header_user_info').removeClass('dropdown-over');
				$('.home-1 .header_user_info .links').removeClass('dropdown-content');
			}
		});
		
		// Mobile Menu
		if ($('#btn-menu').length) {
			$('#all').after('<div id="off-mainmenu" class="siderbarmenu"><div class="off-mainnav"><div class="off-close"><span class="title">Menu</span><span class="close-menu"><i class="fa fa-close"></i></span></div><nav id="siderbar-menu" class="accordion-nav"></div></div>');
			$('#main-nav > ul').clone().appendTo('.off-mainnav #siderbar-menu');
			
			$('#btn-menu').on('click', function (e) {
				e.preventDefault();
				$('body').toggleClass('mainmenu-active');
				
				return false;
			});
			$('.off-close .close-menu').on('click', function (e) {
				e.preventDefault();
				$('body').removeClass('mainmenu-active');
				
				return false;
			});
		}
		
		if ($('#siderbar-menu').length) {
			$('#siderbar-menu').navAccordion({
				expandButtonText: '<i class="fa fa-angle-down"></i>',  
				collapseButtonText: '<i class="fa fa-angle-up"></i>'
			});
		}
		
		// Remove flag on currency widget
		$('.widget-woocommerce-currency-switcher .woocs_flag_view_item').each(function() {
			var cattr = $(this).attr('data-currency');
			$(this).html('');
			$(this).append(cattr);
		});
		
		// Newsletter Widget
		if ($('.es_widget_form').length) {
			$('.es_widget_form').each(function() {
				$(this).find('.es_textbox_class').attr('placeholder', $(this).find('.es_widget_form_email').text());
			});
		}
		
		// Categories Widget on Product Category page
		$('.widget_product_categories').navAccordion({
			expandButtonText: '<i class="fa fa-plus"></i>',  
			collapseButtonText: '<i class="fa fa-minus"></i>'
		});
		
		// ==== Products Carousel ====
		$('.products-carousel').each(function(){
			$(this).find('.tiva-products').owlCarousel({	
				margin: parseInt($(this).find('.tiva-product-attr-space').val()),
				loop: true,
				nav: JSON.parse($(this).find('.tiva-product-attr-navigation').val()) && JSON.parse($(this).find('.tiva-product-attr-carousel').val()),
				dots: true,
				dotsEach: 1,
				autoplay: JSON.parse($(this).find('.tiva-product-attr-autoplay').val()) && JSON.parse($(this).find('.tiva-product-attr-carousel').val()),
				autoplayTimeout: 10500 - (parseInt($(this).find('.tiva-product-attr-speed').val()) * 1000),
				autoplayHoverPause: true,
				mouseDrag: JSON.parse($(this).find('.tiva-product-attr-carousel').val()) || (screen.width < 769),
				touchDrag: JSON.parse($(this).find('.tiva-product-attr-carousel').val()) || (screen.width < 769),
				responsive:{
					0:{
						items: 1
					},
					480:{
						items: 2
					},
					769:{
						items: parseInt($(this).find(".tiva-product-attr-items").val())
					}
				}
			});
		});
		
		// Product Detail page
		$('.product-detail.thumbnail-horizontal .thumb-images').owlCarousel({
			margin: 15,
			loop: true,
			dots: true,
			dotsEach: 1,
			autoplay: false,
			items: 4
		});
		if ($('.product-detail .featured-image img').length) {
			$('.product-detail .featured-image img').elevateZoom({zoomType:"inner", cursor:"crosshair", easing:true, scrollZoom:false});
		}
		$('.product-detail .thumb-image-item').click(function(){
			$('.product-detail .featured-image').html($(this).html()).find('img').elevateZoom({zoomType:"inner", cursor:"crosshair", easing:true, scrollZoom:false});
		});
		
	});
})(jQuery);