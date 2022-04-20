<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
    <div class="humberger__menu__logo">
        <a href="#">
            <img src="<c:url value = '/resources/img/logo.png'/>" alt="">
        </a>
    </div>
    <div class="humberger__menu__cart">
        <ul>
            <li>
                <a href="#">
                    <i class="fa fa-heart"></i> 
                    <span>1</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-shopping-bag"></i> 
                    <span>3</span>
                </a>
            </li>
        </ul>
        <div class="header__cart__price">Tổng tiền: <span>150.000đ</span></div>
    </div>
    <div class="humberger__menu__widget">
        <div class="header__top__right__language">
            <img src="<c:url value = '/resources/img/language.png'/>" alt="">
            <div>Tiếng Việt</div>
            <span class="arrow_carrot-down"></span>
            <ul>
                <li><a href="#">Tiếng Việt</a></li>
                <li><a href="#">English</a></li>
            </ul>
        </div>
        <div class="header__top__right__auth">
            <a href="#"><i class="fa fa-user"></i> Đăng nhập</a>
        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <li class="active"><a href="/trang-chu">Trang Chủ</a></li>
            <li><a href="/shop/shop-grid">Shop</a></li>
            <li><a href="#">Pages</a>
                <ul class="header__menu__dropdown">
                    <li><a href="/shop/shop-details">Shop Details</a></li>
                    <li><a href="/shop/shopping-cart">Giỏ Hàng</a></li>
                    <li><a href="/shop/checkout">Thanh Toán</a></li>
                </ul>
            </li>
            <li><a href="/contact">Liên Hệ</a></li>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="header__top__right__social">
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-pinterest-p"></i></a>
    </div>
    <div class="humberger__menu__contact">
        <ul>
            <li><i class="fa fa-envelope"></i> hello@code.com</li>
            <li>Miễn phí ship cho tất cả đơn hàng từ 99.000đ</li>
        </ul>
    </div>
</div>
