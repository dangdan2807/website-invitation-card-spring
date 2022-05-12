'use strict';

(function ($) {
    /*------------------
        All Functions
        uck
    --------------------*/
    const updateTotal = function(item) {
        var parentElement = item.parent().parent().parent().parent();
        var quantityElement = parentElement.find('.shoping__cart__quantity  input');
        var priceElement = parentElement.find('.shoping__cart__price')
        var discountElement = parentElement.find('.shoping__cart__discount__percent');
        var totalElement = parentElement.find('.shoping__cart__total')

        var quantity = parseInt(quantityElement.val());
        var priceStr = priceElement.text();
        var price = parseFloat(priceStr.replaceAll(/[\s.đ]/ig, ''));
        var discountPercentStr = discountElement.text();
        var discountPercent = parseFloat(discountPercentStr.replaceAll(/[\s.%]/ig, ''));
        var total = 0;
        if (discountPercentStr.length > 0) {
            total = price * quantity * (1 - discountPercent / 100);
        } else {
            total = price * quantity;
        }

        totalElement.text(formatMoney(total));
    }

    const getDayOfTime = function (time) {
        var date = new Date(time);
        const options = { year: "numeric", month: "2-digit", day: "2-digit", hour: "2-digit", minute: "2-digit" };
        return date.toLocaleDateString('vi-Vn', options);;
    }
    
    const getDayOfTimeBySelect = function() {
		var time = $(this).text();
        $(this).text(getDayOfTime(time));
	}

    const formatNumber = function(value) {
        return new Intl.NumberFormat(
            'vi-Vn',
            { maximumSignificantDigits: 20 }).format(value);
    }
    
    const formatNumberBySelect = function() {
        var price = $(this).text();
        $(this).text(formatNumber(price));
    }
    const formatMoney = function(value) {
        return formatNumber(value) + "đ";
    }

    const formatMoneyBySelect = function() {
        var price = $(this).text();
        $(this).text(formatNumber(price) + "đ");
    }
    
    const formatPercentBySelect = function() {
        var price = $(this).text();
        $(this).text(formatNumber(price) + "%");
    }

    /*------------------
        Preloader
    --------------------*/
    $(window).on('load', function () {
        $(".loader").fadeOut();
        $("#preloder").delay(200).fadeOut("slow");

        /*------------------
            Gallery filter
        --------------------*/
        $('.featured__controls li').on('click', function () {
            $('.featured__controls li').removeClass('active');
            $(this).addClass('active');
        });
        if ($('.featured__filter').length > 0) {
            var containerEl = document.querySelector('.featured__filter');
            var mixer = mixitup(containerEl);
        }

        /*------------------
            Format Money vnd
        -------------------- */
        // uck
        // format tiền
        $('.featured__item__text > h5').each(formatMoneyBySelect);
        $('.latest-product__item__text > span').each(formatMoneyBySelect);
        $('.product__item__price > span').each(formatMoneyBySelect);
        $('.product__item__price > strong').each(formatMoneyBySelect);
        $('.product__item__text > h5').each(formatMoneyBySelect);
        $('.product__details__price').each(formatMoneyBySelect);
        $('.shoping__cart__price').each(formatMoneyBySelect);
        $('.shoping__cart__total').each(formatMoneyBySelect);
        $('.checkout__order > ul > li > span').each(formatMoneyBySelect);
        $('.checkout__order__subtotal > span').each(formatMoneyBySelect);
        $('.checkout__order__total > span').each(formatMoneyBySelect);
        $('.shoping__checkout > ul > li > span').each(formatMoneyBySelect);
        $('.header__cart__price > span').each(formatMoneyBySelect);

        // format số
        $('.product__details__text .product__details__rating > span:first-child()').each(formatNumberBySelect);
        
        // format phần trăm
        $('.product__discount__percent').each(formatPercentBySelect);
        $('.shoping__cart__discount__percent').each(formatPercentBySelect);

        // format thời gian
        $('.product__details__comment-item > .comment__time').each(getDayOfTimeBySelect);

        // select review star
        for (let index = 1; index <= 5; index++) {
            $(`.ul-star > li[data-val="${index}"]`).on('click', function () {
                $('#xepHang').val(index);
                if ($(`.ul-star > li[data-val="${index}"] > i`).hasClass('active')) {
                    for (let i = index + 1; i <= 5; i++) {
                        $(`.ul-star > li[data-val="${i}"] > i`).removeClass('active');
                        $(`.ul-star > li[data-val="${i}"] > i`).removeClass('fa-star');
                        $(`.ul-star > li[data-val="${i}"] > i`).addClass('fa-star-o');
                    }
                } else {
                    for (let i = 1; i <= index; i++) {
                        $(`.ul-star > li[data-val="${i}"] > i`).removeClass('fa-star-o');
                        $(`.ul-star > li[data-val="${i}"] > i`).addClass('active');
                        $(`.ul-star > li[data-val="${i}"] > i`).addClass('fa-star');
                    }
                }
            });
        }
    });

    /*------------------
        Background Set
    --------------------*/
    $('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });

    //Humberger Menu
    $(".humberger__open").on('click', function () {
        $(".humberger__menu__wrapper").addClass("show__humberger__menu__wrapper");
        $(".humberger__menu__overlay").addClass("active");
        $("body").addClass("over_hid");
    });

    $(".humberger__menu__overlay").on('click', function () {
        $(".humberger__menu__wrapper").removeClass("show__humberger__menu__wrapper");
        $(".humberger__menu__overlay").removeClass("active");
        $("body").removeClass("over_hid");
    });

    /*------------------
		Navigation
	--------------------*/
    $(".mobile-menu").slicknav({
        prependTo: '#mobile-menu-wrap',
        allowParentLinks: true
    });

    /*-----------------------
        Categories Slider
    ------------------------*/
    $(".categories__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 4,
        dots: false,
        nav: true,
        navText: ["<span class='fa fa-angle-left'><span/>", "<span class='fa fa-angle-right'><span/>"],
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
        responsive: {

            0: {
                items: 1,
            },

            480: {
                items: 2,
            },

            768: {
                items: 3,
            },

            992: {
                items: 4,
            }
        }
    });


    $('.hero__categories__all').on('click', function(){
        $('.hero__categories ul').slideToggle(400);
    });

    /*--------------------------
        Latest Product Slider
    ----------------------------*/
    $(".latest-product__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 1,
        dots: false,
        nav: true,
        navText: ["<span class='fa fa-angle-left'><span/>", "<span class='fa fa-angle-right'><span/>"],
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true
    });

    /*-----------------------------
        Product Discount Slider
    -------------------------------*/
    $(".product__discount__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 3,
        dots: true,
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
        responsive: {

            320: {
                items: 1,
            },

            480: {
                items: 2,
            },

            768: {
                items: 2,
            },

            992: {
                items: 3,
            }
        }
    });

    /*---------------------------------
        Product Details Pic Slider
    ----------------------------------*/
    $(".product__details__pic__slider").owlCarousel({
        loop: true,
        margin: 20,
        items: 4,
        dots: true,
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true
    });

    /*-----------------------
		Price Range Slider
	------------------------ */
    // uck
    var rangeSlider = $(".price-range"),
        minamount = $("#minamount"),
        maxamount = $("#maxamount"),
        minPrice = rangeSlider.data('min'),
        maxPrice = rangeSlider.data('max');
    rangeSlider.slider({
        range: true,
        min: minPrice,
        max: maxPrice,
        values: [minPrice, maxPrice],
        slide: function (event, ui) {
            minamount.val(formatMoney(ui.values[0] + '000'));
            maxamount.val(formatMoney(ui.values[1] + '000'));
        }
    });
    minamount.val(formatMoney(rangeSlider.slider("values", 0) + "000"));
    maxamount.val(formatMoney(rangeSlider.slider("values", 1) + "000"));

    minamount.change(function () {
        let data = minamount.val();
        minamount.val(formatMoney(data.replaceAll(/[\s.đ]/ig, '')));
    });
    maxamount.change(function () {
        let data = maxamount.val();
        maxamount.val(formatMoney(data.replaceAll(/[\s.đ]/ig, '')));
    });

    /*--------------------------
        Select
    ----------------------------*/
    $("select").niceSelect();

    /*------------------
		Single Product
	--------------------*/
    $('.product__details__pic__slider img').on('click', function () {

        var imgurl = $(this).data('imgbigurl');
        var bigImg = $('.product__details__pic__item--large').attr('src');
        if (imgurl != bigImg) {
            $('.product__details__pic__item--large').attr({
                src: imgurl
            });
        }
    });

    /*-------------------
		Quantity change
	--------------------- */
    var proQty = $('.pro-qty');
    proQty.prepend('<span class="dec qtybtn">-</span>');
    proQty.append('<span class="inc qtybtn">+</span>');
    proQty.on('click', '.qtybtn', function () {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        if ($button.hasClass('inc')) {
            // uck
            var newVal = parseInt(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 1) {
                // uck
                var newVal = parseInt(oldValue) - 1;
            } else {
                // uck
                newVal = 1;
            }
        }
        $button.parent().find('input').val(newVal);
        updateTotal($button);
    });

    // uck - vc
    $('.pro-qty > input').change(function () {
        if ($(this).val() < 1) {
            $(this).val(1);
        }
        updateTotal($(this));
    });

})(jQuery);