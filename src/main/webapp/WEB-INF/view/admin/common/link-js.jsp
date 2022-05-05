<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="<c:url value = '/resources/admin/vendor/jquery/jquery.min.js'/>"></script>
<script src="<c:url value = '/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>



<!-- Core plugin JavaScript-->
<script src="<c:url value = '/resources/admin/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value = '/resources/admin/js/sb-admin-2.min.js'/>"></script>

<!-- Page level plugins -->
<script src="<c:url value = '/resources/admin/vendor/chart.js/Chart.min.js'/>"></script>

<!-- Page level custom scripts -->
<script src="<c:url value = '/resources/admin/js/demo/chart-area-demo.js'/>"></script>
<script src="<c:url value = '/resources/admin/js/demo/chart-pie-demo.js'/>"></script>

<script>
$(document).ready(function(){

	var deleteModal = new bootstrap.Modal(document
			.getElementById('deleteModal'), {
		keyboard : false
	});
	
	$(".btn-delete").click(function() {
		$("#deleteTitleModal").text("Bạn có chắc chắn muốn xóa "+$(this).attr("data-msg")+"?");
		$(".btn-delete-modal").attr("href", $(this).attr("data-href"));
		deleteModal.show();
	});	
});

</script>