<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<h1 class="h3 mb-2 text-gray-800">Quản lý thiệp mời</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3 row" style="margin: 0">
							<div class="col-4">
								<button class="btn btn-primary btn-open-modal">Thêm thiệp mời</button>
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
											<th>Mã thiệp</th>
											<th>Tên thiệp</th>
											<th>Giá nhập</th>
											<th>Giá bán</th>
											<th>Giảm giá</th>
											<th>Giá sau khuyến mãi</th>
											<th>Loại thiệp</th>
											<th class="text-center">Hành động</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>#</th>
											<th>Mã thiệp</th>
											<th>Tên thiệp</th>
											<th>Giá nhập</th>
											<th>Giá bán</th>
											<th>Giảm giá</th>
											<th>Giá sau khuyến mãi</th>
											<th>Loại thiệp</th>
											<th class="text-center">Hành động</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="sanPham" items="${dsSanPham}" varStatus="loop">
											<c:url var="deleteLink" value="./delete-product">
												<c:param name="maSp" value="${sanPham.maSp}" />
											</c:url>
											<tr>
												<td>${loop.index+1}</td>
												<td>${sanPham.maSp}</td>
												<td>${sanPham.tenSp}</td>
												<td class="money-format">${sanPham.giaMua}</td>
												<td class="money-format">${sanPham.giaSP}</td>
												<td class="persent-format">${sanPham.giamGia}</td>
												<td class="money-format">${sanPham.giaSP*(100-sanPham.giamGia)/100}</td>
												<td>
													<c:forEach var="loaiSp" items="${sanPham.dsLoaiSP}">
														${loaiSp.loaiSanPham.tenLSP}
														<br/>
													</c:forEach>
												</td>
												<td class="text-center">
													<button class="btn btn-warning btn-edit"
														data-maSp="${sanPham.maSp}" data-tenSp="${sanPham.tenSp}" 
														data-moTa="${sanPham.moTa}" data-giaMua="${sanPham.giaMua}" 
														data-giaSP="${sanPham.giaSP}" data-giamGia="${sanPham.giamGia}"
														data-hinhAnh="${sanPham.hinhAnh}" data-dsLoaiSP="${sanPham.toStringLoaiSp()}">Sửa</button>
													<button class="btn btn-danger btn-delete" 
														data-msg="sản phẩm với mã là ${sanPham.maSp}" 
														data-href="${deleteLink }">Xóa</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="card-footer py-3 row" style="margin: 0">
							<div class="col-4">
								<button class="btn btn-primary btn-open-modal">Thêm thiệp mời</button>
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
					<form:form id="form"
						action="${pageContext.request.contextPath}/admin/product"
						modelAttribute="sanPham" method="POST">
						<div class="mb-3">
							<form:label path="maSp" cssClass="form-label">Mã thiệp</form:label>
							<form:input path="maSp" type="text" cssClass="form-control"
								readonly="true" />
							<form:errors path="maSp" cssClass="form-text error-msg" />
						</div>
						<div class="mb-3">
							<form:label path="tenSp" cssClass="form-label">Tên thiệp</form:label>
							<form:input path="tenSp" type="text" cssClass="form-control" />
							<form:errors path="tenSp" cssClass="form-text error-msg" />
						</div>
						<div class="mb-3">
							<form:label path="moTa" cssClass="form-label">Mô tả</form:label>
							<form:input path="moTa" type="text" cssClass="form-control" />
							<form:errors path="moTa" cssClass="form-text error-msg" />
						</div>
						<div class="row">
							<div class="mb-3 col-6">
								<form:label path="giaMua" cssClass="form-label">Giá nhập</form:label>
								<form:input path="giaMua" type="text" cssClass="form-control" />
								<form:errors path="giaMua" cssClass="form-text error-msg" />
							</div>
							<div class="mb-3 col-6">
								<form:label path="giaSP" cssClass="form-label">Giá bán</form:label>
								<form:input path="giaSP" type="text" cssClass="form-control" />
								<form:errors path="giaSP" cssClass="form-text error-msg" />
							</div>
						</div>
						<div class="row">
							<div class="mb-3 col-6">
								<form:label path="giamGia" cssClass="form-label">Khuyến mãi</form:label>
								<form:input path="giamGia" type="text" cssClass="form-control" />
								<form:errors path="giamGia" cssClass="form-text error-msg" />
							</div>
							<div class="mb-3 col-6">
								<label for="real-price" class="form-label">Giá sau khuyến mãi</label> 
								<input type="text" class="form-control money-format-input" id="real-price" disabled 
									value="${sanPham.giaSP*(100-sanPham.giamGia)/100}"/>
							</div>
						</div>
						<div class="mb-3">
							<form:label path="hinhAnh" cssClass="form-label">Hình ảnh</form:label>
							<form:input path="hinhAnh" type="text" cssClass="form-control" />
							<form:errors path="hinhAnh" cssClass="form-text error-msg" />
						</div>
						<div class="mb-3">
							<label for="image" class="form-label">Loại thiệp</label> 
							<%-- <form:select path="dsLoaiSP" items="${dsLoaiSanPham}" cssClass="form-control"
								  itemValue="maLSP" itemLabel="tenLSP"/> --%>
							<select id="dsLoaiSanPham"   name="dsLoaiSanPham" class="form-control" multiple="multiple" required="required">
								<c:forEach var="loaiSp" items="${dsLoaiSanPham}">
									<option value="${loaiSp.maLSP}" 
										${dsLoaiSanPhamSelected.contains(loaiSp.maLSP) ? "selected" : ""}>
										${loaiSp.tenLSP}
									</option>
								</c:forEach>
							</select> 
							
							<div id="dsLoaiSanPhamError" class="form-text error-msg"></div>
							<div id="dsLoaiSanPhamHelp" class="form-text help-text">Bấm ctrl
								để chọn nhiều mục</div>
						</div>

					</form:form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Hủy</button>
					<a class="btn btn-primary btn-form">Thêm</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Logout Modal-->
	<jsp:include page="./common/logout-model.jsp" />

	<!-- Bootstrap core JavaScript-->
	<jsp:include page="./common/link-js.jsp" />

	<script>
		$(document).ready(function() {
			var modal = new bootstrap.Modal(document
					.getElementById('productModal'), {
				keyboard : false
			});
			${error == true ? "modal.show();": ""}
			$(".btn-edit").click(function() {
				$(".btn-form").text("Sửa");
				$("#maSp").attr('value',
						$(this).attr("data-maSp"));
				$("#tenSp").attr('value',
						$(this).attr("data-tenSp"));
				$("#moTa").attr('value',
						$(this).attr("data-moTa"));
				$("#giaMua").attr('value',
						$(this).attr("data-giaMua"));
				$("#giaSP").attr('value',
						$(this).attr("data-giaSP"));
				$("#giamGia").attr('value',
						$(this).attr("data-giamGia"));
				$("#hinhAnh").attr('value',
						$(this).attr("data-hinhAnh"));
				
				var loaiSp = $(this).attr("data-dsLoaiSP").split(",");
				$dslsp = $("#dsLoaiSanPham>option");
				$dslsp.each(function() {
					  console.log($(this));
					  console.log(loaiSp.includes($(this).attr("value")));
					  if(loaiSp.includes($(this).attr("value"))){
						  $(this).attr("selected", "true");
					  }
				});
				$("#real-price").val(formatNumber(giaSauGiamGia()));
				modal.show();
			});

			$(".btn-open-modal").click(function() {
				$(".btn-form").text("Thêm");
				$("#maSp").attr('value', '0');
				$("#tenSp").attr('value', '');
				$("#moTa").attr('value', '');
				$("#giaMua").attr('value', '');
				$("#giaSP").attr('value', '');
				$("#giamGia").attr('value', '');
				$("#hinhAnh").attr('value', '');
				modal.show();
			});
			
			$("#giaSP").on("input", function(){
				$("#real-price").val(formatNumber(giaSauGiamGia()));
			});
			
			$("#giamGia").on("input", function(){
				$("#real-price").val(formatNumber(giaSauGiamGia()));
			});
			
			function giaSauGiamGia(){
				var price = Number($("#giaSP").val());
				var discount = Number($("#giamGia").val());
				return price*(100 - discount)/100;
			}
			
			$(".btn-form").click(function(){
				check = $("#dsLoaiSanPham option:selected").length;

			    if(!check) {
			        $("#dsLoaiSanPhamError").text("Vui lòng chọn ít nhất một loại thiệp");
			        return false;
			    }

			    $("#dsLoaiSanPhamError").text("");
				document.querySelector('form#form').submit();
			});
		});

</script>
</body>

</html>