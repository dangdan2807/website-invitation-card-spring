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
<%-- <script src="<c:url value = '/resources/admin/vendor/chart.js/Chart.min.js'/>"></script>

<!-- Page level custom scripts -->
<script src="<c:url value = '/resources/admin/js/demo/chart-area-demo.js'/>"></script>
<script src="<c:url value = '/resources/admin/js/demo/chart-pie-demo.js'/>"></script> --%>
<!-- 
<script src="https://raw.githubusercontent.com/google/palette.js/master/palette.js"></script> -->
<script src="<c:url value = '/resources/admin/vendor/chartjs/chart.min.js'/>"></script>

<script>
$(document).ready(function(){

	var deleteModal = new bootstrap.Modal(document
			.getElementById('deleteModal'), {
		keyboard : false
	});
	
	$(".btn-delete").click(function() {
		$("#contentModal").text("Bạn có chắc chắn muốn xóa "+$(this).attr("data-msg")+"?");
		$(".btn-delete-modal").attr("href", $(this).attr("data-href"));
		deleteModal.show();
	});	
});
const formatNumber = (value) => {
	return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(value);
}

const formatNumberPersent = (value) => {
    return new Intl.NumberFormat(
        'vi-Vn',
        { maximumSignificantDigits: 3 }).format(value);
}

const formatMoney = (value) => {
    return formatNumber(value) + "đ";
}

const formatMoneyBySelect = function () {
    var price = $(this).text();
    $(this).text(formatNumber(price));
}

const formatMoneyBySelectInput = function () {
    var price = $(this).val();
    $(this).val(formatNumber(price));
}

const formatPercentBySelect = function () {
    var price = $(this).text();
    $(this).text(formatNumberPersent(price) + "%");
}

$(".money-format").each(formatMoneyBySelect);
$(".money-format-input").each(formatMoneyBySelectInput);
$(".persent-format").each(formatPercentBySelect);

var dynamicColors = function() {
    var r = Math.floor(Math.random() * 255);
    var g = Math.floor(Math.random() * 255);
    var b = Math.floor(Math.random() * 255);
    return "rgb(" + r + "," + g + "," + b + ")";
}



$("input").focus(function(){
	$(this).parent().find(".error-msg").text("");
});

</script>