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

<title>${title}</title>

	<!-- Custom fonts for this template-->
	<jsp:include page="./common/link-css.jsp" />
	<style>
		.btn-edit, .btn-delete{
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
					<h1 class="h3 mb-2 text-gray-800">Quản lý người dùng</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3 row" style="margin: 0">
							<div class="col-12" style="text-align: right">
								<jsp:include page="common/page.jsp"></jsp:include>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered table-hover" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>#</th>
											<th>Mã người dùng</th>
											<th>Họ và tên</th>
											<th>Email</th>
											<th>Số điện thoại</th>
											<th>Địa chỉ</th>
											<th>Vai trò</th>
											<th class="text-center">Hành động</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>#</th>
											<th>Mã người dùng</th>
											<th>Họ và tên</th>
											<th>Email</th>
											<th>Số điện thoại</th>
											<th>Địa chỉ</th>
											<th>Vai trò</th>
											<th class="text-center">Hành động</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="user" items="${users}" varStatus="loop">
											<c:url var="deleteLink" value="./delete-user">
												<c:param name="maND" value="${user.maND}" />
											</c:url>
											<tr>
												<td>${loop.index+1}</td>
												<td>${user.maND}</td>
												<td>${user.tenND}</td>
												<td>${user.taiKhoan.tenDangNhap}</td>
												<td>${user.sdt}</td>
												<td>${user.diaChi}</td>
												<td>${user.taiKhoan.chucVu.tenChucVu == "ROLE_ADMIN" ? "Admin" : "Khách hàng"}</td>
												<td class="text-center">
													<button class="btn btn-warning btn-edit" 
														data-maND="${user.maND}" data-tenND="${user.tenND}" data-sdt="${user.sdt}" 
														data-diaChi="${user.diaChi}" data-hinhAnh="${user.hinhAnh}"
														data-chucVu="${user.taiKhoan.chucVu.maChucVu}">Sửa</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="card-footer py-3 row" style="margin: 0">
							<div class="col-12" style="text-align: right">
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
	
	<!-- user modal -->
	<div class="modal fade" id="userModal" tabindex="-1" role="dialog"
		aria-labelledby="userModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Sửa người dùng</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="">X</button>
				</div>
				<div class="modal-body">
					<form:form id="form"
						action="${pageContext.request.contextPath}/admin/user"
						modelAttribute="nguoiDung" method="POST">
						<div class="mb-3">
							<form:label path="maND" cssClass="form-label">Mã người dùng</form:label>
							<form:input path="maND" type="text" cssClass="form-control"
								readonly="true" />
							<form:errors path="maND" cssClass="form-text error-msg" />
						</div>
						<div class="mb-3">
							<form:label path="tenND" cssClass="form-label">Tên người dùng</form:label>
							<form:input path="tenND" type="text" cssClass="form-control" />
							<form:errors path="tenND" cssClass="form-text error-msg" />
						</div>
						<div class="mb-3">
							<form:label path="sdt" cssClass="form-label">Số điện thoại</form:label>
							<form:input path="sdt" type="text" cssClass="form-control" />
							<form:errors path="sdt" cssClass="form-text error-msg" />
						</div>
						<div class="mb-3">
							<form:label path="diaChi" cssClass="form-label">Địa chỉ</form:label>
							<form:input path="diaChi" type="text" cssClass="form-control" />
							<form:errors path="diaChi" cssClass="form-text error-msg" />
						</div>
						<div class="mb-3">
							<form:label path="hinhAnh" cssClass="form-label">Hình ảnh</form:label>
							<form:input path="hinhAnh" type="text" cssClass="form-control" />
							<form:errors path="hinhAnh" cssClass="form-text error-msg" />
						</div>
						<div class="mb-3">
							<form:label path="taiKhoan.chucVu.maChucVu" cssClass="form-label">Vai trò</form:label>
							<form:select path="taiKhoan.chucVu.maChucVu" cssClass="form-control chucVu">
								<option value="1">Admin</option>
								<option value="2">Khách hàng</option>
							</form:select>
						</div>

					</form:form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Hủy</button>
					<a class="btn btn-primary btn-form"
						onclick="document.querySelector('form#form').submit();">Sửa</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<jsp:include page="./common/logout-model.jsp" />

	<!-- Bootstrap core JavaScript-->
	<jsp:include page="./common/link-js.jsp" />
	
	<script>
		$(document).ready(
				function() {
					var modal = new bootstrap.Modal(document
							.getElementById('userModal'), {
						keyboard : false
					});
					${error == true ? "modal.show();": ""}
					$(".btn-edit").click(function() {
						$("#maND").attr('value',
								$(this).attr("data-maND"));
						$("#tenND").attr('value',
								$(this).attr("data-tenND"));
						$("#sdt").attr('value',
								$(this).attr("data-sdt"));
						$("#diaChi").attr('value',
								$(this).attr("data-diaChi"));
						$("#hinhAnh").attr('value',
								$(this).attr("data-hinhAnh"));
						console.log(".chucVu > option[value='"+$(this).attr("data-chucVu")+"']");
						console.log($(".chucVu > option[value='"+$(this).attr("data-chucVu")+"']"));
						$(".chucVu > option").prop('selected', false);
						$(".chucVu > option[value='"+$(this).attr("data-chucVu")+"']").prop('selected', true);
						modal.show();
					});
					

					
					/* const checkEmpty = function () {
					    var val = $(this).val();
					    if(val == ""){
					    	$(this).parent().find("")
					    }
					} */
				});
	</script>
</body>

</html>