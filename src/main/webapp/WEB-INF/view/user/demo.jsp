<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>demo đọc data</title>
</head>

<body>
    <p>Chức vụ</p>
    <ul>
        <c:forEach var="chucVu" items="${chucVuList}">
            <li>${chucVu.tenChucVu}</li>
        </c:forEach>
    </ul>
    <hr />

    <p>Tài khoản</p>
    <ul>
        <c:forEach var="taiKhoan" items="${taiKhoanList}">
            <li>${taiKhoan.tenDangNhap} - ${taiKhoan.tinhTrang}</li>
        </c:forEach>
    </ul>
    <hr />

    <p>Người dùng</p>
    <ul>
        <c:forEach var="nguoiDung" items="${nguoiDungList}">
            <li>${nguoiDung.tenND}</li>
        </c:forEach>
    </ul>
    <hr />
    <p>Hóa đơn</p>
    <ul>
        <c:forEach var="hoaDon" items="${hoaDonList}">
            <li>${hoaDon.maHD} - ${hoaDon.ngayLHD}</li>
        </c:forEach>
    </ul>
    <hr />

    <p>CT hóa đơn</p>
    <ul>
        <c:forEach var="ctHoaDon" items="${ctHoaDonList}">
            <li>${ctHoaDon.sanPham.maSp} - ${ctHoaDon.sanPham.tenSp}</li>
        </c:forEach>
    </ul>
    <hr />

    <p>Sản phẩm</p>
    <ul>
        <c:forEach var="sanPham" items="${sanPhamList}">
            <li>${sanPham.tenSp}</li>
        </c:forEach>
    </ul>
    <hr />

    <p>CT loại sản phẩm</p>
    <ul>
        <c:forEach var="ctLoaiSP" items="${ctLoaiSPList}">
            <li>${ctLoaiSP.loaiSanPham.maLSP} - ${ctLoaiSP.loaiSanPham.tenLSP}</li>
        </c:forEach>
    </ul>
    <hr />

    <p>Loại sản phẩm</p>
    <ul>
        <c:forEach var="loaiSanPham" items="${loaiSanPhamList}">
            <li>${loaiSanPham.tenLSP}</li>
        </c:forEach>
    </ul>
    <hr />

</body>

</html>