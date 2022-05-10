<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <title>Register New User Form</title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Reference Bootstrap files -->
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

        <script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <c:url var="pattern" value="/resources/img/bg.jpg" />
        <style>
            *{ margin: 0px auto; padding: 0px; }
            body{ 
                background-image: url(${pattern}); 
            }
        </style>
    </head>

    <body>
        <div class="modal-dialog">

            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="panel-title">Tạo tài khoản</div>
                </div>
                <div style="padding-top: 30px" class="panel-body">

                    <!-- Registration Form -->
                    <form:form action="${pageContext.request.contextPath}/dang-ky/processRegistrationForm" 
                               modelAttribute="crmUser"
                               class="form-horizontal">

                        <!-- Place for messages: error, alert etc ... -->
                        <div class="form-group">
                            <div class="col-xs-15">
                                <div>

                                    <!-- Check for registration error -->
                                    <c:if test="${registrationError != null}">

                                        <div class="alert alert-danger col-xs-offset-1 col-xs-10">
                                            ${registrationError}
                                        </div>

                                    </c:if>

                                </div>
                            </div>
                        </div>

                        <!-- User name -->
                        <div style="margin-bottom: 25px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 

                            <form:input path="tenDangNhap" placeholder="Tài khoản email" class="form-control" />
                        </div>

                        <!-- Password -->
                        <div style="margin-bottom: 25px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 

                            <form:password path="matKhau" placeholder="Mật khẩu" class="form-control" />
                        </div>
                        <div class="modal-footer">
                            <a href="${pageContext.request.contextPath}/login" 
                               class="btn btn-primary" role="button" aria-pressed="true" 
                               style="width: 77px; background-color: red">Huỷ</a>
                            <button type="submit" class="btn btn-primary">Đăng ký</button>                 
                        </div>
                    </form:form>

                </div>
            </div>

        </div>
    </body>
</html>