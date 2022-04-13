<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header id="top-header" class="top-header fixed-header fixed">
	<div class="header-topbar">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-md-5 col-sm-6 col-xs-8">
					<div class="header-left">
						<div id="text-4">
							<div class="textwidget">
								<p>Call us now: 0123-456-789</p>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-7 col-md-7 col-sm-6 col-xs-4">
					<!-- User widget -->
					<div class="header_user_info pull-right">

						<div data-toggle="dropdown" class="dropdown-title">
							<a href="http://demo1.cloodo.com/wordpress/byhands/home1/#"
								title="My account"><i class="fa fa-user"></i></a>
						</div>

						<ul id="menu-account" class="links">

							<li><a
								href="http://demo1.cloodo.com/wordpress/byhands/home1/my-account/"
								title="Login"> <i class="fa fa-sign-in"></i> Login
							</a></li>
							<li><a
								href="http://demo1.cloodo.com/wordpress/byhands/home1/my-account/"
								title="Register"> <i class="fa fa-pencil-square-o"></i>
									Register
							</a></li>

							<li><a
								href="http://demo1.cloodo.com/wordpress/byhands/home1/wishlist/"
								class="item-link"> <i class="fa fa-file-text-o"></i>
									Wishlist
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="header-main">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-5 col-xs-12">
					<!-- Logo -->
					<div class="logo">
						<a href="http://demo1.cloodo.com/wordpress/byhands/home1/"
							title="ByHands"> <img class="img-responsive"
							src="<c:url value='/resources/images/logo-h1.png'/>"
							alt="ByHands">
						</a>
					</div>
				</div>

				<div class="col-lg-9 col-md-9 col-sm-7 col-xs-12">
					<div class="topheader-navholder">
						<div class="topheader-navholder-lf">
							<!-- Cart widget -->
							<div id="block-cart" class="block-cart dropdown-over pull-right">
								<div data-toggle="dropdown" class="dropdown-title">

									<a class="cart-header"
										href="http://demo1.cloodo.com/wordpress/byhands/home1/cart/"
										title="Shopping cart"> <span class="title-cart"><i
											class="zmdi zmdi-shopping-basket"></i></span> <span
										class="ajax_cart_quantity">2</span>
									</a>


								</div>

								<div class="dropdown-content">
									<div class="widget_shopping_cart_content">

										<ul class="cart_list product_list_widget ">

											<li class="mini-cart mini_cart_item"><a
												href="http://demo1.cloodo.com/wordpress/byhands/home1/cart/?remove_item=9bf31c7ff062936a96d3c8bd1f8f2ff3&amp;_wpnonce=263660c465"
												class="remove" title="Remove this item" data-product_id="15"
												data-product_sku=""><i class="fa fa-times"></i></a> <a
												class="pull-left cart-linkimg"
												href="http://demo1.cloodo.com/wordpress/byhands/home1/product/bouquet-hydrangea/">
													<img width="150" height="200"
													src="<c:url value='/resources/images/3-150x200.jpg'/>"
													class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image"
													alt=""
													srcset="<c:url value='/resources/images/3-150x200.jpg 150w, ./resources/images/3-225x300.jpg 225w, ./resources/images/3-300x400.jpg 300w, ./resources/images/3.jpg 600w'/>"
													sizes="(max-width: 150px) 100vw, 150px">
											</a> <span class="product-name-wrap">
													<div class="product-name">
														<a class="cart-product-name"
															href="http://demo1.cloodo.com/wordpress/byhands/home1/product/bouquet-hydrangea/">
															Bouquet Hydrangea </a>
													</div>


													<div class="quantity">
														1 × <span class="woocommerce-Price-amount amount"><span
															class="woocommerce-Price-currencySymbol">$</span>98.98</span>
													</div>
											</span></li>

											<li class="mini-cart mini_cart_item"><a
												href="http://demo1.cloodo.com/wordpress/byhands/home1/cart/?remove_item=8e296a067a37563370ded05f5a3bf3ec&amp;_wpnonce=263660c465"
												class="remove" title="Remove this item" data-product_id="25"
												data-product_sku=""><i class="fa fa-times"></i></a> <a
												class="pull-left cart-linkimg"
												href="http://demo1.cloodo.com/wordpress/byhands/home1/product/bouquet-hydrangea-violet-white/">
													<img width="150" height="200"
													src="<c:url value='/resources/images/9-150x200.jpg'/>"
													class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image"
													alt=""
													srcset="<c:url value='/resources/images/9-150x200.jpg 150w, ./resources/images/9-225x300.jpg 225w, ./resources/images/9-300x400.jpg 300w, ./resources/images/9.jpg 600w'/>"
													sizes="(max-width: 150px) 100vw, 150px">
											</a> <span class="product-name-wrap">
													<div class="product-name">
														<a class="cart-product-name"
															href="http://demo1.cloodo.com/wordpress/byhands/home1/product/bouquet-hydrangea-violet-white/">
															Bouquet Hydrangea - Violet White </a>
													</div>


													<div class="quantity">
														1 × <span class="woocommerce-Price-amount amount"><span
															class="woocommerce-Price-currencySymbol">$</span>28.00</span>
													</div>
											</span></li>
										</ul>

										<p class="total">
											Total: <span class="woocommerce-Price-amount amount"><span
												class="woocommerce-Price-currencySymbol">$</span>126.98</span>
										</p>


										<div class="cart-button">
											<a
												href="http://demo1.cloodo.com/wordpress/byhands/home1/cart/"
												class="btn btn-default">View Cart</a> <a
												href="http://demo1.cloodo.com/wordpress/byhands/home1/checkout/"
												class="btn btn-primary pull-right">Checkout</a>
										</div>

									</div>
								</div>
							</div>

							<!-- Switcher widget -->
							<div class="block_group_top dropdown-over pull-right">
								<div data-toggle="dropdown" class="dropdown-title">
									<a href="http://demo1.cloodo.com/wordpress/byhands/home1/#"
										title="Group language, currency"><i class="fa fa-cog"></i></a>
								</div>

								<div class="dropdown-content"></div>
							</div>

							<!-- Search widget -->
							<div id="search_block_top"
								class="block-search dropdown-over pull-right">
								<div data-toggle="dropdown" class="dropdown-title">
									<a href="http://demo1.cloodo.com/wordpress/byhands/home1/#"
										title="Search"> <i class="zmdi zmdi-search"></i>
									</a>
								</div>
								<div class="dropdown-content">
									<form role="search" method="get" class="search-form"
										action="http://demo1.cloodo.com/wordpress/byhands/home1/">
										<input type="search" class="search-field form-control"
											placeholder="Search …" value="" name="s">
										<button class="btn btn-default search-submit" type="submit">
											<i class="fa fa-search"></i>
										</button>
									</form>
								</div>
							</div>
						</div>

						<!-- Menu -->
						<div class="topheader-navholder-rg">
							<span id="btn-menu"><i class="zmdi zmdi-menu"></i></span>
							<div id="main-nav">
								<ul id="menu-main" class="nav navbar-nav nav-mega">
									<li class="active dropdown menu-home tiva-normal-menu level1"><a
										href="http://demo1.cloodo.com/wordpress/byhands/home1/"
										class="item-link dropdown-toggle"><span class="have-title"><span
												class="menu-title">Home</span></span></a>
										<ul class="dropdown-menu nav-level1 one-column "
											style="display: none;">
											<li class="active one-column menu-homepage-1"><a
												href="http://demo1.cloodo.com/wordpress/byhands/home1"><span
													class="have-title"><span class="menu-title">Homepage
															1</span></span></a></li>
											<li class="one-column menu-homepage-2"><a
												href="http://demo1.cloodo.com/wordpress/byhands/home2"><span
													class="have-title"><span class="menu-title">Homepage
															2</span></span></a></li>
											<li class="one-column menu-homepage-3"><a
												href="http://demo1.cloodo.com/wordpress/byhands/home3"><span
													class="have-title"><span class="menu-title">Homepage
															3</span></span></a></li>
										</ul></li>
									<li class="dropdown menu-shop tiva-mega-menu level1"><a
										href="http://demo1.cloodo.com/wordpress/byhands/home1/shop/"
										class="item-link dropdown-toggle"><span class="have-title"><span
												class="menu-title">Shop</span></span></a>
										<ul class="dropdown-menu nav-level1 four-column "
											style="display: none;">
											<li
												class="dropdown-submenu four-column menu-birthday has-child"><a
												href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/birthday/"><span
													class="have-title"><span class="menu-title">Birthday</span></span></a>
												<ul class="dropdown-sub nav-level2">
													<li class="menu-cabernet"><a
														href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/birthday/cabernet/"><span
															class="have-title"><span class="menu-title">Cabernet</span></span></a>
													</li>
													<li class="menu-blends"><a
														href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/birthday/blends/"><span
															class="have-title"><span class="menu-title">Blends</span></span></a>
													</li>
													<li class="menu-pinot"><a
														href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/birthday/pinot/"><span
															class="have-title"><span class="menu-title">Pinot</span></span></a>
													</li>
												</ul></li>
											<li
												class="dropdown-submenu four-column menu-weddings has-child"><a
												href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/bouquets/"><span
													class="have-title"><span class="menu-title">Weddings</span></span></a>
												<ul class="dropdown-sub nav-level2">
													<li class="menu-chardonnay"><a
														href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/bouquets/chardonnay/"><span
															class="have-title"><span class="menu-title">Chardonnay</span></span></a>
													</li>
													<li class="menu-blanc"><a
														href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/bouquets/blanc/"><span
															class="have-title"><span class="menu-title">Blanc</span></span></a>
													</li>
													<li class="menu-albarino"><a
														href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/bouquets/albarino/"><span
															class="have-title"><span class="menu-title">Albarino</span></span></a>
													</li>
												</ul></li>
											<li
												class="dropdown-submenu four-column menu-custom-orders has-child">
												<a
												href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/birthday/"><span
													class="have-title"><span class="menu-title">Custom
															Orders</span></span></a>
												<ul class="dropdown-sub nav-level2">
													<li class="menu-cabernet"><a
														href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/birthday/cabernet/"><span
															class="have-title"><span class="menu-title">Cabernet</span></span></a>
													</li>
													<li class="menu-blends"><a
														href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/birthday/blends/"><span
															class="have-title"><span class="menu-title">Blends</span></span></a>
													</li>
													<li class="menu-pinot"><a
														href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/birthday/pinot/"><span
															class="have-title"><span class="menu-title">Pinot</span></span></a>
													</li>
												</ul>
											</li>
											<li
												class="dropdown-submenu four-column menu-bouquets has-child"><a
												href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/bouquets/"><span
													class="have-title"><span class="menu-title">Bouquets</span></span></a>
												<ul class="dropdown-sub nav-level2">
													<li class="menu-chardonnay"><a
														href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/bouquets/chardonnay/"><span
															class="have-title"><span class="menu-title">Chardonnay</span></span></a>
													</li>
													<li class="menu-blanc"><a
														href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/bouquets/blanc/"><span
															class="have-title"><span class="menu-title">Blanc</span></span></a>
													</li>
													<li class="menu-albarino"><a
														href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/bouquets/albarino/"><span
															class="have-title"><span class="menu-title">Albarino</span></span></a>
													</li>
												</ul></li>
											<li class="image-block four-column menu-banners">
												<div class="row">
													<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
														<div class="block-image">
															<img class="img-responsive"
																src="<c:url value='/resources/images/promotion-2.jpg'/>"
																alt="promotion 1">
														</div>
													</div>
													<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
														<div class="block-image">
															<img class="img-responsive"
																src="<c:url value='/resources/images/promotion-1.jpg'/>"
																alt="promotion 2">
														</div>
													</div>
													<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
														<div class="block-image">
															<img class="img-responsive"
																src="<c:url value='/resources/images/promotion-2.jpg'/>"
																alt="promotion 3">
														</div>
													</div>
												</div>
											</li>
										</ul></li>
									<li class="dropdown menu-pages tiva-normal-menu level1"><a
										href="http://demo1.cloodo.com/wordpress/byhands/home1/#"
										class="item-link dropdown-toggle"><span class="have-title"><span
												class="menu-title">Pages</span></span></a>
										<ul class="dropdown-menu nav-level1 one-column "
											style="display: none;">
											<li
												class="icon-caret dropdown-submenu one-column menu-page-category has-child">
												<a
												href="http://demo1.cloodo.com/wordpress/byhands/home1/shop/"><span
													class="have-title"><span class="menu-title">Page
															Category</span></span></a>
												<ul class="dropdown-sub nav-level2">
													<li class="menu-product-category"><a
														href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/birthday/"><span
															class="have-title"><span class="menu-title">Product
																	Category</span></span></a></li>
												</ul>
											</li>
											<li
												class="dropdown-submenu one-column menu-page-detail has-child">
												<a
												href="http://demo1.cloodo.com/wordpress/byhands/home1/product/tulipa-floriade-red/"><span
													class="have-title"><span class="menu-title">Page
															Detail</span></span></a>
												<ul class="dropdown-sub nav-level2">
													<li class="menu-product-detail"><a
														href="http://demo1.cloodo.com/wordpress/byhands/home1/product/tulipa-floriade-red/"><span
															class="have-title"><span class="menu-title">Product
																	Detail</span></span></a></li>
												</ul>
											</li>
											<li class="one-column menu-page-checkout"><a
												href="http://demo1.cloodo.com/wordpress/byhands/home1/checkout/"><span
													class="have-title"><span class="menu-title">Page
															Checkout</span></span></a></li>
											<li class="one-column menu-page-logged"><a
												href="http://demo1.cloodo.com/wordpress/byhands/home1/my-account/"><span
													class="have-title"><span class="menu-title">Page
															Logged</span></span></a></li>
											<li class="one-column menu-page-404"><a
												href="http://demo1.cloodo.com/wordpress/byhands/home1/page-404"><span
													class="have-title"><span class="menu-title">Page
															404</span></span></a></li>
											<li class="one-column menu-page-shopping-cart"><a
												href="http://demo1.cloodo.com/wordpress/byhands/home1/cart/"><span
													class="have-title"><span class="menu-title">Page
															shopping cart</span></span></a></li>
										</ul></li>
									<li class="menu-blog tiva-normal-menu level1"><a
										href="http://demo1.cloodo.com/wordpress/byhands/home1/category/blog/"
										class="item-link"><span class="have-title"><span
												class="menu-title">Blog</span></span></a></li>
									<li class="menu-about-us tiva-normal-menu level1"><a
										href="http://demo1.cloodo.com/wordpress/byhands/home1/about-us/"
										class="item-link"><span class="have-title"><span
												class="menu-title">About us</span></span></a></li>
									<li class="menu-contact tiva-normal-menu level1"><a
										href="http://demo1.cloodo.com/wordpress/byhands/home1/contact/"
										class="item-link"><span class="have-title"><span
												class="menu-title">Contact</span></span></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
