<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ page import="java.util.Random"  %>  
<%@ page import="java.text.DecimalFormat"  %>  
<%@ page import="N1.Service.*"  %>  
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Trang chủ</title>

    <jsp:include page="./module/link-css.jsp"/>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <jsp:include page="./module/header-mobile.jsp">
        <jsp:param name="activePage" value="home" />
    </jsp:include>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <jsp:include page="./module/header.jsp">
        <jsp:param name="activePage" value="home" />
    </jsp:include>
    <!-- Header Section End -->

    <!-- Search bar Begin -->
    <jsp:include page="./module/search-bar.jsp">
        <jsp:param name="showBanner" value="true" />
    </jsp:include>
    <!-- Search bar End -->

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <c:forEach var="loaiSp" items="${dsLoaiSanPham}">
                        <div class="col-lg-3">
                            <% 
                                Random rand=new Random(); 
                                int ranNum=rand.nextInt(5)+1; 
                                request.setAttribute("ranNum", ranNum); 
                            %>
                            <div class="categories__item set-bg"
                                data-setbg="<c:url value = '/resources/user/img/categories/cat-${ranNum}.jpg' />">
                                <h5><a href="#">${loaiSp.tenLSP}</a></h5>
                            </div>
                        </div>
                    </c:forEach>      
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Sản phẩm nổi bật</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">Tất cả</li>
                            <c:forEach var="loaiSp" items="${dsLoaiSanPham}">
                                <li data-filter='.${fn:replace(loaiSp.tenLSP, " ", "-")}'>${loaiSp.tenLSP}</li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="featured__filter" class="row featured__filter">
                <c:forEach var="sanPham" items="${dsSanPham}" begin="0" end="7">
                    <div class='col-lg-3 col-md-4 col-sm-6 mix <c:forEach var="lsp" items="${sanPham.dsLoaiSP}">${fn:replace(lsp.loaiSanPham.tenLSP, " ", "-")} </c:forEach>'>
                        <div class="featured__item"
                            onclick=window.location.href='<c:url value = "/trang-chu" />'>
                            <div class="featured__item__pic set-bg"
                                data-setbg="<c:url value = '${sanPham.hinhAnh}' />">
                                <ul class="featured__item__pic__hover">
                                    <li>
                                        <a href="#"><i class="fa fa-heart"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="featured__item__text">
                                <h6><a href="#">${sanPham.tenSp}</a></h6>
                                <h5>${sanPham.giaSP}</h5>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="<c:url value = '/resources/user/img/banner/banner-1.jpg' />" alt="" />
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="<c:url value = '/resources/user/img/banner/banner-2.jpg' />" alt="" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->

    <!-- Latest Product Section Begin -->
    <section class="latest-product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Sản phẩm mới nhất</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <c:forEach var="sanPham" items="${dsSanPhamMoi}" begin="0" end="2">
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="<c:url value = '${sanPham.hinhAnh}'/>" alt="" />
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>${sanPham.tenSp}</h6>
                                            <span>${sanPham.giaSP}</span>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <c:forEach var="sanPham" items="${dsSanPhamMoi}" begin="3" end="6">
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="<c:url value = '${sanPham.hinhAnh}'/>" alt="" />
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>${sanPham.tenSp}</h6>
                                            <span>${sanPham.giaSP}</span>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Sản phẩm hàng đầu</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <c:forEach var="sanPham" items="${dsSanPhamTot}" begin="0" end="2">
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="<c:url value = '${sanPham.hinhAnh}' />" alt="" />
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>${sanPham.tenSp}</h6>
                                            <span>${sanPham.giaSP}</span>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <c:forEach var="sanPham" items="${dsSanPhamTot}" begin="3" end="6">
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="<c:url value = '${sanPham.hinhAnh}' />" alt="" />
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>${sanPham.tenSp}</h6>
                                            <span>${sanPham.giaSP}</span>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Đánh giá Sản phẩm</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <c:forEach var="sanPham" items="${dsDanhGiaSp}" begin="0" end="2">
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="<c:url value = '${sanPham.hinhAnh}' />" alt="" />
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>${sanPham.tenSp}</h6>
                                            <span>${sanPham.giaSP}</span>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <c:forEach var="sanPham" items="${dsDanhGiaSp}" begin="3" end="6">
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="<c:url value = '${sanPham.hinhAnh}' />" alt="" />
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>${sanPham.tenSp}</h6>
                                            <span>${sanPham.giaSP}</span>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Product Section End -->

    <!-- Footer Section Begin -->
    <jsp:include page="./module/footer.jsp" />
    <!-- Footer Section End -->
    <jsp:include page="./module/link-js.jsp"/>
</body>

</html>