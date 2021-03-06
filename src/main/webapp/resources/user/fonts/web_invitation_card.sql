USE [master]
GO

CREATE DATABASE [web_invitation_cards]
GO

USE [web_invitation_cards]
GO

CREATE TABLE [dbo].[ChucVu]
(
	[maChucVu] [INT] IDENTITY(1,1) NOT NULL,
	[tenChucVu] [NVARCHAR](100) NOT NULL DEFAULT (N''),
	CONSTRAINT PK_ChucVu PRIMARY KEY([maChucVu])
)
GO

CREATE TABLE [dbo].[TaiKhoan]
(
	[tenDangNhap] [VARCHAR](255) NOT NULL,
	[matKhau] [VARCHAR](100) NOT NULL,
	[tinhTrang] [INT] NOT NULL DEFAULT (1),
	[maChucVu] [INT] NOT NULL,
	CONSTRAINT PK_TaiKhoan PRIMARY KEY([tenDangNhap])
)
GO

CREATE TABLE [dbo].[NguoiDung]
(
	[maND] [INT] IDENTITY(1,1) NOT NULL,
	[diaChi] [TEXT] NULL DEFAULT (N''),
	[sdt] [VARCHAR](10) NULL DEFAULT (''),
	[tenND] [NVARCHAR](125) NOT NULL,
	[email] [VARCHAR](255) NOT NULL DEFAULT (''),
	[hinhAnh] text NULL DEFAULT (N''),
	CONSTRAINT PK_NguoiDung PRIMARY KEY([maND]),
	CONSTRAINT [UK_NguoiDung_email] UNIQUE ([email])
)
GO

CREATE TABLE [dbo].[HoaDon]
(
	[maHD] [INT] IDENTITY(1,1) NOT NULL,
	[diaChiGiaoHang] [TEXT] NULL DEFAULT (N''),
	[ngayGiaoHang] [DATETIME] NULL,
	[ngayLHD] [DATETIME] NOT NULL DEFAULT (getdate()),
	[tongSoLuong] [INT] NOT NULL DEFAULT (0) CHECK([tongSoLuong]>=0),
	[tongTien] [MONEY] NOT NULL DEFAULT (0) CHECK([tongTien]>=0),
	[trangThaiDonHang] [NVARCHAR](100) NOT NULL DEFAULT (N'Chưa thanh toán'),
	[maKH] [INT] NOT NULL,
	CONSTRAINT PK_HoaDon PRIMARY KEY([maHD])
)
GO

CREATE TABLE [dbo].[SanPham]
(
	[maSp] [INT] IDENTITY(1,1) NOT NULL,
	[giaSP] [MONEY] NOT NULL DEFAULT (0) CHECK  ([giaSP]>=0),
	[hinhAnh] text NULL DEFAULT (N''),
	[tenSp] [NVARCHAR](255) NOT NULL,
	CONSTRAINT PK_SanPham PRIMARY KEY([maSp])
)
GO

CREATE TABLE [dbo].[ChiTietHoaDon]
(
	[maHD] [INT] NOT NULL,
	[maSp] [INT] NOT NULL,
	[giaBan] [MONEY] NULL DEFAULT (0) CHECK([giaBan]>=0),
	[soLuong] [INT] NULL DEFAULT (1) CHECK([soLuong]>=1),
	CONSTRAINT PK_ChiTietHoaDon PRIMARY KEY([maHD], [maSp])
)
GO

CREATE TABLE [dbo].[LoaiSanPham]
(
	[maLSP] [INT] IDENTITY(1,1) NOT NULL,
	[tenLSP] [NVARCHAR](100) NOT NULL,
	[hinhAnh] text NULL DEFAULT (N''),
	CONSTRAINT PK_LoaiSanPham PRIMARY KEY([maLSP])
)
GO

CREATE TABLE [dbo].[ChiTietLoaiSP]
(
	[maLSP] [INT] NOT NULL,
	[maSp] [INT] NOT NULL,
	CONSTRAINT PK_ChiTietLoaiSP PRIMARY KEY([maLSP], [maSp])
)
GO

CREATE TABLE [dbo].[DanhGia]
(
	[maDanhGia] [INT] IDENTITY(1,1) NOT NULL,
	[noiDung] [TEXT] NOT NULL DEFAULT (N''),
	[thoiGian] [DATETIME] NOT NULL DEFAULT (getdate()),
	[xepHang] [INT] NOT NULL DEFAULT (0) CHECK([xepHang]>=0 OR [xepHang]<=5),
	[maND] [INT] NULL,
	[maSP] [INT] NULL,
	CONSTRAINT PK_DanhGia PRIMARY KEY([maDanhGia])
)

CREATE TABLE [dbo].[GioHang]
(
	[maND] [INT] NOT NULL,
	[maSp] [INT] NOT NULL,
	[soLuong] [INT] NULL DEFAULT (1) CHECK([soLuong]>=1),
	CONSTRAINT PK_GioHang PRIMARY KEY([maND], [maSp])
)
GO

ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([maHD])
REFERENCES [dbo].[HoaDon] ([maHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_SanPham] FOREIGN KEY([maSp])
REFERENCES [dbo].[SanPham] ([maSp])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_SanPham]
GO
ALTER TABLE [dbo].[ChiTietLoaiSP]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLoaiSP_LoaiSanPham] FOREIGN KEY([maLSP])
REFERENCES [dbo].[LoaiSanPham] ([maLSP])
GO
ALTER TABLE [dbo].[ChiTietLoaiSP] CHECK CONSTRAINT [FK_ChiTietLoaiSP_LoaiSanPham]
GO
ALTER TABLE [dbo].[ChiTietLoaiSP]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLoaiSP_SanPham] FOREIGN KEY([maSp])
REFERENCES [dbo].[SanPham] ([maSp])
GO
ALTER TABLE [dbo].[ChiTietLoaiSP] CHECK CONSTRAINT [FK_ChiTietLoaiSP_SanPham]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_SanPham] FOREIGN KEY([maSP])
REFERENCES [dbo].[SanPham] ([maSp])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_SanPham]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_NguoiDung] FOREIGN KEY([maND])
REFERENCES [dbo].[NguoiDung] ([maND])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_NguoiDung]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_SanPham] FOREIGN KEY([maSp])
REFERENCES [dbo].[SanPham] ([maSp])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_SanPham]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_NguoiDung] FOREIGN KEY([maND])
REFERENCES [dbo].[NguoiDung] ([maND])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_NguoiDung]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NguoiDung] FOREIGN KEY([maKH])
REFERENCES [dbo].[NguoiDung] ([maND])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NguoiDung]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_TaiKhoan] FOREIGN KEY([email])
REFERENCES [dbo].[TaiKhoan] ([tenDangNhap])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_TaiKhoan]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_ChucVu] FOREIGN KEY([maChucVu])
REFERENCES [dbo].[ChucVu] ([maChucVu])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_ChucVu]
GO

USE [master]
GO
