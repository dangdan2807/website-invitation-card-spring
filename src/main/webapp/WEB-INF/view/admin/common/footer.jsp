<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
	aria-labelledby="deleteModal" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="deleteTitleModal">Xóa </h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="">X</button>
			</div>
			<div class="modal-body" id="contentModal"></div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">Hủy</button>
				<a class="btn btn-danger btn-delete-modal">Xóa</a>
			</div>
		</div>
	</div>
</div>

<footer class="sticky-footer bg-white">
	<div class="container my-auto">
		<div class="copyright text-center my-auto">
			<span>Nhóm 1 đề tài 39</span>
		</div>
	</div>
</footer>