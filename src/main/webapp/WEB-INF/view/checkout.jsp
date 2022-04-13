<!DOCTYPE html>
<!-- saved from url=(0057)http://demo1.cloodo.com/wordpress/byhands/home1/checkout/ -->
<html lang="en-US" prefix="og: http://ogp.me/ns#">

<jsp:include page="common/head.jsp" />

<body
	class="page-template-default page page-id-6 woocommerce-checkout woocommerce-page home-1 body chrome windows currency-usd"
	style="" data-new-gr-c-s-check-loaded="14.1056.0" data-gr-ext-installed="">
	



	<div id="all">
		<div id="page-loader" style="display: none;">
			<span class="page-loading">
				<img src="resources/images/page_loading.gif" alt="Loading">
			</span>
		</div>

		<jsp:include page="common/top-header.jsp" />

		<div id="columns" class="columns-container">
			<div id="breadcrumb" class="clearfix"
				style="background-image:url(http://demo1.cloodo.com/wordpress/byhands/home1/wp-content/uploads/2017/08/bg-breacrum.jpg)">
				<div class="container">
					<div class="breadcrumb clearfix">
						<!-- Breadcrumb NavXT 5.7.1 -->
						<span property="itemListElement" typeof="ListItem"><a property="item" typeof="WebPage"
								title="Go to ByHands." href="http://demo1.cloodo.com/wordpress/byhands/home1"
								class="home"><span property="name">ByHands</span></a>
							<meta property="position" content="1">
						</span> &gt; <span property="itemListElement" typeof="ListItem"><span
								property="name">Checkout</span>
							<meta property="position" content="2">
						</span>
						<h2 class="bread-title">Checkout</h2>
					</div>
				</div>
			</div>

			<div class="container">

				<div id="post-6" class="post-6 page type-page status-publish hentry">
					<div class="entry-content clearfix">
						<div class="woocommerce">
							<div class="woocommerce-info">Returning customer? <a
									href="http://demo1.cloodo.com/wordpress/byhands/home1/checkout/#"
									class="showlogin">Click here to login</a></div>
							<form class="woocomerce-form woocommerce-form-login login" method="post"
								style="display:none;">


								<p>If you have shopped with us before, please enter your details in the boxes below. If
									you are a new customer, please proceed to the Billing &amp; Shipping section.</p>

								<p class="form-row form-row-first">
									<label for="username">Username or email <span class="required">*</span></label>
									<input type="text" class="input-text" name="username" id="username">
								</p>
								<p class="form-row form-row-last">
									<label for="password">Password <span class="required">*</span></label>
									<input class="input-text" type="password" name="password" id="password">
								</p>
								<div class="clear"></div>


								<p class="form-row">
									<input type="hidden" id="_wpnonce" name="_wpnonce" value="6bf7d4bf2a"><input
										type="hidden" name="_wp_http_referer"
										value="/wordpress/byhands/home1/checkout/"> <input type="submit" class="button"
										name="login" value="Login">
									<input type="hidden" name="redirect"
										value="http://demo1.cloodo.com/wordpress/byhands/home1/checkout/">
									<label class="woocommerce-form__label woocommerce-form__label-for-checkbox inline">
										<input class="woocommerce-form__input woocommerce-form__input-checkbox"
											name="rememberme" type="checkbox" id="rememberme" value="forever">
										<span>Remember me</span>
									</label>
								</p>
								<p class="lost_password">
									<a href="http://demo1.cloodo.com/wordpress/byhands/home1/my-account/lost-password/">Lost
										your password?</a>
								</p>

								<div class="clear"></div>


							</form>

							<div class="woocommerce-info">Have a coupon? <a
									href="http://demo1.cloodo.com/wordpress/byhands/home1/checkout/#"
									class="showcoupon">Click here to enter your code</a></div>

							<form class="checkout_coupon" method="post" style="display:none">

								<p class="form-row form-row-first">
									<input type="text" name="coupon_code" class="input-text" placeholder="Coupon code"
										id="coupon_code" value="">
								</p>

								<p class="form-row form-row-last">
									<input type="submit" class="button" name="apply_coupon" value="Apply coupon">
								</p>

								<div class="clear"></div>
							</form>

							<form name="checkout" method="post" class="checkout woocommerce-checkout"
								action="http://demo1.cloodo.com/wordpress/byhands/home1/checkout/"
								enctype="multipart/form-data" novalidate="novalidate">

								<div class="col2-set" id="customer_details">
									<div class="col-1">
										<div class="woocommerce-billing-fields">

											<h3>Billing details</h3>



											<div class="woocommerce-billing-fields__field-wrapper">
												<p class="form-row form-row-first validate-required woocommerce-invalid woocommerce-invalid-required-field"
													id="billing_first_name_field" data-priority="10"><label
														for="billing_first_name" class="">First name <abbr
															class="required" title="required">*</abbr></label><input
														type="text" class="input-text " name="billing_first_name"
														id="billing_first_name" placeholder="" value=""
														autocomplete="given-name" autofocus="autofocus"></p>
												<p class="form-row form-row-last validate-required"
													id="billing_last_name_field" data-priority="20"><label
														for="billing_last_name" class="">Last name <abbr
															class="required" title="required">*</abbr></label><input
														type="text" class="input-text " name="billing_last_name"
														id="billing_last_name" placeholder="" value=""
														autocomplete="family-name"></p>
												<p class="form-row form-row-wide" id="billing_company_field"
													data-priority="30"><label for="billing_company" class="">Company
														name</label><input type="text" class="input-text "
														name="billing_company" id="billing_company" placeholder=""
														value="" autocomplete="organization"></p>
												<p class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated"
													id="billing_country_field" data-priority="40"><label
														for="billing_country" class="">Country <abbr class="required"
															title="required">*</abbr></label><select
														name="billing_country" id="billing_country"
														class="country_to_state country_select select2-hidden-accessible"
														autocomplete="country" tabindex="-1" aria-hidden="true">
														<option value="">Select a country…</option>
														<option value="AX">Åland Islands</option>
														<option value="AF">Afghanistan</option>
														<option value="AL">Albania</option>
														<option value="DZ">Algeria</option>
														<option value="AS">American Samoa</option>
														<option value="AD">Andorra</option>
														<option value="AO">Angola</option>
														<option value="AI">Anguilla</option>
														<option value="AQ">Antarctica</option>
														<option value="AG">Antigua and Barbuda</option>
														<option value="AR">Argentina</option>
														<option value="AM">Armenia</option>
														<option value="AW">Aruba</option>
														<option value="AU">Australia</option>
														<option value="AT">Austria</option>
														<option value="AZ">Azerbaijan</option>
														<option value="BS">Bahamas</option>
														<option value="BH">Bahrain</option>
														<option value="BD">Bangladesh</option>
														<option value="BB">Barbados</option>
														<option value="BY">Belarus</option>
														<option value="PW">Belau</option>
														<option value="BE">Belgium</option>
														<option value="BZ">Belize</option>
														<option value="BJ">Benin</option>
														<option value="BM">Bermuda</option>
														<option value="BT">Bhutan</option>
														<option value="BO">Bolivia</option>
														<option value="BQ">Bonaire, Saint Eustatius and Saba</option>
														<option value="BA">Bosnia and Herzegovina</option>
														<option value="BW">Botswana</option>
														<option value="BV">Bouvet Island</option>
														<option value="BR">Brazil</option>
														<option value="IO">British Indian Ocean Territory</option>
														<option value="VG">British Virgin Islands</option>
														<option value="BN">Brunei</option>
														<option value="BG">Bulgaria</option>
														<option value="BF">Burkina Faso</option>
														<option value="BI">Burundi</option>
														<option value="KH">Cambodia</option>
														<option value="CM">Cameroon</option>
														<option value="CA">Canada</option>
														<option value="CV">Cape Verde</option>
														<option value="KY">Cayman Islands</option>
														<option value="CF">Central African Republic</option>
														<option value="TD">Chad</option>
														<option value="CL">Chile</option>
														<option value="CN">China</option>
														<option value="CX">Christmas Island</option>
														<option value="CC">Cocos (Keeling) Islands</option>
														<option value="CO">Colombia</option>
														<option value="KM">Comoros</option>
														<option value="CG">Congo (Brazzaville)</option>
														<option value="CD">Congo (Kinshasa)</option>
														<option value="CK">Cook Islands</option>
														<option value="CR">Costa Rica</option>
														<option value="HR">Croatia</option>
														<option value="CU">Cuba</option>
														<option value="CW">Curaçao</option>
														<option value="CY">Cyprus</option>
														<option value="CZ">Czech Republic</option>
														<option value="DK">Denmark</option>
														<option value="DJ">Djibouti</option>
														<option value="DM">Dominica</option>
														<option value="DO">Dominican Republic</option>
														<option value="EC">Ecuador</option>
														<option value="EG">Egypt</option>
														<option value="SV">El Salvador</option>
														<option value="GQ">Equatorial Guinea</option>
														<option value="ER">Eritrea</option>
														<option value="EE">Estonia</option>
														<option value="ET">Ethiopia</option>
														<option value="FK">Falkland Islands</option>
														<option value="FO">Faroe Islands</option>
														<option value="FJ">Fiji</option>
														<option value="FI">Finland</option>
														<option value="FR">France</option>
														<option value="GF">French Guiana</option>
														<option value="PF">French Polynesia</option>
														<option value="TF">French Southern Territories</option>
														<option value="GA">Gabon</option>
														<option value="GM">Gambia</option>
														<option value="GE">Georgia</option>
														<option value="DE">Germany</option>
														<option value="GH">Ghana</option>
														<option value="GI">Gibraltar</option>
														<option value="GR">Greece</option>
														<option value="GL">Greenland</option>
														<option value="GD">Grenada</option>
														<option value="GP">Guadeloupe</option>
														<option value="GU">Guam</option>
														<option value="GT">Guatemala</option>
														<option value="GG">Guernsey</option>
														<option value="GN">Guinea</option>
														<option value="GW">Guinea-Bissau</option>
														<option value="GY">Guyana</option>
														<option value="HT">Haiti</option>
														<option value="HM">Heard Island and McDonald Islands</option>
														<option value="HN">Honduras</option>
														<option value="HK">Hong Kong</option>
														<option value="HU">Hungary</option>
														<option value="IS">Iceland</option>
														<option value="IN">India</option>
														<option value="ID">Indonesia</option>
														<option value="IR">Iran</option>
														<option value="IQ">Iraq</option>
														<option value="IE">Ireland</option>
														<option value="IM">Isle of Man</option>
														<option value="IL">Israel</option>
														<option value="IT">Italy</option>
														<option value="CI">Ivory Coast</option>
														<option value="JM">Jamaica</option>
														<option value="JP">Japan</option>
														<option value="JE">Jersey</option>
														<option value="JO">Jordan</option>
														<option value="KZ">Kazakhstan</option>
														<option value="KE">Kenya</option>
														<option value="KI">Kiribati</option>
														<option value="KW">Kuwait</option>
														<option value="KG">Kyrgyzstan</option>
														<option value="LA">Laos</option>
														<option value="LV">Latvia</option>
														<option value="LB">Lebanon</option>
														<option value="LS">Lesotho</option>
														<option value="LR">Liberia</option>
														<option value="LY">Libya</option>
														<option value="LI">Liechtenstein</option>
														<option value="LT">Lithuania</option>
														<option value="LU">Luxembourg</option>
														<option value="MO">Macao S.A.R., China</option>
														<option value="MK">Macedonia</option>
														<option value="MG">Madagascar</option>
														<option value="MW">Malawi</option>
														<option value="MY">Malaysia</option>
														<option value="MV">Maldives</option>
														<option value="ML">Mali</option>
														<option value="MT">Malta</option>
														<option value="MH">Marshall Islands</option>
														<option value="MQ">Martinique</option>
														<option value="MR">Mauritania</option>
														<option value="MU">Mauritius</option>
														<option value="YT">Mayotte</option>
														<option value="MX">Mexico</option>
														<option value="FM">Micronesia</option>
														<option value="MD">Moldova</option>
														<option value="MC">Monaco</option>
														<option value="MN">Mongolia</option>
														<option value="ME">Montenegro</option>
														<option value="MS">Montserrat</option>
														<option value="MA">Morocco</option>
														<option value="MZ">Mozambique</option>
														<option value="MM">Myanmar</option>
														<option value="NA">Namibia</option>
														<option value="NR">Nauru</option>
														<option value="NP">Nepal</option>
														<option value="NL">Netherlands</option>
														<option value="NC">New Caledonia</option>
														<option value="NZ">New Zealand</option>
														<option value="NI">Nicaragua</option>
														<option value="NE">Niger</option>
														<option value="NG">Nigeria</option>
														<option value="NU">Niue</option>
														<option value="NF">Norfolk Island</option>
														<option value="KP">North Korea</option>
														<option value="MP">Northern Mariana Islands</option>
														<option value="NO">Norway</option>
														<option value="OM">Oman</option>
														<option value="PK">Pakistan</option>
														<option value="PS">Palestinian Territory</option>
														<option value="PA">Panama</option>
														<option value="PG">Papua New Guinea</option>
														<option value="PY">Paraguay</option>
														<option value="PE">Peru</option>
														<option value="PH">Philippines</option>
														<option value="PN">Pitcairn</option>
														<option value="PL">Poland</option>
														<option value="PT">Portugal</option>
														<option value="PR">Puerto Rico</option>
														<option value="QA">Qatar</option>
														<option value="RE">Reunion</option>
														<option value="RO">Romania</option>
														<option value="RU">Russia</option>
														<option value="RW">Rwanda</option>
														<option value="ST">São Tomé and Príncipe</option>
														<option value="BL">Saint Barthélemy</option>
														<option value="SH">Saint Helena</option>
														<option value="KN">Saint Kitts and Nevis</option>
														<option value="LC">Saint Lucia</option>
														<option value="SX">Saint Martin (Dutch part)</option>
														<option value="MF">Saint Martin (French part)</option>
														<option value="PM">Saint Pierre and Miquelon</option>
														<option value="VC">Saint Vincent and the Grenadines</option>
														<option value="WS">Samoa</option>
														<option value="SM">San Marino</option>
														<option value="SA">Saudi Arabia</option>
														<option value="SN">Senegal</option>
														<option value="RS">Serbia</option>
														<option value="SC">Seychelles</option>
														<option value="SL">Sierra Leone</option>
														<option value="SG">Singapore</option>
														<option value="SK">Slovakia</option>
														<option value="SI">Slovenia</option>
														<option value="SB">Solomon Islands</option>
														<option value="SO">Somalia</option>
														<option value="ZA">South Africa</option>
														<option value="GS">South Georgia/Sandwich Islands</option>
														<option value="KR">South Korea</option>
														<option value="SS">South Sudan</option>
														<option value="ES">Spain</option>
														<option value="LK">Sri Lanka</option>
														<option value="SD">Sudan</option>
														<option value="SR">Suriname</option>
														<option value="SJ">Svalbard and Jan Mayen</option>
														<option value="SZ">Swaziland</option>
														<option value="SE">Sweden</option>
														<option value="CH">Switzerland</option>
														<option value="SY">Syria</option>
														<option value="TW">Taiwan</option>
														<option value="TJ">Tajikistan</option>
														<option value="TZ">Tanzania</option>
														<option value="TH">Thailand</option>
														<option value="TL">Timor-Leste</option>
														<option value="TG">Togo</option>
														<option value="TK">Tokelau</option>
														<option value="TO">Tonga</option>
														<option value="TT">Trinidad and Tobago</option>
														<option value="TN">Tunisia</option>
														<option value="TR">Turkey</option>
														<option value="TM">Turkmenistan</option>
														<option value="TC">Turks and Caicos Islands</option>
														<option value="TV">Tuvalu</option>
														<option value="UG">Uganda</option>
														<option value="UA">Ukraine</option>
														<option value="AE">United Arab Emirates</option>
														<option value="GB">United Kingdom (UK)</option>
														<option value="US">United States (US)</option>
														<option value="UM">United States (US) Minor Outlying Islands
														</option>
														<option value="VI">United States (US) Virgin Islands</option>
														<option value="UY">Uruguay</option>
														<option value="UZ">Uzbekistan</option>
														<option value="VU">Vanuatu</option>
														<option value="VA">Vatican</option>
														<option value="VE">Venezuela</option>
														<option value="VN" selected="selected">Vietnam</option>
														<option value="WF">Wallis and Futuna</option>
														<option value="EH">Western Sahara</option>
														<option value="YE">Yemen</option>
														<option value="ZM">Zambia</option>
														<option value="ZW">Zimbabwe</option>
													</select><span
														class="select2 select2-container select2-container--default"
														dir="ltr" style="width: 100%;"><span class="selection"><span
																class="select2-selection select2-selection--single"
																role="combobox" aria-haspopup="true"
																aria-expanded="false" tabindex="0"
																aria-labelledby="select2-billing_country-container"><span
																	class="select2-selection__rendered"
																	id="select2-billing_country-container"
																	title="Vietnam">Vietnam</span><span
																	class="select2-selection__arrow"
																	role="presentation"><b
																		role="presentation"></b></span></span></span><span
															class="dropdown-wrapper"
															aria-hidden="true"></span></span><noscript><input
															type="submit" name="woocommerce_checkout_update_totals"
															value="Update country" /></noscript></p>
												<p class="form-row form-row-wide address-field validate-required"
													id="billing_address_1_field" data-priority="50"><label
														for="billing_address_1" class="">Street address <abbr
															class="required" title="required">*</abbr></label><input
														type="text" class="input-text " name="billing_address_1"
														id="billing_address_1"
														placeholder="House number and street name" value=""
														autocomplete="address-line1"></p>
												<p class="form-row form-row-wide address-field"
													id="billing_address_2_field" data-priority="60"
													style="display: none;"><input type="text" class="input-text "
														name="billing_address_2" id="billing_address_2"
														placeholder="Apartment, suite, unit etc. (optional)" value=""
														autocomplete="address-line2"></p>
												<p class="form-row form-row-wide address-field validate-postcode"
													id="billing_postcode_field" data-priority="65"
													data-o_class="form-row form-row-wide address-field validate-postcode">
													<label for="billing_postcode" class="">Postcode / ZIP</label><input
														type="text" class="input-text " name="billing_postcode"
														id="billing_postcode" placeholder="" value=""
														autocomplete="postal-code"></p>
												<p class="form-row form-row-wide address-field validate-required"
													id="billing_city_field" data-priority="70"
													data-o_class="form-row form-row-wide address-field validate-required">
													<label for="billing_city" class="">Town / City <abbr
															class="required" title="required">*</abbr></label><input
														type="text" class="input-text " name="billing_city"
														id="billing_city" placeholder="" value=""
														autocomplete="address-level2"></p>
												<p class="form-row form-row-wide address-field validate-state"
													id="billing_state_field" style="display: none"
													data-o_class="form-row form-row-wide address-field validate-state">
													<label for="billing_state" class="">State / County</label><input
														type="hidden" class="hidden" name="billing_state"
														id="billing_state" value="" placeholder=""></p>
												<p class="form-row form-row-first validate-required validate-phone"
													id="billing_phone_field" data-priority="100"><label
														for="billing_phone" class="">Phone <abbr class="required"
															title="required">*</abbr></label><input type="tel"
														class="input-text " name="billing_phone" id="billing_phone"
														placeholder="" value="" autocomplete="tel"></p>
												<p class="form-row form-row-last validate-required validate-email"
													id="billing_email_field" data-priority="110"><label
														for="billing_email" class="">Email address <abbr
															class="required" title="required">*</abbr></label><input
														type="email" class="input-text " name="billing_email"
														id="billing_email" placeholder="" value=""
														autocomplete="email username"></p>
											</div>

										</div>

										<div class="woocommerce-account-fields">

											<p class="form-row form-row-wide create-account woocommerce-validated">
												<label
													class="woocommerce-form__label woocommerce-form__label-for-checkbox checkbox">
													<input
														class="woocommerce-form__input woocommerce-form__input-checkbox input-checkbox"
														id="createaccount" type="checkbox" name="createaccount"
														value="1"> <span>Create an account?</span>
												</label>
											</p>




											<div class="create-account" style="display: none;">
												<p class="form-row validate-required" id="account_password_field"
													data-priority=""><label for="account_password" class="">Account
														password <abbr class="required"
															title="required">*</abbr></label><input type="password"
														class="input-text " name="account_password"
														id="account_password" placeholder="Password" value=""></p>
												<div class="clear"></div>
											</div>


										</div>
										<div class="woocommerce-shipping-fields">
										</div>
										<div class="woocommerce-additional-fields">



											<h3>Additional information</h3>


											<div class="woocommerce-additional-fields__field-wrapper">
												<p class="form-row notes" id="order_comments_field" data-priority="">
													<label for="order_comments" class="">Order notes</label><textarea
														name="order_comments" class="input-text " id="order_comments"
														placeholder="Notes about your order, e.g. special notes for delivery."
														rows="2" cols="5"></textarea></p>
											</div>


										</div>
									</div>

									<div class="col-2">
										<h3 id="order_review_heading">Your order</h3>

										<div id="order_review" class="woocommerce-checkout-review-order">
											<table class="shop_table woocommerce-checkout-review-order-table">
												<thead>
													<tr>
														<th class="product-name">Product</th>
														<th class="product-total">Total</th>
													</tr>
												</thead>
												<tbody>
													<tr class="cart_item">
														<td class="product-name">
															Bouquet Hydrangea&nbsp; <strong class="product-quantity">×
																1</strong> </td>
														<td class="product-total">
															<span class="woocommerce-Price-amount amount"><span
																	class="woocommerce-Price-currencySymbol">$</span>98.98</span>
														</td>
													</tr>
													<tr class="cart_item">
														<td class="product-name">
															Bouquet Hydrangea - Violet White&nbsp; <strong
																class="product-quantity">× 1</strong> </td>
														<td class="product-total">
															<span class="woocommerce-Price-amount amount"><span
																	class="woocommerce-Price-currencySymbol">$</span>28.00</span>
														</td>
													</tr>
												</tbody>
												<tfoot>

													<tr class="cart-subtotal">
														<th>Subtotal</th>
														<td><span class="woocommerce-Price-amount amount"><span
																	class="woocommerce-Price-currencySymbol">$</span>126.98</span>
														</td>
													</tr>






													<tr class="order-total">
														<th>Total</th>
														<td><strong><span class="woocommerce-Price-amount amount"><span
																		class="woocommerce-Price-currencySymbol">$</span>126.98</span></strong>
														</td>
													</tr>


												</tfoot>
											</table>



											<div id="payment" class="woocommerce-checkout-payment">
												<ul class="payment_methods methods">
													<li class="wc_payment_method payment_method_bacs">
														<input id="payment_method_bacs" type="radio" class="input-radio"
															name="payment_method" value="bacs" checked="checked"
															data-order_button_text="">

														<label for="payment_method_bacs">
															Direct bank transfer </label>
														<div class="payment_box payment_method_bacs">
															<p>Make your payment directly into our bank account. Please
																use your Order ID as the payment reference. Your order
																will not be shipped until the funds have cleared in our
																account.</p>
														</div>
													</li>
													<li class="wc_payment_method payment_method_cheque">
														<input id="payment_method_cheque" type="radio"
															class="input-radio" name="payment_method" value="cheque"
															data-order_button_text="">

														<label for="payment_method_cheque">
															Check payments </label>
														<div class="payment_box payment_method_cheque"
															style="display:none;">
															<p>Please send a check to Store Name, Store Street, Store
																Town, Store State / County, Store Postcode.</p>
														</div>
													</li>
													<li class="wc_payment_method payment_method_cod">
														<input id="payment_method_cod" type="radio" class="input-radio"
															name="payment_method" value="cod" data-order_button_text="">

														<label for="payment_method_cod">
															Cash on delivery </label>
														<div class="payment_box payment_method_cod"
															style="display:none;">
															<p>Pay with cash upon delivery.</p>
														</div>
													</li>
												</ul>

												<div class="form-row place-order">
													<noscript>Since your browser does not support JavaScript, or it is
														disabled, please ensure you click the &lt;em&gt;Update
														Totals&lt;/em&gt; button before placing your order. You may be
														charged more than the amount stated above if you fail to do
														so.<br /><input type="submit" class="button alt"
															name="woocommerce_checkout_update_totals"
															value="Update totals" /></noscript>

													<input type="hidden" id="_wpnonce" name="_wpnonce"
														value="2b7f6117cd"><input type="hidden" name="_wp_http_referer"
														value="/wordpress/byhands/home1/checkout/?wc-ajax=update_order_review">

													<input type="submit" class="button alt"
														name="woocommerce_checkout_place_order" id="place_order"
														value="Place order" data-value="Place order">

												</div>
											</div>



										</div>

									</div>
								</div>

							</form>

						</div>

					</div>

				</div>
			</div>

		</div>

		<jsp:include page="common/footer.jsp" />
	</div>
	<div id="off-mainmenu" class="siderbarmenu">
		<div class="off-mainnav">
			<div class="off-close"><span class="title">Menu</span><span class="close-menu"><i
						class="fa fa-close"></i></span></div>
			<nav id="siderbar-menu" class="accordion-nav">
				<ul id="menu-main" class="nav navbar-nav nav-mega">
					<li class="dropdown menu-home tiva-normal-menu level1 has-subnav" style="position: relative;"><a
							href="http://demo1.cloodo.com/wordpress/byhands/home1/" class="item-link dropdown-toggle"
							style="margin-right: 20%;"><span class="have-title"><span
									class="menu-title">Home</span></span></a><span class="accordion-btn-wrap"
							style="width: 20%; position: absolute; top: 0px; text-align: center; cursor: pointer; display: inline-block; right: 0px;"><span
								class="accordion-btn accordion-collapsed"
								style="display: inline-block; width: 100%; line-height: 0px; height: 0px;"><i
									class="fa fa-angle-down"></i></span><span class="accordion-btn accordion-expanded"
								style="display: none; width: 100%; line-height: 0px; height: 0px;"><i
									class="fa fa-angle-up"></i></span></span>
						<ul class="dropdown-menu nav-level1 one-column " style="display: none;">
							<li class="one-column menu-homepage-1"><a
									href="http://demo1.cloodo.com/wordpress/byhands/home1"><span
										class="have-title"><span class="menu-title">Homepage 1</span></span></a></li>
							<li class="one-column menu-homepage-2"><a
									href="http://demo1.cloodo.com/wordpress/byhands/home2"><span
										class="have-title"><span class="menu-title">Homepage 2</span></span></a></li>
							<li class="one-column menu-homepage-3"><a
									href="http://demo1.cloodo.com/wordpress/byhands/home3"><span
										class="have-title"><span class="menu-title">Homepage 3</span></span></a></li>
						</ul>
					</li>
					<li class="dropdown menu-shop tiva-mega-menu level1 has-subnav" style="position: relative;"><a
							href="http://demo1.cloodo.com/wordpress/byhands/home1/shop/"
							class="item-link dropdown-toggle" style="margin-right: 20%;"><span class="have-title"><span
									class="menu-title">Shop</span></span></a><span class="accordion-btn-wrap"
							style="width: 20%; position: absolute; top: 0px; text-align: center; cursor: pointer; display: inline-block; right: 0px;"><span
								class="accordion-btn accordion-collapsed"
								style="display: inline-block; width: 100%; line-height: 0px; height: 0px;"><i
									class="fa fa-angle-down"></i></span><span class="accordion-btn accordion-expanded"
								style="display: none; width: 100%; line-height: 0px; height: 0px;"><i
									class="fa fa-angle-up"></i></span></span>
						<ul class="dropdown-menu nav-level1 four-column " style="display: none;">
							<li class="dropdown-submenu four-column menu-birthday has-subnav has-child"
								style="position: relative;"><a
									href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/birthday/"
									style="margin-right: 20%;"><span class="have-title"><span
											class="menu-title">Birthday</span></span></a><span
									class="accordion-btn-wrap"
									style="width: 20%; position: absolute; top: 0px; text-align: center; cursor: pointer; display: inline-block; right: 0px;"><span
										class="accordion-btn accordion-collapsed"
										style="display: inline-block; width: 100%; line-height: 0px; height: 0px;"><i
											class="fa fa-angle-down"></i></span><span
										class="accordion-btn accordion-expanded"
										style="display: none; width: 100%; line-height: 0px; height: 0px;"><i
											class="fa fa-angle-up"></i></span></span>
								<ul class="dropdown-sub nav-level2" style="display: none;">
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
												class="have-title"><span class="menu-title">Pinot</span></span></a></li>
								</ul>
							</li>
							<li class="dropdown-submenu four-column menu-weddings has-subnav has-child"
								style="position: relative;"><a
									href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/bouquets/"
									style="margin-right: 20%;"><span class="have-title"><span
											class="menu-title">Weddings</span></span></a><span
									class="accordion-btn-wrap"
									style="width: 20%; position: absolute; top: 0px; text-align: center; cursor: pointer; display: inline-block; right: 0px;"><span
										class="accordion-btn accordion-collapsed"
										style="display: inline-block; width: 100%; line-height: 0px; height: 0px;"><i
											class="fa fa-angle-down"></i></span><span
										class="accordion-btn accordion-expanded"
										style="display: none; width: 100%; line-height: 0px; height: 0px;"><i
											class="fa fa-angle-up"></i></span></span>
								<ul class="dropdown-sub nav-level2" style="display: none;">
									<li class="menu-chardonnay"><a
											href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/bouquets/chardonnay/"><span
												class="have-title"><span class="menu-title">Chardonnay</span></span></a>
									</li>
									<li class="menu-blanc"><a
											href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/bouquets/blanc/"><span
												class="have-title"><span class="menu-title">Blanc</span></span></a></li>
									<li class="menu-albarino"><a
											href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/bouquets/albarino/"><span
												class="have-title"><span class="menu-title">Albarino</span></span></a>
									</li>
								</ul>
							</li>
							<li class="dropdown-submenu four-column menu-custom-orders has-subnav has-child"
								style="position: relative;"><a
									href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/birthday/"
									style="margin-right: 20%;"><span class="have-title"><span class="menu-title">Custom
											Orders</span></span></a><span class="accordion-btn-wrap"
									style="width: 20%; position: absolute; top: 0px; text-align: center; cursor: pointer; display: inline-block; right: 0px;"><span
										class="accordion-btn accordion-collapsed"
										style="display: inline-block; width: 100%; line-height: 0px; height: 0px;"><i
											class="fa fa-angle-down"></i></span><span
										class="accordion-btn accordion-expanded"
										style="display: none; width: 100%; line-height: 0px; height: 0px;"><i
											class="fa fa-angle-up"></i></span></span>
								<ul class="dropdown-sub nav-level2" style="display: none;">
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
												class="have-title"><span class="menu-title">Pinot</span></span></a></li>
								</ul>
							</li>
							<li class="dropdown-submenu four-column menu-bouquets has-subnav has-child"
								style="position: relative;"><a
									href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/bouquets/"
									style="margin-right: 20%;"><span class="have-title"><span
											class="menu-title">Bouquets</span></span></a><span
									class="accordion-btn-wrap"
									style="width: 20%; position: absolute; top: 0px; text-align: center; cursor: pointer; display: inline-block; right: 0px;"><span
										class="accordion-btn accordion-collapsed"
										style="display: inline-block; width: 100%; line-height: 0px; height: 0px;"><i
											class="fa fa-angle-down"></i></span><span
										class="accordion-btn accordion-expanded"
										style="display: none; width: 100%; line-height: 0px; height: 0px;"><i
											class="fa fa-angle-up"></i></span></span>
								<ul class="dropdown-sub nav-level2" style="display: none;">
									<li class="menu-chardonnay"><a
											href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/bouquets/chardonnay/"><span
												class="have-title"><span class="menu-title">Chardonnay</span></span></a>
									</li>
									<li class="menu-blanc"><a
											href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/bouquets/blanc/"><span
												class="have-title"><span class="menu-title">Blanc</span></span></a></li>
									<li class="menu-albarino"><a
											href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/bouquets/albarino/"><span
												class="have-title"><span class="menu-title">Albarino</span></span></a>
									</li>
								</ul>
							</li>
							<li class="image-block four-column menu-banners accordion-header-only">
								<div class="row">
									<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
										<div class="block-image">
											<img class="img-responsive" src="resources/images/promotion-2.jpg"
												alt="promotion 1">
										</div>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
										<div class="block-image">
											<img class="img-responsive" src="resources/images/promotion-1.jpg"
												alt="promotion 2">
										</div>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
										<div class="block-image">
											<img class="img-responsive" src="resources/images/promotion-2.jpg"
												alt="promotion 3">
										</div>
									</div>
								</div>
							</li>
						</ul>
					</li>
					<li class="active dropdown menu-pages tiva-normal-menu level1 has-subnav"
						style="position: relative;"><a href="http://demo1.cloodo.com/wordpress/byhands/home1/checkout/#"
							class="item-link dropdown-toggle" style="margin-right: 20%;"><span class="have-title"><span
									class="menu-title">Pages</span></span></a><span class="accordion-btn-wrap"
							style="width: 20%; position: absolute; top: 0px; text-align: center; cursor: pointer; display: inline-block; right: 0px;"><span
								class="accordion-btn accordion-collapsed"
								style="display: inline-block; width: 100%; line-height: 0px; height: 0px;"><i
									class="fa fa-angle-down"></i></span><span class="accordion-btn accordion-expanded"
								style="display: none; width: 100%; line-height: 0px; height: 0px;"><i
									class="fa fa-angle-up"></i></span></span>
						<ul class="dropdown-menu nav-level1 one-column " style="display: none;">
							<li class="icon-caret dropdown-submenu one-column menu-page-category has-subnav has-child"
								style="position: relative;"><a
									href="http://demo1.cloodo.com/wordpress/byhands/home1/shop/"
									style="margin-right: 20%;"><span class="have-title"><span class="menu-title">Page
											Category</span></span></a><span class="accordion-btn-wrap"
									style="width: 20%; position: absolute; top: 0px; text-align: center; cursor: pointer; display: inline-block; right: 0px;"><span
										class="accordion-btn accordion-collapsed"
										style="display: inline-block; width: 100%; line-height: 0px; height: 0px;"><i
											class="fa fa-angle-down"></i></span><span
										class="accordion-btn accordion-expanded"
										style="display: none; width: 100%; line-height: 0px; height: 0px;"><i
											class="fa fa-angle-up"></i></span></span>
								<ul class="dropdown-sub nav-level2" style="display: none;">
									<li class="menu-product-category"><a
											href="http://demo1.cloodo.com/wordpress/byhands/home1/product-category/birthday/"><span
												class="have-title"><span class="menu-title">Product
													Category</span></span></a></li>
								</ul>
							</li>
							<li class="dropdown-submenu one-column menu-page-detail has-subnav has-child"
								style="position: relative;"><a
									href="http://demo1.cloodo.com/wordpress/byhands/home1/product/tulipa-floriade-red/"
									style="margin-right: 20%;"><span class="have-title"><span class="menu-title">Page
											Detail</span></span></a><span class="accordion-btn-wrap"
									style="width: 20%; position: absolute; top: 0px; text-align: center; cursor: pointer; display: inline-block; right: 0px;"><span
										class="accordion-btn accordion-collapsed"
										style="display: inline-block; width: 100%; line-height: 0px; height: 0px;"><i
											class="fa fa-angle-down"></i></span><span
										class="accordion-btn accordion-expanded"
										style="display: none; width: 100%; line-height: 0px; height: 0px;"><i
											class="fa fa-angle-up"></i></span></span>
								<ul class="dropdown-sub nav-level2" style="display: none;">
									<li class="menu-product-detail"><a
											href="http://demo1.cloodo.com/wordpress/byhands/home1/product/tulipa-floriade-red/"><span
												class="have-title"><span class="menu-title">Product
													Detail</span></span></a></li>
								</ul>
							</li>
							<li class="active one-column menu-page-checkout"><a
									href="http://demo1.cloodo.com/wordpress/byhands/home1/checkout/"><span
										class="have-title"><span class="menu-title">Page Checkout</span></span></a></li>
							<li class="one-column menu-page-logged"><a
									href="http://demo1.cloodo.com/wordpress/byhands/home1/my-account/"><span
										class="have-title"><span class="menu-title">Page Logged</span></span></a></li>
							<li class="one-column menu-page-404"><a
									href="http://demo1.cloodo.com/wordpress/byhands/home1/page-404"><span
										class="have-title"><span class="menu-title">Page 404</span></span></a></li>
							<li class="one-column menu-page-shopping-cart"><a
									href="http://demo1.cloodo.com/wordpress/byhands/home1/cart/"><span
										class="have-title"><span class="menu-title">Page shopping cart</span></span></a>
							</li>
						</ul>
					</li>
					<li class="menu-blog tiva-normal-menu level1"><a
							href="http://demo1.cloodo.com/wordpress/byhands/home1/category/blog/"
							class="item-link"><span class="have-title"><span class="menu-title">Blog</span></span></a>
					</li>
					<li class="menu-about-us tiva-normal-menu level1"><a
							href="http://demo1.cloodo.com/wordpress/byhands/home1/about-us/" class="item-link"><span
								class="have-title"><span class="menu-title">About us</span></span></a></li>
					<li class="menu-contact tiva-normal-menu level1"><a
							href="http://demo1.cloodo.com/wordpress/byhands/home1/contact/" class="item-link"><span
								class="have-title"><span class="menu-title">Contact</span></span></a></li>
				</ul>
			</nav>
		</div>
	</div>

	<div class="go-up" style="display: none;">
		<a href="http://demo1.cloodo.com/wordpress/byhands/home1/checkout/#"><i class="fa fa-chevron-up"></i></a>
	</div>
	
	<jsp:include page="common/foot.jsp" />
	
</body>

</html>