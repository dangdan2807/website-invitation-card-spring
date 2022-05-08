<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class='hero <c:if test="${!param.showBanner}">hero-normal</c:if>'>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>Loại thiệp</span>
                    </div>
                    <ul>
                        <c:forEach var="loaiSp" items="${dsLoaiSanPham}">
                            <li>
                                <a href='<c:url value = "/danh-muc/id=${loaiSp.maLSP}" />'>${loaiSp.tenLSP}</a>
                            </li>
                        </c:forEach>
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
                            <h5><a href="tel:+849999999">+84 9.999.999</a></h5>
                            <span>Hỗ trợ 24/7</span>
                        </div>
                    </div>
                </div>
                <!-- banner -->
                <c:if test="${param.showBanner}">
                    <div>
                        <div class="ribbon ribbon-top-right"><span>Mới</span></div>
                        <div class="hero__item set-bg" data-setbg="<c:url value ='${sanPhamMoi.hinhAnh}'/>">
                            <div class="hero__text">
                                <span>${sanPhamMoi.dsLoaiSP.get(0).loaiSanPham.tenLSP}</span>
                                <h3>${sanPhamMoi.tenSp}</h3>
                                <br />
                                <!-- <p>Free Pickup and Delivery Available</p> -->
                                <a href='<c:url value = "/san-pham/id=${sanPhamMoi.maSp}" />' 
                                class="primary-btn">MUA NGAY</a>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</section>