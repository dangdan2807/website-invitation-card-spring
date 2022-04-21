USE master
GO

--drop database web_invitation_cards
go

USE web_invitation_cards
GO

insert into ChucVu(tenChucVu)
VALUES 
(N'Nhan vien'),
(N'Quản lý'),
(N'Admin')
GO

insert into TaiKhoan(tenDangNhap, matKhau, tinhTrang, maChucVu) 
VALUES
('admin@code.com', '123', 1, 1),
('quanly@code.com', '123', 1, 2),
('nhanvien@code.com', '123', 1, 3)
GO

insert into NguoiDung(tenND, diaChi, sdt, email)
VALUES 
(N'Nguyen Van A', N'Hai Ba Trung', '0123456789', 'admin@code.com'),
(N'Nguyen Van B', N'Hai Ba Trung', '0123456789', 'quanly@code.com'),
(N'Nguyen Van C', N'Hai Ba Trung', '0123456789', 'nhanvien@code.com')
GO

insert into HoaDon(tongTien, tongSoLuong, maKH)
VALUES
(20000, 2, 1),
(20000, 2, 2),
(20000, 2, 3)
GO

insert into SanPham(tenSp, hinhAnh, giaSP)
VALUES
(N'Sản phẩm 1', N'product/product-1.jpg', 10000),
(N'Sản phẩm 2', N'product/product-2.jpg', 10000),
(N'Sản phẩm 3', N'product/product-3.jpg', 10000),
(N'Sản phẩm 4', N'product/product-4.jpg', 10000),
(N'Sản phẩm 5', N'product/product-5.jpg', 10000),
(N'Sản phẩm 6', N'product/product-6.jpg', 10000),
(N'Sản phẩm 7', N'product/product-7.jpg', 10000),
(N'Sản phẩm 8', N'product/product-8.jpg', 10000),
(N'Sản phẩm 9', N'product/product-9.jpg', 10000),
(N'Sản phẩm 10', N'product/product-10.jpg', 10000),
(N'Sản phẩm 11', N'product/product-11.jpg', 10000),
(N'Sản phẩm 12', N'product/product-12.jpg', 10000)
GO

insert into ChiTietHoaDon(maHD, maSp, soLuong, thanhTien)
VALUES
(1, 1, 1, 10000),
(1, 2, 1, 10000),
(2, 1, 1, 10000),
(2, 2, 1, 10000),
(3, 1, 1, 10000),
(3, 2, 1, 10000)
GO

insert into LoaiSanPham(tenLSP)
VALUES
(N'Loại 1'),
(N'Loại 2'),
(N'Loại 3')
GO

insert into ChiTietLoaiSP(maLSP, maSp)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12)
go

USE master
GO
