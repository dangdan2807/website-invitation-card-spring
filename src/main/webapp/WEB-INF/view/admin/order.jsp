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

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Quản lý hóa đơn</h1>
					<!-- <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p> -->

					<div class="card shadow mb-4">
						<div class="card-header py-3 row" style="margin: 0">
							<div class="col-4">
								<button class="btn btn-primary" data-toggle="modal"
									data-target="#orderModal">Thêm hóa đơn</button>
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
											<c:forEach var="cthd" items="order.dsCTHoaDon" varStatus="status">
												${cthd }
												
											</c:forEach>
											<tr>
												<td>${loop.index + 1}</td>
												<td>${order.maHD }</td>
												<td>${order.nguoiDung.tenND }</td>
												<td>${order.nguoiDung.sdt }</td>
												<td>${order.diaChiGiaoHang }</td>
												<td>${order.tongTien }<sup>đ</sup></td>
												<td>${order.trangThaiDonHang }</td>
												<td>${order.dateToString(order.ngayGiaoHang) }</td>
												<td>${order.dateToString(order.ngayLHD) }</td>
												<td class="text-center">
													<button class="btn btn-warning btn-edit">Sửa</button>
													<button class="btn btn-danger btn-delete">Xóa</button>
												</td>
											</tr>
										</c:forEach>
										
									</tbody>
								</table>
							</div>
						</div>
						<div class="card-footer py-3 row" style="margin: 0">
							<div class="col-4">
								<button class="btn btn-primary" data-toggle="modal"
									data-target="#orderModal">Thêm hóa đơn</button>
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
						<div class="mb-3 ">
							<div id="search-autocomplete" class="form-outline">
								<label class="form-label" for="maND">Tìm kiếm khách
									hàng</label> 
								<input class="form-control" list="userListOptions"
									id="maND" placeholder="Type to search...">
								<datalist id="userListOptions">
									<c:forEach var="user" items="${users}" varStatus="loop">
										<option value="${user.maND}">${user.tenND}-${user.sdt}</option>
									</c:forEach>
									
								</datalist>
							</div>

						</div>
						<div class="mb-3">
							<label for="tenND" class="form-label">Tên khách hàng</label>
							<input type="text" class="form-control" id="tenND"
								aria-describedby="tenNDHelp" disabled>
							<div id="tenNDHelp" class="form-text"></div>
						</div>
						<div class="mb-3">
							<label for="sdt" class="form-label">Số điện thoại</label> 
							<input
								type="text" class="form-control" id="sdt"
								aria-describedby="sdtHelp" disabled>
							<div id="sdtHelp" class="form-text"></div>
						</div>
						<div class="mb-3">
							<label for="price" class="form-label">Địa chỉ giao hàng</label> 
							<form:input path="diaChiGiaoHang" type="text" cssClass="form-control"/>
						</div>
						<div class="mb-3">
							<label for="image" class="form-label">Ngày giao hàng</label> 
							<form:input path="ngayGiaoHang" type="date" cssClass="form-control"/>
						</div>
						<div class="mb-3">
							<label for="image" class="form-label">Trạng thái giao hàng</label>
							<form:select path="trangThaiDonHang" cssClass="form-select form-control" aria-label="Default select example">
								  <option selected>Đang xuất hàng</option>
								  <option value="1">Đang giao hàng</option>
								  <option value="2">Giao hàng hoàn tất</option>
								  
							</form:select>
						</div>
						<div class="card shadow mb-4">
							<div class="card-header py-3 row" style="margin: 0">
								<div class="col-6">
									<div id="search-autocomplete" class="form-outline">
										<label for="card-name" class="form-label">Tìm kiếm
											thiệp</label> 
										<input class="form-control" list="datalistProduct"
											id="exampleDataList"
											placeholder="Nhập tên thiệp để thêm vào hóa đơn...">
										<datalist id="datalistProduct">
											<c:forEach var="product" items="${dsSanPham}" varStatus="loop">
												<option value="${product.tenSp}">${product.tenSp}</option>
											</c:forEach>
										</datalist>
									</div>
								</div>
								<div class="col-3">
									<label for="" class="form-label">Số lượng</label> <input
										type="number" class="form-control" value="100" min="1"/>
								</div>
								<div class="col-3" style="display: flex; align-items: flex-end;">
									<button class="btn btn-primary">Thêm sản phẩm</button>
								</div>
							</div>
							<div class="table-responsive">
								<table class="table table-bordered table-hover" id="dataTable"
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
										
										<%-- <c:forEach var="cthd" items="order.dsCTHoaDon" varStatus="loop">
											<form:input path="cthd[0].sanPham.tenSp"/>
										</c:forEach> --%>
										
										<!-- <tr>
											<td>2</td>
											<td>Thiệp cưới hiện đại</td>
											<td><input type="number" class="form-control"
												value="100" /></td>
											<td>10.000đ</td>
											<td>100.000đ</td>
											<td class="text-center">
												<button class="btn btn-danger btn-delete">Xóa</button>
											</td>
										</tr> -->
									</tbody>
								</table>
							</div>
							<div class="card-footer py-3 row" style="margin: 0">
								<div class="col-6">
									Tổng tiền
								</div>
								<div class="col-6" style="text-align: right">
									100.000đ
								</div>
							</div>
					</form:form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Hủy</button>
					<a class="btn btn-primary"
						onclick="document.querySelector('form#product-form').submit();">Thêm</a>
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
					var modal = new bootstrap.Modal(document
							.getElementById('orderModal'), {
						keyboard : false
					});
					$(".btn-edit").click(function() {
						modal.show();
					});
				});
	</script>
</body>

</html>