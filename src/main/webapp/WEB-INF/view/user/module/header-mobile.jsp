<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
	<div class="humberger__menu__logo">
		<a href="<c:url value ='/trang-chu' />">
			<img src="<c:url value = '/resources/user/img/logo.png'/>" alt="">
		</a>
	</div>
	<div class="humberger__menu__cart">
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
	<div class="humberger__menu__widget">
		<div class="header__top__right__auth">
		<security:authorize access="!hasAnyRole('ADMIN', 'CUSTOMER')">
			<a href="<c:url value ='/dang-nhap' />">
				<i class="fa fa-user"></i>
				Đăng nhập
			</a>
		</security:authorize>
		<security:authorize access="hasAnyRole('ADMIN', 'CUSTOMER')">
			<div class="account__container">
				<a class="account_info" href='<c:url value = "/user/profile" />'>
					<img class="account_avatar rounded-circle" src='<c:url value = "${nguoiDung.hinhAnh}" />' alt="">
					<span class="account_name">${nguoiDung.tenND}</>
				</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href='<c:url value = "/user/profile" />'>Tài khoản của tôi</a>
					<a class="dropdown-item" href='<c:url value = "/user/gio-hang" />'>Giỏ hàng</a>
					<a class="dropdown-item" href='<c:url value = "/user/danh-sach-mua-hang" />'>Danh sách đơn hàng</a>
					<a class="dropdown-item" href='<c:url value = "/user/lich-su-mua-hang" />'>Lịch sử mua hàng</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href='<c:url value = "/dang-xuat" />'>Đăng xuất</a>
				</div>
			</div>
			<div class="header__cart-mobile">
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
		</security:authorize>
		</div>
	</div>
	<nav class="humberger__menu__nav mobile-menu">
		<ul>
			<li 
				<% String tag=request.getParameter("activePage"); 
					if(tag.equals("home")) { 
						out.print("class='active'");
					}
				%>
            >
                <a href='<c:url value = "/trang-chu" />'>Trang chủ</a>
			</li>

			<li 
				<% 
					if(tag.equals("shop-grid")) { 
						out.print("class='active'");
					}
				%>
            >
                <a href='<c:url value = "/san-pham" />'>Cửa Hàng</a>
			</li>

			<li 
				<% 
					if(tag.equals("shopping-cart")) { 
						out.print("class='active'");
					}
				%>
            >
				<a href='<c:url value = "/user/gio-hang" />'>Giỏ Hàng</a>
			</li>

			<li 
				<% 
					if(tag.equals("contact")) { 
						out.print("class='active'");
					}
				%>
            >
                <a href='<c:url value = "/lien-he" />'>Liên Hệ</a>
			</li>
		</ul>
	</nav>
	<div id="mobile-menu-wrap"></div>
	<div class="header__top__right__social">
		<a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a>
		<a href="https://twitter.com/"><i class="fa fa-twitter"></i></a>
	</div>
	<div class="humberger__menu__contact">
		<ul>
			<li>
				<i class="fa fa-envelope"></i>
				<a href="mailto:hello@code.com">hello@code.com</a>
			</li>
			<li>Miễn phí ship cho tất cả đơn hàng từ 99.000đ</li>
		</ul>
	</div>
</div>