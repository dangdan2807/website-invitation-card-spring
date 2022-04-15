<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

<head>
	<title>Login Page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<style>
		* {
			margin: 0px auto;
			padding: 0px;
		}

		body {
			background-image: url(${pattern});
		}

		button {
			width: 140px;
		}
	</style>
</head>

<body>
	<div class="modal-dialog">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="panel-title">Sign In</div>
			</div>
			<div class="panel-body">
				<!-- Login Form -->
				<form action="${pageContext.request.contextPath}/authenticateLogin" method="POST"
					class="form-horizontal">
					<!-- Place for messages: error, alert etc ... -->
					<div class="form-group">
						<div class="col-xs-15">
							<div>

								<!-- Check for login error -->

								<c:if test="${param.error != null}">

									<div class="alert alert-danger col-xs-offset-1 col-xs-10">
										Invalid username and password.</div>

								</c:if>

								<!-- Check for logout -->

								<c:if test="${param.logout != null}">

									<div class="alert alert-success col-xs-offset-1 col-xs-10">You
										have been logged out.</div>

								</c:if>

							</div>
						</div>
					</div>

					<!-- User name -->
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<input type="text" name="username" placeholder="username" class="form-control">
					</div>

					<!-- Password -->
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						<input type="password" name="password" placeholder="password" class="form-control">
					</div>


					<div class="modal-footer">
						<a href="${pageContext.request.contextPath}/register/showRegistrationForm"
							class="btn btn-primary" role="button" aria-pressed="true">Register New User</a>
						<button type="submit" class="btn btn-success">Login</button>
					</div>


					<!-- I'm manually adding tokens ... Bro! -->

					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

				</form>
			</div>
		</div>

	</div>
</body>

</html>