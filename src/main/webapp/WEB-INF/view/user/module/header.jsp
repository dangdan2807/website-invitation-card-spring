<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="header__top__left">
                        <ul>
                            <li>
                                <i class="fa fa-envelope"></i>
                                <a href="mailto:hello@code.com">hello@code.com</a>
                            </li>
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
                            <a href='<c:url value = "/san-pham" />'>Cửa Hàng</a>
                        </li >
                        
                        <li <% 
                            if(tag.equals("shopping-cart")) {
                                out.print("class='active'");
                            }
                            %>
                        >
                            <a href='<c:url value = "/user/gio-hang" />'>Giỏ Hàng</a>
                        </li>
                        
                        <li <% 
                            if(tag.equals("contact")) {
                                out.print("class='active'");
                            }
                            %>
                        >
                            <a href='<c:url value = "/lien-he" />'>Liên Hệ</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li><a href="<c:url value = '/gio-hang' />"><i class="fa fa-shopping-bag"></i> <span>2</span></a></li>
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