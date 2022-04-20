<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="hero">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>Loại thiệp</span>
                    </div>
                    <ul>
                        <li><a href="#">Category Name</a></li>
                        <li><a href="#">Category Name</a></li>
                        <li><a href="#">Category Name</a></li>
                        <li><a href="#">Category Name</a></li>
                        <li><a href="#">Category Name</a></li>
                        <li><a href="#">Category Name</a></li>
                        <li><a href="#">Category Name</a></li>
                        <li><a href="#">Category Name</a></li>
                        <li><a href="#">Category Name</a></li>
                        <li><a href="#">Category Name</a></li>
                        <li><a href="#">Category Name</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="#">
                            <!-- <div class="hero__search__categories">
                                All Categories
                                <span class="arrow_carrot-down"></span>
                            </div> -->
                            <input type="text" placeholder="Loại thiệp bạn cần là gì?">
                            <button type="submit" class="site-btn">TÌM</button>
                        </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>+84 09.999.999</h5>
                            <span>Hỗ trợ 24/7</span>
                        </div>
                    </div>
                </div>
                <!-- banner -->
                <div class="hero__item set-bg" data-setbg="<c:url value ='/resources/img/hero/banner.jpg'/>" >
                    <div class="hero__text">
                        <span>FRUIT FRESH</span>
                        <h2>Vegetable <br />100% Organic</h2>
                        <p>Free Pickup and Delivery Available</p>
                        <a href="#" class="primary-btn">SHOP NOW</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>