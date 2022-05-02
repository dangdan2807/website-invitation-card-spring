<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i> hello@code.com</li>
                            <li>Miễn phí ship cho tất cả đơn hàng từ 99.000đ</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                        </div>
                        <div class="header__top__right__auth">
                            <a href="#"><i class="fa fa-user"></i> Đăng nhập</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="<c:url value ='/trang-chu' />">
                        <img src="<c:url value = '/resources/user/img/logo.png'/>" alt="">
                    </a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li <% 
                        	String tag = request.getParameter("activePage");
                        	if(tag.equals("home")) {
                        		out.print("class='active'");
                        	}
                        	%>
                        >
                            <a href="<c:url value ='/trang-chu' />">Trang chủ</a>
                        </li>
                        
                        <li <% 
                        	if(tag.equals("shop-grid")) {
                        		out.print("class='active'");
                        	}
                        	%>
                        >
                            <a href='<c:url value = "/shop/shop-grid" />'>Cửa Hàng</a>
                        </li >
                        
                        <li <% 
                        	if(tag.equals("shopping-cart")) {
                        		out.print("class='active'");
                        	}
                        	%>
                        >
                            <a href='<c:url value = "/shop/shopping-cart" />'>Giỏ Hàng</a>
                        </li>
                        
                        <li <% 
                        	if(tag.equals("contact")) {
                        		out.print("class='active'");
                        	}
                        	%>
                        >
                            <a href='<c:url value = "/contact" />'>Liên Hệ</a>
                        </li>
                        <!-- <li><a href="#">Pages</a>
                            <ul class="header__menu__dropdown">
                                <li><a href="./shop-details.html">Shop Details</a></li>
                                <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                <li><a href="./checkout.html">Check Out</a></li>
                                <li><a href="./blog-details.html">Blog Details</a></li>
                            </ul>
                        </li>-->
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                        <li><a href="<c:url value = '/shop/shopping-cart' />"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                    </ul>
                    <div class="header__cart__price">Tổng tiền: <span>150.000đ</span></div>
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>