<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge;charset=" UTF-8" />
<title>Thông tin tài khoản</title>
<jsp:include page="./module/link-css.jsp" />
<style type="text/css">
.container-form-tt {
	padding: 10px 20px 20px 20px;
	border: 1px solid #f2f1f6;
}

.title-profile-page {
	padding-left: 0;
	padding-top: 0;
	font-size: 18px;
	font-weight: 700;
	position: relative;
	width: 100%;
	float: left;
	padding-bottom: 10px;
}

.containter-avatar {
	padding-left: 30px;
	text-align: center;
}

.img-avt {
	max-width: 65%;
}

.width_common {
	width: 100%;
	float: left;
}

.btn_site_1 {
	background: #326e51;
	border-radius: 3px;
	color: #fff;
	display: inline-block;
	padding: 5px 10px;
	font-weight: 700;
	font-size: 15px;
}

.block_icon_form .fa {
	position: absolute;
	right: 20px;
	top: 10px;
	color: #8a8f91;
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
.thong-bao p {
	text-align: center;
	width: 100%;
	color: #326E52
}
</style>
<script type="text/javascript">
	function checkDoiMatKhau() {
		var a = document.getElementById("check");
		let inputMk = document.getElementById('matKhau');// file

		if (a.checked) {
			console.log("a>> ", a.value);
			// mở nè
			inputMk.readOnly = false; // này là mở
			return true;
		}
		inputMk.readOnly = true;// này là đóng run đi
		return false;
	};
</script>
</head>
<body>
	<c:if test="${kq==true }">
		<div class="thong-bao">
			<p>
				Cập nhật thông tin tài khoản thành công <span
					class="icon-check ml-2"> <i class="fa fa-check-circle"
					aria-hidden="true"></i></span>
			</p>

		</div>
		</c:if>
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
			<div class="row"
				style="background: #e5e5e5; margin-bottom: 10px; padding: 5px">
				<div class="col-lg-12">
					<c:url var="backUrl" value="/trang-chu"></c:url>
					<span> <a href="${backUrl}"
						style="color: #326e51; background-color: transparent;"> Trang
							chủ</a>
					</span> <span> > </span> <span>Thông tin tài khoản</span>
				</div>
			</div>

			<div class="row container-form-tt">
				<div class="col-lg-12">
					<c:url var="toUrl" value="/user/profile/edit"></c:url>
					<form:form id="form-update-profile" action="${toUrl }" modelAttribute="thongTinCapNhat"
						method="post">
						<div class="title-profile-page">Thông tin tài khoản</div>
						<div class="content-box-profile row">
							<div class="containter-avatar col-lg-3">
								<div>
									<img class="img-avt" alt=""
										src="https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png">
								</div>

								<a style="color: #326e51; font-size: 15px;">Tải ảnh của bạn</a>
								<input type="file" name="hinhAnh" id="hinhAnh" class="hide"
									hidden="true">
							</div>
							<div class="content-info col-lg-9 ">
								<div class="row">
									<div class="col-lg-6">
										<div class="input-info-account">
											<div class="col-lg-12 block_icon_form"
												style="margin-bottom: 15px">
												<span class="icon_form"> <i class="fa fa-envelope-o"></i>
												</span> 
													<input type="email" class="form-control" id="email"
													name="email" placeholder="Nhập địa chỉ email"
													value="${email}" disabled="disabled"/>
											</div>
											<div class="col-lg-12 block_icon_form"
												style="margin-bottom: 15px">
												<form:input path="sdt" type="tel" class="form-control"
													placeholder="Nhập số điện thoại"/> 
												<i class="fa fa-phone"></i>
												<form:errors path="sdt" cssClass="form-text error-msg" />
											</div>
											<div class="col-lg-12 block_icon_form"
												style="margin-bottom: 15px">
												<form:input path="tenND" type="text" class="form-control" placeholder="Nhập họ và tên"/> 
												<i class="fa fa-user"></i>
												<form:errors path="tenND" cssClass="form-text error-msg" />
											</div>
											<div class="col-lg-12 block_icon_form"
												style="margin-bottom: 15px">
												<form:input path="diaChi" type="text" class="form-control" placeholder="Nhập địa chỉ"/> 
												<i class="fa fa-user"></i>
												<form:errors path="diaChi" cssClass="form-text error-msg" />
											</div>
											<div class="col-lg-12 block_icon_form"
												style="margin-bottom: 15px">
												<input type="checkbox" name="check" id="check"
													value="Đổi mật khẩu" onclick="checkDoiMatKhau()"> <span>Đổi
													mật khẩu</span>
											</div>
											<div class="col-lg-12 block_icon_form"
												style="margin-bottom: 15px">
												<input type="password" class="form-control" id="matKhau"
													name="matKhau" placeholder="Nhập mật khẩu mới"
													readonly="readonly"> <i class="fa fa-lock"></i>
											</div>

											<div class="col-lg-12">
												<button type="submit" class="btn btn_site_1 width_common">
													Cập nhật</button>
											</div>
										</div>
									</div>

								</div>
							</div>

						</div>


					</form:form>
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