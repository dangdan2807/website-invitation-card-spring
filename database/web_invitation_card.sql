USE master
Go

CREATE DATABASE web_invitation_cards
Go

USE web_invitation_cards
Go

CREATE TABLE ChucVu(
	maChucVu int IDENTITY(1,1) NOT NULL,
	tenChucVu nvarchar(100) NOT NULL DEFAULT(N''),
	CONSTRAINT PK_ChucVu PRIMARY KEY (maChucVu)
)
Go

CREATE TABLE TaiKhoan(
	tenDangNhap varchar(255) NOT NULL,
	matKhau varchar(100) NOT NULL,
	tinhTrang int NOT NULL DEFAULT(1),
	maChucVu int NOT NULL,
	CONSTRAINT PK_TaiKhoan PRIMARY KEY (tenDangNhap)
)
Go

CREATE TABLE NguoiDung(
	maND int IDENTITY(1,1) NOT NULL,
	tenND nvarchar(125) NOT NULL DEFAULT(N''),
	diaChi text NULL DEFAULT(''),
	sdt varchar(10) NULL DEFAULT(''),
	email varchar(255) NOT NULL UNIQUE,
	CONSTRAINT PK_NguoiDung PRIMARY KEY (maND)
)
Go

CREATE TABLE HoaDon(
	maHD int IDENTITY(1,1) NOT NULL,
	ngayLHD datetime NOT NULL DEFAULT(GETDATE()) CHECK(ngayLHD >= GETDATE()),
	tongSoLuong int NOT NULL DEFAULT(0) CHECK(tongSoLuong >= 0),
	tongTien money NOT NULL DEFAULT(0) CHECK(tongTien >= 0),
	maKH int NOT NULL,
	CONSTRAINT PK_HoaDon PRIMARY KEY (maHD)
)
Go

CREATE TABLE ChiTietHoaDon(
	maHD int NOT NULL,
	maSp int NOT NULL,
	soLuong int NULL DEFAULT(1) CHECK(soLuong >= 1),
	thanhTien MONEY NULL DEFAULT(0) CHECK(thanhTien >= 0),
	CONSTRAINT PK_ChiTietHoaDon PRIMARY KEY(maHD, maSp)
)
Go

CREATE TABLE SanPham(
	maSp int IDENTITY(1,1) NOT NULL,
	tenSp nvarchar(255) NOT NULL,
	giaSP money NOT NULL DEFAULT(0) CHECK(giaSP >= 0),
	hinhAnh text NULL,
	CONSTRAINT PK_SanPham PRIMARY KEY (maSp) 
)
Go

CREATE TABLE ChiTietLoaiSP(
	maLSP int NOT NULL,
	maSp int NOT NULL,
	CONSTRAINT PK_ChiTietLoaiSP PRIMARY KEY (maLSP, maSp)
)
Go

CREATE TABLE LoaiSanPham(
	maLSP int IDENTITY(1,1) NOT NULL,
	tenLSP nvarchar(100) NOT NULL,
	CONSTRAINT PK_LoaiSanPham PRIMARY KEY (maLSP) 
)
Go

ALTER TABLE ChiTietHoaDon WITH CHECK ADD CONSTRAINT FK_HoaDon_MaHD FOREIGN KEY(maHD)
REFERENCES HoaDon (maHD)
Go

ALTER TABLE ChiTietHoaDon CHECK CONSTRAINT FK_HoaDon_MaHD
Go

ALTER TABLE ChiTietHoaDon  WITH CHECK ADD  CONSTRAINT FK_CTHoaDon_SanPham FOREIGN KEY(maSp)
REFERENCES SanPham (maSp)
Go

ALTER TABLE ChiTietHoaDon CHECK CONSTRAINT FK_CTHoaDon_SanPham
Go

ALTER TABLE ChiTietLoaiSP  WITH CHECK ADD  CONSTRAINT FK_CTLoaiSP_LoaiSanPham FOREIGN KEY(maLSP)
REFERENCES LoaiSanPham (maLSP)
Go

ALTER TABLE ChiTietLoaiSP CHECK CONSTRAINT FK_CTLoaiSP_LoaiSanPham
Go

ALTER TABLE ChiTietLoaiSP  WITH CHECK ADD  CONSTRAINT FK_CTLoaiSP_SanPham FOREIGN KEY(maSp)
REFERENCES SanPham (maSp)
Go

ALTER TABLE ChiTietLoaiSP CHECK CONSTRAINT FK_CTLoaiSP_SanPham
Go

ALTER TABLE HoaDon  WITH CHECK ADD  CONSTRAINT FK_HoaDon_NguoiDung FOREIGN KEY(maKH)
REFERENCES NguoiDung (maND)
Go

ALTER TABLE HoaDon CHECK CONSTRAINT FK_HoaDon_NguoiDung
Go

ALTER TABLE NguoiDung  WITH CHECK ADD  CONSTRAINT FK_NguoiDung_TaiKhoan FOREIGN KEY(email)
REFERENCES TaiKhoan (tenDangNhap)
Go

ALTER TABLE NguoiDung CHECK CONSTRAINT FK_NguoiDung_TaiKhoan
Go

ALTER TABLE TaiKhoan  WITH CHECK ADD  CONSTRAINT FK_TaiKhoan_ChucVu FOREIGN KEY(maChucVu)
REFERENCES ChucVu (maChucVu)
Go

ALTER TABLE TaiKhoan CHECK CONSTRAINT FK_TaiKhoan_ChucVu
Go

USE master
Go