<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Đăng xuất?</h5>
				<button class="close" type="button" data-dismiss="modal"
						aria-label="">X</button>
			</div>
			<div class="modal-body">Bạn có chắc chắn muốn đăng xuất không?</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">Hủy</button>
				<a class="btn btn-primary" href="${pageContext.request.contextPath}/dang-xuat">Đăng xuất</a>
			</div>
		</div>
	</div>
</div>