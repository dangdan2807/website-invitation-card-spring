<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.springframework.web.servlet.tags.Param"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Giỏ Hàng</title>

<jsp:include page="./module/link-css.jsp" />
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<jsp:include page="./module/header-mobile.jsp">
		<jsp:param name="activePage" value="shopping-cart" />
	</jsp:include>
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<jsp:include page="./module/header.jsp">
		<jsp:param name="activePage" value="shopping-cart" />
	</jsp:include>
	<!-- Header Section End -->

	<!-- Search bar Begin -->
	<jsp:include page="./module/search-bar.jsp">
		<jsp:param name="showBanner" value="false" />
	</jsp:include>

	<!-- Breadcrumb Section Begin -->
	<!-- Breadcrumb Section End -->

	<!-- Shoping Cart Section Begin -->
	<section class="shoping-cart spad">
		<div class="container">
			<div class="row shoping__cart-desktop">
				<div class="col-lg-12">
					<div class="shoping__cart__table">
					<form:form id="gioHangForm"
								action="${pageContext.request.contextPath}/user/gio-hang" method="POST">
						<table>
							<thead>
								<tr>
									<th class="shoping__product">Sản phẩm</th>
									<th>Giá</th>
									<th>Giảm giá</th>
									<th>Số lượng</th>
									<th>Tổng tiền</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="gioHang" items="${dsSanPhamGioHang}">
									
									<tr>
										<input type="hidden" value="${gioHang.sanPham.maSp}" name="dscthdmaSp"/>
										<td class="shoping__cart__item"><img
											src="<c:url value = '${gioHang.sanPham.hinhAnh}' />" alt="">
											<h5>${gioHang.sanPham.tenSp}</h5></td>
										<td class="shoping__cart__price">
											${gioHang.sanPham.giaSP}</td>
										<td class="shoping__cart__discount__percent">
											${gioHang.sanPham.giamGia}</td>
										<td class="shoping__cart__quantity">
											<div class="quantity">
												<div class="pro-qty">
													<input type="text" value="${gioHang.soLuong }" name="dscthdsoLuong">
												</div>
											</div>
										</td>
										<td class="shoping__cart__total">${gioHang.sanPham.giaSP * gioHang.soLuong * (100 - gioHang.sanPham.giamGia) / 100}
										</td>
										<td class="shoping__cart__item__close">
											<form:form method="POST"
												action="${pageContext.request.contextPath}/user/gio-hang/id=${gioHang.sanPham.maSp}"
												accept-charset="UTF-8">
												<span id="btn-delete" class="icon_close"></span>
											</form:form>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</form:form>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__btns">
						<a href="<c:url value = '/san-pham' />" class="primary-btn cart-btn">
							TIẾP TỤC MUA SẮM
						</a> 
						<button class="primary-btn cart-btn cart-btn-right" onclick="document.querySelector('#gioHangForm').submit();" style="    border: none;"> 
							<span class="icon_loading"></span> 
							CẬP NHẬT GIỎ HÀNG
						</button>
					</div>
				</div>
				<div class="col-lg-6 offset-lg-6">
					<div class="shoping__checkout">
						<h5>Tổng số giỏ hàng</h5>
						<ul>
							<li>Thành Tiền <span>${tongTien}</span></li>
							<li>Total <span>${tongTien}</span></li>
						</ul>
						<%-- <a href="<c:url value = '/user/gio-hang' />" class="primary-btn">TIẾN HÀNH KIỂM TRA</a> --%>
						<a href="<c:url value = '/user/thanh-toan' />" class="primary-btn">THANH TOÁN</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shoping Cart Section End -->

	<!-- Footer Section Begin -->
	<jsp:include page="./module/footer.jsp" />
	<!-- Footer Section End -->

	<jsp:include page="./module/link-js.jsp" />
	
	<script type="text/javascript">
		$('#btn-delete').click(function() {
			if(!confirm('Bạn có muốn xóa sản phẩm này không?')){
				return false;
			} else {
				$(this).parent().submit();
				return true;
			}
		});
	</script>

</body>

</html>