<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav aria-label="Page navigation example" style="display: inline-block">
	<ul class="pagination">
		<c:if test="${currentPage-1 >= 1}">
			<li class="page-item"><a class="page-link"
				href="${pageContext.request.contextPath}${path}?page=${currentPage-1 >= 1 ? currentPage-1 : 1}"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>
		</c:if>
		<c:if test="${!(currentPage-1 >= 1)}">
			<li class="page-item disabled"><a class="page-link" href="#"
				aria-label="Previous" aria-disabled="true"> <span
					aria-hidden="true">&laquo;</span>
			</a></li>
		</c:if>


		<c:forEach var="index" begin="1" end="${numberOfPage}">
			<li class="page-item ${currentPage == index ? "active": ""}"><a
				class="page-link"
				href="${pageContext.request.contextPath}${path}?page=${index}">${index}</a></li>
		</c:forEach>
		<c:if test="${numberOfPage == 0}">
			<li class="page-item ${currentPage == index ? "active": ""}"><a
				class="page-link"
				href="${pageContext.request.contextPath}${path}?page=1">1</a></li>
		</c:if>
		
		
		<c:if test="${currentPage+1 <= numberOfPage}">
			<li class="page-item"><a class="page-link"
				href="${pageContext.request.contextPath}${path}?page=${currentPage+1 <= numberOfPage ? currentPage+1 : numberOfPage}"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</c:if>
		<c:if test="${!(currentPage+1 <= numberOfPage)}">
			<li class="page-item disabled"><a class="page-link" href="#"
				aria-label="Next" aria-disabled="true"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</c:if>
	</ul>
</nav>