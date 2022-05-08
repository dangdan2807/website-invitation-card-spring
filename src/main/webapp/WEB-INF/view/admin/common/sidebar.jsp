<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="${pageContext.request.contextPath}/admin">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			Admin
		</div>
	</a>

	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item ${path == '/admin' ? 'active': ''}"><a class="nav-link"
		href="${pageContext.request.contextPath}/admin"> <i
			class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a></li>

	<hr class="sidebar-divider">

	<li class="nav-item ${path == '/admin/user' ? 'active': ''}"><a class="nav-link"
		href="${pageContext.request.contextPath}/admin/user"> 
		<i class="fa fa-user"></i> <span>Người dùng</span></a></li>
	
	<hr class="sidebar-divider">

	<li class="nav-item ${path == '/admin/order' ? 'active': ''}"><a class="nav-link"
		href="${pageContext.request.contextPath}/admin/order"> 
		<i class="fas fa-receipt"></i> <span>Hóa đơn</span></a></li>
	
	<hr class="sidebar-divider">

	<li class="nav-item ${path == '/admin/product' ? 'active': ''}"><a class="nav-link"
		href="${pageContext.request.contextPath}/admin/product"> 
		<i class="fab fa-product-hunt"></i> <span>Thiệp mời</span></a></li>
	
	<li class="nav-item ${path == '/admin/category' ? 'active': ''}"><a class="nav-link"
		href="${pageContext.request.contextPath}/admin/category"> 
		<i class="fas fa-layer-group"></i> <span>Danh mục thiệp mời</span></a></li>

	<hr class="sidebar-divider">

	<li class="nav-item"><a class="nav-link"
		href="${pageContext.request.contextPath}/home"> 
		<i class="fas fa-arrow-left"></i> <span>Trở về trang chủ</span></a></li>

</ul>
