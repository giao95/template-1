USE [TiemThuocTay]
GO
/****** Object:  Table [dbo].[CHITIETBAN]    Script Date: 16/02/2017 00:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETBAN](
	[SoHD] [numeric](18, 0) NOT NULL,
	[SoLo] [varchar](50) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaBan] [money] NOT NULL,
 CONSTRAINT [PK_CHITIETBAN_1] PRIMARY KEY CLUSTERED 
(
	[SoHD] ASC,
	[SoLo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOHANG]    Script Date: 16/02/2017 00:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOHANG](
	[SoLo] [varchar](50) NOT NULL,
	[MaThuoc] [varchar](50) NOT NULL,
	[SoLuongCon] [int] NOT NULL,
	[NgaySX] [date] NOT NULL,
	[HanSD] [date] NOT NULL,
 CONSTRAINT [PK_LOHANG] PRIMARY KEY CLUSTERED 
(
	[SoLo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_BAN]    Script Date: 16/02/2017 00:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_BAN]
AS
SELECT        dbo.CHITIETBAN.SoHD, dbo.LOHANG.SoLo, dbo.CHITIETBAN.SoLuong
FROM            dbo.CHITIETBAN INNER JOIN
                         dbo.LOHANG ON dbo.CHITIETBAN.SoLo = dbo.LOHANG.SoLo


GO
/****** Object:  Table [dbo].[CHITIETNHAP]    Script Date: 16/02/2017 00:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETNHAP](
	[SoPhieu] [numeric](18, 0) NOT NULL,
	[SoLo] [varchar](50) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaNhap] [money] NOT NULL,
 CONSTRAINT [PK_CHITIETNHAP_1] PRIMARY KEY CLUSTERED 
(
	[SoPhieu] ASC,
	[SoLo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_NHAP]    Script Date: 16/02/2017 00:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_NHAP]
AS
SELECT        dbo.CHITIETNHAP.SoPhieu, dbo.LOHANG.SoLo, dbo.LOHANG.MaThuoc, dbo.CHITIETNHAP.SoLuong, dbo.LOHANG.NgaySX, dbo.LOHANG.HanSD, dbo.CHITIETNHAP.GiaNhap
FROM            dbo.CHITIETNHAP INNER JOIN
                         dbo.LOHANG ON dbo.CHITIETNHAP.SoLo = dbo.LOHANG.SoLo

GO
/****** Object:  Table [dbo].[GIA]    Script Date: 16/02/2017 00:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIA](
	[MaThuoc] [varchar](50) NOT NULL,
	[NgayTD] [date] NOT NULL,
	[GiaBan] [money] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_GIA]    Script Date: 16/02/2017 00:06:02 ******/
CREATE CLUSTERED INDEX [PK_GIA] ON [dbo].[GIA]
(
	[MaThuoc] ASC,
	[NgayTD] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THUOC]    Script Date: 16/02/2017 00:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THUOC](
	[MaThuoc] [varchar](50) NOT NULL,
	[TenThuoc] [nvarchar](300) NOT NULL,
	[Anh] [varchar](500) NULL,
	[TacDung] [nvarchar](1000) NOT NULL,
	[CachDung] [nvarchar](1000) NOT NULL,
	[ChongChiDinh] [nvarchar](1000) NOT NULL,
	[TacDungPhu] [nvarchar](1000) NOT NULL,
	[ThanhPhan] [nvarchar](1000) NOT NULL,
	[DonViTinh] [nvarchar](200) NULL,
	[NhaSanXuat] [nvarchar](300) NULL,
	[MaDM] [varchar](50) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GioiThieu] [nvarchar](1000) NULL,
 CONSTRAINT [PK_THUOC] PRIMARY KEY CLUSTERED 
