(function($) {
	'use strict';
	
	/* Wishlist */
	var ByHandsWishlist = {
		/**
		 *	Initialize Wishlist
		 */
		init: function() {
			var self = this,
                wishlistAjax = false,
                $wishlistAjaxButton;
			
			/* Update wishlist button classes for added items */
			if ($.cookie) {
				var wishlistCookie = $.cookie('byhands-wishlist-items');
				if (wishlistCookie) {
					wishlistCookie = JSON.parse(wishlistCookie);
					
					for (var id in wishlistCookie) {
						if (wishlistCookie.hasOwnProperty(id)) {
							$('.wishlist-item-' + id).html('<i class="fa fa-angle-down"></i>');
						}
					}
				}
			}
			
			/* Add Wishlist */
			$(document).on('click', '.add-to-wishlist', function(e) {
				e.preventDefault();
				
                var $this = $(this),
                    productId = $this.data('product-id');
                
                // Is an Ajax request already running?
				if (wishlistAjax) {
                    if ($this.hasClass('ajax-running')) {
                        wishlistAjax.abort(); // Abort Ajax request
                        wishlistAjax = false;
                    } else {
                        return;
                    }
				}
				
				$this.find('i').css('opacity', '0.3');
                $this.addClass('ajax-running');
                $wishlistAjaxButton = $this;
                
				wishlistAjax = $.ajax({
					type: 'POST',
					url: byhands_ajax_vars.ajaxUrl,
					data: {
						action: 'byhands_wishlist_toggle',
                        remove_item: 0,
						product_id: productId
					},
					dataType: 'json',
					cache: false,
					headers: {'cache-control': 'no-cache'},
					complete: function() {
                        $wishlistAjaxButton.removeClass('ajax-running');
                        wishlistAjax = false;
                    },
                    success: function(json) {
						$this.removeClass('add-to-wishlist');
						$this.attr('title', byhands_ajax_vars.wishlistBtn);
                        $this.html('<i class="fa fa-angle-down"></i>');
					}
				});
			});
			
			/* Wishlist Page */
			var $wishlistTable = $('.wishlist-content table');
			if ($wishlistTable.length) {
				var _wishlistRemoveItem = function($this) {
					var	$thisTr = $this.closest('tr'),
						productId = $thisTr.attr('id');
						
					$wishlistTable.addClass('ajax-running');
					
					$.ajax({
						type: 'POST',
						url: byhands_ajax_vars.ajaxUrl,
						data: {
							action: 'byhands_wishlist_toggle',
							remove_item: 1,
                            product_id: productId
						},
						dataType: 'json',
						cache: false,
						headers: {'cache-control': 'no-cache'},
						success: function(json) {
                            $('body').trigger('wishlist_removed_item');
							
							$thisTr.remove();
							
							$wishlistTable.removeClass('ajax-running');
							
							// Show "wishlist empty"
							if (!($wishlistTable.find('.item').length)) {
								$wishlistTable.find('.wishlist-empty').show();
							}
						}
					});
				};
								
				/* Remove Wishlist */
				$wishlistTable.find('.wishlist-remove').bind('click', function(e) {
					e.preventDefault();
					
					var $this = $(this);
					
					_wishlistRemoveItem($this);
				});
						
                /* Event - Add-to-cart: Remove wishlist item after adding it to the cart */
				/*
                $(document.body).on('added_to_cart', function(event, fragments, cartHash, $thisbutton) {
                    _wishlistRemoveItem($thisbutton);
                });
				*/
            }
		}
	}
	
	$(document).ready(function() {
		// Initialize script
		ByHandsWishlist.init();
	});
	
})(jQuery);