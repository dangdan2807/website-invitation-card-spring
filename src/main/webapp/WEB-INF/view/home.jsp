<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Web Student Tracker Page</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css"
/>
</head>

<body>
	<h1>Home page 1</h1>
	<ul>
		<c:forEach items="${chucVu}" var="cv">
			<li>
				${cv.tenChucVu}
			</li>
		</c:forEach>
	</ul>
	<a href="./TestDbServlet">Test connect database</a>
</body>

</html>