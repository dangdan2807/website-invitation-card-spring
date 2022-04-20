<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<c:url value = '/resources/css/bootstrap.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value = '/resources/css/font-awesome.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value = '/resources/css/elegant-icons.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value = '/resources/css/nice-select.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value = '/resources/css/jquery-ui.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value = '/resources/css/owl.carousel.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value = '/resources/css/slicknav.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value = '/resources/css/style.css'/>" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <jsp:include page="./common/top-header.jsp" />
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <jsp:include page="./common/header.jsp" />
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <!-- Search bar Begin -->
    <jsp:include page="./common/search-bar.jsp" />
    <!-- Search bar End -->
    
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<c:url value = '/resources/img/breadcrumb.jpg' />">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Giỏ Hàng</h2>
                        <div class="breadcrumb__option">
                            <a href="/trang-chu">Home</a>
                            <span>Giỏ Hàng</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Sản phẩm</th>
                                    <th>Giá</th>
                                    <th>Số lượng</th>
                                    <th>Tổng tiền</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="<c:url value = '/resources/img/cart/cart-1.jpg' />" alt="">
                                        <h5>Product Name 1</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        55.000đ
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="2">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        110.000đ
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="<c:url value = '/resources/img/cart/cart-2.jpg' />" alt="">
                                        <h5>Product name 2</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        39.000đ
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        39.000đ
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="<c:url value = '/resources/img/cart/cart-3.jpg' />" alt="">
                                        <h5>Product name 3</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        69.000đ
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        69.000đ
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="#" class="primary-btn cart-btn">TIẾP TỤC MUA SẮM</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            CẬP NHẬT GIỎ HÀNG</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Mã giảm giá</h5>
                            <form action="#">
                                <input type="text" placeholder="Nhập mã giảm giá">
                                <button type="submit" class="site-btn">ÁP DỤNG COUPON</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Tổng số giỏ hàng</h5>
                        <ul>
                            <li>Thành Tiền <span>218.000đ</span></li>
                            <li>Total <span>218.000đ</span></li>
                        </ul>
                        <a href="#" class="primary-btn">TIẾN HÀNH KIỂM TRA</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

    <!-- Footer Section Begin -->
    <jsp:include page="./common/footer.jsp" />
    <!-- Footer Section End -->

   <!-- Js Plugins -->
    <script src="<c:url value = '/resources/js/jquery-3.3.1.min.js'/>"></script>
    <script src="<c:url value = '/resources/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value = '/resources/js/jquery.nice-select.min.js'/>"></script>
    <script src="<c:url value = '/resources/js/jquery-ui.min.js'/>"></script>
    <script src="<c:url value = '/resources/js/jquery.slicknav.js'/>"></script>
    <script src="<c:url value = '/resources/js/mixitup.min.js'/>"></script>
    <script src="<c:url value = '/resources/js/owl.carousel.min.js'/>"></script>
    <script src="<c:url value = '/resources/js/main.js'/>"></script>

</body>

</html>