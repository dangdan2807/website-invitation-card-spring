<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Liên hệ chúng tôi</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

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
    <jsp:include page="./common/header-mobile.jsp" >
    	<jsp:param name="activePage" value="contact" />
    </jsp:include>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <jsp:include page="./common/header.jsp" >
    	<jsp:param name="activePage" value="contact" />
    </jsp:include>
    <!-- Header Section End -->

    <!-- Search bar Begin -->
    <jsp:include page="./common/search-bar.jsp" >
        <jsp:param name="showBanner" value="false" />
    </jsp:include>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<c:url value = '/resources/img/breadcrumb.jpg' />">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Liên hệ chúng tôi</h2>
                        <div class="breadcrumb__option">
                            <a href="./trang-chu">Trang chủ</a>
                            <span>Liên hệ chúng tôi</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_phone"></span>
                        <h4>Số điện thoại</h4>
                        <p>+84 09.999.999</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_pin_alt"></span>
                        <h4>Địa chỉ</h4>
                        <p>12 Nguyễn Văn Bảo, P.4, Q.Gò Vấp, TP.Hồ Chí Minh</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_clock_alt"></span>
                        <h4>Thời gian mở cữa</h4>
                        <p>07:00 đến 19:00</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_mail_alt"></span>
                        <h4>Email</h4>
                        <p>hello@code.com</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

    <!-- Map Begin -->
    <div class="map">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15675.425754936272!2d106.6874508!3d10.8222965!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x8b7bb8b7c956157b!2sIndustrial%20University%20of%20Ho%20Chi%20Minh%20City!5e0!3m2!1sen!2s!4v1650281774184!5m2!1sen!2s"
            height="500" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        <div class="map-inside">
            <i class="icon_pin"></i>
            <div class="inside-widget">
                <h4>TP.HỒ CHÍ MINH</h4>
                <ul>
                    <li>Số điện thoại: +84 09.999.999</li>
                    <li>Địa chỉ: 12 Nguyễn Văn Bảo, P.4, Q.Gò Vấp, TP.Hồ Chí Minh</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Map End -->

    <!-- Contact Form Begin -->
    <div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2>Liên Hệ</h2>
                    </div>
                </div>
            </div>
            <form action="#">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <input type="text" placeholder="Your name">
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <input type="text" placeholder="Your Email">
                    </div>
                    <div class="col-lg-12 text-center">
                        <textarea placeholder="Your message"></textarea>
                        <button type="submit" class="site-btn">Gửi</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Contact Form End -->

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