<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Danh sách sản phẩm</title>

    <jsp:include page="./module/link-css.jsp" />
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <jsp:include page="./module/header-mobile.jsp">
        <jsp:param name="activePage" value="shop-grid" />
    </jsp:include>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <jsp:include page="./module/header.jsp">
        <jsp:param name="activePage" value="shop-grid" />
    </jsp:include>
    <!-- Header Section End -->

    <!-- Search bar Begin -->
    <jsp:include page="./module/search-bar.jsp">
        <jsp:param name="showBanner" value="false" />
    </jsp:include>

    <!-- Breadcrumb Section Begin -->
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>Loại Thiệp</h4>
                            <ul>
                                <li>
                                    <a href='<c:url value = "/san-pham"/>'
                                        class='<c:if test="${selectedCategoryId == 0}">active</c:if>'
                                    >
                                        <span>Tất cả</span>
                                    </a>
                                </li>
                                <c:forEach var="loaiSp" items="${dsLoaiSanPham}">
                                    <li>
                                    	<a href='<c:url value = "/danh-muc/id=${loaiSp.maLSP}"/>'
                                            class='<c:if test="${selectedCategoryId == loaiSp.maLSP}">active</c:if>'
                                        >
                                        	<span>${loaiSp.tenLSP}</span>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="sidebar__item">
                            <h4>Giá</h4>
                            <div class="price-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                    data-min="0" data-max="100">
                                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                    <span tabindex="0"
                                        class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                    <span tabindex="0"
                                        class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                </div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <input name="minPrice" type="text" id="minamount" />
                                        <input name="maxPrice" type="text" id="maxamount" />
                                    </div>
                                </div>
                                <div class="sidebar__item__btn">
                                	<button 
                                		class="site-btn sidebar__item__btn-submit"
                                	>Tìm</button>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>Sản Phẩm Mới</h4>
                                <div class="latest-product__slider owl-carousel">
                                	<c:forEach var="i" items="{1, 2}" varStatus="myIndex">
	                                    <div class="latest-prdouct__slider__item">
	                                        <c:forEach var="sanPham" items="${dsSanPhamMoi}" begin="${myIndex.index * 3}" end="${(myIndex.index + 1) * 3 - 1}">
	                                            <a href="<c:url value = '/san-pham/id=${sanPham.maSp}'/>" class="latest-product__item">
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
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>Giảm Giá</h2>
                        </div>
                        <div class="row">
                            <div class="product__discount__slider owl-carousel">
                                <c:forEach var="sanPham" items="${dsSpGiamGia}" begin="0" end="5">
                                    <div class="col-lg-4">
                                        <div class="product__discount__item"
                                            onclick=window.location.href='<c:url value = "/san-pham/id=${sanPham.maSp}" />'
                                            >
                                            <div class="product__discount__item__pic set-bg"
                                                data-setbg="<c:url value = '${sanPham.hinhAnh}' />">
                                                <div class="product__discount__percent">-${sanPham.giamGia}</div>
                                            </div>
                                            <div class="product__discount__item__text">
                                                <h5><a href="<c:url value = '/san-pham/id=${sanPham.maSp}'/>">${sanPham.tenSp}</a></h5>
                                                <div class="product__item__price">
                                                    <strong>${sanPham.giaSP * (1 - sanPham.giamGia / 100)}</strong>
                                                    <span>${sanPham.giaSP}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sắp xếp</span>
                                    <select name="sort">
                                       	<option value="asc" 
                                       		<c:if test="${sort == 'asc'}">selected</c:if>
                                       	>Giá: Thấp đến Cao</option>
                                        <option value="desc"
                                        	<c:if test="${sort == 'desc'}">selected</c:if>
                                        >Giá: Cao đến Thấp</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6>Tìm thấy <span>${slSanPham}</span> sản phẩm</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach var="sanPham" items="${dsSanPham}">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item"
                                onclick=window.location.href='<c:url value = "/san-pham/id=${sanPham.maSp}" />'
                                >
                                    <div class="product__item__pic set-bg"
                                        data-setbg="<c:url value = '${sanPham.hinhAnh}' />">
                                    </div>
                                    <div class="product__item__text">
                                        <h6><a href='<c:url value = "/san-pham/id=${sanPham.maSp}" />'>${sanPham.tenSp}</a></h6>
                                        <h5>${sanPham.giaSP}</h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="product__pagination">
                        <c:if test="${currentPage > 1}">
                            <a class="pagination__link" onclick="pagingPage(${currentPage - 1});">
                                <i class="fa fa-long-arrow-left"></i>
                            </a>
                        </c:if>
                        <c:forEach var="sp" items="${pagingSize}">
                            <c:if test="${((currentPage - sp) >= 1) && ((currentPage - sp) <= pageOfNumber)}">
                                <a class="pagination__link" onclick="pagingPage(${currentPage - sp});"
                                    class='<c:if test="${currentPage == currentPage - sp}">active</c:if>'
                                >
                                    ${currentPage - sp}
                                </a>
                            </c:if>
                        </c:forEach>
                        <c:if test="${currentPage < pageOfNumber}">
                            <a class="pagination__link" onclick="pagingPage(${currentPage + 1});">
                                <i class="fa fa-long-arrow-right"></i>
                            </a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

    <!-- Footer Section Begin -->
    <jsp:include page="./module/footer.jsp" />
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <jsp:include page="./module/link-js.jsp" />
    <script type="text/javascript">
        function getUrl() {
            var url = window.location.href;
            if (!url.includes('?')) {
                url += "?"
            }
            return url;
		}

        function pagingPage(page) {
            var url = getUrl();

            if (url.includes('page')) {
                url = url.replace(/page=[\d]+/ig, 'page=' + page);
            } else {
                url += '&page=' + page;
            }

            window.location.href = url;
        }

        $('button.sidebar__item__btn-submit').click(function() {
            let minPrice = $('#minamount').val().replaceAll(/[\s.đ]/ig, '');
            let maxPrice = $('#maxamount').val().replaceAll(/[\s.đ]/ig, '');
            var url = getUrl();

            if (url.includes('minPrice')) {
                url = url.replace(/minPrice=[\d]+[đ]*/ig, 'minPrice=' + minPrice);
            } else {
                url += '&minPrice=' + minPrice;
            }

            if (url.includes('maxPrice')) {
                url = url.replace(/maxPrice=[\d]+[đ]*/ig, 'maxPrice=' + maxPrice);
            } else {
                url += '&maxPrice=' + maxPrice;
            }

            window.location.href = url;
        });

        $('.filter__sort select[name="sort"]').change(function() {
            var sort = $(this).val();
            var url = getUrl();

            if (url.includes('sort')) {
                url = url.replace(/sort=[a-zA-z]+/ig, 'sort=' + sort);
            } else {
                url += '&sort=' + sort;
            }
            window.location.href = url;
        });
    </script>
</body>

</html>