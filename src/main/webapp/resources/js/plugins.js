(function($){
    'use strict'
	
	// ==== Slideshow ====
	if ($('#tiva-slideshow').length) {
		$('#tiva-slideshow').nivoSlider({ 
			effect: $('.tiva-slideshow-attr-effect').val(),
			animSpeed: parseInt($('.tiva-slideshow-attr-speed').val()),
			pauseTime: parseInt($('.tiva-slideshow-attr-pause-time').val()),
			directionNav: JSON.parse($('.tiva-slideshow-attr-direction').val()),
			controlNav: JSON.parse($('.tiva-slideshow-attr-control').val()),
			pauseOnHover: JSON.parse($('.tiva-slideshow-attr-pause-hover').val())
		});
	}
  
    // ==== Counter ====
    $('.counter-wrap').each(function(){
		if ($(this).find('.counter-numb').length) {
			$(this).find('.counter-numb').counterUp({
				delay: 5
			});
		}
    });
	
	// ==== Posts Carousel ====
	$('.tiva-article-wrapper').each(function(){
		var item = (parseInt($(this).find('.tiva-article-attr-items').val()) == 1) ? 1 : 2;
		
		$(this).find('.tiva-article').owlCarousel({
			margin: parseInt($(this).find('.tiva-article-attr-space').val()),
			loop: true,
			nav: JSON.parse($(this).find('.tiva-article-attr-navigation').val()) && JSON.parse($(this).find('.tiva-article-attr-carousel').val()),
			dots: true,
			dotsEach: 1,
			autoplay: JSON.parse($(this).find('.tiva-article-attr-autoplay').val()) && JSON.parse($(this).find('.tiva-article-attr-carousel').val()),
			autoplayTimeout: 10500 - (parseInt($(this).find('.tiva-article-attr-speed').val()) * 1000),
			autoplayHoverPause: true,
			mouseDrag: JSON.parse($(this).find('.tiva-article-attr-carousel').val()),
			touchDrag: JSON.parse($(this).find('.tiva-article-attr-carousel').val()),
			responsive:{
				0:{
					items: 1
				},
				480:{
					items: item
				},
				769:{
					items: parseInt($(this).find('.tiva-article-attr-items').val())
				}
			}
		});
	});
	
	// ==== Images Carousel ====
	$('.tiva-image-wrapper').each(function(){
		var items1;
		var items2;
		if ($(this).find('.tiva-image-attr-gallery').val() == 'true') {
			items1 = 3;
			items2 = parseInt($(this).find('.tiva-image-attr-items').val());
		} else {
			items1 = 1;
			items2 = 2;
		}
		
		$(this).find('.tiva-image').owlCarousel({	
			margin: parseInt($(this).find('.tiva-image-attr-space').val()),
			loop: true,
			nav: JSON.parse($(this).find('.tiva-image-attr-navigation').val()) && JSON.parse($(this).find('.tiva-image-attr-carousel').val()),
			dots: true,
			dotsEach: 1,
			autoplay: JSON.parse($(this).find('.tiva-image-attr-autoplay').val()),
			autoplayTimeout: 10500 - (parseInt($(this).find('.tiva-image-attr-speed').val()) * 1000),
			autoplayHoverPause: true,
			mouseDrag: JSON.parse($(this).find('.tiva-image-attr-carousel').val()),
			touchDrag: JSON.parse($(this).find('.tiva-image-attr-carousel').val()),
			responsive:{
				0:{
					items: items1
				},
				480:{
					items: items2
				},
				769:{
					items: parseInt($(this).find('.tiva-image-attr-items').val())
				}
			}
		});
		
		if ($(this).find('.tiva-image-attr-gallery').val() == 'true') {
			$(this).magnificPopup({
				delegate: 'a',
				type: 'image',
				gallery: {
					enabled:true
				},
				zoom: {
					enabled: true,
					duration: 300 // don't foget to change the duration also in CSS
				}
			});
		}
	});
	
	// Testimonials
	$('.tiva-testimonials-wrapper').each(function(){
		$(this).find('.tiva-testimonials').owlCarousel({	
			margin: 30,
			loop: true,
			nav: JSON.parse($(this).find('.tiva-testimonials-attr-navigation').val()),
			dots: true,
			dotsEach: 1,
			autoplay: JSON.parse($(this).find('.tiva-testimonials-attr-autoplay').val()),
			autoplayTimeout: 10500 - (parseInt($(this).find('.tiva-testimonials-attr-speed').val()) * 1000),
			autoplayHoverPause: true,
			responsive:{
				0:{
					items: 1
				},
				769:{
					items: parseInt($(this).find('.tiva-testimonials-attr-items').val())
				}
			}
		});
	});
})(jQuery)