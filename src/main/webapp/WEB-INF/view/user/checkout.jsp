<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge;charset="UTF-8" />
<title>Thanh toán</title>

<jsp:include page="./module/link-css.jsp" />
<style type="text/css">
.tb-hoadon {
	font-size: 14px;
}

.tb-header {
	width: 25%;
}
</style>
<script type="text/javascript">
	function validateAddressNotNull() {
		var a = document.getElementById("input_address");
		console.log("a>> ", a);
		if (a.value === null || a.value === '') {
			a.style.border = "1px solid red";
			return false;
		}
		a.style.border = "1px solid #ebebeb";
		return true;
	};

	function submicForm() {
		event.preventDefault();
		const validate = validateAddressNotNull();
		if (validate == false)
			return;
		event.currentTarget.submit();
	}
</script>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<jsp:include page="./module/header-mobile.jsp">
		<jsp:param name="activePage" value="shoppingCart" />
		<jsp:param name="soLuong" value="${soLuong}" />
		<jsp:param name="tongTienHang" value="${tongTienHang}" />
	</jsp:include>
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<jsp:include page="./module/header.jsp">
		<jsp:param name="activePage" value="shoppingCart" />
		<jsp:param name="soLuong" value="${soLuong}" />
		<jsp:param name="tongTienHang" value="${tongTienHang}" />
	</jsp:include>
	<!-- Header Section End -->

	<!-- Header Section End -->

	<!-- Search bar Begin -->
	<jsp:include page="./module/search-bar.jsp">
		<jsp:param name="showBanner" value="false" />
	</jsp:include>

	<!-- Breadcrumb Section Begin -->
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->

	<c:if test="${dsSanPhamMua.size()==0 }">
		<div style="text-align: center;" class="mb-4">
			<p>Giỏ hàng rỗng</p>
			<a style="color: #326e51; background-color: transparent;"
				href='<c:url value = "/trang-chu" />'>Tiếp
				tục mua hàng <i class="fa fa-shopping-cart" aria-hidden="true"></i>
			</a>
		</div>
	</c:if>

	<c:if test="${dsSanPhamMua.size()!=0 }">
		<section class="checkout spad">
			<div class="container">
				<div class="checkout__form">
					<c:url var="toUrl"
						value="/user/orders/success">
						
					</c:url>
					<form:form id="form-create-order" action="${toUrl}" method="post"
						onsubmit="return submicForm()">
						<div class="row">
							<div class="col-lg-8 col-md-6">
								<div class="row">
									<div class="col-lg-6">
										<div class="checkout__input">
											<p>
												Tên<span>*</span>
											</p>
											<input type="text" readonly="readonly"
												value="${fn:substring(nguoiDung.tenND,fn:split(nguoiDung.tenND, ' ')[0].length() + 1, 500)}" />
										</div>
									</div>
									<div class="col-lg-6">
										<div class="checkout__input">
											<p>
												Họ<span>*</span>
											</p>
											<input type="text" readonly="readonly"
												value="${fn:split(nguoiDung.tenND, ' ')[0]}" />
										</div>
									</div>
								</div>
								<div class="checkout__input">
									<p>
										Số điện thoại<span>*</span>
									</p>
									<input type="text" readonly="readonly" name="sdt"
										value="${nguoiDung.sdt }" />
								</div>
								<div class="checkout__input">
									<p>
										Email<span>*</span>
									</p>
									<input type="text" readonly="readonly" name="taiKhoan"
										value="${nguoiDung.taiKhoan.tenDangNhap }" />
								</div>
								<div class="checkout__input">
									<p>
										Địa chỉ<span>*</span>
									</p>
									<input id="input_address" name="diaChi" path="diaChi"
										style="font-family: 'Roboto', sans-serif;" type="text"
										placeholder="Địa chỉ của bạn ..." class="checkout__input__add"
										onkeyUp="validateAddressNotNull()" value="${nguoiDung.diaChi}" />
								</div>
								<div class="checkout__input">
									<p>
										Ghi chú đơn hàng<span>*</span>
									</p>
									<input type="text"
										placeholder="Ghi chú về đơn hàng của bạn, Ví dụ như ghi chú đặc biệt cho đơn hàng" />
								</div>
							</div>
							<div class="col-lg-4 col-md-6">
								<div class="checkout__order">
									<h4>Đơn hàng của bạn</h4>
									<table style="width: 100%" class="tb-hoadon">
										<tr>
											<th class="tb-header">Sản phẩm</th>
											<th class="tb-header">Giá thành</th>
											<th class="tb-header">Số lượng</th>
											<th class="tb-header">Thành tiền</th>
										</tr>
										<c:forEach var="sanPhamMua" items="${dsSanPhamMua }">
											<tr>
												<td>${sanPhamMua.tenSp}</td>
												<td><fmt:formatNumber value="${sanPhamMua.giaSp}"
														type="currency" currencySymbol="" />đ</td>
												<td>${sanPhamMua.soLuong}</td>
												<td><fmt:formatNumber value="${sanPhamMua.thanhTien}"
														type="currency" currencySymbol="" />đ</td>

											</tr>
										</c:forEach>


									</table>

									<div class="checkout__order__subtotal">
										Tổng tiền hàng <span> <c:out value="${tongTienHang}"></c:out></span>

									</div>
									<div class="row">
										<div class="col-8">Giảm giá</div>
										<div class="col-4 text-right">
											<div class="checkout__order__subtotal"
												style="border: none; padding-top: 0; font-weight: normal">
												<span> -<c:out value="${giamGia}"></c:out>

												</span>
											</div>

										</div>
									</div>
									<div class="checkout__order__total">
										Tổng thanh toán <strong style="float: right; color:#dd2222;" >

											<fmt:formatNumber value="${tongThanhToan}" type="currency"
												currencySymbol="" />đ

										</strong>
									</div>
									<button type="submit" class="site-btn">Đặt hàng</button>
								</div>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</section>
	</c:if>

	<!-- Checkout Section End -->

	<!-- Footer Section Begin -->
	<jsp:include page="./module/footer.jsp" />
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<jsp:include page="./module/link-js.jsp" />
</body>

</html>