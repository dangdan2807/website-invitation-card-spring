<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<footer class="footer spad">
  <div class="container">
    <div class="row">
      <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="footer__about">
          <div class="footer__about__logo">
            <a href="/trang-chu">
              <img src="<c:url value ='/resources/img/logo.png' />" alt="" />
            </a>
          </div>
          <ul>
              <li>Địa chỉ: 12 Nguyễn Văn Bảo, P.4, Q.Gò Vấp, TP.Hồ Chí Minh</li>
              <li>Phone: +84 09.999.999</li>
            <li>Email: hello@code.com</li>
          </ul>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
        <div class="footer__widget">
          <h6>Liên kết hữu ích</h6>
          <ul>
            <li><a href="#">Về chúng tôi</a></li>
            <li><a href="#">Về cửa hàng của chúng tôi</a></li>
            <li><a href="#">Mua sắm an toàn</a></li>
            <li><a href="#">Thông tin giao hàng</a></li>
            <li><a href="#">Chính sách bảo mật</a></li>
            <li><a href="#">Sơ đồ trang web</a></li>
          </ul>
          <ul>
            <li><a href="#">Chúng tôi là ai</a></li>
            <li><a href="#">Dịch vụ của chúng tôi</a></li>
            <li><a href="#">Dự án</a></li>
            <li><a href="#">Liên hệ</a></li>
            <li><a href="#">Sự đổi mới</a></li>
            <li><a href="#">Lời chứng thực</a></li>
          </ul>
        </div>
      </div>
      <div class="col-lg-4 col-md-12">
        <div class="footer__widget">
          <h6>Nhận tin mới nhất của chúng tôi</h6>
          <p>
            Nhận cập nhật e-mail về cửa hàng mới nhất và ưu đãi đặc biệt của
            chúng tôi.
          </p>
          <form action="#">
            <input type="text" placeholder="Nhập email của bạn" />
            <button type="submit" class="site-btn">Tham gia</button>
          </form>
          <div class="footer__widget__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-instagram"></i></a>
            <!-- <a href="#"><i class="fa fa-twitter"></i></a> -->
            <!-- <a href="#"><i class="fa fa-pinterest"></i></a> -->
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-12">
        <div class="footer__copyright">
          <div class="footer__copyright__text">
            <p>
              Copyright &copy;
              <script>
                document.write(new Date().getFullYear());
              </script>
              <i class="fa fa-heart" aria-hidden="true"></i> by
              <a href="/trang-chu" target="_blank">Nhóm 1</a>
            </p>
          </div>
          <div class="footer__copyright__payment">
            <img
              src="<c:url value = '/resources/img/payment-item.png' />"
              alt=""
            />
          </div>
        </div>
      </div>
    </div>
  </div>
</footer>
