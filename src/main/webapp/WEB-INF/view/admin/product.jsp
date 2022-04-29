<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Dashboard</title>

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
					<h1 class="h3 mb-2 text-gray-800">Quản lý thiệp mời</h1>
					<!-- <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p> -->

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3 row" style="margin: 0">
							<div class="col-4">
								<button class="btn btn-primary" data-toggle="modal"
									data-target="#productModal">Thêm thiệp mời</button>
							</div>
							<div class="col-8" style="text-align: right">
								<nav aria-label="Page navigation example"
									style="display: inline-block">
									<ul class="pagination">
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
										<li class="page-item"><a class="page-link" href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</ul>
								</nav>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered table-hover" id="dataTable"
									width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>Mã thiệp</th>
											<th>Tên thiệp</th>
											<th>Giá nhập</th>
											<th>Giá bán</th>
											<th>Giảm giá</th>
											<th>Giá mới</th>
											<th>Loại thiệp</th>
											<th class="text-center">Hành động</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Mã thiệp</th>
											<th>Tên thiệp</th>
											<th>Giá nhập</th>
											<th>Giá bán</th>
											<th>Giảm giá</th>
											<th>Giá mới</th>
											<th>Loại thiệp</th>
											<th class="text-center">Hành động</th>
										</tr>
									</tfoot>
									<tbody>
										<tr>
											<td>1</td>
											<td>Hiện đại</td>
											<td>100.000đ</td>
											<td>100.000đ</td>
											<td>5%</td>
											<td>100.000đ</td>
											<td>Thiệp cưới</td>
											<td class="text-center">
												<button class="btn btn-warning btn-edit">Sửa</button>
												<button class="btn btn-danger btn-delete">Xóa</button>
											</td>
										</tr>
										<tr>
											<td>2</td>
											<td>Hiện đại</td>
											<td>100.000đ</td>
											<td>100.000đ</td>
											<td>5%</td>
											<td>100.000đ</td>
											<td>Thiệp cưới</td>
											<td class="text-center">
												<button class="btn btn-warning btn-edit">Sửa</button>
												<button class="btn btn-danger btn-delete">Xóa</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="card-footer py-3 row" style="margin: 0">
							<div class="col-4">
								<button class="btn btn-primary" data-toggle="modal"
									data-target="#productModal">Thêm thiệp mời</button>
							</div>
							<div class="col-8" style="text-align: right">
								<nav aria-label="Page navigation example"
									style="display: inline-block">
									<ul class="pagination">
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
										<li class="page-item"><a class="page-link" href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</ul>
								</nav>
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

	<!-- thêm thiệp modal -->
	<div class="modal fade" id="productModal" tabindex="-1" role="dialog"
		aria-labelledby="productModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Thêm thiệp mời</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="">X</button>
				</div>
				<div class="modal-body">
					<form id="product-form" method="GET">
						<!-- sửa lại thành POST -->
						<div class="mb-3">
							<label for="card-name" class="form-label">Tên thiệp</label> <input
								type="text" class="form-control" id="card-name"
								aria-describedby="cardNameHelp">
							<div id="cardNameHelp" class="form-text"></div>
						</div>
						<div class="mb-3">
							<label for="card-name" class="form-label">Mô tả</label>
							<!-- <input type="text" class="form-control" id="card-name"
								aria-describedby="cardNameHelp"> -->
							<textarea class="form-control"></textarea>
							<div id="cardNameHelp" class="form-text"></div>
						</div>
						<div class="row">
							<div class="mb-3 col-6">
								<label for="price-buy" class="form-label">Giá nhập</label> <input
									type="number" class="form-control" id="price">
							</div>
							<div class="mb-3 col-6">
								<label for="price-sell" class="form-label">Giá bán</label> <input
									type="number" class="form-control" id="price">
							</div>
						</div>
						<div class="row">
							<div class="mb-3 col-6">
								<label for="price-sell" class="form-label">Khuyến mãi</label> <input
									type="number" class="form-control" id="price">
							</div>
							<div class="mb-3 col-6">
								<label for="price-sell" class="form-label">Giá mới</label> <input
									type="number" class="form-control" id="price" disabled>
							</div>
						</div>
						<div class="mb-3">
							<label for="image" class="form-label">Hình ảnh</label> <input
								type="text" class="form-control" id="image">
						</div>
						<div class="mb-3">
							<label for="image" class="form-label">Loại thiệp</label> 
							<select class="form-select form-control" multiple
								aria-label="multiple select example" aria-describedby="categoryHelp">
								<option selected>Thiệp cưới</option>
								<option value="1">Thiệp tốt nghiệp</option>
								<option value="2">Thiệp sinh nhật</option>
							</select>
							<div id="categoryHelp" class="form-text help-text">Bấm ctrl để chọn nhiều mục</div>
						</div>

					</form>
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

	<!-- Logout Modal-->
	<jsp:include page="./common/logout-model.jsp" />

	<!-- Bootstrap core JavaScript-->
	<jsp:include page="./common/link-js.jsp" />

	<script>
		$(document).ready(
				function() {
					var modal = new bootstrap.Modal(document
							.getElementById('productModal'), {
						keyboard : false
					});
					$(".btn-edit").click(function() {
						modal.show();
					});
				});
	</script>
</body>

</html>