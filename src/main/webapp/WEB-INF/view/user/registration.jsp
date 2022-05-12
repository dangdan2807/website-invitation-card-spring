<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>

<title>Trang đăng ký</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Reference Bootstrap files -->

<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="<c:url value ='/resources/user/img/icons/favicon.png'/>" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value ='/resources/user/vendor/bootstrap/css/bootstrap.min.css'/>" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value ='/resources/user/fonts/font-awesome-4.7.0/css/font-awesome.min.css'/>" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value ='/resources/user/fonts/Linearicons-Free-v1.0.0/icon-font.min.css'/>" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value ='/resources/user/vendor/animate/animate.css'/>" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value ='/resources/user/vendor/css-hamburgers/hamburgers.min.css'/>" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value ='/resources/user/vendor/animsition/css/animsition.min.css'/>" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value ='/resources/user/vendor/select2/select2.min.css'/>" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value ='/resources/user/vendor/daterangepicker/daterangepicker.css'/>" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value ='/resources/user/css/login/util.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value ='/resources/user/css/login/main.css'/>" />
<!--===============================================================================================-->
</head>
<body style="background-color: #666666;">
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form:form
					action="${pageContext.request.contextPath}/dang-ky/processRegistrationForm"
					modelAttribute="crmUser" class="login100-form validate-form">
					<span class="login100-form-title p-b-43"> Đăng ký </span>

					<div class="form-group">
						<div class="col-xs-15">
							<div>

								<!-- Check for registration error -->
								<c:if test="${registrationError != null}">
									<div class="alert alert-danger col-xs-offset-1 col-xs-10">
										${registrationError}</div>
								</c:if>

							</div>
						</div>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Email hợp lệ có dạng: ex@abc.xyz">
						<form:input path="tenDangNhap" type="text" class="input100"
							name="email" />
						<span class="focus-input100"></span> <span class="label-input100">Email</span>
					</div>


					<div class="wrap-input100 validate-input"
						data-validate="Chưa nhập mật khẩu">
						<form:password class="input100" path="matKhau" name="password" />
						<span class="focus-input100"></span> <span class="label-input100">Mật
							khẩu</span>
					</div>


					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">Đăng ký</button>
					</div>

					<div class="text-center p-t-46 p-b-20">
						<span class="txt2"> Đã có tài khoản ? </span><span class="txt2">
							<a href="<c:url value ='/login' />"> Đăng nhập </a>
						</span>
					</div>
				</form:form>
				<div class="login100-more"
					style="background-image: url('resources/user/img/bg.jpg');"></div>

			</div>

		</div>
	</div>



	<!--===============================================================================================-->
	<script
		src="<c:url value ='/resources/user/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value ='/resources/user/vendor/animsition/js/animsition.min.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value ='/resources/user/vendor/bootstrap/js/popper.js'/>"></script>
	<script
		src="<c:url value ='/resources/user/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value ='/resources/user/vendor/select2/select2.min.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value ='/resources/user/vendor/daterangepicker/moment.min.js'/>"></script>
	<script
		src="<c:url value ='/resources/user/vendor/daterangepicker/daterangepicker.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value ='/resources/user/vendor/countdowntime/countdowntime.js'/>"></script>
	<!--===============================================================================================-->
	<script src="<c:url value ='/resources/user/js/login/main.js'/>"></script>

</body>
</html>