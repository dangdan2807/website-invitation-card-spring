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
					<h1 class="h3 mb-2 text-gray-800">Quản lý danh mục</h1>
					<!-- <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p> -->

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3 row" style="margin: 0">
							<div class="col-4">
								<button class="btn btn-primary" data-toggle="modal"
								data-target="#categoryModal">Thêm danh mục</button>
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
											<th>Mã danh mục</th>
											<th>Tên danh mục</th>
											<th>Hành động</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Mã danh mục</th>
											<th>Tên danh mục</th>
											<th>Hành động</th>
										</tr>
									</tfoot>
									<tbody>
										<tr>
											<td>1</td>
											<td>Đám cưới</td>
											<td>
												<button class="btn btn-warning btn-edit">Sửa</button>
												<button class="btn btn-danger btn-delete">Xóa</button>
											</td>
										</tr>
										<tr>
											<td>2</td>
											<td>Sinh nhật</td>
											<td>
												<button class="btn btn-warning btn-edit">Sửa</button>
												<button class="btn btn-danger btn-delete">Xóa</button>
											</td>
										</tr>
										<tr>
											<td>3</td>
											<td>Tân gia</td>
											<td>
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
								data-target="#categoryModal">Thêm danh mục</button>
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
	<div class="modal fade" id="categoryModal" tabindex="-1"
		role="dialog" aria-labelledby="categoryModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Thêm danh mục</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="">X</button>
				</div>
				<div class="modal-body">
					<form id="category-form" method="GET"> <!-- sửa lại thành POST -->
						<div class="mb-3">
							<label for="category-name" class="form-label">Tên danh mục</label> <input type="text" class="form-control"
								id="category-name" aria-describedby="categoryNameHelp">
							<div id="categoryNameHelp" class="form-text"></div>
						</div>
						
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Hủy</button>
					<a class="btn btn-primary"  onclick="document.querySelector('form#category-form').submit();">Thêm</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Logout Modal-->
	<jsp:include page="./common/logout-model.jsp" />

	<!-- Bootstrap core JavaScript-->
	<jsp:include page="./common/link-js.jsp" />
</body>

</html>