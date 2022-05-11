<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Random"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="N1.Service.*"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chi Tiết Hóa Đơn</title>

<jsp:include page="./module/link-css.jsp" />

<style type="text/css">
.content_box_profile_page {
	border: solid 1px #e5e5e5;;
	padding: 10px 0;
	color: #333;
	font-family: 'Roboto', sans-serif;
	font-size: 13px;
}

.thong-bao {
	position: fixed;
	top: -100px;
	left: 50%;
	width: 250px;
	height: 100px;
	border: 1px solid #326e51;
	z-index: 1000;
	transform: translateX(-50%);
	background-color: #CFEADD;
	border-radius: 7px;
    display: flex;
    align-items: center;
	animation-name: appear-noti;
	animation-duration: 2s;
    
}

@keyframes appear-noti {
	0%   {top: -50px;}
	100% {top:20px;}
}
.thong-bao p {text-align: center; width: 100%;color: #326E52}

table {
	border: solid 1px #e5e5e5;
}

.tb_chitiet_donhang {
	border-collapse: collapse;
	border-spacing: 0;
}

.tb_header {
	color: #333;
	font-family: 'Roboto', sans-serif;
	font-size: 13px;
	font-weight: 700;
	border: solid 1px #e5e5e5;
	background: #f7f7f7;
}

.tb_chitiet_donhang td.col_sanpham {
	width: 45%;
}

.tb_chitiet_donhang td.col_dongia {
	width: 15%;
}

.tb_chitiet_donhang td.col_soluong {
	width: 8%;
}

.tb_chitiet_donhang td.col_tamtinh {
	width: 10%;
}

#order-item-row {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
	border: solid 1px #e5e5e5;
}

.container-sanpham {
	display: flex;
	align-items: center;
}

.tb_chitiet_donhang .containter-img-sanpham {
	width: 80px;
	margin-right: 10px;
}

.tb_chitiet_donhang td {
	padding: 7px 10px;
	border-bottom: 1px solid #e5e5e5;
}

img {
	padding: 5px;
}

.containter-img-sanpham {
	display: block;
}

.tfooter {
	height: 130px;
	background: #f7f7f7;
}
</style>
</head>
<body>
		<div class="thong-bao">
			<p>Bạn đã đặt hàng thành công
				<span class="icon-check ml-2">	<i class="fa fa-check-circle" aria-hidden="true"></i></span>
			</p>
		</div>

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

				<div class="title_page"
					style="font-size: 18px; font-weight: 700; padding-bottom: 10px; font-family: 'Roboto', sans-serif;">Chi
					tiết đơn hàng</div>
				<div class="content_box_profile_page row">

					<div class="col-lg-3 ">
						<div>
							Đơn hàng <span style="font-weight: 600"> #<c:out
									value="${hoadonThanhToan.getMaHD() }"></c:out></span>
						</div>
						<div>
							Ngày đặt:
							<fmt:formatDate value="${hoadonThanhToan.getNgayLHD() }"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</div>

						<div>
							Trạng thái:<span style="font-weight: 600"><c:out
									value="${hoadonThanhToan.getTrangThaiDonHang() }"></c:out></span>
						</div>
					</div>

					<div class="col-lg-6 ">
						<div style="font-weight: 600">Địa chỉ người nhận</div>
						<div>
							<c:out value="${hoadonThanhToan.getNguoiDung().getTenND()}"></c:out>
						</div>
						<div>
							Điện thoại :
							<c:out value="${hoadonThanhToan.getNguoiDung().getSdt() }"></c:out>
						</div>
						<div>
							<c:out value="${hoadonThanhToan.getDiaChiGiaoHang()}"></c:out>
						</div>
					</div>

					<div class="col-lg-3 ">
						<div style="font-weight: 600">Phương thức thanh toán</div>
						<div>Thanh toán khi nhận hàng (COD)</div>
						<div style="font-weight: 600">Ngày giao dự kiến</div>
						<div>

							<fmt:formatDate value="${hoadonThanhToan.getNgayGiaoHang() }"
								pattern="dd-MM-yyyy" />
						</div>
					</div>

				</div>
				<div class="row" style="margin-top: 20px;">
					<table border="0" style="width: 100%;" class="tb_chitiet_donhang">

						<tr class="tb_header">
							<td class="col_sanpham">Sản phẩm</td>
							<td class="col_dongia">Đơn giá</td>
							<td class="col_soluong text-right">Số lượng</td>
							<td class="col_tamtinh text-right">Tạm tính</td>
						</tr>
						<c:forEach var="chiTietHoaDon" items="${chiTietHoaDons }">
							<tr id="order-item-row">
								<td>
									<div class="container-sanpham">
										<div class="containter-img-sanpham">
											<img alt="" src="${chiTietHoaDon.getSanPham().getHinhAnh() }">
										</div>

										<div class="infor-sanpham" style="font-size: 16px;">
											<div
												style="font-family: 'Roboto', sans-serif; font-size: 14px">
												<c:out value="${chiTietHoaDon.getSanPham().getTenSp() }"></c:out>
											</div>

										</div>
									</div>

								</td>
								<td style="font-size: 14px;"><fmt:formatNumber
										value="${chiTietHoaDon.getSanPham().getGiaSP()}"
										type="currency" currencySymbol="" /> đ</td>
								<td style="font-size: 14px;" class="text-right">${chiTietHoaDon.getSoLuong()}</td>
								<td style="font-size: 14px;" class="text-right"><fmt:formatNumber
										value="${chiTietHoaDon.getThanhTien()}" type="currency"
										currencySymbol="" /> đ</td>
							</tr>
						</c:forEach>
						<tr class="tfooter">
							<td colspan="3">
								<div class="text-right">
									<div
										style="font-family: 'Roboto', sans-serif; font-size: 14px; padding: 5px;">Tạm
										tính</div>
									<div
										style="font-family: 'Roboto', sans-serif; font-size: 14px; padding: 5px;">Giảm
										giá</div>
									<div
										style="font-family: 'Roboto', sans-serif; font-size: 14px; padding: 5px;">
										<strong> Thành tiền</strong>
									</div>

								</div>

							</td>
							<td>
								<div class="text-right">
									<div
										style="font-family: 'Roboto', sans-serif; font-size: 14px; padding: 5px;">
										<fmt:formatNumber value="${tongTienHang}" type="currency"
											currencySymbol="" />
										đ
									</div>
									<div
										style="font-family: 'Roboto', sans-serif; font-size: 14px; padding: 5px;">
										<strong>-<fmt:formatNumber value="${giamGia}"
												type="currency" currencySymbol="" />đ
										</strong>
									</div>
									<div
										style="font-family: 'Roboto', sans-serif; font-size: 14px; padding: 5px; color: red;">
										<strong> <fmt:formatNumber
												value="${hoadonThanhToan.getTongTien()}" type="currency"
												currencySymbol="" /> đ
										</strong>
									</div>
								</div>

							</td>
						</tr>
					</table>

				</div>

				<div class="text-center">
					<c:url var="backUrl" value="/user/order/history" />
					<a href="${backUrl}"
						style="color: #326e51; background-color: transparent;"> <i
						class="fa fa-caret-left"></i> Quay lại đơn hàng của tôi
					</a>
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