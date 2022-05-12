<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="org.springframework.web.servlet.tags.Param"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>${title }</title>

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
					<h1 class="h3 mb-2 text-gray-800">Quản lý danh mục</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3 row" style="margin: 0">
							<div class="col-4">
								<button class="btn btn-primary btn-open-modal">Thêm
									danh mục</button>
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
											<th>Mã danh mục</th>
											<th>Tên danh mục</th>
											<th>Hành động</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>#</th>
											<th>Mã danh mục</th>
											<th>Tên danh mục</th>
											<th>Hành động</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="loaiSp" items="${dsLoaiSanPham}"
											varStatus="loop">
											<c:url var="deleteLink" value="./delete-category">
												<c:param name="maLSP" value="${loaiSp.maLSP}" />
											</c:url>
											<tr>
												<td>${loop.index+1}</td>
												<td>${loaiSp.maLSP}</td>
												<td>${loaiSp.tenLSP}</td>
												<td>
													<button class="btn btn-warning btn-edit"
														data-maLSP="${loaiSp.maLSP}"
														data-tenLSP="${loaiSp.tenLSP}"
														data-hinhAnh="${loaiSp.hinhAnh}">Sửa</button> 
													<a class="btn btn-danger btn-delete" 
														data-msg="danh mục sản phẩm với mã là ${loaiSp.maLSP}" 
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
								<button class="btn btn-primary btn-open-modal">Thêm
									danh mục</button>
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

	<!-- thêm thiệp modal -->
	<div class="modal fade" id="categoryModal" tabindex="-1" role="dialog"
		aria-labelledby="categoryModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Thêm danh mục</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="">X</button>
				</div>
				<div class="modal-body">
					<form:form id="form"
						action="${pageContext.request.contextPath}/admin/category"
						modelAttribute="loaiSanPham" method="POST">
						<div class="mb-3">
							<form:label path="maLSP" cssClass="form-label">Mã danh mục</form:label>
							<form:input path="maLSP" type="text" cssClass="form-control"
								readonly="true" />
							<form:errors path="maLSP" cssClass="form-text error-msg" />
						</div>
						<div class="mb-3">
							<form:label path="tenLSP" cssClass="form-label">Tên danh mục</form:label>
							<form:input path="tenLSP" type="text" cssClass="form-control" />
							<form:errors path="tenLSP" cssClass="form-text error-msg" />
						</div>
						<div class="mb-3">
							<form:label path="hinhAnh" cssClass="form-label">Hình ảnh</form:label>
							<form:input path="hinhAnh" type="text" cssClass="form-control" />
							<form:errors path="hinhAnh" cssClass="form-text error-msg" />
						</div>

					</form:form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Hủy</button>
					<a class="btn btn-primary btn-form"
						onclick="document.querySelector('form#form').submit();">Thêm</a>
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
							.getElementById('categoryModal'), {
						keyboard : false
					});
					/* modal */
					${error == true ? "modal.show();": ""}
					
					$(".btn-edit").click(function() {
						$(".btn-form").text("Sửa");
						$("#maLSP").attr('value',
								$(this).attr("data-maLSP"));
						$("#tenLSP").attr('value',
								$(this).attr("data-tenLSP"));
						$("#hinhAnh").attr('value',
								$(this).attr("data-hinhAnh"));
						modal.show();
					});

					$(".btn-open-modal").click(function() {
						$(".btn-form").text("Thêm");
						$("#maLSP").attr('value', '0');
						$("#tenLSP").attr('value', '');
						$("#hinhAnh").attr('value', '');
						modal.show();
					});
					
					
					
				});
	</script>
</body>

</html>