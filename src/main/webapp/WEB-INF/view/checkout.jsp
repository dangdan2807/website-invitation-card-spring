<%@ page language="java" contentType="text/html; charset=UTF-8"Billing Details
    pageEncoding="UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Thanh toán</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
        rel="stylesheet" />

    <!-- Css Styles -->
    <link rel="stylesheet" href="<c:url value = '/resources/css/bootstrap.min.css'/>" type="text/css" />
    <link rel="stylesheet" href="<c:url value = '/resources/css/font-awesome.min.css'/>" type="text/css" />
    <link rel="stylesheet" href="<c:url value = '/resources/css/elegant-icons.css'/>" type="text/css" />
    <link rel="stylesheet" href="<c:url value = '/resources/css/nice-select.css'/>" type="text/css" />
    <link rel="stylesheet" href="<c:url value = '/resources/css/jquery-ui.min.css'/>" type="text/css" />
    <link rel="stylesheet" href="<c:url value = '/resources/css/owl.carousel.min.css'/>" type="text/css" />
    <link rel="stylesheet" href="<c:url value = '/resources/css/slicknav.min.css'/>" type="text/css" />
    <link rel="stylesheet" href="<c:url value = '/resources/css/style.css'/>" type="text/css" />
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

    <section class="breadcrumb-section set-bg" data-setbg="c:url value = '/resources/img/breadcrumb.jpg; />">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Thanh toán</h2>
                        <div class="breadcrumb__option">
                            <a href="/trang-chu">Trang chủ</a>
                            <span>Thanh toán</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6>
                        <span class="icon_tag_alt"></span> Bạn có mã giảm giá?
                        <a href="#">Tại đây</a> nhập mã của bạn
                    </h6>
                </div>
            </div>
            <div class="checkout__form">
                <h4></h4>
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Tên<span>*</span></p>
                                        <input type="text" />
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Họ<span>*</span></p>
                                        <input type="text" />
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Quốc gia<span>*</span></p>
                                <input type="text" />
                            </div>
                            <div class="checkout__input">
                                <p>Địa chỉ<span>*</span></p>
                                <input type="text" placeholder="Địa chỉ của bạn ..." class="checkout__input__add" />
                            </div>
                            <div class="checkout__input">
                                <p>Quận/Huyện<span>*</span></p>
                                <input type="text" />
                            </div>
                            <div class="checkout__input">
                                <p>Thành phố/ Tỉnh<span>*</span></p>
                                <input type="text" />
                            </div>
                            <div class="checkout__input">
                                <p>Postcode / ZIP<span>*</span></p>
                                <input type="text" />
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Số điện thoại<span>*</span></p>
                                        <input type="text" />
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text" />
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="acc">
                                    Đăng ký tài khoản mới?
                                    <input type="checkbox" id="acc" />
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <p>
                                Nếu bạn chưa có tài khoản vui lòng đăng ký hoặc đã có vui lòng đăng nhập
                            </p>
                            <div class="checkout__input">
                                <p>Mật khẩu tài khoản<span>*</span></p>
                                <input type="text" />
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="diff-acc">
                                    Giao hàng đến địa chỉ khác?
                                    <input type="checkbox" id="diff-acc" />
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="checkout__input">
                                <p>Ghi chú đơn hàng<span>*</span></p>
                                <input type="text"
                                    placeholder="Ghi chú về đơn hàng của bạn, Ví dụ như ghi chú đặc biệt cho đơn hàng" />
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Đơn hàng của bạn</h4>
                                <div class="checkout__order__products">
                                    Các sản phẩm <span>Giá thành</span>
                                </div>
                                <ul>
                                    <li>Product name 1 <span>79.000đ</span></li>
                                    <li>Product name 2 <span>150.000đ</span></li>
                                    <li>Product name 3 <span>59.000đ</span></li>
                                </ul>
                                <div class="checkout__order__subtotal">
                                    Thành tiền <span>288.000đ</span>
                                </div>
                                <div class="checkout__order__total">
                                    Tổng tiền <span>288.000đ</span>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="acc-or">
                                        Tạo tài khoản?
                                        <input type="checkbox" id="acc-or" />
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <!-- <p>
                    Lorem ipsum dolor sit amet, consectetur adip elit, sed do
                    eiusmod tempor incididunt ut labore et dolore magna aliqua.
                  </p> -->
                                <div class="checkout__input__checkbox">
                                    <label for="payment">
                                        Kiểm tra thanh toán
                                        <input type="checkbox" id="payment" />
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="paypal">
                                        Paypal
                                        <input type="checkbox" id="paypal" />
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <button type="submit" class="site-btn">Đặt hàng</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

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