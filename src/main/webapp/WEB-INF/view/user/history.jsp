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
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Đơn hàng của tôi</title>

<jsp:include page="./module/link-css.jsp" />
<style type="text/css">
.item_donhang {
	border: 1px solid #f2f1f6;
	width: 100%;
	margin-bottom: 20px;
}

.item_status_donhang {
	display: inline-block;
	padding: 3px 10px;
	border-radius: 3px;
	color: #fff;
	font-size: 12px;
	width: 110px;
	text-align: center;
}

.tt_donhang {
	font-size: 16px;
	padding: 5px;
	text-align: center;
	background: #f7f7f7;
}

.txt_color {
	color: #333;
}

.txt_chitiet {
	display: inline-block;
	position: absolute;
	right: 10px;
	top: 8px;
}

</style>
</head>

<body>

	<!-- Humberger Begin -->
	<jsp:include page="./module/header-mobile.jsp">
		<jsp:param name="activePage" value="shoppingCart" />
	</jsp:include>
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<jsp:include page="./module/header.jsp">
		<jsp:param name="activePage" value="shoppingCart" />
	</jsp:include>
	<!-- Header Section End -->

	<!-- Search bar Begin -->
	<jsp:include page="./module/search-bar.jsp">
		<jsp:param name="showBanner" value="false" />
	</jsp:include>

	<!-- Breadcrumb Section Begin -->
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<!-- <div class="row">
                <div class="col-lg-12">
                    <h6>
                        <span class="icon_tag_alt"></span> Bạn có mã giảm giá?
                        <a href="#">Tại đây</a> nhập mã của bạn
                    </h6>
                </div>
            </div> -->
			<div class="checkout__form">
				<div id="container-list-orders">
					<c:forEach var="hoadon" items="${hoadons }">
						<div class="item_donhang">
							<div class="tt_donhang">
								<span class="mr-2">Mã đơn hàng <c:out
										value="${hoadon.getMaHD() }"></c:out></span> | <span class="mx-2">
									Đặt ngày: <span> <fmt:formatDate
											value="${hoadon.getNgayLHD() }" pattern="dd-MM-yyyy" />
								</span>
								</span> <span class="item_status_donhang txt_color"
									style="background-color: red; margin-left: 16px; margin-right: 16px; color: white;">Chưa
									thanh toán</span> Thanh toán: <span class="mr-2">Thanh toán khi
									nhận hàng</span> | <span class="mx-2"> Tổng tiền <strong
									style="color: #ff6600;"> <fmt:formatNumber
											value="${hoadon.getTongTien()}" type="currency"
											currencySymbol="" /> đ

								</strong>
								</span>
								<c:url var="xemChiTietUrl"
									value="/user/show-order">
									<c:param name="maHD"
										value="${hoadon.getMaHD() }"></c:param>
										
								</c:url>
								<a href="${xemChiTietUrl }"
									style="color: #326e51; background-color: transparent;"> Xem
									chi tiết <i class="fa fa-caret-right"></i>
								</a>
							</div>


							<div class="list_sp_donhang py-2">
								<c:forEach var="chitiethoadon"
									items="${ hoadon.getDsCTHoaDon()}">
									<div class="row"
										style="width: 89%; margin: auto; align-items: center;">
										<div class="col-lg-2 " style="width: 70px">
											<img style="width: 80px;" alt="" src="${chitiethoadon.getSanPham().getHinhAnh() }">
										</div>
										<div class="col-lg-4">
											Tên sản phẩm:
											<c:out value="${chitiethoadon.getSanPham().getTenSp() }"></c:out>
										</div>
										<div class="col-lg-2">
											Số lượng: <strong><c:out
													value="${chitiethoadon.getSoLuong() }"></c:out> </strong>

										</div>
										<div class="col-lg-4">
											Đơn giá: <strong style="color: #ff6600;"> <fmt:formatNumber
													value="${chitiethoadon.getSanPham().getGiaSP()}"
													type="currency" currencySymbol="" /> đ
											</strong>

										</div>

									</div>

								</c:forEach>
							</div>
						</div>
					</c:forEach>

				</div>
				
				<div class="text-center">
				<c:url var="backUrl" value="/trang-chu"></c:url>
					<a href="${backUrl }"
						style="color: #326e51; background-color: transparent;"> <i
						class="fa fa-caret-left"></i> Quay lại 
					</a>
				</div>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->

	<!-- Footer Section Begin -->
	<jsp:include page="./module/footer.jsp" />
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<jsp:include page="./module/link-js.jsp" />
</body>

</html>