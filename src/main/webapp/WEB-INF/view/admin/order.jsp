<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.springframework.web.servlet.tags.Param"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>${title }</title>

<!-- Custom fonts for this template-->
<jsp:include page="./common/link-css.jsp" />
<style>
.btn-edit, .btn-delete {
	margin: 5px;
}
</style>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="./common/sidebar.jsp" />
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="./common/topbar.jsp" />
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<c:if test="${status != null}">
						<div class="alert alert-${status == 1 ? "success": "warning"} alert-dismissible fade show"
							role="alert">
							<strong>Thông báo</strong> ${msg}
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

					</c:if>
					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Quản lý hóa đơn</h1>
					<!-- <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p> -->

					<div class="card shadow mb-4">
						<div class="card-header py-3 row" style="margin: 0">
							<div class="col-4">
								<button class="btn btn-primary btn-open-modal">Thêm hóa đơn</button>
							</div>
							<div class="col-8" style="text-align: right">
								<jsp:include page="common/page.jsp"></jsp:include>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered table-hover" id="dataTable"
									width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>#</th>
											<th>Mã hóa đơn</th>
											<th>Tên khách hàng</th>
											<th>Số điện thoại</th>
											<th>Địa chỉ</th>
											<th>Tổng tiền</th>
											<th>Trạng thái</th>
											<th>Ngày giao</th>
											<th>Ngày lập hóa đơn</th>
											<th class="text-center">Hành động</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>#</th>
											<th>Mã hóa đơn</th>
											<th>Tên khách hàng</th>
											<th>Số điện thoại</th>
											<th>Địa chỉ</th>
											<th>Tổng tiền</th>
											<th>Trạng thái</th>
											<th>Ngày giao</th>
											<th>Ngày lập hóa đơn</th>
											<th class="text-center">Hành động</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="order" items="${orders}" varStatus="loop">
											<c:url var="editLink" value="./order">
												<c:param name="maHD" value="${order.maHD}" />
											</c:url>
											<c:url var="deleteLink" value="./delete-order">
												<c:param name="maHD" value="${order.maHD}" />
											</c:url>
											<tr>
												<td>${loop.index + 1}</td>
												<td>${order.maHD }</td>
												<td>${order.nguoiDung.tenND }</td>
												<td>${order.nguoiDung.sdt }</td>
												<td>${order.diaChiGiaoHang }</td>
												<td class="money-format">${order.tongTien }</td>
												<td>${order.trangThaiDonHang }</td>
												<td>${order.dateToString(order.ngayGiaoHang) }</td>
												<td>${order.dateToString(order.ngayLHD) }</td>
												<td class="text-center">
													<a class="btn btn-warning btn-edit" href="${editLink }">Sửa</a>
													<a class="btn btn-danger btn-delete" data-msg="hóa đơn với mã là ${order.maHD }" 
														data-href="${deleteLink }">Xóa</a>
												</td>
											</tr>
										</c:forEach>
										
									</tbody>
								</table>
							</div>
						</div>
						<div class="card-footer py-3 row" style="margin: 0">
							<div class="col-4">
								<button class="btn btn-primary btn-open-modal">Thêm hóa đơn</button>
							</div>
							<div class="col-8" style="text-align: right">
								<jsp:include page="common/page.jsp"></jsp:include>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<jsp:include page="./common/footer.jsp" />
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- order modal -->
	<div class="modal fade" id="orderModal" tabindex="-1" role="dialog"
		aria-labelledby="orderModal" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Thêm hóa đơn</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="">X</button>
				</div>
				<div class="modal-body">
					<form:form id="form"
						action="${pageContext.request.contextPath}/admin/order"
						modelAttribute="order" method="POST">
						<form:hidden path="ngayLHD" class="clear"/>
						<div class="mb-3">
							<form:label path="maHD" cssClass="form-label">Mã hóa đơn</form:label>
							<form:input path="maHD" type="text" cssClass="form-control clear" 
								readonly="true"/>
							<form:errors path="maHD" cssClass="form-text error-msg" />
						</div>
						<div class="mb-3 ">
							<div id="search-autocomplete" class="form-outline">
								<form:label path="nguoiDung.maND" class="form-label">Tìm kiếm khách
									hàng</form:label> 
								<form:input path="nguoiDung.maND" cssClass="form-control clear seachUser" list="userListOptions"
									placeholder="Type to search..."/>
								<datalist id="userListOptions">
									<c:forEach var="user" items="${users}" varStatus="loop">
										<option value="${user.maND}" data-tenND="${user.tenND}" data-sdt="${user.sdt}">${user.tenND}-${user.sdt}</option>
									</c:forEach>
									
								</datalist>
								<form:errors path="nguoiDung.maND" cssClass="form-text error-msg" />
							</div>

						</div>
						<div class="mb-3">
							<form:label path="nguoiDung.tenND" cssClass="form-label">Tên khách hàng</form:label>
							<form:input path="nguoiDung.tenND" type="text" cssClass="form-control clear nguoiDungtenND" 
								readonly="true"/>
							<form:errors path="nguoiDung.tenND" cssClass="form-text error-msg" />
						</div>
						<div class="mb-3">
							<form:label path="nguoiDung.sdt" cssClass="form-label">Số điện thoại</form:label> 
							<form:input path="nguoiDung.sdt" 
								type="text" cssClass="form-control clear nguoiDungsdt"
								aria-describedby="sdtHelp" readonly="true"/>
							<form:errors path="nguoiDung.sdt" cssClass="form-text error-msg" />
						</div>
						<div class="mb-3">
							<form:label path="diaChiGiaoHang" cssClass="form-label">Địa chỉ giao hàng</form:label> 
							<form:input path="diaChiGiaoHang" type="text" cssClass="form-control clear"/>
							<form:errors path="diaChiGiaoHang" cssClass="form-text error-msg" />
						</div>
						<div class="mb-3">
							<form:label path="ngayGiaoHang" cssClass="form-label">Ngày giao hàng</form:label> 
							<form:input path="ngayGiaoHang" type="date" cssClass="form-control clear" />
							<form:errors path="ngayGiaoHang" cssClass="form-text error-msg" />
						</div>
						<div class="mb-3">
							<form:label path="trangThaiDonHang" class="form-label">Trạng thái giao hàng</form:label>
							${order.trangThaiDonHang == "pending" ? "selected" : "" }
							<form:select path="trangThaiDonHang" cssClass="form-select form-control clear" aria-label="Default select example">
								
								  <option value="pending" ${order.trangThaiDonHang == "pending" ? "selected" : "" }>
								  	Đang chờ thanh toán</option>
								  <option value="payment" ${order.trangThaiDonHang == "payment" ? "selected" : "" }>
								  	Đã thanh toán</option>
								  <option value="shipping" ${order.trangThaiDonHang == "shipping" ? "selected" : "" }>
								  	Đang giao hàng</option>
								  <option value="complete" ${order.trangThaiDonHang == "complete" ? "selected" : "" }>
								  	Giao hàng hoàn tất</option>
								  <option value="cancelled" ${order.trangThaiDonHang == "cancelled" ? "selected" : "" }>
								  	Đã hủy</option> 
							</form:select>
							<form:errors path="trangThaiDonHang" cssClass="form-text error-msg" />
						</div>
						
						<div class="card shadow mb-4">
							<div class="card-header py-3 row" style="margin: 0">
								<div class="col-6">
									<div id="search-autocomplete" class="form-outline">
										<label for="card-name" class="form-label">Tìm kiếm
											thiệp</label> 
										<input class="form-control clear" list="datalistProduct"
											id="searchProduct"
											placeholder="Nhập tên thiệp để thêm vào hóa đơn...">
										<datalist id="datalistProduct">
											<c:forEach var="product" items="${dsSanPham}" varStatus="loop">
												<option value="${product.tenSp}" data-maSp="${product.maSp}" 
													data-giaSp="${product.getGiaSauGiamGia()}" data-tenSp="${product.tenSp}">${product.tenSp}</option>
											</c:forEach>
										</datalist>
									</div>
								</div>
								<div class="col-3">
									<label for="" class="form-label">Số lượng</label> 
									<input
										type="number" id="soLuongAdd" class="form-control" value="100" min="1"/>
								</div>
								<div class="col-3" style="display: flex; align-items: flex-end;">
									<a class="btn btn-primary btn-add-item">Thêm sản phẩm</a>
								</div>
							</div>
							<div class="table-responsive">
								<table class="table table-bordered table-hover" id="itemTable"
									width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>Mã thiệp</th>
											<th>Tên thiệp</th>
											<th>Số lượng</th>
											<th>Đơn giá</th>
											<th>Thành tiền</th>
											<th class="text-center">Hành động</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="cthd" items="${dsCTHoaDon}" varStatus="loop">
											<tr>
												<input type="hidden" value="${cthd.sanPham.maSp}" name="dscthdmaSp"/>
												<td>${cthd.sanPham.maSp}</td>
												<td>${cthd.sanPham.tenSp}</td>
												<td><input value="${cthd.soLuong}" 
													type="number" class="form-control" name="dscthdsoLuong"/></td>
												<td class="money-format tdGiaSp" data-giaSp="${cthd.giaBan}">${cthd.giaBan}</td>
												<td class="money-format thanhTien">${cthd.giaBan * cthd.soLuong}</td>
												<td class="text-center">
													<a class="btn btn-danger btn-delete-item">Xóa</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="card-footer py-3 row" style="margin: 0">
								<div class="col-6">
									Tổng tiền
								</div>
								<div class="col-6 money-format" style="text-align: right" id="tongTien">
									${order.tongTien}
								</div>
							</div>
					</form:form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Hủy</button>
					<a class="btn btn-primary btn-form"
						onclick="document.querySelector('form#form').submit();">${maHD != null ? "Sửa": "Thêm"}</a>
				</div>
			</div>
		</div>
	</div>
	</div>

	<!-- Logout Modal-->
	<jsp:include page="./common/logout-model.jsp" />

	<!-- Bootstrap core JavaScript-->
	<jsp:include page="./common/link-js.jsp" />

	<script>
		$(document).ready(
				function() {
					tinhTong();
					var modal = new bootstrap.Modal(document
							.getElementById('orderModal'), {
						keyboard : false
					});
					${maHD != null || error == true ? "modal.show();": ""}
					
					/* $(".btn-edit").click(function() {
						modal.show();
					}); */
					$(".btn-open-modal").click(function() {
						$(".btn-form").text("Thêm");
						$(".clear").val("");
						$("#itemTable > tbody").html('');
						tinhTong();
						$("#maHD").val('0');
						modal.show();
					});
					
					$(".btn-delete-item").click(function (){
						$(this).parent().parent().remove();
						tinhTong();
					});
					
					$(".seachUser").on("input", function(){
						console.log("hi");
						var val = document.getElementById("nguoiDung.maND").value;
					    var opts = document.getElementById('userListOptions').childNodes;
					    for (var i = 0; i < opts.length; i++) {
					      if (opts[i].value === val) {
					    	console.log(opts[i], $(opts[i]).attr("data-tenND"), $(opts[i]).attr("data-sdt"));
					    	$(".nguoiDungtenND").val($(opts[i]).attr("data-tenND"));
					    	$(".nguoiDungsdt").val($(opts[i]).attr("data-sdt"));
					        break;
					      }
					    }
					});
					
					var currentSellect;
					$("#searchProduct").on('input', function() {
						var val = document.getElementById("searchProduct").value;
					    var opts = document.getElementById('datalistProduct').childNodes;
					    for (var i = 0; i < opts.length; i++) {
					      if (opts[i].value === val) {
					    	console.log(opts[i]);
					    	currentSellect = opts[i]; 
					        break;
					      }
					    }

					})
					
					$(".btn-add-item").click(function(){
						
						var maSp = $(currentSellect).attr("data-maSp");
						var tenSp = $(currentSellect).attr("data-tenSp");
						var giaSp = $(currentSellect).attr("data-giaSp");
						var soLuong = Number($("#soLuongAdd").val());
						var html = `<tr>
							<input type="hidden" value="`+ maSp +`" name="dscthdmaSp"/>
							<td>`+ maSp +`</td>
							<td>`+ tenSp +`</td>
							<td><input value="`+ soLuong +`" 
								type="number" class="form-control" name="dscthdsoLuong"/></td>
							<td class="money-format tdGiaSp" data-giaSp="`+ giaSp +`">`+ formatNumber(giaSp) +`</td>
							<td class="money-format thanhTien">`+ formatNumber(giaSp*soLuong) +`</td>
							<td class="text-center">
								<a class="btn btn-danger btn-delete-item">Xóa</a>
							</td>
						</tr>`;
						
						$("#itemTable > tbody").append(html);
						
						var btnDelete = document.querySelectorAll(".btn-delete-item");
						for(var i=0; i<btnDelete.length; i++){
							btnDelete[i].addEventListener("click", function (){
								$(this).parent().parent().remove();
								tinhTong();
							})
						}
						$("#searchProduct").val("");
						tinhTong();
					});

					$("input[name='dscthdsoLuong']").on("input", tinhTong);
					
					
					
					function tinhTong(){
						var item = $("#itemTable > tbody > tr");
						var tong = 0;
						for(var i=0; i<item.length; i++){
							var soLuong = $(item[i]).find("input[name='dscthdsoLuong']").val();
							var giaSp = $(item[i]).find(".tdGiaSp").attr("data-giaSp");
							
							tong += giaSp * soLuong;
							console.log(soLuong, giaSp);
							$(item[i]).find(".thanhTien").text(formatNumber(giaSp * soLuong));
						}
						
						$("#tongTien").text(formatNumber(tong));
					}
				});
	</script>
</body>

</html>