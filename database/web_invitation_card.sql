USE [master]
GO

CREATE DATABASE [web_invitation_cards]
GO

USE [web_invitation_cards]
GO

CREATE TABLE [dbo].[ChucVu]
(
	[maChucVu] [INT] IDENTITY(1, 1) NOT NULL,
	[tenChucVu] [NVARCHAR](100) NOT NULL DEFAULT(N''),
	CONSTRAINT [PK_ChucVu] PRIMARY KEY([maChucVu])
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TaiKhoan]
(
	[tenDangNhap] [VARCHAR](255) NOT NULL,
	[matKhau] [VARCHAR](100) NOT NULL,
	[tinhTrang] [INT] NOT NULL DEFAULT (1),
	[maChucVu] [INT] NOT NULL UNIQUE,
	PRIMARY KEY ([tenDangNhap])
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[NguoiDung]
(
	[maND] [INT] IDENTITY(1, 1) NOT NULL,
	[tenND] [NVARCHAR](125) NOT NULL,
	[diaChi] TEXT NULL DEFAULT (''),
	[sdt] [VARCHAR](10) NULL DEFAULT(''),
	[email] [VARCHAR](255) NOT NULL UNIQUE,
	PRIMARY KEY (maND),
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SanPham]
(
	[maSp] [INT] IDENTITY(1, 1) NOT NULL,
	[tenSp] [NVARCHAR](255) NOT NULL,
	[loaiSp] [NVARCHAR](100) NOT NULL,
	[hinhAnh] [TEXT] NULL,
	[giaSP] [MONEY] NULL DEFAULT (0) CHECK (giaSP >= 0)
	CONSTRAINT [PK_SanPham] PRIMARY KEY ([maSp])
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[HoaDon]
(
	[maHD] [INT] IDENTITY(1, 1) NOT NULL,
	[ngayLHD] [DATETIME] NOT NULL,
	[tongTien] [MONEY] NOT NULL DEFAULT(0) CHECK(tongTien >= 0),
	[tongSoLuong] [INT] NOT NULL DEFAULT(0) CHECK(tongSoLuong >= 0),
	[maKH] [INT] NOT NULL,
	CONSTRAINT [PK_HoaDon] PRIMARY KEY ([maHD])
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ChiTietHoaDon]
(
	[maHD] [INT] NOT NULL,
	[maSp] [INT] NOT NULL,
	[soLuong] [INT] NULL DEFAULT(1) CHECK(soLuong >= 1),
	[thanhTien] [MONEY] NULL DEFAULT(0) CHECK(thanhTien >= 0),
	CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY ([maSp], [maHD])
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([maHD])
REFERENCES [dbo].[HoaDon] ([maHD])
GO

ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([maSp])
REFERENCES [dbo].[SanPham] ([maSp])
GO

ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([maKH])
REFERENCES [dbo].[NguoiDung] ([maND])
GO

ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([maChucVu])
REFERENCES [dbo].[ChucVu] ([maChucVu])
GO

ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([tenDangNhap])
REFERENCES [dbo].[NguoiDung] ([email])
GO

USE [master]
GO