<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<header class="header">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="header__top__left">
						<ul>
							<li>
								<i class="fa fa-envelope"></i> 
								<a href="mailto:hello@code.com">hello@code.com</a>
							</li>
							<li>Miễn phí ship cho tất cả đơn hàng từ 99.000đ</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="header__top__right">
						<div class="header__top__right__social">
							<a href="#"><i class="fa fa-facebook"></i></a> 
							<a href="#"><i class="fa fa-twitter"></i></a>
						</div>
						<div class="header__top__right__auth">
							<security:authorize access="!hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER')">
								<a href="<c:url value ='/dang-nhap' />">
									<i class="fa fa-user"></i>
									Đăng nhập
								</a>
							</security:authorize>
							<security:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER')">
								<div class="account__container">
									<a class="account_info" href='<c:url value = "/user/profile" />'>
										<c:if test="${nguoiDung.hinhAnh != '' && nguoiDung.hinhAnh != null}">
											<img class="account_avatar rounded-circle" src='<c:url value = "${nguoiDung.hinhAnh}" />' alt="">
										</c:if>
										<c:if test="${!(nguoiDung.hinhAnh != '' && nguoiDung.hinhAnh != null)}">
											<img class="account_avatar rounded-circle" src='<c:url value = "/resources/admin/img/undraw_profile.svg" />' alt="">
										</c:if>
										
										<span class="account_name">${nguoiDung.tenND}</>
									</a>
									<div class="dropdown-menu">
										<a class="dropdown-item" href='<c:url value = "/user/profile" />'>Tài khoản của tôi</a>
										<a class="dropdown-item" href='<c:url value = "/user/gio-hang" />'>Giỏ hàng</a>
										<a class="dropdown-item" href='<c:url value = "/user/lich-su-mua-hang" />'>Lịch sử mua hàng</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href='<c:url value = "/dang-xuat" />'>Đăng xuất</a>
									</div>
								</div>
							</security:authorize>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="header__logo">
					<a href="<c:url value ='/trang-chu' />"> <img
						src="<c:url value = '/resources/user/img/logo.png'/>" alt="">
					</a>
				</div>
			</div>
			<div class="col-lg-6">
				<nav class="header__menu">
					<ul>
						<li
							<%
							String tag = request.getParameter("activePage");
							if (tag.equals("home")) {
								out.print("class='active'");
							}
							%>
							>
							<a href="<c:url value ='/trang-chu' />">Trang chủ</a>
						</li>

						<li
							<%
							if (tag.equals("shop-grid")) {
								out.print("class='active'");
							}
							%>
							>
							<a href='<c:url value = "/san-pham" />'>Cửa Hàng</a>
						</li>

						<li
							<%
							if (tag.equals("shopping-cart")) {
								out.print("class='active'");
							}
							%>
						>
							<a href='<c:url value = "/user/gio-hang" />'>Giỏ Hàng</a>
						</li>

						<li
							<%
							if (tag.equals("contact")) {
								out.print("class='active'");
							}
							%>
						>
							<a href='<c:url value = "/lien-he" />'>Liên Hệ</a>
						</li>
					</ul>
				</nav>
			</div>
			<div class="col-lg-3">
				<div class="header__cart">
					<ul>
						<li>
							<a href="<c:url value = '/user/gio-hang' />">
								<i class="fa-solid fa-cart-shopping"></i>
								<security:authorize access="hasAnyRole('ADMIN', 'CUSTOMER')">
									<span>${soLuongSpGh}</span>
		                        </security:authorize>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="humberger__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
</header>