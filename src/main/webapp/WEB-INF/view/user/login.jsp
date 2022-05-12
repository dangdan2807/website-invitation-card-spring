
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>

<title>Trang đăng nhập</title>
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
<jsp:include page="./module/link-css.jsp" />
</head>
<body>
	<!-- Header Section Begin -->
	<jsp:include page="./module/header.jsp">
		<jsp:param name="activePage" value="home" />
	</jsp:include>
	<!-- Header Section End -->
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form"
					action="${pageContext.request.contextPath}/authenticateLogin"
					method="POST">
					<span class="login100-form-title p-b-43"> Đăng nhập </span>
					<div class="form-group">
						<div class="col-xs-15">
							<div>

								<!-- Check for login error -->

								<c:if test="${param.error != null}">

									<div class="alert alert-danger col-xs-offset-1 col-xs-10">
										Sai tài khoản hoặc mật khẩu.</div>

								</c:if>

								<!-- Check for logout -->

								<c:if test="${param.logout != null}">

									<div class="alert alert-success col-xs-offset-1 col-xs-10">Đã
										đăng xuất.</div>

								</c:if>

							</div>
						</div>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Email hợp lệ có dạng: ex@abc.xyz">
						<input class="input100" type="text" name="username"> <span
							class="focus-input100"></span> <span class="label-input100">Email</span>
					</div>


					<div class="wrap-input100 validate-input"
						data-validate="Chưa nhập mật khẩu">
						<input class="input100" type="password" name="password"> <span
							class="focus-input100"></span> <span class="label-input100">Mật
							khẩu</span>
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-32">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox"
								name="remember-me"> <label class="label-checkbox100"
								for="ckb1"> Nhớ mật khẩu </label>
						</div>


					</div>


					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">Đăng nhập</button>
					</div>

					<div class="text-center p-t-46 p-b-20">
						<span class="txt2"> Chưa có tài khoản ? </span><span class="txt2">
							<a href="<c:url value ='/dang-ky' />"> Đăng ký </a>
						</span>
					</div>

					<div class="login100-form-social flex-c-m">
						<a href="https://www.facebook.com/"
							class="login100-form-social-item flex-c-m bg1 m-r-5"> <i
							class="fa fa-facebook-f" aria-hidden="true"></i>
						</a> <a href="https://www.twitter.com/"
							class="login100-form-social-item flex-c-m bg2 m-r-5"> <i
							class="fa fa-twitter" aria-hidden="true"></i>
						</a>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>

				<div class="login100-more"
					style="background-image: url('<c:url value ="https://microlancer.lancerassets.com/v2/services/fe/2c457042ef11e6a3db8fad360b0fb2/large_Wedding_20Invitation_20Vol2-1390973102.jpg"/>');"></div>
			</div>
		</div>
	</div>

	<!-- Footer Section Begin -->
	<jsp:include page="./module/footer.jsp" />
	<!-- Footer Section End -->
	<jsp:include page="./module/link-js.jsp" />

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