(
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_THUOC]    Script Date: 16/02/2017 00:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_THUOC]
AS
SELECT        dbo.THUOC.MaThuoc, dbo.THUOC.TenThuoc, dbo.THUOC.Anh, dbo.THUOC.TacDung, dbo.THUOC.CachDung, dbo.THUOC.ChongChiDinh, dbo.THUOC.TacDungPhu, 
                         dbo.THUOC.ThanhPhan, dbo.THUOC.DonViTinh, dbo.THUOC.NhaSanXuat, dbo.THUOC.MaDM, dbo.THUOC.GioiThieu, dbo.THUOC.SoLuong, dbo.GIA.GiaBan
FROM            dbo.GIA INNER JOIN
                         dbo.THUOC ON dbo.GIA.MaThuoc = dbo.THUOC.MaThuoc


GO
/****** Object:  View [dbo].[View_GIA]    Script Date: 16/02/2017 00:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[View_GIA]
as
select MaThuoc, GiaBan, NgayTD
from (
	select MaThuoc, GiaBan, NgayTD, ROW_NUMBER() OVER(PARTITION BY MaThuoc ORDER BY NgayTD DESC) id
	from GIA) tb
where id = 1
GO
/****** Object:  Table [dbo].[DANHMUC]    Script Date: 16/02/2017 00:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUC](
	[MaDM] [varchar](50) NOT NULL,
	[TenDanhMuc] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_DANHMUC] PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 16/02/2017 00:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[SoHD] [numeric](18, 0) NOT NULL,
	[TenTaiKhoan] [varchar](50) NOT NULL,
	[NgayLap] [date] NOT NULL,
	[TongTien] [money] NOT NULL,
 CONSTRAINT [PK_HOADON] PRIMARY KEY CLUSTERED 
(
	[SoHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 16/02/2017 00:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[MaNhaCC] [varchar](50) NOT NULL,
	[TenNhaCC] [nvarchar](300) NOT NULL,
	[DiaChi] [nvarchar](500) NULL,
	[SoDT] [varchar](15) NULL,
	[Email] [varchar](200) NULL,
 CONSTRAINT [PK_NHACUNGCAP] PRIMARY KEY CLUSTERED 
(
	[MaNhaCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHIEUNHAP]    Script Date: 16/02/2017 00:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUNHAP](
	[SoPhieu] [numeric](18, 0) NOT NULL,
	[TenTaiKhoan] [varchar](50) NOT NULL,
	[MaNhaCC] [varchar](50) NOT NULL,
	[NgayLap] [date] NOT NULL,
	[TongTien] [money] NOT NULL,
 CONSTRAINT [PK_PHIEUNHAP] PRIMARY KEY CLUSTERED 
(
	[SoPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 16/02/2017 00:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[TenTaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[TenNguoiDung] [nvarchar](200) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [bit] NULL,
	[DiaChi] [nvarchar](500) NULL,
	[SoDT] [varchar](15) NULL,
	[Email] [varchar](200) NULL,
	[LoaiTK] [int] NOT NULL,
	[GioiThieu] [ntext] NULL,
 CONSTRAINT [PK_TAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[TenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[DANHMUC] ([MaDM], [TenDanhMuc]) VALUES (N'001', N'Danh muc 1')
INSERT [dbo].[DANHMUC] ([MaDM], [TenDanhMuc]) VALUES (N'002', N'Danh muc 2')
INSERT [dbo].[DANHMUC] ([MaDM], [TenDanhMuc]) VALUES (N'003', N'Danh muc 3')
INSERT [dbo].[DANHMUC] ([MaDM], [TenDanhMuc]) VALUES (N'DM001', N'Danh muc 01')
INSERT [dbo].[DANHMUC] ([MaDM], [TenDanhMuc]) VALUES (N'DM002', N'Danh muc 02')
INSERT [dbo].[DANHMUC] ([MaDM], [TenDanhMuc]) VALUES (N'DM003', N'Danh muc 03')
INSERT [dbo].[GIA] ([MaThuoc], [NgayTD], [GiaBan]) VALUES (N'THUOC001', CAST(N'2016-04-21' AS Date), 62000.0000)
INSERT [dbo].[GIA] ([MaThuoc], [NgayTD], [GiaBan]) VALUES (N'THUOC001', CAST(N'2015-12-02' AS Date), 50000.0000)
INSERT [dbo].[GIA] ([MaThuoc], [NgayTD], [GiaBan]) VALUES (N'THUOC002', CAST(N'2017-06-05' AS Date), 51000.0000)
INSERT [dbo].[GIA] ([MaThuoc], [NgayTD], [GiaBan]) VALUES (N'THUOC003', CAST(N'2017-02-02' AS Date), 30000.0000)
INSERT [dbo].[GIA] ([MaThuoc], [NgayTD], [GiaBan]) VALUES (N'THUOC004', CAST(N'2016-04-05' AS Date), 85000.0000)
INSERT [dbo].[GIA] ([MaThuoc], [NgayTD], [GiaBan]) VALUES (N'THUOC005', CAST(N'2016-09-15' AS Date), 120000.0000)
INSERT [dbo].[GIA] ([MaThuoc], [NgayTD], [GiaBan]) VALUES (N'THUOC005', CAST(N'2015-05-05' AS Date), 20000.0000)
INSERT [dbo].[GIA] ([MaThuoc], [NgayTD], [GiaBan]) VALUES (N'THUOC006', CAST(N'2017-01-01' AS Date), 15000.0000)
INSERT [dbo].[GIA] ([MaThuoc], [NgayTD], [GiaBan]) VALUES (N'THUOC007', CAST(N'2016-05-24' AS Date), 652000.0000)
INSERT [dbo].[GIA] ([MaThuoc], [NgayTD], [GiaBan]) VALUES (N'THUOC008', CAST(N'2017-01-03' AS Date), 100000.0000)
INSERT [dbo].[GIA] ([MaThuoc], [NgayTD], [GiaBan]) VALUES (N'THUOC009', CAST(N'2016-03-05' AS Date), 51000.0000)
INSERT [dbo].[GIA] ([MaThuoc], [NgayTD], [GiaBan]) VALUES (N'THUOC010', CAST(N'2016-11-11' AS Date), 25000.0000)
INSERT [dbo].[GIA] ([MaThuoc], [NgayTD], [GiaBan]) VALUES (N'THUOC011', CAST(N'2017-11-11' AS Date), 623000.0000)
INSERT [dbo].[NHACUNGCAP] ([MaNhaCC], [TenNhaCC], [DiaChi], [SoDT], [Email]) VALUES (N'ncc1', N'fhfg', N'fgfg', N'fgf', N'fgfg')
INSERT [dbo].[TAIKHOAN] ([TenTaiKhoan], [MatKhau], [TenNguoiDung], [NgaySinh], [GioiTinh], [DiaChi], [SoDT], [Email], [LoaiTK], [GioiThieu]) VALUES (N'admin', N'123456', N'admin', CAST(N'2010-10-10' AS Date), 1, N'admin', N'0123', N'abc@gmail', 1, N'tao la admin')
INSERT [dbo].[TAIKHOAN] ([TenTaiKhoan], [MatKhau], [TenNguoiDung], [NgaySinh], [GioiTinh], [DiaChi], [SoDT], [Email], [LoaiTK], [GioiThieu]) VALUES (N'LeB', N'234', N'Lê B', CAST(N'1990-03-02' AS Date), 0, N'Huế', N'01248584', N'leb@gmail.com', 0, N'Y sỹ')
INSERT [dbo].[TAIKHOAN] ([TenTaiKhoan], [MatKhau], [TenNguoiDung], [NgaySinh], [GioiTinh], [DiaChi], [SoDT], [Email], [LoaiTK], [GioiThieu]) VALUES (N'nguoidung', N'123', N'Lê A', CAST(N'1989-02-03' AS Date), 1, N'Huế', N'01234585', N'lea@gmail.com', 1, N'Dược sỹ')
INSERT [dbo].[TAIKHOAN] ([TenTaiKhoan], [MatKhau], [TenNguoiDung], [NgaySinh], [GioiTinh], [DiaChi], [SoDT], [Email], [LoaiTK], [GioiThieu]) VALUES (N'user', N'user', N'user', CAST(N'2010-10-10' AS Date), 0, N'abc', N'0123', N'abc@gmail', 0, N'bac sy')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [Anh], [TacDung], [CachDung], [ChongChiDinh], [TacDungPhu], [ThanhPhan], [DonViTinh], [NhaSanXuat], [MaDM], [SoLuong], [GioiThieu]) VALUES (N'THUOC001', N'Thuoc 01', N'img.jpg', N'khong co tac dung', N'dung xa lang', N'sa', N'ewq', N'rew', N'chai', N'a', N'DM001', 0, NULL)
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [Anh], [TacDung], [CachDung], [ChongChiDinh], [TacDungPhu], [ThanhPhan], [DonViTinh], [NhaSanXuat], [MaDM], [SoLuong], [GioiThieu]) VALUES (N'THUOC002', N'Thuoc 02', N'img2.jpg', N'khong co tac dung', N'dung xa lang', N'sa', N'qe', N'ewfwef', N'chai', N'a', N'DM002', 0, NULL)
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [Anh], [TacDung], [CachDung], [ChongChiDinh], [TacDungPhu], [ThanhPhan], [DonViTinh], [NhaSanXuat], [MaDM], [SoLuong], [GioiThieu]) VALUES (N'THUOC003', N'Thuoc 03', N'img3.jpg', N'khong co tac dung', N'dung xa lang', N'á', N'ưefrew', N'sadf', N'chai', N'a', N'DM003', 0, NULL)
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [Anh], [TacDung], [CachDung], [ChongChiDinh], [TacDungPhu], [ThanhPhan], [DonViTinh], [NhaSanXuat], [MaDM], [SoLuong], [GioiThieu]) VALUES (N'THUOC004', N'Thuoc 04', N'img3.jpg', N'khong co tac dung', N'dung xa lang', N'khong dung cho tre em dang mang thai va phu nu duoi 18tuoi', N'khong co', N'eo co gi', N'chai', NULL, N'001', 0, NULL)
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [Anh], [TacDung], [CachDung], [ChongChiDinh], [TacDungPhu], [ThanhPhan], [DonViTinh], [NhaSanXuat], [MaDM], [SoLuong], [GioiThieu]) VALUES (N'THUOC005', N'Thuoc 05', N'img3.jpg', N'khong co tac dung', N'dung xa lang', N'khong dung cho tre em dang mang thai va phu nu duoi 18tuoi', N'khong co', N'eo co gi', N'chai', NULL, N'002', 0, NULL)
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [Anh], [TacDung], [CachDung], [ChongChiDinh], [TacDungPhu], [ThanhPhan], [DonViTinh], [NhaSanXuat], [MaDM], [SoLuong], [GioiThieu]) VALUES (N'THUOC006', N'Thuoc 06', N'img3.jpg', N'co tac dung', N'dung xa lang', N'khong dung cho tre em dang mang thai va phu nu duoi 18tuoi', N'khong co', N'eo co gi', N'chai', NULL, N'003', 0, NULL)
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [Anh], [TacDung], [CachDung], [ChongChiDinh], [TacDungPhu], [ThanhPhan], [DonViTinh], [NhaSanXuat], [MaDM], [SoLuong], [GioiThieu]) VALUES (N'THUOC007', N'Thuoc 07', N'img3.jpg', N'khong tac dung', N'dung xa lang', N'khong dung cho tre em dang mang thai va phu nu duoi 18tuoi', N'khong co', N'eo co gi', N'chai', NULL, N'DM002', 0, NULL)
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [Anh], [TacDung], [CachDung], [ChongChiDinh], [TacDungPhu], [ThanhPhan], [DonViTinh], [NhaSanXuat], [MaDM], [SoLuong], [GioiThieu]) VALUES (N'THUOC008', N'Thuoc 08', N'img3.jpg', N'khong', N'dung xa lang', N'khong dung cho tre em dang mang thai va phu nu duoi 18tuoi', N'khong co', N'eo co gi', N'chai', NULL, N'DM002', 0, NULL)
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [Anh], [TacDung], [CachDung], [ChongChiDinh], [TacDungPhu], [ThanhPhan], [DonViTinh], [NhaSanXuat], [MaDM], [SoLuong], [GioiThieu]) VALUES (N'THUOC009', N'Thuoc 09', N'img3.jpg', N'tac', N'dung xa lang', N'khong dung cho tre em dang mang thai va phu nu duoi 18tuoi', N'khong co', N'eo co gi', N'chai', NULL, N'DM002', 0, NULL)
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [Anh], [TacDung], [CachDung], [ChongChiDinh], [TacDungPhu], [ThanhPhan], [DonViTinh], [NhaSanXuat], [MaDM], [SoLuong], [GioiThieu]) VALUES (N'THUOC010', N'Thuoc 10', N'img3.jpg', N'dung', N'dung xa lang', N'khong dung cho tre em dang mang thai va phu nu duoi 18tuoi', N'khong co', N'eo co gi', N'chai', NULL, N'DM002', 0, NULL)
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [Anh], [TacDung], [CachDung], [ChongChiDinh], [TacDungPhu], [ThanhPhan], [DonViTinh], [NhaSanXuat], [MaDM], [SoLuong], [GioiThieu]) VALUES (N'THUOC011', N'Thuoc 11', N'img3.jpg', N'co', N'dung xa lang', N'khong dung cho tre em dang mang thai va phu nu duoi 18tuoi', N'khong co', N'eo co gi', N'chai', NULL, N'DM002', 0, NULL)
ALTER TABLE [dbo].[THUOC] ADD  CONSTRAINT [DF_THUOC_SoLuong]  DEFAULT ((0)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[CHITIETBAN]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETBAN_HOADON] FOREIGN KEY([SoHD])
REFERENCES [dbo].[HOADON] ([SoHD])
GO
ALTER TABLE [dbo].[CHITIETBAN] CHECK CONSTRAINT [FK_CHITIETBAN_HOADON]
GO
ALTER TABLE [dbo].[CHITIETBAN]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETBAN_LOHANG] FOREIGN KEY([SoLo])
REFERENCES [dbo].[LOHANG] ([SoLo])
GO
ALTER TABLE [dbo].[CHITIETBAN] CHECK CONSTRAINT [FK_CHITIETBAN_LOHANG]
GO
ALTER TABLE [dbo].[CHITIETNHAP]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETNHAP_LOHANG] FOREIGN KEY([SoLo])
REFERENCES [dbo].[LOHANG] ([SoLo])
GO
ALTER TABLE [dbo].[CHITIETNHAP] CHECK CONSTRAINT [FK_CHITIETNHAP_LOHANG]
GO
ALTER TABLE [dbo].[CHITIETNHAP]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETNHAP_PHIEUNHAP] FOREIGN KEY([SoPhieu])
REFERENCES [dbo].[PHIEUNHAP] ([SoPhieu])
GO
ALTER TABLE [dbo].[CHITIETNHAP] CHECK CONSTRAINT [FK_CHITIETNHAP_PHIEUNHAP]
GO
ALTER TABLE [dbo].[GIA]  WITH CHECK ADD  CONSTRAINT [FK_GIA_THUOC] FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[THUOC] ([MaThuoc])
GO
ALTER TABLE [dbo].[GIA] CHECK CONSTRAINT [FK_GIA_THUOC]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HOADON_TAIKHOAN] FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TAIKHOAN] ([TenTaiKhoan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HOADON_TAIKHOAN]
GO
ALTER TABLE [dbo].[LOHANG]  WITH CHECK ADD  CONSTRAINT [FK_LOHANG_THUOC] FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[THUOC] ([MaThuoc])
GO
ALTER TABLE [dbo].[LOHANG] CHECK CONSTRAINT [FK_LOHANG_THUOC]
GO
ALTER TABLE [dbo].[PHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUNHAP_NHACUNGCAP] FOREIGN KEY([MaNhaCC])
REFERENCES [dbo].[NHACUNGCAP] ([MaNhaCC])
GO
ALTER TABLE [dbo].[PHIEUNHAP] CHECK CONSTRAINT [FK_PHIEUNHAP_NHACUNGCAP]
GO
ALTER TABLE [dbo].[PHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUNHAP_TAIKHOAN] FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TAIKHOAN] ([TenTaiKhoan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PHIEUNHAP] CHECK CONSTRAINT [FK_PHIEUNHAP_TAIKHOAN]
GO
ALTER TABLE [dbo].[THUOC]  WITH CHECK ADD  CONSTRAINT [FK_THUOC_DANHMUC] FOREIGN KEY([MaDM])
REFERENCES [dbo].[DANHMUC] ([MaDM])
GO
ALTER TABLE [dbo].[THUOC] CHECK CONSTRAINT [FK_THUOC_DANHMUC]
GO
/****** Object:  Trigger [dbo].[tr_insertBan]    Script Date: 16/02/2017 00:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tr_insertBan]
	on [dbo].[View_BAN]
	instead of insert
as
begin
	declare @gia money
	set @gia = (
		select View_GIA.GiaBan
		from inserted inner join LOHANG
			on inserted.SoLo = LOHANG.SoLo
			inner join View_GIA
			on LOHANG.MaThuoc = View_GIA.MaThuoc
	)
	insert into CHITIETBAN (SoHD, SoLo, SoLuong, GiaBan)
	select SoHD, SoLo, SoLuong, @gia
	from inserted

	update LOHANG
	set SoLuongCon = SoLuongCon - SoLuong
	from inserted
end

GO
/****** Object:  Trigger [dbo].[tr_insertNhap]    Script Date: 16/02/2017 00:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tr_insertNhap]
	on [dbo].[View_NHAP]
	instead of insert
as
begin
	insert into LOHANG (SoLo, MaThuoc, SoLuongCon, NgaySX, HanSD)
	select SoLo, MaThuoc, SoLuong, NgaySX, HanSD
	from inserted

	insert into CHITIETNHAP (SoPhieu, SoLo, SoLuong, GiaNhap)
	select SoPhieu, SoLo, SoLuong, GiaNhap
	from inserted
end
GO
/****** Object:  Trigger [dbo].[tr_insertThuoc]    Script Date: 16/02/2017 00:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tr_insertThuoc]
	on [dbo].[View_THUOC]
	instead of insert
as
begin
	insert into THUOC (MaThuoc, TenThuoc, Anh, TacDung, CachDung, ChongChiDinh, TacDungPhu, ThanhPhan, DonViTinh, NhaSanXuat, MaDM, SoLuong, GioiThieu)
	select MaThuoc, TenThuoc, Anh, TacDung, CachDung, ChongChiDinh, TacDungPhu, ThanhPhan, DonViTinh, NhaSanXuat, MaDM, SoLuong, GioiThieu
	from inserted

	insert into GIA (MaThuoc, NgayTD, GiaBan)
	select MaThuoc, getdate(), GiaBan
	from inserted
end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CHITIETBAN"
            Begin Extent = 
               Top = 23
               Left = 41
               Bottom = 152
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LOHANG"
            Begin Extent = 
               Top = 17
               Left = 297
               Bottom = 146
               Right = 467
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BAN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BAN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CHITIETNHAP"
            Begin Extent = 
               Top = 39
               Left = 43
               Bottom = 168
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LOHANG"
            Begin Extent = 
               Top = 19
               Left = 371
               Bottom = 148
               Right = 541
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_NHAP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_NHAP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[26] 4[34] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "GIA"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 118
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "THUOC"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 312
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_THUOC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_THUOC'
GO
