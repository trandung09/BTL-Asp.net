USE [master]
GO

CREATE DATABASE [OrganicFoodStore]
GO
ALTER DATABASE [OrganicFoodStore] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [OrganicFoodStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OrganicFoodStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OrganicFoodStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OrganicFoodStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OrganicFoodStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [OrganicFoodStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OrganicFoodStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OrganicFoodStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OrganicFoodStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OrganicFoodStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OrganicFoodStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OrganicFoodStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OrganicFoodStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OrganicFoodStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OrganicFoodStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OrganicFoodStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OrganicFoodStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OrganicFoodStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OrganicFoodStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OrganicFoodStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OrganicFoodStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OrganicFoodStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OrganicFoodStore] SET RECOVERY FULL 
GO
ALTER DATABASE [OrganicFoodStore] SET  MULTI_USER 
GO
ALTER DATABASE [OrganicFoodStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OrganicFoodStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OrganicFoodStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OrganicFoodStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OrganicFoodStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OrganicFoodStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'OrganicFoodStore', N'ON'
GO
ALTER DATABASE [OrganicFoodStore] SET QUERY_STORE = OFF
GO
USE [OrganicFoodStore]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 9/5/2021 6:26:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDH] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuyenMuc](
	[Ma] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](500) NULL,
	[Mota] [ntext] NULL,
	[MaCT] [int] NULL,
 CONSTRAINT [PK_ChuyenMuc] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[Ma] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayDat] [date] NULL,
	[NgayGiao] [date] NULL,
	[PhiGiao] [decimal](10, 0) NULL,
	[TenNguoiNhan] [nvarchar](500) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[DienThoai] [varchar](16) NULL,
	[Email] [nvarchar](500) NULL,
	[TrangThai] [bit] NULL,
	[PhuongThucTT] [nvarchar](500) NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[Ma] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](500) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[DienThoai] [char](16) NULL,
	[Email] [varchar](100) NULL,
	[Password] [nvarchar](500) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 9/5/2021 6:26:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[Ma] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](500) NULL,
	[Mota] [ntext] NULL,
 CONSTRAINT [PK_LoaiSP] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[Ma] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](500) NULL,
	[GioiTinh] [bit] NULL,
	[DiaChi] [nvarchar](500) NULL,
	[DienThoai] [char](16) NULL,
	[Email] [nvarchar](500) NULL,
	[TenDangNhap] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](500) NULL,
	[Anh] [nvarchar](500) NULL,
	[Quyen] [nvarchar](500) NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SP](
	[Ma] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](500) NULL,
	[MoTa] [ntext] NULL,
	[MaLoai] [int] NULL,
	[AnhNho] [nvarchar](500) NULL,
	[Anh1] [nvarchar](500) NULL,
	[Anh2] [nvarchar](500) NULL,
	[Anh3] [nvarchar](500) NULL,
	[TSKT] [ntext] NULL,
	[TieuBieu] [bit] NULL,
	[TrangThai] [bit] NULL,
	[Xoa] [bit] NULL,
	[Hang] [nvarchar](500) NULL,
	[Gia] [decimal](18, 0) NULL,
	[KhuyenMai] [int] NULL,
	[NgayDang] [date] NULL,
	[DVT] [nvarchar](50) NULL,
 CONSTRAINT [PK_SP] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[Ma] [int] IDENTITY(1,1) NOT NULL,
	[MaCM] [int] NULL,
	[MotaNgan] [nvarchar](500) NULL,
	[Mota] [ntext] NULL,
	[NgayDang] [date] NULL,
	[Anh] [nvarchar](500) NULL,
	[NguoiDang] [nvarchar](500) NULL,
	[TieuBieu] [bit] NULL,
	[LoaiTin] [nvarchar](500) NULL,
	[TieuDe] [nvarchar](500) NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (21, 2022, 1, CAST(240000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (21, 2024, 1, CAST(244000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (22, 2010, 1, CAST(42000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (22, 2031, 1, CAST(37000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (35, 2031, 2, CAST(35890 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (35, 2054, 2, CAST(134900 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (36, 2031, 2, CAST(71780 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (36, 2032, 2, CAST(462000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (37, 2015, 2, CAST(37000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (38, 2031, 2, CAST(71780 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (38, 2032, 2, CAST(462000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (39, 2047, 5, CAST(4800 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (39, 2055, 1, CAST(33250 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (40, 2047, 5, CAST(4800 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (40, 2055, 1, CAST(33250 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[ChuyenMuc] ON 

INSERT [dbo].[ChuyenMuc] ([Ma], [Ten], [Mota], [MaCT]) VALUES (21, N'Thể thao', N'Tin tức về thể thao', NULL)
INSERT [dbo].[ChuyenMuc] ([Ma], [Ten], [Mota], [MaCT]) VALUES (22, N'Video', N'Những video liên quan nấu ăn', NULL)
INSERT [dbo].[ChuyenMuc] ([Ma], [Ten], [Mota], [MaCT]) VALUES (23, N'Chính Trị', N'Thông tin chính trị trong và ngoài nước', NULL)
INSERT [dbo].[ChuyenMuc] ([Ma], [Ten], [Mota], [MaCT]) VALUES (24, N'Tư vấn dinh dưỡng', N'Thông tin về dinh dưỡng', NULL)
INSERT [dbo].[ChuyenMuc] ([Ma], [Ten], [Mota], [MaCT]) VALUES (25, N'Tin tức hằng ngày', N'<p>Th&ocirc;ng tin hằng ng&agrave;y</p>
', NULL)
SET IDENTITY_INSERT [dbo].[ChuyenMuc] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([Ma], [MaKH], [NgayDat], [NgayGiao], [PhiGiao], [TenNguoiNhan], [DiaChi], [DienThoai], [Email], [TrangThai], [PhuongThucTT]) VALUES (21, NULL, CAST(N'2021-05-11' AS Date), NULL, NULL, N'lê lâm', N'Hà nam', N'0987113982', N'phungdinhminh1999@gmail.com', NULL, N'Giao hang lay tien')
INSERT [dbo].[DonHang] ([Ma], [MaKH], [NgayDat], [NgayGiao], [PhiGiao], [TenNguoiNhan], [DiaChi], [DienThoai], [Email], [TrangThai], [PhuongThucTT]) VALUES (22, NULL, CAST(N'2021-05-16' AS Date), NULL, NULL, N'phạm hải', N'vụ bản nam định', N'0987113982', N'phungdinhminh1999@gmail.com', NULL, N'Giao hang lay tien')
INSERT [dbo].[DonHang] ([Ma], [MaKH], [NgayDat], [NgayGiao], [PhiGiao], [TenNguoiNhan], [DiaChi], [DienThoai], [Email], [TrangThai], [PhuongThucTT]) VALUES (35, NULL, CAST(N'2021-05-16' AS Date), NULL, NULL, N'Lê Thanh Oai', N'Hà Nội', N'0384577854', N'phungdinhminh1999@gmail.com', NULL, N'Giao hang lay tien')
INSERT [dbo].[DonHang] ([Ma], [MaKH], [NgayDat], [NgayGiao], [PhiGiao], [TenNguoiNhan], [DiaChi], [DienThoai], [Email], [TrangThai], [PhuongThucTT]) VALUES (36, NULL, CAST(N'2021-05-16' AS Date), NULL, NULL, N'Phùng Lan', N'Quảng Nam', N'0384577854', N'phungdinhminh1999@gmail.com', NULL, N'Giao hang lay tien')
INSERT [dbo].[DonHang] ([Ma], [MaKH], [NgayDat], [NgayGiao], [PhiGiao], [TenNguoiNhan], [DiaChi], [DienThoai], [Email], [TrangThai], [PhuongThucTT]) VALUES (37, NULL, CAST(N'2021-05-17' AS Date), NULL, NULL, N'phạm hải', N'thái bình', N'045543545', N'phungdinhminh1999@gmail.com', NULL, N'ChuyenKhoan')
INSERT [dbo].[DonHang] ([Ma], [MaKH], [NgayDat], [NgayGiao], [PhiGiao], [TenNguoiNhan], [DiaChi], [DienThoai], [Email], [TrangThai], [PhuongThucTT]) VALUES (38, NULL, CAST(N'2021-05-17' AS Date), NULL, NULL, N'phùng long', N'thái bình', N'03526846368', N'phungdinhminh1999@gmail.com', NULL, N'GiaoHangLayTien')
INSERT [dbo].[DonHang] ([Ma], [MaKH], [NgayDat], [NgayGiao], [PhiGiao], [TenNguoiNhan], [DiaChi], [DienThoai], [Email], [TrangThai], [PhuongThucTT]) VALUES (39, NULL, CAST(N'2021-06-18' AS Date), NULL, NULL, N'Bùi Thu Thảo', N'258 Trần Thánh Tông Nam Định', N'084574868', N'thaocntt84@gmail.com', NULL, N'GiaoHangLayTien')
INSERT [dbo].[DonHang] ([Ma], [MaKH], [NgayDat], [NgayGiao], [PhiGiao], [TenNguoiNhan], [DiaChi], [DienThoai], [Email], [TrangThai], [PhuongThucTT]) VALUES (40, NULL, CAST(N'2021-06-18' AS Date), NULL, NULL, N'Bùi Thu Thảo', N'258 Trần Thánh Tông Nam Định', N'0886689829', N'thaocntt84@gmail.com', NULL, N'ChuyenKhoan')
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([Ma], [Ten], [DiaChi], [DienThoai], [Email], [Password]) VALUES (1, N'Phạm linh', N'nam định', N'0999999999      ', N'linh@123', N'123')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiSP] ON 

INSERT [dbo].[LoaiSP] ([Ma], [Ten], [Mota]) VALUES (3, N'Dinh dưỡng thiết yếu', N'a')
INSERT [dbo].[LoaiSP] ([Ma], [Ten], [Mota]) VALUES (4, N'Rau hữu cơ', N'b')
INSERT [dbo].[LoaiSP] ([Ma], [Ten], [Mota]) VALUES (5, N'Rau củ an toàn', N'c')
INSERT [dbo].[LoaiSP] ([Ma], [Ten], [Mota]) VALUES (6, N'Thịt cá dân dã', N'd')
INSERT [dbo].[LoaiSP] ([Ma], [Ten], [Mota]) VALUES (7, N'Trái cây', NULL)
INSERT [dbo].[LoaiSP] ([Ma], [Ten], [Mota]) VALUES (8, N'Đồ sơ chế', NULL)
INSERT [dbo].[LoaiSP] ([Ma], [Ten], [Mota]) VALUES (9, N'Hải sản', NULL)
INSERT [dbo].[LoaiSP] ([Ma], [Ten], [Mota]) VALUES (10, N'Hàng Khô', NULL)
SET IDENTITY_INSERT [dbo].[LoaiSP] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([Ma], [Ten], [GioiTinh], [DiaChi], [DienThoai], [Email], [TenDangNhap], [MatKhau], [Anh], [Quyen]) VALUES (1, N'tran dung', 1, N'nd', N'09999999999', N'dung@gmail.com', N'dung2004', N'123456', N'1', N'admin')

SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO

SET IDENTITY_INSERT [dbo].[SP] ON 
GO

INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2008, N'Bắp cải RA', N'<p>Bắp cải hay được gọi l&agrave; cải bắp, l&agrave; một loại rau chủ lực trong d&ograve;ng họ Cải, c&oacute; xuất xứ từ v&ugrave;ng Địa Trung Hải. bắp cải l&agrave; một thực vật c&oacute; hoa thuộc nh&oacute;m hai l&aacute; mầm với c&aacute;c l&aacute; tạo th&agrave;nh một cụm đặc h&igrave;nh gần giống như h&igrave;nh cầu.</p>

<p>Trong bắp cải c&oacute; chứa lượng vitamin cao hơn nhiều so với c&aacute;c loại rau củ kh&aacute;c như: c&agrave; rốt, khoai t&acirc;y, h&agrave;nh t&acirc;y. Theo nghi&ecirc;n cứu, h&agrave;m lượng vitamin A v&agrave; vitamin P trong bắp cải kết hợp với nhau l&agrave;m th&agrave;nh mạch m&aacute;u bền vững hơn.</p>

<p>Trong bắp cải c&ograve;n chứa c&aacute;c chất chống ung thư như: Sulforaphane, phenethyl isothiocyanate v&agrave; Indol -33 carbinol.</p>

<p>Theo Đ&ocirc;ng y, bắp cải vị ngọt, t&iacute;nh h&agrave;n, kh&ocirc;ng độc, c&oacute; t&aacute;c dụng h&ograve;a huyết, thanh nhiệt, thanh phế, trừ đ&agrave;m thấp, sinh t&acirc;n, chỉ kh&aacute;t, m&aacute;t dạ d&agrave;y, giải độc, lợi tiểu. Bắp cải cũng gi&uacute;p chống suy nhược thần kinh, giảm đau nhức ph&ograve;ng chống c&aacute;c bệnh ung thư, tim mạch v&agrave; nhiều loại bệnh kh&aacute;c.</p>

<p>Tuy nhi&ecirc;n cần lưu &yacute; rằng: người bị rối loạn tuyến gi&aacute;p hoặc bướu cổ th&igrave; kh&ocirc;ng n&ecirc;n ăn v&igrave; trong bắp cải c&oacute; chưa một lượng nhỏ goitrin.</p>
', 4, N'/admin/content/files/bapcaianhto.jpg', N'/admin/content/files/bapcainho1.jpg', N'/admin/content/files/bapcainho2.jpg', N'/admin/content/files/bapcainho3.jpg', NULL, 1, 1, 1, N'BẮC HÀ - LÀO CAI', CAST(35000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-13' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2009, N'Dưa chuột RB', N'<p>Rau an to&agrave;n l&agrave; một kh&aacute;i niệm chung để chỉ c&aacute;c loại rau, củ được sản xuất cung cấp đến người d&ugrave;ng đảm bảo ti&ecirc;u chuẩn an to&agrave;n thực phẩm.</p>

<p>Những sản phẩm rau tươi c&oacute; chất lượng đ&uacute;ng như đặc t&iacute;nh giống của n&oacute;, h&agrave;m lượng c&aacute;c h&oacute;a chất v&agrave; mức độ nhiễm c&aacute;c vi sinh g&acirc;y hại ở dưới mức ti&ecirc;u chuẩn cho ph&eacute;p, đảm bảo cho người ti&ecirc;u d&ugrave;ng lẫn m&ocirc;i trường.</p>

<p>Rau an to&agrave;n được quy định với c&aacute;c chất sau kh&ocirc;ng vượt qu&aacute; h&agrave;m lượng cho ph&eacute;p:</p>

<ul>
	<li>Dư lượng thuốc h&oacute;a học</li>
	<li>Dư lượng đạm nitrat (NO3)</li>
	<li>Số lượng vi sinh vật v&agrave; k&yacute; sinh tr&ugrave;ng.</li>
	<li>Dư lượng c&aacute;c kim loại nặng (ch&igrave;, đồng, kẽm, thủy ng&acirc;n...) tr&ecirc;n v&ugrave;ng đất trồng.</li>
	<li>Kh&ocirc;ng tưới rau bằng ph&acirc;n b&oacute;n tắc, ph&acirc;n chuồng tươi, nước thải sinh hoạt, nước thải c&ocirc;ng nghiệp</li>
</ul>

<p>Sau khi thực hiện nghi&ecirc;m ngặt c&aacute;c quy định về giống c&acirc;y, đất trồng v&agrave; quy tr&igrave;nh canh t&aacute;c. Rau đến tay người ti&ecirc;u d&ugrave;ng của B&aacute;c T&ocirc;m sẽ an to&agrave;n tuyệt đối.</p>

<p><strong>Dưa chuột</strong></p>

<p>Dưa chuột l&agrave; loại quả được sử dụng rất phổ biến tại Việt Nam bởi sự thanh m&aacute;t v&agrave; c&oacute; nhiều c&aacute;ch chế biến kh&aacute;ch nhau.</p>

<p>Dưa chuột c&oacute; thể được d&ugrave;ng để ăn trực tiếp, l&agrave;m dưa g&oacute;p, đắp mặt dưỡng da, l&agrave;m c&aacute;c m&oacute;n gỏi, cuốn,...</p>

<p>C&aacute;ch bảo quản: n&ecirc;n bảo quản dưa chuột trong ngăn m&aacute;t của tủ lạnh để đảm bảo độ tươi ngon của sản phẩm.</p>

<p>B&ecirc;n cạnh đ&oacute;, dưa chuột c&ograve;n mang lại c&aacute;c lợi &iacute;ch đặc biệt đến với sức khỏe:<br />
- Cung cấp nước cho cơ thể<br />
- Giải độc<br />
- T&aacute;c dụng tốt cho c&aacute;c khớp<br />
- Giảm cholesterol m&aacute;u<br />
- Tốt cho da<br />
- Tốt cho thận<br />
- C&oacute; m&aacute;i t&oacute;c đẹp v&agrave; m&oacute;ng khỏe<br />
- Gi&uacute;p hơi thở thơm m&aacute;t</p>
', 4, N'/admin/content/files/duachuotto.jpg', N'/admin/content/files/duachuotnho1.jpg', NULL, NULL, NULL, 1, 1, 1, N'BẮC HÀ - LÀO CAI', CAST(32000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-13' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2010, N'Cà rốt', N'<p>Rau an to&agrave;n l&agrave; một kh&aacute;i niệm chung để chỉ c&aacute;c loại rau, củ được sản xuất cung cấp đến người d&ugrave;ng đảm bảo ti&ecirc;u chuẩn an to&agrave;n thực phẩm.</p>

<p>Những sản phẩm rau tươi c&oacute; chất lượng đ&uacute;ng như đặc t&iacute;nh giống của n&oacute;, h&agrave;m lượng c&aacute;c h&oacute;a chất v&agrave; mức độ nhiễm c&aacute;c vi sinh g&acirc;y hại ở dưới mức ti&ecirc;u chuẩn cho ph&eacute;p, đảm bảo cho người ti&ecirc;u d&ugrave;ng lẫn m&ocirc;i trường.</p>

<p>Rau an to&agrave;n được quy định với c&aacute;c chất sau kh&ocirc;ng vượt qu&aacute; h&agrave;m lượng cho ph&eacute;p:</p>

<ul>
	<li>Dư lượng thuốc h&oacute;a học</li>
	<li>Dư lượng đạm nitrat (NO3)</li>
	<li>Số lượng vi sinh vật v&agrave; k&yacute; sinh tr&ugrave;ng.</li>
	<li>Dư lượng c&aacute;c kim loại nặng (ch&igrave;, đồng, kẽm, thủy ng&acirc;n...) tr&ecirc;n v&ugrave;ng đất trồng.</li>
	<li>Kh&ocirc;ng tưới rau bằng ph&acirc;n b&oacute;n tắc, ph&acirc;n chuồng tươi, nước thải sinh hoạt, nước thải c&ocirc;ng nghiệp</li>
</ul>

<p>Sau khi thực hiện nghi&ecirc;m ngặt c&aacute;c quy định về giống c&acirc;y, đất trồng v&agrave; quy tr&igrave;nh canh t&aacute;c. Rau đến tay người ti&ecirc;u d&ugrave;ng của B&aacute;c T&ocirc;m sẽ an to&agrave;n tuyệt đối.</p>

<p><strong>C&agrave; rốt<br />
C&agrave; rốt l&agrave; một loại c&acirc;y c&oacute; củ, thường c&oacute; m&agrave;u v&agrave;ng cam, đỏ, v&agrave;ng, trắng hay t&iacute;a. Phần ăn được của c&agrave; rốt l&agrave; củ, thực chất l&agrave; rễ c&aacute;i của n&oacute;, chứa nhiều tiền tố của vitamin A tốt cho mắt.</strong></p>

<p>C&agrave; rốt ăn c&oacute; vị ngọt, gi&ograve;n, thanh m&aacute;t. C&oacute; thể được chế biến v&agrave; sử dụng rất đa dạng. C&agrave; rốt c&oacute; thể d&ugrave;ng được trực tiếp, chế biến c&aacute;c m&oacute;n luộc, x&agrave;o, nấu canh, l&agrave;m nước &eacute;p,..</p>

<p>C&aacute;ch bảo quản: Bảo quản nhiệt độ thường hoặc bảo quản trong ngăn mất tủ lạnh.</p>

<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Sử dụng c&agrave; rốt thường xuy&ecirc;n c&oacute; thể mang lại một số lợi &iacute;ch như:<br />
- Gi&uacute;p ph&ograve;ng chống bệnh cao huyết &aacute;p.<br />
- Chữa ho g&agrave;, ho khan<br />
- Chống vi khuẩn<br />
- Tốt cho da, t&oacute;c v&agrave; sức khỏe răng miệng<br />
- Gi&uacute;p giải độc gan<br />
- Tăng lợi &iacute;ch cho tim mạch<br />
- Tốt cho mắt</p>
', 5, N'/admin/content/files/carotto.jpg', N'/admin/content/files/carotnho.jpg', NULL, NULL, NULL, 1, 1, NULL, N'BẮC HÀ - LÀO CAI', CAST(42000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-13' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2011, N'Khoai lang giống Nhật Đà Lạt', N'<p>Một đặc sản thi&ecirc;n nhi&ecirc;n ưu đ&atilde;i cho v&ugrave;ng đất Đ&agrave; Lạt - Khoai lang mật. Hương vị dẻo, thơm, ngọt m&agrave; bất kỳ kh&aacute;ch h&agrave;ng n&agrave;o khi thưởng thức cũng đều cảm nhận được, kh&ocirc;ng phải tự nhi&ecirc;n m&agrave; khoai lang mật trở th&agrave;nh đặc sản m&agrave; khi du kh&aacute;ch đến với Đ&agrave; Lạt đều muốn mua về l&agrave;m qu&agrave;, m&agrave; bởi vị ngọt, tưa mật dẻo thơm kh&ocirc;ng l&agrave;m người ăn bị nghẹn như c&aacute;c giống khoai lang kh&aacute;c.</p>

<p>Khoai lang mật được trồng &nbsp;tr&ecirc;n những đồi đất đỏ bazan. Với độ cao 1500m so với mực nước biển, th&ecirc;m v&agrave;o đ&oacute; l&agrave; được bao quanh bởi quần hệ thực vật rừng bao quanh. Ch&iacute;nh v&igrave; điều kiện thuận lợi như vậy đ&atilde; tạo n&ecirc;n hương vị khoai lang mật kh&ocirc;ng đ&acirc;u ngon bằng.</p>
', 5, N'/admin/content/images/raucuantoan/khoailanggiongnhatto.jpg', N'/admin/content/images/raucuantoan/khoailanggiongnhatnho1.jpg', N'/admin/content/images/raucuantoan/khoailanggiongnhatnho2.jpg', N'/admin/content/images/raucuantoan/khoailanggiongnhatnho3.jpg', NULL, 1, 1, 1, N'Đà Lạt', CAST(53000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2013, N'Rau mồng tơi RH', NULL, 5, N'/admin/content/images/raucuantoan/mongtoito.jpg', N'/admin/content/images/raucuantoan/mongtoinho.jpg', NULL, NULL, NULL, 1, 1, 1, N'Đà Lạt', CAST(32000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2014, N'Cải Thảo Hữu Cơ ', N'<p>&bull; Cải thảo c&oacute; m&agrave;u sắc kh&aacute; giống với cải bắp, phần l&aacute; bao ngo&agrave;i của m&agrave;u xanh đậm, c&ograve;n l&aacute; cuộn ở b&ecirc;n trong (gọi l&agrave; l&aacute; non) c&oacute; m&agrave;u xanh nhạt, trong khi phần cuống l&aacute; c&oacute; m&agrave;u trắng.&nbsp; C&Ocirc;NG DỤNG &bull; Cải thảo c&oacute; vị ngọt, t&iacute;nh m&aacute;t, c&oacute; t&aacute;c dụng hạ kh&iacute;, thanh nhiệt nhuận thấp, c&oacute; c&ocirc;ng dụng l&agrave;m mềm cổ họng, bớt r&aacute;t, đỡ ho; lại bổ &iacute;ch trường vị, l&agrave; loại rau ngon chứa nhiều vitamin A, B, C, E. &bull; Người bị bệnh trường nhiệt, bệnh sốt r&eacute;t v&agrave; c&aacute;c bệnh c&oacute; sốt l&acirc;u, thường thường khi sốt kh&ocirc;ng muốn ăn uống, d&ugrave;ng Cải thảo nấu canh cho người bệnh ăn. C&oacute; thể tuỳ &yacute; th&ecirc;m gi&aacute; đậu xanh hoặc gi&aacute; đậu n&agrave;nh, c&agrave;, rau dừa, rau cần, nấu chung, canh ăn bổ lại hạ sốt. Người bị bệnh vi&ecirc;m b&agrave;ng quang, vi&ecirc;m đường tiết niệu, tiểu tiện kh&ocirc;ng b&igrave;nh thường, đau buốt; c&oacute; thể d&ugrave;ng rau Cải thảo hoặc Rau cần hai vị nấu canh hoặc nấu ch&iacute;n lấy nước uống liền v&agrave;i ng&agrave;y. C&Aacute;CH SỬ DỤNG &nbsp; &bull; C&oacute; thể d&ugrave;ng nấu canh ăn như c&aacute;c loại rau cải kh&aacute;c, l&agrave;m nước canh cơ bản trong bữa ăn; cũng c&oacute; thể nấu canh với jamb&ocirc;ng, g&agrave;, vịt, xương lợn. Cũng c&oacute; thể lấy l&otilde;i bắp cuộn lại ở ph&iacute;a trong m&agrave;u trắng v&agrave; mềm d&ugrave;ng ăn sống, dầm muối th&agrave;nh nguy&ecirc;n liệu chủ yếu của m&oacute;n nộm d&ugrave;ng ăn cơm, ăn ch&aacute;o; hoặc trộn dầu giấm như rau x&agrave; l&aacute;ch. Cải thảo nấu lẩu hoặc x&agrave;o ăn đều ngọt &bull; Cải thảo c&oacute; thể xắt kh&uacute;c nhỏ đem tẩm x&igrave; dầu để phơi kh&ocirc; cất ăn dần, d&ugrave;ng để nấu canh thịt, hấp c&aacute;, ăn hủ tiếu, ăn thịt b&ograve; vi&ecirc;n. Cuống Cải thảo c&oacute; thể xắt miếng, lẫn với c&agrave; rốt, đem muối (th&ecirc;m h&agrave;nh, tỏi, bột ớt, nước gừng), c&oacute; vị chua chua, ngon ngọt, cay cay, nồng nồng... LƯỢNG D&Ugrave;NG &bull;&nbsp;Cải thảo được d&ugrave;ng như rau v&agrave; chế biến như c&aacute;c loại rau kh&aacute;c, c&oacute; thể sử dụng t&ugrave;y th&iacute;ch. C&Aacute;CH BẢO QUẢN &bull;&nbsp;C&oacute; thể cho v&agrave;o t&uacute;i nhựa v&agrave; bảo quản trong hộc tủ lạnh ở nhiệt độ 5-12&deg;C, trong khoảng một tuần. Cải để l&acirc;u ng&agrave;y ở nhiệt độ ph&ograve;ng, khi chế biến h&atilde;y cho v&agrave;o nước ấm v&agrave; sau đ&oacute; ng&acirc;m trong nước đ&aacute; lạnh v&agrave;i ph&uacute;t, rau sẽ tươi trở lại.<br />
&nbsp;</p>
', 5, N'/admin/content/images/raucuantoan/caithaohuucoto.jpg', NULL, NULL, NULL, NULL, 1, 1, 1, N'BẮC HÀ - LÀO CAI', CAST(32000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2015, N'Rau cải ngọt RH', N'<p>Cải ngọt l&agrave; một trong những loại giống thuộc họ nh&agrave; cả dễ ăn v&agrave; được nhiều người y&ecirc;u th&iacute;ch. Cải ngọt &ocirc;n t&iacute;nh. Cải ngọt tốt cho sức khỏe nhờ c&ocirc;ng dụng trường vị, chữa c&aacute;c bệnh ho, t&aacute;o b&oacute;n, ngăn ngừa trị v&agrave; ung thư ruột kết.</p>

<p><strong>Chất dinh dưỡng:</strong><em>&nbsp;</em>C&oacute; chất đường, vitamin B1, ax&iacute;t pamic, coban, iot. Rễ v&agrave; l&aacute; c&oacute; nhiều chất kiềm th&uacute;c đẩy sự ti&ecirc;u ho&aacute;, th&uacute;c đẩy cơ thể tiếp thu albumin bảo vệ gan, chống mỡ trong gan.</p>

<p>Cải ngọt c&oacute; thể chế biến th&agrave;nh c&aacute;c m&oacute;n ăn như cải ngọt x&agrave;o thịt, canh cải ngọt nấu t&ocirc;m, rau cải ngọt luộc chấm x&igrave; dầu, cải ngọt x&agrave;o thịt b&ograve;, cải ngọt x&agrave;o ch&acirc;n g&agrave;&hellip;, l&agrave;m lẩu c&aacute;, lẩu thịt.</p>

<p>Sử dụng sản phẩm rau cải ngọt hữu cơ của B&aacute;c T&ocirc;m để mang đến cho gia đ&igrave;nh nhiều m&oacute;n ăn ngon v&agrave; an to&agrave;n.</p>
', 4, N'/admin/content/images/raucuantoan/caingotto.jpg', N'/admin/content/images/raucuantoan/caingotnho.jpg', NULL, NULL, NULL, 1, 1, 1, N'Đà Lạt', CAST(37000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2016, N'Đậu trạch RA', N'<p>Đậu trạch B&aacute;c T&ocirc;m c&oacute; xuất xứ từ Bắc H&agrave; - L&agrave;o Cai, được trồng hữu cơ theo hướng 7 KH&Ocirc;NG</p>

<ul>
	<li>Kh&ocirc;ng thuốc trừ s&acirc;u</li>
	<li>Kh&ocirc;ng thuốc diệt cỏ</li>
	<li>Kh&ocirc;ng ph&acirc;n b&oacute;n h&oacute;a học</li>
	<li>Kh&ocirc;ng chất k&iacute;ch th&iacute;ch tăng trưởng</li>
	<li>Kh&ocirc;ng biến đổi gen</li>
	<li>Kh&ocirc;ng chất bảo quản</li>
	<li>Kh&ocirc;ng tưới nước &ocirc; nhiễm</li>
</ul>
', 4, N'/admin/content/images/raucuantoan/daucoveto.jpg', N'/admin/content/images/raucuantoan/daucovenho.jpg', NULL, NULL, NULL, 1, 1, 1, N'BẮC HÀ - LÀO CAI', CAST(35000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2017, N'RAU MUỐNG RH', N'<p>Rau muống c&oacute; chứa h&agrave;m lượng canxi cao tốt cho những người bị lo&atilde;ng xương v&agrave; huyết &aacute;p thấp v&agrave; phụ nữ c&oacute; thai. Ngo&agrave;i ra, trong rau muống c&ograve;n chứa protit, glucid, cellulose, vitamin B1, B2&hellip; Những người bị t&aacute;o b&oacute;n ăn rau muống cũng rất tốt. Trong ngọn rau muống, c&oacute; một chất giống như insulin n&ecirc;n những người bị đ&aacute;i th&aacute;o đường c&oacute; thể ăn 5 &ndash; 10 ngọn rau muống trước bữa ăn khoảng 30 ph&uacute;t.</p>

<p>Những người cao tuổi ăn rau muống ng&agrave;y hai bữa c&oacute; n&atilde;o trẻ hơn 5 năm v&agrave; &iacute;t bị suy giảm tinh thần hơn 40% so với những người ăn &iacute;t rau muống..</p>
', 4, N'/admin/content/images/raucuantoan/raumuongto.jpg', N'/admin/content/images/raucuantoan/raumuongnho.jpg', NULL, NULL, NULL, 1, 1, 1, N'Hải Phòng', CAST(37000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2018, N'Mướp hương', N'<p>Mướp l&agrave; một loại c&acirc;y thảo dạng d&acirc;y leo, được trồng để lấy quả xanh. Với nhiều chất dinh dưỡng v&agrave; c&ocirc;ng dụng đặc biệt tốt cho sức khỏe, mướp được nhiều người lựa chọn trong bữa ăn gia đ&igrave;nh.</p>

<p>Mướp hương c&oacute; vị thơm ng&aacute;t, ăn ngọt m&aacute;t&nbsp;</p>
', 5, N'/admin/content/images/raucuantoan/muophuongto.jpg', N'/admin/content/images/raucuantoan/muophuongnho.jpg', NULL, NULL, NULL, 1, 1, 1, N'Hải Phòng', CAST(2300 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2019, N'Su hào RH', NULL, 4, N'/admin/content/images/raucuantoan/suhaoto.jpg', N'/admin/content/images/raucuantoan/suhaonho.jpg', NULL, NULL, NULL, 1, 1, 1, N'BẮC HÀ - LÀO CAI', CAST(37000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2020, N'Qủa lặc lày', N'<p>Gi&agrave;u vitamin, kho&aacute;ng chất v&agrave; chất xơ, lặc l&agrave;y mang lại một số lợi &iacute;ch sức khỏe, rất tốt cho t&oacute;c v&agrave; da của bạn.&nbsp;</p>

<p>Lặc l&agrave;y ăn vị ngọt, rất m&aacute;t, thường sử dụng để luộc, x&agrave;o với thịt.</p>
', 4, N'/admin/content/images/raucuantoan/laclayto.jpg', N'/admin/content/images/raucuantoan/laclaynho.jpg', NULL, NULL, NULL, 1, 1, 1, N'Đà Lạt', CAST(3000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2021, N'Cải bó xôi RH', NULL, 4, N'/admin/content/images/raucuantoan/caiboxoito.jpg', N'/admin/content/images/raucuantoan/caiboxoinho.jpg', NULL, NULL, NULL, 1, 1, 1, N'Đà Lạt', CAST(37000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2022, N'Thịt quế - ba chỉ', N'<ul>
	<li>THỊT BA CHỈ QUẾ</li>
</ul>

<p>Thịt ba chỉ lợn quế l&agrave; phần thịt bụng của lợn quế, bao gồm c&aacute;c lớp thịt v&agrave; mỡ phần xếp xen kẽ l&ecirc;n nhau th&agrave;nh nhiều lớp. Thịt ba chỉ quế l&agrave; loại phổ biến v&agrave; được ưa chuộng nhất n&ecirc;n cũng dễ d&agrave;ng chế biến ba chỉ th&agrave;nh nhiều m&oacute;n như chi&ecirc;n, luộc, quay gi&ograve;n, kho...</p>
', 6, N'/admin/content/images/thitcadanda/thitlonbachito.jpg', N'/admin/content/images/thitcadanda/thitlongbachinho1.jpg', N'/admin/content/images/thitcadanda/thilonbachinho2.jpg', N'/admin/content/images/thitcadanda/thitlonbachinho3.jpg', NULL, 1, 1, 1, N'SÓC SƠN - HÀ NỘI', CAST(240000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-10' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2023, N'Thịt quế - sườn', N'<ul>
	<li>XƯƠNG SƯỜN LỢN QUẾ</li>
</ul>

<p>Nằm ở phần xương bụng của lợn quế, đ&acirc;y được đ&aacute;nh gi&aacute; l&agrave; phần xương ngon nhất&nbsp;của con lợn ch&uacute;ng được lọc từ phần&nbsp;xương sườn&nbsp;của con lợn v&agrave; c&oacute; dắt thịt ở tr&ecirc;n đ&oacute;. Sườn lợn quế l&agrave; nguy&ecirc;n liệu của m&oacute;n sườn nướng, ngo&agrave;i ra c&ograve;n m&oacute;n&nbsp;chả ch&igrave;a&nbsp;cũng kh&aacute; phổ biến. Sườn lợn quế c&oacute; thể chia th&agrave;nh c&aacute;c dạng:</p>

<ul>
	<li>Sườn non l&agrave; phần xương sườn nhỏ, xương dẹt, nhiều thịt, &iacute;t xương, thường c&oacute; sụn. Phần sườn non n&agrave;y l&agrave; ngon nhất, d&ugrave;ng để chế biến c&aacute;c m&oacute;n như nướng, sườn rim, sườn rang sả ớt, sườn chua ngọt.</li>
	<li>Dẻ sườn: Người phương T&acirc;y rất thường d&ugrave;ng cả tảng sườn lớn để nướng, khi ăn th&igrave; mới cắt theo từng dẻ sườn.</li>
	<li>Sườn cốt-lết l&agrave; phần thịt cốt-lết c&ograve;n gắn với một đoạn xương sườn. Phần thịt n&agrave;y hay được tẩm ướp để l&agrave;m c&aacute;c m&oacute;n nướng, chi&ecirc;n, &aacute;p chảo rất ngon.</li>
	<li>Sườn gi&agrave; l&agrave; phần sườn c&oacute; xương to hơn, cứng hơn, &iacute;t thịt hơn, khi nấu cần thời gian l&acirc;u hơn, thịt dai hơn, th&iacute;ch hợp l&agrave;m c&aacute;c m&oacute;n canh hầm.</li>
</ul>
', 6, N'/admin/content/images/thitcadanda/xuongsuonlonqueto.jpg', N'/admin/content/images/thitcadanda/xuongsuonlonquenho1.jpg', N'/admin/content/images/thitcadanda/xuongsuonlonquenho2.jpg', NULL, NULL, 1, 1, 1, N'SÓC SƠN - HÀ NỘI', CAST(275000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2024, N'Thịt quế - thăn', N'<ul>
	<li>THỊT THĂN LỢN QUẾ</li>
</ul>

<p>Thịt thăn hay c&ograve;n gọi l&agrave; thịt nạc thăn. Đ&acirc;y l&agrave; phần thịt si&ecirc;u nạc, kh&ocirc;ng c&oacute; ch&uacute;t mỡ lợn n&agrave;o nhưng lại mềm nhất trong những phần thịt của con lợn. C&oacute; ưu điểm l&agrave; thơm, kh&ocirc;ng h&ocirc;i v&agrave; rất mềm n&ecirc;n thịt thăn thường được d&ugrave;ng l&agrave;m chả gi&ograve;, hay l&agrave; l&agrave;m ruốc. Thịt thăn lợn quế rất tốt cho phụ nữ mới sinh bằng c&aacute;ch l&agrave; rang l&ecirc;n, luộc hoặc nấu canh rau ng&oacute;t.</p>
', 6, N'/admin/content/images/thitcadanda/thitthanlonqueto.jpg', N'/admin/content/images/thitcadanda/thithanlonquenho1.jpg', N'/admin/content/images/thitcadanda/thithanlonquenho2.jpg', N'/admin/content/images/thitcadanda/thithanlonquenho3.jpg', NULL, 1, 1, 1, N'SÓC SƠN - HÀ NỘI', CAST(244000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2025, N'Cá chép đầm', N'<p>C&aacute; Ch&eacute;p - một m&oacute;n ngon, th&ocirc;ng dụng v&agrave; kh&oacute; cưỡng đối với bất kỳ một người y&ecirc;u th&iacute;ch những m&oacute;n thủy hải sản n&agrave;o. C&aacute; ch&eacute;p tại B&aacute;c T&ocirc;m được nhập trực tiếp từ những đầm tại H&ograve;a B&igrave;nh, lu&ocirc;n đảm bảo tươi ngon, thịt chắc, ngọt, v&agrave; thơm khi nấu.</p>

<p>Trong c&aacute; ch&eacute;p c&oacute; rất nhiều th&agrave;nh phần m&agrave; cơ thể con người cần được đ&aacute;p ứng như: protein amino acid, chất xơ tốt, nhiều đạm. Ngo&agrave;i ra c&aacute; ch&eacute;p chứa một lượng lớn c&aacute;c axit b&eacute;o kh&ocirc;ng b&atilde;o h&ograve;a đa omega 3, trong đ&oacute; Eicosapentaenoic acid (EPA) gi&uacute;p l&agrave;m giảm chất b&eacute;o trong m&aacute;u, chống ung thư, giảm xơ vữa động mạch.</p>
', 9, N'/admin/content/images/thitcadanda/cachepdamto.jpg', N'/admin/content/images/thitcadanda/cachepdamnho1.jpg', N'/admin/content/images/thitcadanda/cachepdamnho2.jpg', N'/admin/content/images/thitcadanda/cachepdamnho3.jpg', NULL, 1, 1, 1, N'HOÀ BÌNH', CAST(138000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2026, N'Gà đồi Hòa Bình', N'<p>- Xuất xứ: H&ograve;a B&igrave;nh<br />
- Đặc điểm: G&agrave; thả đồi tự nhi&ecirc;n n&ecirc;n thịt rất săn chắc, thịt thơm ngon, khi luộc kh&ocirc;ng ra nhiều nước.<br />
- Trọng lượng: ~1,2 - 1,5kg/con</p>
', 6, N'/admin/content/images/thitcadanda/gadoito.jpg', N'/admin/content/images/thitcadanda/gadoinho.jpg', N'/admin/content/images/thitcadanda/gadoinho1.jpg', N'/admin/content/images/thitcadanda/gadoinho2.jpg', NULL, 1, 1, 1, N'HOÀ BÌNH', CAST(235000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2027, N'Xương ống lợn quế', N'<ul>
	<li>XƯƠNG ỐNG LỢN QUẾ</li>
</ul>

<p>Đ&acirc;y l&agrave; phần xương trong bắp ch&acirc;n của lợn quế, do th&agrave;nh phần chứa nhiều tủy sống n&ecirc;n thường được d&ugrave;ng để hầm, ninh lấy nước. Do thịt lợn quế nu&ocirc;i đảm bảo n&ecirc;n khi hầm, ninh l&acirc;u vẫn đảm bảo nước d&ugrave;ng ngọt, kh&ocirc;ng cặn v&agrave; bọt.</p>
', 6, N'/admin/content/images/thitcadanda/xuongonglonqueto.jpg', N'/admin/content/images/thitcadanda/xuongonglonquenho1.jpg', N'/admin/content/images/thitcadanda/xuongonglonquenho.jpg', NULL, NULL, 1, 1, 1, N'SÓC SƠN - HÀ NỘI', CAST(95000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2028, N'Ngan Hòa Bình', N'<p>- Xuất xứ: H&ograve;a B&igrave;nh<br />
- Khối lượng: ~1.5kg/con<br />
- Đặc điểm: ngan được chăn thả tự nhi&ecirc;n n&ecirc;n thịt chắc, ngọt thịt, xương nhỏ</p>
', 6, N'/admin/content/images/thitcadanda/nganto.jpg', N'/admin/content/images/thitcadanda/ngannho.jpg', NULL, NULL, NULL, 1, 1, 1, N'HOÀ BÌNH', CAST(125000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2029, N'Gà quế', N'<p>- Xuất xứ: S&oacute;c Sơn - H&agrave; Nội<br />
- Đặc điểm của G&agrave; Giun Quế:<br />
+ Thơm ngon, thịt chắc, da gi&ograve;n kh&aacute;c hẳn c&aacute;c loại g&agrave; nu&ocirc;i c&ocirc;ng nghiệp<br />
+ Kh&ocirc;ng sử dụng c&aacute;m tăng trọng<br />
+ Kh&ocirc;ng sử dụng thuốc kh&aacute;ng sinh, kh&ocirc;ng tồn dư chất h&oacute;a học<br />
- Trọng lượng: 1,2 - 1,5kg/con</p>
', 6, N'/admin/content/images/thitcadanda/gaqueto.jpg', N'/admin/content/images/thitcadanda/gaquenho.jpg', N'/admin/content/images/thitcadanda/gaquenho1.jpg', NULL, NULL, 1, 1, 1, N'SÓC SƠN - HÀ NỘI', CAST(285000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2030, N'Tôm rảo', N'<p>T&ocirc;m rảo hay sống ở c&aacute;c đầm ph&aacute; nơi ven biển n&ecirc;n l&agrave; ở m&ocirc;i trường nước lợ. V&igrave; thế ch&uacute;ng kh&ocirc;ng c&oacute; vị tanh như lo&agrave;i t&ocirc;m s&ocirc;ng bạn hay gặp. Thịt t&ocirc;m rảo ăn đậm đ&agrave; như t&ocirc;m biển v&agrave; lại c&ograve;n ngọt như con t&ocirc;m s&ocirc;ng n&ecirc;n rất được y&ecirc;u th&iacute;ch.</p>
', 9, N'/admin/content/images/thitcadanda/tomraoto.jpg', N'/admin/content/images/thitcadanda/tomraoto.jpg', NULL, NULL, NULL, 1, 1, 1, N'Đà Lạt', CAST(350000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2031, N'Cá thu tươi Phú Quốc', NULL, 9, N'/admin/content/images/cathutuoinho.jpg', N'/admin/content/images/cathutuoinho.jpg', NULL, NULL, NULL, 1, 1, 1, N'PHÚ QUỐC', CAST(37000 AS Decimal(18, 0)), 3, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2032, N'Cá chim trắng vây vàng', N'<p>L&agrave; một trong bốn tặng phẩm của biển cả (Chim, Thu, Nụ, Đ&eacute;), c&aacute; chim được biết đến như một loại c&aacute; ngon, chắc thịt lại gi&agrave;u dinh dưỡng. Biển nước ta c&oacute; nhiều loại c&aacute; chim như: C&aacute; chim trắng, c&aacute; chim đen, c&aacute; chim gai, c&aacute; chim Ấn Độ. Tuy nhi&ecirc;n đặc biệt nhất phải n&oacute;i đến c&aacute; chim v&acirc;y v&agrave;ng của v&ugrave;ng biển C&aacute;t B&agrave;.</p>

<p>C&aacute; chim trắng v&acirc;y v&agrave;ng tươi c&oacute; thịt nạc tới, vị ngọt, thịt c&aacute; mềm kh&ocirc;ng kh&ocirc;. Kh&ocirc;ng chỉ vậy c&aacute; chim trắng v&acirc;y v&agrave;ng c&oacute; h&agrave;m lượng dinh dưỡng cao, gi&agrave;u omega 3, nhiều protein. Trong 100g c&aacute;&nbsp;c&oacute; tới 19,4g protein, 5,4g lipit, 1,1g tro, 15mg canxi, 185mg photpho, 0,6mg sắt, 145mg natri, 263mg kali, 27mg vitamin A, 2mg vitamin PP, 1mg vitamin C, c&aacute;c vitamin B1, B2&hellip; cung cấp được 126kcal.</p>
', 9, N'/admin/content/images/cachimtrangvayvangto.jpg', N'/admin/content/images/cachimtrangvayvangnho.jpg', N'/admin/content/images/cachimtrangvayvang1.jpg', N'/admin/content/images/cachimtrangvayvang2.jpg', NULL, 1, 1, 1, N'CÁT BÀ - HẢI PHÒNG', CAST(275000 AS Decimal(18, 0)), 16, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2033, N'Cua gạch Năm Căn', N'<p>Cua C&agrave; Mau hầu hết được nu&ocirc;i th&acirc;m canh theo hướng tự nhi&ecirc;n, sinh th&aacute;i trong c&aacute;c vu&ocirc;ng t&ocirc;m, kết hợp với rừng v&agrave; c&aacute;c lo&agrave;i thủy sản kh&aacute;c. Đặc biệt, huyện Năm Căn l&agrave; v&ugrave;ng ven biển, c&oacute; hệ sinh th&aacute;i đa dạng n&ecirc;n đất v&agrave; nước m&agrave;u mỡ. B&ecirc;n cạnh đ&oacute;, m&ocirc;i trường kh&iacute; hậu ổn định n&ecirc;n tạo được lượng thức ăn tự nhi&ecirc;n dồi d&agrave;o cho con cua ph&aacute;t triển nhanh, thịt cua ngon hơn những v&ugrave;ng kh&aacute;c.</p>

<p>Từng ch&uacute; cua được lựa chọn kỹ c&agrave;ng trước khi đưa đến tay người ti&ecirc;u d&ugrave;ng, ch&uacute;ng t&ocirc;i cam kết sản phẩm ho&agrave;n to&agrave;n tự nhi&ecirc;n v&agrave; chất lượng được đảm bảo ở mức độ cao nhất.</p>

<p>Cua gạch Năm Căn: gạch son đầy, thịt chắc, ngon, ngọt</p>
', 9, N'/admin/content/images/cuagachto.jpg', N'/admin/content/images/cuagachnho.jpg', NULL, NULL, NULL, 1, 1, 1, N'CÀ MAU', CAST(680000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2034, N'Cá thát lát rút xương', N'<p>C&aacute; th&aacute;t l&aacute;t r&uacute;t xương l&agrave; kỹ thuật lọc v&agrave; r&uacute;t hết xương b&ecirc;n trong thịt c&aacute;, xử l&yacute; thịt với gia vị thơm ngon, tạo n&ecirc;n một sản phẩm mới lạ m&agrave; v&ocirc; c&ugrave;ng tiện dụng v&agrave; an to&agrave;n.</p>
', 9, N'/admin/content/images/cathatlatto.jpg', N'/admin/content/images/cathatlatto.jpg', NULL, NULL, NULL, 1, 1, 1, N'SÓC SƠN - HÀ NỘI', CAST(32000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2035, N'Cua thịt Năm Căn', N'<p>Cua thịt Năm Căn&nbsp;l&agrave; một lo&agrave;i đặc sản tuyệt vời, qu&agrave; tặng từ thi&ecirc;n nhi&ecirc;n mang đến cho con người. Cua Năm Căn được xem loại cua l&agrave; ngon nhất nước. Thịt cua vừa thơm, vừa ngọt, kh&ocirc;ng qu&aacute; b&eacute;o, b&ugrave;i, chắc nịch. C&ograve;n gạch cua b&eacute;o ngậy, ng&acirc;y ngất đầu lưỡi. Người C&agrave; Mau tự h&agrave;o c&oacute; được đặc sản cua biển để tiếp đ&oacute;n kh&aacute;ch qu&yacute;, hay l&agrave;m qu&agrave; mỗi khi thăm viếng người th&acirc;n ở c&aacute;c tỉnh, th&agrave;nh kh&aacute;c.</p>

<p>Từng ch&uacute; cua được lựa chọn kỹ c&agrave;ng trước khi đưa đến tay người ti&ecirc;u d&ugrave;ng, ch&uacute;ng t&ocirc;i cam kết sản phẩm ho&agrave;n to&agrave;n tự nhi&ecirc;n v&agrave; chất lượng được đảm bảo ở mức độ cao nhất.</p>
', 9, N'/admin/content/images/cuathitto.jpg', N'/admin/content/images/cuathitto.jpg', NULL, NULL, NULL, 1, 1, 1, N'CÀ MAU', CAST(615000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2036, N'Cua Cốm', N'<p>Cua 2 da hay Cua cốm l&agrave; những con cua chuẩn bị thay vỏ, giai đoạn n&agrave;y th&igrave; thịt cua chứa rất nhiều dinh dưỡng v&agrave; ngon nhất. L&agrave; m&oacute;n qu&agrave; đặc sản m&agrave; người C&agrave; Mau d&agrave;nh biếu tặng cho kh&aacute;ch qu&yacute;, &iacute;t b&aacute;n ra thị trường.</p>

<p>Trong tất cả c&aacute;c giai đoạn của một con cua th&igrave; giai đoạn cốm (v&agrave;i ng&agrave;y trước khi lột) l&agrave; rất qu&yacute;. Đ&acirc;y l&agrave; giai đoạn cua chắc thịt, thơm, nhiều chất dinh dưỡng nhất. So với cua thịt th&igrave; độ chắc của cua cốm gấp 5 lần, rủi ro cua bị ốp hay &iacute;t thịt l&agrave; hầu như kh&ocirc;ng hề c&oacute; n&ecirc;n khi ăn sẽ rất chắc thịt. Phần gạch của cua cốm, thật ra l&agrave; lớp chất dinh dưỡng m&agrave; cua t&iacute;ch trữ để sử dụng trong thời gian tr&uacute; ẩn sau khi lột da th&igrave; rất b&eacute;o v&agrave; b&ugrave;i. Lớp gạch n&agrave;y kh&ocirc;ng bị cứng v&agrave; dễ g&acirc;y ng&aacute;n ở cua gạch</p>
', 9, N'/admin/content/images/cuacomto.jpg', N'/admin/content/images/cuacomnho.jpg', N'/admin/content/images/cuacomnho1.jpg', NULL, NULL, 1, 1, 1, N'CÀ MAU', CAST(780000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2037, N'Lươn đồng Nghệ An', N'<p>Lươn đồng Nghệ An l&agrave; một thực phẩm từ xưa đ&atilde; nổi tiếng khắp cả nước, khi ăn bất kể m&oacute;n lươn n&agrave;o người ta cũng nhớ đến l&agrave; xứ Nghệ, cũng bởi v&igrave; xứ Nghệ l&agrave; xứ sở của lươn.</p>

<p>Lươn l&agrave; lo&agrave;i thủy sản nước ngọt, th&acirc;n tr&ograve;n, da trơn, m&agrave;u n&acirc;u v&agrave;ng v&agrave; thường sống r&uacute;c trong b&ugrave;n. Lươn c&ograve;n c&oacute; t&ecirc;n gọi kh&aacute;c l&agrave; &ldquo;S&acirc;m động vật dưới nước&rdquo;. Đặc biệt, đ&acirc;y l&agrave; loại lươn đồng ch&iacute;nh hiệu, được người d&acirc;n xứ Nghệ đ&aacute;nh bắt từ ruộng th&ocirc;ng qua đặt tr&uacute;m, rồi sau đ&oacute; sơ chế chỉ giữ lại phần thịt.</p>
', 9, N'/admin/content/images/luondongto.jpg', N'/admin/content/images/luondongnho.jpg', N'/admin/content/images/luondongnho2.jpg', N'/admin/content/images/luondongnho1.jpg', NULL, 1, 1, 1, N'NGHỆ AN', CAST(315000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-14' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2038, N'Ổi Phúc Lợi', N'<p>Ổi Ph&uacute;c Lợi l&agrave; giống ổi được trồng tại Ph&uacute;c Lợi, Long Bi&ecirc;n, H&agrave; Nội. Để c&oacute; thương hiệu ổi Ph&uacute;c Lợi như hiện nay, người trồng ổi phải thực hiện quy tr&igrave;nh l&agrave;m đất, chọn giống, chăm s&oacute;c, tỉa c&agrave;nh, phun thuốc, b&oacute;n ph&acirc;n rất cầu kỳ v&agrave; c&ocirc;ng phu theo ti&ecirc;u chuẩn VietGAP. Ổi Ph&uacute;c Lợi cho tr&aacute;i quanh năm, nhưng người trồng phải chăm tỉa c&agrave;nh để nhanh ra nh&aacute;nh.</p>

<p>Ổi Ph&uacute;c Lợi cho ra tr&aacute;i to, đều, m&agrave;u tươi. Ăn ổi gi&ograve;n, rất ngọt v&agrave; c&oacute; vị thơm đặc trưng.</p>

<p>Ăn ổi c&ograve;n c&oacute; một số c&ocirc;ng dụng tốt đến sức khỏe:&nbsp;<br />
- Gi&uacute;p ổn định huyết &aacute;p<br />
- Ăn nhiều ổi tốt hệ ti&ecirc;u h&oacute;a<br />
- Ổi gi&uacute;p duy tr&igrave; nồng độ cholesterol<br />
- Ăn ổi gi&uacute;p tăng cường hệ miễn dịch<br />
- Ăn ổi giảm nguy cơ thiếu m&aacute;u<br />
- Bổ sung canxi cho b&eacute;</p>
', 7, N'/admin/content/images/traicay/oidailoanto.png', N'/admin/content/images/traicay/oidailoannho.png', NULL, NULL, NULL, 1, 1, 1, N'Phúc Lợi, Long Biên, Hà Nội', CAST(55000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-24' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2039, N'Chuối Viba', N'<p><span style="background-color:transparent; color:#000000; font-family:Verdana,Arial,Helvetica,sans-serif; font-size:14px">Chu&ocirc;́i Viba được tr&ocirc;̀ng theo quy trình VietGap. Chuối Viba giấm bằng ph&ograve;ng giấm ti&ecirc;u chuẩn, c&ocirc;ng nghệ cao nhập khẩu từ Mỹ. Chuối Viba ch&iacute;n tự nhi&ecirc;n bằng kh&iacute; Ethylene sinh học tuyệt đối an to&agrave;n, kh&ocirc;ng độc hại. Với 7 bước ch&iacute;n sau 7 ng&agrave;y giấm ho&agrave;n to&agrave;n tự nhi&ecirc;n, n&ecirc;n giữ được c&aacute;c gi&aacute; trị tự nhi&ecirc;n nhất của quả chuối như: Calories, protein, sắt, đồng, kẽm, photpho, potassium, vitamin c, kho&aacute;ng chất. Chuối Viba tươi hơn, m&atilde; s&aacute;ng, đẹp hơn v&agrave; để l&acirc;u hơn chuối giấm hương truyền thống.</span></p>

<p style="margin-left:0px; margin-right:0px"><span style="font-size:11pt">Chuối Viba ăn thơm ngon, ngọt quanh năm kh&ocirc;ng giống một số loại chuối ti&ecirc;u kh&aacute;c ăn chua v&agrave;o m&ugrave;a h&egrave;. Đặc biệt l&agrave; rất gi&agrave;u gi&aacute; trị dinh dưỡng c&oacute; h&agrave;m lượng protein cao gấp 4 lần tr&aacute;i t&aacute;o, h&agrave;m lượng Vitamin A v&agrave; sắt cao gấp 5 lần tr&aacute;i t&aacute;o.&nbsp;Trong chuối Viba c&oacute; đủ 8 loại ax&iacute;t amin thiết yếu m&agrave; cơ thể con người kh&ocirc;ng tự tạo ra được, c&oacute; đến 11 loại kho&aacute;ng chất v&agrave; 6 vitamin. </span></p>

<p style="margin-left:0px; margin-right:0px; text-align:justify">Chuối Viba kh&ocirc;ng chỉ tốt với người lớn m&agrave; c&ograve;n đối với trẻ nhỏ nếu ăn hai tr&aacute;i mỗi ng&agrave;y sẽ rất tốt cho hoạt động tr&iacute; n&atilde;o v&agrave; được cung cấp đầy đủ năng lượng cho hoạt động thể chất.&nbsp;Chuối Viba l&agrave; một loại quả c&oacute; th&agrave;nh phần của hầu hết những vi chất cần thiết cho sự biến dưỡng của cơ thể. Ngo&agrave;i ra chuối Viba c&oacute; thể &nbsp;hỗ trợ điều ho&agrave; hoạt động của hệ thần kinh v&agrave; l&agrave;m giảm nguy cơ những bệnh về tim mạch do c&oacute; h&agrave;m lượng Potassium tự nhi&ecirc;n rất cao</p>
', 7, N'/admin/content/images/traicay/chuoivinho.jpg', N'/admin/content/images/traicay/chuoivinho1.jpg', NULL, NULL, NULL, 1, 1, 1, N'Viba', CAST(22000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-24' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2040, N'Cam xoàn', N'<p>Cam Xo&agrave;n được rất nhiều chị em phụ nữ, cũng như trẻ em y&ecirc;u th&iacute;ch bởi vị thơm rất đặc trưng, vỏ mỏng, nhiều nước, &iacute;t hạt kh&aacute;c hẳn với c&aacute;c loại cam kh&aacute;c. Hơn nữa, đ&acirc;y l&agrave; giống cam c&oacute; h&agrave;m lượng vitamin C v&agrave; liminoid rất cao gi&uacute;p cơ thể tăng cường thể lực, hỗ trợ qu&aacute; tr&igrave;nh ti&ecirc;u h&oacute;a, tăng thị lực v&agrave; giảm nguy cơ mắc bệnh tim mạch.</p>

<p>Hiện nay, để Cam Xo&agrave;n đạt năng suất tốt v&agrave; đủ ti&ecirc;u chuẩn Vietgap th&igrave; đ&ograve;i hỏi người trồng phải thực hiện chế độ chăm s&oacute;c đặc biệt v&agrave; canh t&aacute;c tr&ecirc;n những nơi c&oacute; thổ nhưỡng ph&ugrave; sa bồi đắp thường xuy&ecirc;n.</p>

<p>Tuy nhi&ecirc;n, tr&ecirc;n thị trường hiện nay đ&atilde; xuất hiện những loại cam lai thuộc giống Cam Xo&agrave;nđể l&agrave;m giảm gi&aacute; th&agrave;nh cam xo&agrave;n, nhưng điều đ&oacute; đồng nghĩa với việc khiến cam bị biến đổi cả về &ldquo;chất&rdquo; v&agrave; &ldquo;lượng&rdquo;. V&igrave; vậy để chắc chắn mua được giống Cam Xo&agrave;n tốt, mọi người n&ecirc;n mua ở những địa chỉ chuyển cung cấp sản phẩm hữu cơ để đảm bảo an to&agrave;n v&agrave; chất lượng tốt nhất.</p>

<p>Ti&ecirc;u chuẩn chất lượng v&agrave; quy tr&igrave;nh bảo quản:</p>

<ul>
	<li>Ch&iacute;n c&acirc;y tự nhi&ecirc;n, ti&ecirc;u chuẩn Vietgap</li>
	<li>Kh&ocirc;ng chất bảo quản</li>
	<li>Vận chuyển đ&uacute;ng tr&igrave;nh v&agrave; thời gian cho ph&eacute;p</li>
</ul>
', 7, N'/admin/content/images/traicay/camxoankhoangto.jpg', N'/admin/content/images/traicay/camxoankhoangnho.jpg', NULL, NULL, NULL, 1, 1, 1, N'Hoà Bình', CAST(77000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-24' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2041, N'Dưa Lê Ninh Thuận', N'<p>Dưa l&ecirc; B&aacute;c T&ocirc;m được trồng xen canh trong vườn nho, hoặc c&aacute;c n&ocirc;ng trường Ninh Thuận đầy nắng gi&oacute; tạo n&ecirc;n vị ngọt đậm, thơm thơm đặc trưng đ&atilde; l&agrave;m bao nhi&ecirc;u thực kh&aacute;ch phải thương nhớ.</p>

<p>Dưa l&ecirc; quả gi&agrave;, chắc tay, vỏ trắng ng&agrave; cắt ăn thơm, ngọt kh&ocirc;ng bị đắng.</p>
', 7, N'/admin/content/images/traicay/dualeto.jpg', N'/admin/content/images/traicay/dualenho.jpg', NULL, NULL, NULL, 1, 1, 1, N'Ninh Thuận', CAST(52000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-24' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2042, N'Dứa Queen', N'<p>Dứa Queen B&aacute;c T&ocirc;m được trồng v&agrave; chăm s&oacute;c theo ti&ecirc;u chuẩn Vietgap tại n&ocirc;ng trường H&agrave; Trung - Thanh H&oacute;a. Dứa ở đ&acirc;y cho ra những quả ch&iacute;n đều, vị ngọt đậm, mọng nước v&agrave; c&oacute; m&ugrave;i thơm rất đặc trưng.</p>

<p>Trọng lượng: Dứa Queen cho quả to, 0.8 - 1kg/quả.&nbsp;</p>

<p>Dứa Queen th&iacute;ch hợp để ăn trực tiếp, hoặc l&agrave;m nước &eacute;p v&igrave; độ ngọt v&agrave; mọng nước. Ch&uacute;ng ta c&oacute; thể l&agrave;m nước &eacute;p dứa nguy&ecirc;n chất hoặc kết hợp để l&agrave;m một số loại nước &eacute;p kh&aacute;c như nước &eacute;p cần t&acirc;y,...</p>

<p>Ngo&agrave;i hương vị thơm ngon, Dứa Queen c&ograve;n mang lại những lợi &iacute;ch v&ocirc; c&ugrave;ng lớn cho sức khỏe:<br />
- Nhuận tr&agrave;ng, tốt cho ti&ecirc;u h&oacute;a<br />
- Thanh nhiệt giải độc<br />
- Tăng cường sức đề kh&aacute;ng cơ thể<br />
- Hỗ trợ điều trị vi&ecirc;m khớp</p>
', 3, N'/admin/content/images/traicay/duato.png', N'/admin/content/images/traicay/duanho.png', NULL, NULL, NULL, 1, 1, 1, N'Nông Trường Hà Trung - Thanh Hóa', CAST(27000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-24' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2043, N'Đu đủ', N'<div class="grid__item large--one-whole">
<div class="product-tabs">
<div class="tabcontent" id="product-long-description" style="display:block">
<p>Được trồng theo phương ph&aacute;p hữu cơ n&ecirc;n đu đủ tại B&aacute;c T&ocirc;m lu&ocirc;n đảm bảo an to&agrave;n nhất. Theo đ&oacute;, sản phẩm đu đủ kh&ocirc;ng sử dụng thuốc bảo vệ thực vật, kh&ocirc;ng thuốc k&iacute;ch th&iacute;ch tăng trưởng v&agrave; được chăm s&oacute;c theo đ&uacute;ng quy tr&igrave;nh từ khi ươm giống c&acirc;y.</p>

<p>Đu đủ từ l&acirc;u đ&atilde; được biết đến như &ldquo;thần dược&rdquo; trong c&aacute;c loại tr&aacute;i c&acirc;y. Trong đu đủ, lượng beta caroten nhiều hơn trong c&aacute;c rau quả kh&aacute;c, đ&acirc;y l&agrave; một loại vi chất dinh dưỡng c&oacute; vai tr&ograve; l&agrave; chống oxy ho&aacute; mạnh gi&uacute;p chống lại một số căn bệnh ung thư, chống kh&ocirc; mắt, kh&ocirc; da v&agrave; c&oacute; t&aacute;c dụng nhuận tr&agrave;ng. Trong 100g đu đủ ch&iacute;n chứa 2.100 mcg beta caroten. Đu đủ c&oacute; thể cung cấp cho cơ thể c&aacute;c loại vitamin thiết yếu như vitamin A v&agrave; vitamin C.</p>

<p>Đặc biệt, trong đu đủ chứa một loại enzyme đặc biệt gọi l&agrave; papain, đ&oacute; l&agrave; l&yacute; do tại sao n&oacute; được biết đến như một chất hỗ trợ ti&ecirc;u h&oacute;a mạnh mẽ. Ngo&agrave;i t&aacute;c dụng cải thiện, tăng cường chức năng hệ ti&ecirc;u h&oacute;a, đu đủ cũng gi&uacute;p cơ thể thải độc, chữa l&agrave;nh c&aacute;c vết thương, giảm vi&ecirc;m, l&agrave;m sạch m&aacute;u v&agrave; nhiều chức năng kh&aacute;c.</p>

<p>Tuy nhi&ecirc;n, một số trường hợp sẽ kh&ocirc;ng được ăn đu đủ v&igrave; sẽ đem lại những t&aacute;c hại kh&ocirc;n lường như: người bị v&agrave;ng da, người bị dạ d&agrave;y, người c&oacute; cơ địa dị ứng, người c&oacute; ti&ecirc;u h&oacute;a k&eacute;m, người bị bệnh m&aacute;u lo&atilde;ng.</p>

<p>Ngo&agrave;i ra, B&aacute;c T&ocirc;m cũng xin hướng dẫn qu&yacute; kh&aacute;ch h&agrave;ng c&oacute; thể lựa chọn giữa đu đủ ch&iacute;n c&acirc;y v&agrave; đu đủ ủ h&oacute;a chất như sau:</p>

<ul>
	<li>Đu đủ ch&iacute;n tự nhi&ecirc;n bao giờ cũng c&oacute; một mặt ch&iacute;n hơn mặt c&ograve;n lại do mặt ngo&agrave;i hứng được nhiều &aacute;nh s&aacute;ng mặt trời hơn. Vỏ thường một lớp nấm m&agrave;u trắng b&ecirc;n tr&ecirc;n, thỉnh thoảng xuất hiện chấm đen hoặc vết l&otilde;m nhỏ, m&agrave;u kh&ocirc;ng v&agrave;ng đều m&agrave; vẫn c&ograve;n chấm xanh. Về cảm quan, đu đủ ch&iacute;n tự nhi&ecirc;n sờ v&agrave;o thấy mềm đều, những điểm c&oacute; m&agrave;u v&agrave;ng thấy kh&ocirc;ng c&ograve;n sự xuất hiện của nhựa.</li>
	<li>Quả đu đủ d&ugrave;ng h&oacute;a chất vỏ s&aacute;ng b&oacute;ng, sờ v&agrave;o thấy cứng mặc d&ugrave; lớp vỏ b&ecirc;n ngo&agrave;i đ&atilde; chuyển s&aacute;ng m&agrave;u v&agrave;ng. Khi thấy một quả ch&iacute;n đều từ cuống th&igrave; chắn chắn n&oacute; đ&atilde; được &#39;độ&#39; qua h&oacute;a chất.</li>
</ul>

<p>&nbsp;</p>
</div>
</div>
</div>
', 7, N'/admin/content/images/traicay/duduto.jpg', N'/admin/content/images/traicay/dudunho.jpg', N'/admin/content/images/traicay/dudunho1.jpg', N'/admin/content/images/traicay/dudunho2.jpg', NULL, 1, 1, 1, N'Đồng Tháp', CAST(42000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-24' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2044, N'Dưa hấu có hạt', N'<p>Trong dưa hấu, hơn 90% l&agrave; nước, đ&oacute; l&agrave; l&yacute; do khi ăn bạn sẽ cảm thấy nhanh no. Ngo&agrave;i ra, loại quả n&agrave;y chứa h&agrave;m lượng chất xơ dồi d&agrave;o. Nước v&agrave; chất xơ khi v&agrave;o cơ thể cung cấp năng lượng, chống mất nước trong ng&agrave;y h&egrave;, cải thiện ti&ecirc;u h&oacute;a.</p>
', 7, N'/admin/content/images/traicay/duahauhatto.jpg', N'/admin/content/images/traicay/duahauhatnho.jpg', NULL, NULL, NULL, 1, 1, 1, N'Thái lan', CAST(27000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-24' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2045, N'Táo Ba Mọi', N'<p>T&aacute;o xanh được trồng tại Trang trại Ba Mọi vẫn l&agrave; sản phẩm chất lượng cao được mọi người tin d&ugrave;ng v&igrave; trang trại Ba Mọi l&agrave; trang trại đạt ti&ecirc;u chuẩn VietGAP n&ecirc;n sản phẩm T&aacute;o Ba Mọi sản xuất ra được quản l&yacute; nghi&ecirc;m ngặt từ l&uacute;c trồng, chăm s&oacute;c, thu hoạch, bao g&oacute;i, vận chuyển v&agrave; ti&ecirc;u thụ sản phẩm.</p>
', 7, N'/admin/content/images/traicay/taobaomoito.jpg', N'/admin/content/images/traicay/taobamoinho.jpg', NULL, NULL, NULL, 1, 1, 1, N'Ninh Thuận', CAST(55000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-24' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2046, N'Mận An Phước xuất khẩu', N'<p>Mận An Phước c&oacute; sự kh&aacute;c biệt nhiều với roi ngo&agrave;i Bắc. Vỏ tr&aacute;i m&agrave;u đỏ b&oacute;ng, to đẹp, nếu d&ugrave;ng để trưng b&agrave;n thờ ng&agrave;y đầu th&aacute;ng th&igrave; rất hợp, d&ugrave;ng để ăn tươi cũng rất ngon. Ruột quả d&agrave;y, hơi xốp nhưng gi&ograve;n, thơm thơm, lại l&agrave; tr&aacute;i c&acirc;y Việt sạch n&ecirc;n an to&agrave;n.</p>

<p>&nbsp;Trọng lượng trung b&igrave;nh 100- 120 gram/tr&aacute;i</p>

<p>C&ocirc;ng dụng tốt cho sức khỏe của mận (roi)<br />
- Kiểm so&aacute;t lượng đường trong cơ thể<br />
- Trị ti&ecirc;u chảy v&agrave; đầy hơi.<br />
- Gi&uacute;p l&agrave;m m&aacute;t cơ thể trong m&ugrave;a h&egrave;<br />
- Chống nấm, nhiễm tr&ugrave;ng.<br />
- Giảm nguy cơ ung thư v&uacute;<br />
- Giảm h&agrave;m lượng Cholesterol.<br />
- Cải thiện sức khỏe mắt</p>
', 7, N'/admin/content/images/traicay/mananphuocto.jpg', N'/admin/content/images/traicay/mananphuocnho.jpg', N'/admin/content/images/traicay/mananphuocnho1.jpg', N'/admin/content/images/traicay/mananphuocnho2.jpg', NULL, 1, 1, 1, N'An Phước', CAST(86000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-24' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2047, N'Trứng gà quê sạch', N'<p>Nguồn gốc r&otilde; r&agrave;ng v&agrave; đảm bảo trứng g&agrave; sạch 100%. B&aacute;c T&ocirc;m chuy&ecirc;n cung cấp sản phẩm g&agrave; qu&ecirc; sạch được xuất xứ từ H&ograve;a B&igrave;nh hoặc H&agrave; Tĩnh, sản phẩm trứng g&agrave; Qu&ecirc; sạch đảm bảo l&agrave; h&agrave;ng chuẩn kh&ocirc;ng sử dụng bất cứ h&oacute;a chất bảo quản, trứng đều l&agrave; loại trứng g&agrave; nhỏ xịn được đẻ ra từ loại g&agrave; ta nu&ocirc;i trong vườn. Đặc biệt g&agrave; được cho ăn th&oacute;c, gạo, ng&ocirc;, c&aacute;c phế phẩm n&ocirc;ng nghiệp v&agrave; ho&agrave;n to&agrave;n kh&ocirc;ng cho ăn c&aacute;c thức ăn c&ocirc;ng nghiệp.</p>

<p>Ngo&agrave;i việc đảm bảo nguồn gốc r&otilde; r&agrave;ng, trứng g&agrave; sạch cũng đem lại những c&ocirc;ng dụng tuyệt vời:</p>

<ul>
	<li>Ph&ograve;ng chống xơ h&oacute;a động mạch: trong trứng g&agrave; rất nhiều h&agrave;m lượng lecithin, v&igrave; vậy chỉ cần người mắc bệnh tim sau 3 th&aacute;ng sử dụng, lượng cholesterol trong m&aacute;u sẽ giảm đ&aacute;ng kể.</li>
	<li>Ph&ograve;ng ngừa c&aacute;c bệnh về mắt: Chất lutein v&agrave; zeaxanthin trong trứng g&agrave; c&oacute; t&aacute;c dụng chống oxy h&oacute;a rất mạnh, cộng th&ecirc;m t&aacute;c dụng chung của superoxide dismutase, c&oacute; thể giảm mức độ tho&aacute;i h&oacute;a điểm v&agrave;ng, đục thủy tinh thể.</li>
	<li>Tăng cường hệ miễn dịch: trứng c&oacute; chứa nhiều selen &ndash; chất dinh dưỡng gi&uacute;p tăng cường hệ miễn dịch v&agrave; c&acirc;n bằng hormone tuyến gi&aacute;p. Ăn từ 1-2 quả trứng v&agrave;o bữa s&aacute;ng c&oacute; thể gi&uacute;p cơ thể chống lại cơ chế nhiễm tr&ugrave;ng, x&acirc;y dựng hệ miễn dịch khỏe mạnh.</li>
	<li>Tốt cho phụ nữ mang thai: Vitamin B c&oacute; trong trứng tham gia v&agrave;o việc h&igrave;nh th&agrave;nh h&oacute;c-m&ocirc;n giới t&iacute;nh thai nhi. N&oacute; c&ograve;n c&oacute; t&aacute;c dụng hỗ trợ tế b&agrave;o hồng cầu v&agrave; ống thần kinh thai nhi được h&igrave;nh th&agrave;nh, giảm nguy cơ chậm ph&aacute;t triển tr&iacute; tuệ ở trẻ.</li>
</ul>

<p>Tuy nhi&ecirc;n, cũng cần lưu &yacute; khi d&ugrave;ng trứng g&agrave; qu&ecirc; sạch l&agrave; n&ecirc;n nấu ch&iacute;n kỹ trước khi sử dụng để c&oacute; thể bảo to&agrave;n v&agrave; hấp thụ tốt nhất chất dinh dưỡng c&oacute; trong trứng.</p>
', 10, N'/admin/content/images/traicay/trunggatanho.jpg', N'/admin/content/images/traicay/trunggatanho.jpg', NULL, NULL, NULL, 1, 1, 1, N'Hòa Bình - Hà Tĩnh', CAST(4800 AS Decimal(18, 0)), NULL, CAST(N'2021-04-24' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2048, N'Sữa chua Mục Đồng', N'<p style="text-align:justify">Được xuất xứ từ những trang trại nu&ocirc;i b&ograve; sữa c&oacute; quy tr&igrave;nh nghi&ecirc;m ngặt tại Mục Đồng, Tr&aacute;c Văn, H&agrave; Nam. Sữa chua Mục Đồng như l&agrave; biểu tượng đặc trưng cho c&aacute;c sản phẩm sữa chua hữu cơ.</p>

<p style="text-align:justify">Với ti&ecirc;u chuẩn 5 KH&Ocirc;NG lu&ocirc;n được đặt l&ecirc;n h&agrave;ng đầu, sữa chua Mục Đồng lu&ocirc;n l&agrave; sự lựa chọn cho người ti&ecirc;u d&ugrave;ng th&ocirc;ng th&aacute;i:</p>

<ul>
	<li>KH&Ocirc;NG sử dụng c&aacute;m c&ocirc;ng nghiệp</li>
	<li>KH&Ocirc;NG thức ăn biến đổi Gen</li>
	<li>KH&Ocirc;NG k&iacute;ch th&iacute;ch tăng sữa</li>
	<li>KH&Ocirc;NG h&oacute;a chất bảo quản</li>
	<li>KH&Ocirc;NG tồn dư kh&aacute;ng sinh</li>
</ul>

<p style="text-align:justify">Hơn thế nữa, sữa chua Mục Đồng được chế biến theo phương ph&aacute;p l&ecirc;n men tự nhi&ecirc;n, ổn định cấu tr&uacute;c sữa v&agrave; dễ d&agrave;nh nhận biết nhờ lớp l&ecirc;n men v&agrave;ng để đảm bảo sữa chua nguy&ecirc;n kem 100%.</p>

<p style="text-align:justify">Tuy nhi&ecirc;n, thực trạng phần lớn b&ograve; hiện nay được chăn nu&ocirc;i bằng c&aacute;m c&ocirc;ng nghiệp, ti&ecirc;m hormone tăng sữa, th&igrave; sữa tươi Mục Đồng l&agrave; một sự lựa chọn kh&aacute; an to&agrave;n m&agrave; c&aacute;c mẹ cho thể lựa chọn cho c&aacute;c th&agrave;nh vi&ecirc;n trong gia đ&igrave;nh. Từ con giống, đầu v&agrave;o thức ăn, quy tr&igrave;nh l&ecirc;n men, quy tr&igrave;nh sản xuất của sữa chua Mục Đồng đều được gi&aacute;m s&aacute;t chặt chẽ theo đủ mọi ti&ecirc;u chuẩn. Ngo&agrave;i ra, c&aacute;c mẹ ho&agrave;n to&agrave;n c&oacute; thể truy xuất được nguồn gốc, th&ocirc;ng tin, ng&agrave;y sản xuất của sản phẩm th&ocirc;ng qua tem x&aacute;c thực được d&aacute;n tr&ecirc;n vỏ hộp, điều n&agrave;y nhằm tr&aacute;nh được h&agrave;ng giả, h&agrave;ng sắp hết hạn.</p>
', 10, N'/admin/content/images/traicay/suachuamdto.jpg', N'/admin/content/images/traicay/suachuamdnho.jpg', NULL, NULL, NULL, 1, 1, 1, N'Mục Đồng', CAST(12000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-24' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2049, N'Bánh Giò Nóng', N'<p>B&aacute;nh gi&ograve; l&agrave; loại b&aacute;nh được l&agrave;m từ gạo tẻ kết hợp bột năng, nh&acirc;n c&oacute;: thịt lợn băm, mộc nhĩ, h&agrave;nh kh&ocirc;, nấm hương... Vỏ được g&oacute;i bằng l&agrave; chuối.</p>

<p>Phần vỏ b&aacute;nh mềm, mịn. Nh&acirc;n b&aacute;nh gồm thịt băm, mộc nhĩ cũng được kh&eacute;o l&eacute;o chế biến để vừa ăn.</p>

<p>B&aacute;nh gi&ograve; thưởng thức khi c&ograve;n n&oacute;ng rất dậy vị hấp dẫn</p>

<p>B&aacute;nh gi&ograve; c&oacute; thể l&agrave;m qu&agrave; s&aacute;ng, ăn l&uacute;c xế chiều đều hợp l&yacute;. Mọi người hay ăn b&aacute;nh gi&ograve; k&egrave;m dưa chuột g&oacute;p, gi&ograve; lụa v&agrave; ch&uacute;t tương ớt hay nước tương tăng th&ecirc;m phần đậm vị.</p>
', 10, N'/admin/content/images/traicay/banhgionho.jpg', N'/admin/content/images/traicay/banhgionho1.jpg', N'/admin/content/images/traicay/banhgionho2.jpg', NULL, NULL, 1, 1, 1, N'Sóc Sơn - Hà Nội', CAST(17000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-24' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2050, N'Bột cần tây sấy lạnh', N'<p>100% l&agrave;nh sạch từ cao nguy&ecirc;n 1500m Đ&agrave; Lạt, được chế biến tại Jan&rsquo;s Farm từ nguy&ecirc;n liệu tươi ngon với c&ocirc;ng nghệ kh&aacute;c biệt giữ nguy&ecirc;n tinh chất cần t&acirc;y thơm m&ugrave;i, giữ m&agrave;u xanh tự nhi&ecirc;n v&agrave; giữ trọn vị.</p>

<p>NƯỚC UỐNG CẦN T&Acirc;Y JAN&rsquo;S POWDER<br />
- Kh&ocirc;ng phụ gia<br />
- Kh&ocirc;ng hương liệu&nbsp;<br />
- Kh&ocirc;ng chất bảo quản&nbsp;<br />
- Kh&ocirc;ng biến đổi gen<br />
- Kh&ocirc;ng đường tinh luyện</p>
', 10, N'/admin/content/images/traicay/botcantayto.jpg', N'/admin/content/images/traicay/botcantaynho.jpg', NULL, NULL, NULL, 1, 1, 1, N' Jan''s', CAST(195000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-24' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2051, N'Sữa chua nếp cẩm Mục Đồng', N'<p style="text-align:justify">Sữa chua nếp cẩm Mục Đồng - Sự kết hợp giữa nếp cẩm v&agrave; sữa b&ograve; tươi nguy&ecirc;n chất 100% l&ecirc;n men tự nhi&ecirc;n c&agrave;ng trở n&ecirc;n tuyệt vời với sức khỏe. Một hộp sữa chua nếp cẩm thơm ngon mỗi ng&agrave;y gi&uacute;p cơ thể bổ sung đầy đủ axit amin thiết yếu, tăng cảm gi&aacute;c ngon miệng v&agrave; thật nhiều c&ocirc;ng dụng tr&ecirc;n cả tuyệt vờiGạo nếp cẩm được mệnh danh như l&agrave; một si&ecirc;u thực phẩm c&oacute; khả năng ph&ograve;ng chống ung thư nhờ v&agrave;o h&agrave;m lượng Anthocyanin rất cao, hơn cả quả Việt Quất hay bất kỳ loại tr&aacute;i c&acirc;y sẫm m&agrave;u kh&aacute;c như bắp cải t&iacute;m, cherry t&iacute;m hay nho đen. Th&ecirc;m v&agrave;o đ&oacute; l&agrave; sự kết hợp với sữa chua Mục Đồng đ&atilde; đem lại những lợi &iacute;ch kỳ diệu:</p>

<ul>
	<li>Sự kết hợp giữa nếp cẩm v&agrave; sữa b&ograve; tươi nguy&ecirc;n chất 100% l&ecirc;n men tự nhi&ecirc;n c&agrave;ng trở n&ecirc;n tuyệt vời với sức khỏe.</li>
	<li>Một hộp sữa chua nếp cẩm thơm ngon mỗi ng&agrave;y gi&uacute;p cơ thể bổ sung đầy đủ axit amin thiết yếu, tăng cảm gi&aacute;c ngon miệng v&agrave; thật nhiều c&ocirc;ng dụng tr&ecirc;n cả tuyệt vời kh&aacute;c:
	<ul>
		<li>Bảo vệ hệ tim mạch, chống xơ vữa động mạch, c&acirc;n bằng huyết &aacute;p</li>
		<li>Chống l&atilde;o h&oacute;a, dưỡng ẩm gi&uacute;p l&agrave;n da mịn m&agrave;ng, tươi trẻ</li>
		<li>Cải thiện nhanh ch&oacute;ng c&aacute;c vấn đề về ti&ecirc;u h&oacute;a như đầy bụng, chướng hơi hoặc l&acirc;u ti&ecirc;u.</li>
		<li>Bổ sung sắt, cải thiện t&igrave;nh trạng thiếu m&aacute;u, đặc biệt tốt v&agrave; an to&agrave;n cho phụ nữ trong thai</li>
		<li>Tăng cường thị lực, gi&uacute;p mắt s&aacute;ng hơn mỗi ng&agrave;y.</li>
	</ul>
	</li>
</ul>

<p style="text-align:justify">Sản phẩm được sản xuất tại n&ocirc;ng trại Mục Đồng, H&agrave; Nam &ndash; Chất lượng v&agrave; nguồn gốc bảo đảm an to&agrave;n 100%.</p>

<p style="text-align:justify">Sản phẩm ph&ugrave; hợp với mọi th&agrave;nh vi&ecirc;n trong gia đ&igrave;nh &amp; trẻ em tr&ecirc;n 1 tuổi</p>

<p style="text-align:justify">Hũ 120g, Đ&oacute;ng g&oacute;i 12 hũ/1 th&ugrave;ng. C&oacute; th&igrave;a b&ecirc;n trong, chỉ cần mở ra v&agrave; d&ugrave;ng lu&ocirc;n.</p>

<p style="text-align:justify">Sản phẩm bảo quản tại nhiệt độ từ 2 &ndash; 5 độ C</p>
', 10, N'/admin/content/images/traicay/suachuanepcamto.jpg', N'/admin/content/images/traicay/suachuanepcamnho.jpg', N'/admin/content/images/traicay/suachuanepcamnho.jpg', NULL, NULL, 1, 1, 1, N'Mục Đồng', CAST(12000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-24' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2052, N'Phồng Tôm Đất', N'<p>B&aacute;nh phồng t&ocirc;m Đất C&agrave; Mau từ l&acirc;u đ&atilde; nổi tiếng khắp cả nước bởi m&ugrave;i vị thơm ngon đặc trưng kh&ocirc;ng nơi n&agrave;o c&oacute; được.</p>

<p>B&aacute;nh được l&agrave;m từ những con t&ocirc;m đất tươi, với đ&ocirc;i tay kh&eacute;o l&eacute;o của người  thợ đ&atilde; cho ra những sản phẩm chất lượng thơm ngon, ngọt, gi&ograve;n kh&ocirc;ng sử dụng phẩm m&agrave;u h&oacute;a chất</p>
', 10, N'/admin/content/images/traicay/phongtomto.jpg', N'/admin/content/images/traicay/phongtomnho.jpg', NULL, NULL, NULL, 1, 1, 1, N'Cà Mau', CAST(130000 AS Decimal(18, 0)), NULL, CAST(N'2021-04-24' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2054, N'Tôm Bắc Cực', N'<p>T&ocirc;m Bắc Cực l&agrave; loại hải sản nước lạnh, sống dưới v&ugrave;ng biển băng v&agrave; tập trung nhiều tại Greenland &ndash; Đan Mạch. Để đ&aacute;nh bắt loại hải sản n&agrave;y, ngư d&acirc;n cần đặt lưới ở độ s&acirc;u 1000m dưới mặt nước biển. Ở m&ocirc;i trường khăc nghiệt như vậy, t&ocirc;m sống ho&agrave;n to&agrave;n tự nhi&ecirc;n. Sau đ&aacute;nh bắt, t&ocirc;m được hấp v&ocirc; tr&ugrave;ng v&agrave; cấp đ&ocirc;ng s&acirc;u ngay tr&ecirc;n t&agrave;u theo ti&ecirc;u chuẩn Ch&acirc;u &Acirc;u với c&ocirc;ng nghệ kh&eacute;p k&iacute;n hiện đại. Việc n&agrave;y gi&uacute;p hương vị v&agrave; h&agrave;m lượng dinh dưỡng được giữ lại tối đa như khi t&ocirc;m c&ograve;n tươi. Với thời gian 6 năm sinh trưởng, m&ocirc;i trường sống đặc biệt như vậy, T&ocirc;m Bắc Cực xứng đ&aacute;ng với danh hiệu &ldquo;qu&aacute;n qu&acirc;n hải sản sạch&rdquo;.</p>

<p>Khi nhập khẩu v&agrave;o Việt Nam, loại t&ocirc;m n&agrave;y đ&atilde; được Chứng nhận Vệ sinh An to&agrave;n Thực phẩm bởi Cục Th&uacute; Y v&agrave; Sở Y tế Th&agrave;nh phố Hồ Ch&iacute; Minh, gi&uacute;p cho người nội trợ y&ecirc;n t&acirc;m hơn khi sử dụng.</p>

<p>C&aacute;ch ăn mới của T&ocirc;m Bắc Cực c&oacute; lẽ sẽ khiến bạn v&agrave; gia đ&igrave;nh kh&ocirc;ng quen trong thời gian đầu v&igrave; t&ocirc;m mua về c&oacute; thể ăn trực tiếp sau 5-10&rsquo; để cho bớt lạnh. Thịt t&ocirc;m dai, chắc cộng th&ecirc;m vị ngọt đậm đặc trưng kết hợp c&ugrave;ng một ch&uacute;t l&agrave;nh lạnh ch&iacute;nh l&agrave; &ldquo;của lạ&rdquo; khiến ai đ&atilde; từng thử một lần đều nhớ m&atilde;i. L&agrave;m đồ nhắm cho chồng hay đồ ăn vặt cho con, tất cả đều tuyệt vời với t&iacute;nh nhanh - gọn - bổ dưỡng của T&ocirc;m Bắc Cực.</p>
', 9, N'/admin/content/images/haisan/tombaccucto.png', N'/admin/content/images/haisan/tombaccucto.png', NULL, NULL, NULL, 1, 1, 1, N'Cà Mau', CAST(142000 AS Decimal(18, 0)), 5, CAST(N'2021-05-16' AS Date), N'đ')
INSERT [dbo].[SP] ([Ma], [Ten], [MoTa], [MaLoai], [AnhNho], [Anh1], [Anh2], [Anh3], [TSKT], [TieuBieu], [TrangThai], [Xoa], [Hang], [Gia], [KhuyenMai], [NgayDang], [DVT]) VALUES (2055, N'Khoai Sọ RA', N'<p style="margin-left:0px; margin-right:0px; text-align:left">Rau an to&agrave;n l&agrave; một kh&aacute;i niệm chung để chỉ c&aacute;c loại rau, củ được sản xuất cung cấp đến người d&ugrave;ng đảm bảo ti&ecirc;u chuẩn an to&agrave;n thực phẩm.</p>

<p style="margin-left:0px; margin-right:0px; text-align:left">Những sản phẩm rau tươi c&oacute; chất lượng đ&uacute;ng như đặc t&iacute;nh giống của n&oacute;, h&agrave;m lượng c&aacute;c h&oacute;a chất v&agrave; mức độ nhiễm c&aacute;c vi sinh g&acirc;y hại ở dưới mức ti&ecirc;u chuẩn cho ph&eacute;p, đảm bảo cho người ti&ecirc;u d&ugrave;ng lẫn m&ocirc;i trường.</p>

<p style="margin-left:0px; margin-right:0px; text-align:left">Rau an to&agrave;n được quy định với c&aacute;c chất sau kh&ocirc;ng vượt qu&aacute; h&agrave;m lượng cho ph&eacute;p:</p>

<ul>
	<li>Dư lượng thuốc h&oacute;a học</li>
	<li>Dư lượng đạm nitrat (NO3)</li>
	<li>Số lượng vi sinh vật v&agrave; k&yacute; sinh tr&ugrave;ng.</li>
	<li>Dư lượng c&aacute;c kim loại nặng (ch&igrave;, đồng, kẽm, thủy ng&acirc;n...) tr&ecirc;n v&ugrave;ng đất trồng.</li>
	<li>Kh&ocirc;ng tưới rau bằng ph&acirc;n b&oacute;n tắc, ph&acirc;n chuồng tươi, nước thải sinh hoạt, nước thải c&ocirc;ng nghiệp</li>
</ul>

<p style="margin-left:0px; margin-right:0px; text-align:left">Sau khi thực hiện nghi&ecirc;m ngặt c&aacute;c quy định về giống c&acirc;y, đất trồng v&agrave; quy tr&igrave;nh canh t&aacute;c. Rau đến tay người ti&ecirc;u d&ugrave;ng của B&aacute;c T&ocirc;m sẽ an to&agrave;n tuyệt đối.</p>

<p style="margin-left:0px; margin-right:0px; text-align:left"><strong>Khoai sọ</strong></p>

<p style="margin-left:0px; margin-right:0px; text-align:left"><span style="background-color:#ffffff; color:#222222; font-family:sans-serif; font-size:14px">C&acirc;y khoai sọ c&oacute; củ c&aacute;i v&agrave; củ con. Kh&aacute;c với khoai m&ocirc;n, củ c&aacute;i khoai sọ nhỏ, nhiều củ con, nhiều tinh bột. Nh&oacute;m khoai sọ th&iacute;ch hợp với c&aacute;c loại đất thịt nhẹ, c&aacute;t pha, gi&agrave;u m&ugrave;n, tho&aacute;t nước tốt, chủ yếu được trồng ở v&ugrave;ng đồng bằng v&agrave; trung du.</span></p>

<p style="margin-left:0px; margin-right:0px; text-align:left">Khoai sọ ăn rất bở, vị ngọt b&ugrave;i v&igrave; vậy khoai sọ rất ph&ugrave; hợp để chế biến c&aacute;c m&oacute;n canh thơm ngon, m&aacute;t l&agrave;nh.</p>

<p style="margin-left:0px; margin-right:0px; text-align:left"><strong>C&ocirc;ng dụng</strong></p>

<p style="margin-left:0px; margin-right:0px; text-align:left">Ăn thường xuy&ecirc;n khoai sọ c&oacute; thể mang lại một số c&ocirc;ng dụng tốt cho sức khỏe như:<br />
- Lợi &iacute;ch với hệ ti&ecirc;u h&oacute;a<br />
- Nhuận tr&agrave;ng<br />
- Ngăn ngừa bệnh tiểu đường<br />
- Ổn định huyết &aacute;p v&agrave; gi&uacute;p tim khỏe mạnh<br />
- L&agrave;m sạch răng<br />
- Ngăn ngừa c&aacute;c loại bệnh ung thư<br />
- Chống l&atilde;o h&oacute;a</p>
', 5, N'/admin/content/images/raucuantoan/khoaisoto.png', N'/admin/content/images/raucuantoan/khoaisoto.png', NULL, NULL, NULL, 1, 1, 1, N'Bắc Hà - Lào Cai', CAST(35000 AS Decimal(18, 0)), 5, CAST(N'2021-05-22' AS Date), N'đ')

USE [OrganicFood_Store]
GO

SET IDENTITY_INSERT [dbo].[TinTuc] ON 
GO

INSERT [dbo].[TinTuc] ([Ma], [MaCM], [MotaNgan], [Mota], [NgayDang], [Anh], [NguoiDang], [TieuBieu], [LoaiTin], [TieuDe]) VALUES (1012, 21, N'Mẹo hay ngăn ngừa bệnh Ung thư hiệu quả', N'<p><img src="https://bizweb.dktcdn.net/100/311/398/files/chong-ung-thu-3-sfood-new.jpg?v=1529058635964" /></p>

<p><strong>Sfood</strong>&nbsp;biết rằng bệnh ung thư lu&ocirc;n l&agrave; nỗi lo sợ của mọi người, l&agrave; căn bệnh v&ocirc; c&ugrave;ng nguy hiểm. Ung thư do nhiều nguy&ecirc;n nh&acirc;n kh&aacute;c nhau g&acirc;y ra c&oacute; thể l&agrave; do t&aacute;c nh&acirc;n b&ecirc;n ngo&agrave;i, do yếu tố di truyền v&agrave; do th&oacute;i quen ăn uống, sinh hoạt hằng ng&agrave;y. Một người khỏe mạnh vẫn c&oacute; nguy cơ mắc bệnh ung thư nếu chế độ ăn uống v&agrave; th&oacute;i quen sinh hoạt kh&ocirc;ng hợp l&yacute;. Mỗi ng&agrave;y, ch&uacute;ng ta đều c&oacute; thể ph&ograve;ng chống căn bệnh ung thư qu&aacute;i &aacute;c bằng những th&oacute;i quen tưởng chừng như rất nhỏ. C&ugrave;ng với<strong>&nbsp;Sfood</strong>t&igrave;m hiểu nh&eacute;.<br />
&nbsp;</p>

<h2><strong>1. Đ&aacute;nh răng thường xuy&ecirc;n</strong></h2>

<p>Việc vệ sinh răng miệng đ&uacute;ng c&aacute;ch v&agrave; đều đặn &nbsp;sẽ gi&uacute;p cho ch&uacute;ng ta ph&ograve;ng tr&aacute;nh được c&aacute;c bệnh về răng miệng, ph&ograve;ng tr&aacute;nh được ung thư tuyến tụy. Bạn phải biết c&aacute;ch chải răng đ&uacute;ng c&aacute;ch nếu kh&ocirc;ng sẽ ảnh hưởng đến lợi v&agrave; dẫn tới tỷ lệ ung thư l&ecirc;n tới 63%.</p>

<h2><br />
<strong>2.Uống tr&agrave; xanh</strong></h2>

<p>Trong tr&agrave; xanh c&oacute; chứa chất oxy h&oacute;a c&oacute; thể gi&uacute;p ngăn chặn c&aacute;c bệnh ung thư li&ecirc;n quan tới phổi, thận, gan v&agrave; da. Mỗi ng&agrave;y n&ecirc;n sử dụng hai cốc tr&agrave; xanh sẽ l&agrave; giảm nguy cơ ung thư đường ti&ecirc;u h&oacute;a khoảng 32%. Với đ&agrave;n &ocirc;ng c&oacute; thể ngăn chặn được ung thư tuyến tiền liệt nếu uống đều đặn 5 ly tr&agrave; mỗi ng&agrave;y.&nbsp;</p>

<p><img src="https://bizweb.dktcdn.net/100/311/398/files/chong-ung-thu-2-sfood.jpg?v=1529058668626" /></p>

<h2><strong>3. Ăn rau quả</strong></h2>

<p>Trong rau quả c&oacute; rất nhiều chất sơ v&agrave; c&aacute;c chất dinh dưỡng tốt cho cơ thể.&nbsp;<strong>Sfood</strong>&nbsp;biết rau quả lu&ocirc;n l&agrave; thực phẩm v&agrave;ng của c&aacute;c chị em phải kh&ocirc;ng n&agrave;o. Nay ăn nhiều rau quả lại th&ecirc;m một c&ocirc;ng dụng kh&ocirc;ng ngờ. Mỗi ng&agrave;y n&ecirc;n ăn &iacute;t nhất 5 rau củ quả, tr&aacute;i c&acirc;y sẽ gi&uacute;p ngăn ngừa được nhiều &nbsp;bệnh ung thư. Một số loại rau bạn n&ecirc;n thường sử dụng chẳng hạn như rau cải, m&acirc;m x&ocirc;i, c&agrave; rốt, c&aacute;c loại rau thuộc họ cải.</p>

<p><img src="https://bizweb.dktcdn.net/100/311/398/files/chong-ung-thu-sfood.jpg?v=1529058693478" /></p>

<h2><br />
<strong>4. Tập thể dục đều đặn</strong></h2>

<p>Thường xuy&ecirc;n tập thể dục đều đặn mỗi ng&agrave;y c&oacute; thể gi&uacute;p ngăn chặn được mệt số bệnh li&ecirc;n quan về tim mạch v&agrave; n&acirc;ng cao sức khỏe nhờ đ&oacute;&nbsp;<strong>ngăn ngừa bệnh ung thư</strong>. T&ugrave;y v&agrave;o sở th&iacute;ch của mỗi người bạn c&oacute; thể chọn cho m&igrave;nh một m&ocirc;n thể dục ưa th&iacute;ch như bơi lội. thể dục thẩm mỹ, chạy bộ, hay nếu c&oacute; điều kiện hơn c&oacute; thể chơi golf. N&ecirc;n gi&agrave;nh thời gian thức dậy v&agrave;o c&aacute;c buổi s&aacute;ng sớm để r&egrave;n luyện sức khỏe l&agrave; tốt nhất.</p>

<h2><br />
<strong>5. Kh&ocirc;ng nhậu nhẹt</strong></h2>

<p>Phải n&oacute;i l&agrave; tỷ lệ ti&ecirc;u thụ bia rượu của nước ta l&agrave; v&ocirc; c&ugrave;ng lớn so với c&aacute;c nước kh&aacute;c tr&ecirc;n thế giới. Mọi người đều biết việc uống qu&aacute; nhiều rượu bia sẽ kh&ocirc;ng tốt cho sức khỏe. Trong một ng&agrave;y chỉ cần sử dụng 1 cốc rượu to hoặc 1 vại bia th&igrave; dễ dẫn đến ung thư ruột. Với phụ nữ dễ dẫn tới nguy ung thư v&uacute; khi sử dụng bia rượu thường xuy&ecirc;n. Chất cồn trong rượu bia sẽ dễ dẫn đến c&aacute;c bệnh li&ecirc;n quan đến gan như sơ gan, vi&ecirc;m gan&hellip;</p>

<p><img src="https://bizweb.dktcdn.net/100/311/398/files/chong-ung-thu-1-sfood.jpg?v=1529058718385" /></p>

<h2><strong>6. Tinh thần thoải m&aacute;i</strong></h2>

<p>T&acirc;m l&iacute; kh&ocirc;ng ổn định, lu&ocirc;n ở trong trạng th&aacute;i lo lắng, suốt ng&agrave;y cứ suy nghĩ, l&acirc;u dần dễ dẫn đến nguy cơ mắc một số bệnh như bệnh trầm cảm v&agrave; nhất l&agrave; bệnh ung thư. Tinh thần bị stress v&agrave; việc suy nghĩ qu&aacute; nhiều sẽ l&agrave;m cho cơ thể tiết ra nhiều hoocmon c&oacute; hại cho cơ thể đặc biệt &nbsp;l&agrave;m tăng khả năng mắc bệnh ung thư v&uacute; đối với phụ nữ.&nbsp;</p>

<h2><br />
<strong>7. Kh&ocirc;ng ăn đồ ăn nhanh</strong></h2>

<p>Đồ ăn nhanh rất tiện lợi để ch&uacute;ng ta giải quyết &nbsp;được ngay cơn đ&oacute;i nhưng trong đồ ăn nhanh thường chứa nhiều chống dầu mỡ kh&ocirc;ng tốt cho sức khỏe v&agrave; dễ mắc c&aacute;c bệnh ung thư li&ecirc;n quan đến thực quản, phổi,dạ d&agrave;y, tuyến tiền liệt. Do đ&oacute; bạn kh&ocirc;ng n&ecirc;n sử dụng qu&aacute; nhiều đố ăn nhanh như hamburger, thịt hun kh&oacute;i, x&uacute;c x&iacute;ch mỗi ng&agrave;y</p>
', CAST(N'2021-04-17' AS Date), N'/admin/content/files/chong-ung-thu-3-sfood-new.jpg', N'minh', 1, NULL, NULL)
INSERT [dbo].[TinTuc] ([Ma], [MaCM], [MotaNgan], [Mota], [NgayDang], [Anh], [NguoiDang], [TieuBieu], [LoaiTin], [TieuDe]) VALUES (1013, 21, N'Bí quyết làm váng sữa tuyệt ngon cho bé yêu', N'<p><img src="https://bizweb.dktcdn.net/100/311/398/files/vang-sua-3-sfood-new.jpg?v=1528972656312" /></p>

<p>Hiện nay việc m&agrave; c&aacute;c b&agrave; mẹ quan t&acirc;m nhất c&oacute; lẽ l&agrave; việc nấu ăn như thế n&agrave;o l&agrave; tốt cho trẻ, như thế n&agrave;o th&igrave; sẽ cung cấp chất dinh dưỡng đầy đủ cho cơ thể. Nhiều người rất lo lắng l&agrave; lượng thức ăn trẻ ăn h&agrave;ng ng&agrave;y n&oacute; c&oacute; đủ cung cấp cho cơ thể b&eacute; ph&aacute;t triển to&agrave;n diện hay kh&ocirc;ng, n&oacute; c&oacute; tốt cho cơ thể b&eacute; hay kh&ocirc;ng. N&ecirc;n họ thường mua th&ecirc;m một v&agrave;i loại thức ăn để cung cấp đầy đủ chất dinh dưỡng cho b&eacute; trong đ&oacute; c&oacute; v&aacute;ng sữa.<br />
<br />
V&aacute;ng sữa l&agrave; thực phẩm vừa tốt cho hệ ti&ecirc;u h&oacute;a của b&eacute; vừa cung cấp th&ecirc;m dinh dưỡng cho cơ thể b&eacute; bởi lượng thức ăn hằng ng&agrave;y chưa cung cấp đủ cho trẻ lớn kh&ocirc;n. Bởi v&igrave; biết bạn hay mua v&aacute;ng sữa cho con nhưng v&aacute;ng sữa cũng rất mắc tiền n&ecirc;n bạn c&oacute; thể học c&aacute;ch l&agrave;m tại nh&agrave; th&ocirc;ng qua b&agrave;i viết của sfood ng&agrave;y h&ocirc;m nay nh&eacute;.&nbsp;<strong>Sfood</strong>&nbsp;sẽ giới thiệu cho bạn một số c&aacute;ch&nbsp;<strong>l&agrave;m v&aacute;ng sữa ngon tại nh&agrave;</strong>&nbsp;để thay đổi khẩu vị của b&eacute;, bạn sẽ c&oacute; hai c&ocirc;ng thức để l&agrave;m v&aacute;ng sữa ngon cho b&eacute; tại&nbsp;<br />
&nbsp;</p>

<h2><strong>1. C&ocirc;ng thức 1 - &nbsp;sử dụng sữa tươi</strong></h2>

<p>Trước khi bắt đầu l&agrave;m th&igrave; ch&uacute;ng ta cần chuẩn bị nguy&ecirc;n liệu đầy đủ trước đ&uacute;ng kh&ocirc;ng n&agrave;o. Đối với m&oacute;n ăn l&agrave;m từ sữa tươi th&igrave; bạn cần chuẩn bị nguy&ecirc;n liệu đ&oacute; ch&iacute;nh l&agrave; sữa tươi, kem tươi - c&oacute; thể mua ở c&aacute;c cửa h&agrave;ng tạp h&oacute;a, một &iacute;t bột ng&ocirc; v&agrave; c&oacute; thể cho th&ecirc;m một &iacute;t socola hoặc hương vị g&igrave; đ&oacute; m&agrave; b&eacute; th&iacute;ch.<br />
&nbsp;</p>

<h2><strong>2. C&aacute;ch l&agrave;m v&aacute;ng sữa ngon từ sữa tươi</strong></h2>

<p>C&aacute;ch l&agrave;m v&aacute;ng sữa từ sữa tươi: Đầu ti&ecirc;n bạn cần phải sử dụng một c&aacute;i t&ocirc; to để c&oacute; thể cho v&agrave;o tất cả c&aacute;c nguy&ecirc;n liệu đ&atilde; chuẩn bị ở tr&ecirc;n v&agrave;o v&agrave; trộn đều n&oacute; nh&eacute;. Sau đ&oacute; cho v&agrave;o nồi v&agrave; đun s&ocirc;i hỗn hợp n&agrave;y l&ecirc;n sau đ&oacute; tắt bếp để nguội. Khi l&agrave;m v&aacute;ng sữa kiểu n&agrave;y th&igrave; n&oacute; kh&ocirc;ng c&oacute; m&agrave;u v&agrave;ng như hộp m&agrave; bạn hay mua về, nếu bạn muốn v&aacute;ng sữa c&oacute; m&agrave;u v&agrave;ng th&igrave; bạn h&atilde;y cho th&ecirc;m một hộp v&aacute;ng sữa mua v&agrave;o hỗn hợp đ&atilde; nấu ch&iacute;n kia v&agrave; trộn l&ecirc;n th&igrave; n&oacute; c&oacute; m&agrave;u như mua ngo&agrave;i đ&oacute;. Tiếp theo bạn cần để nguội hỗn hợp v&agrave; khi để nguội xong th&igrave; bạn h&atilde;y đổ n&oacute; v&agrave;o c&aacute;c hộp đ&atilde; rửa sạch v&agrave; để r&aacute;o sẵn rồi v&agrave; cho v&agrave;o tử lạnh.<br />
&nbsp;</p>

<p>Nếu mẹ c&oacute; con biếng ăn h&atilde;y mua ruốc t&ocirc;m của sfood để con ăn c&ugrave;ng cơm, đảm bảo khi sử dụng ruốc t&ocirc;m của sfood c&aacute;c con sẽ ăn ngon hơn v&agrave; nhiều hơn. Ruốc t&ocirc;m của sfood l&agrave; sản phẩm l&agrave;m thủ c&ocirc;ng v&agrave; từ nguy&ecirc;n liệu sạch n&ecirc;n c&aacute;c mẹ ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m khi cho con sử dụng nh&eacute;<br />
&nbsp;</p>

<h2><strong>3. C&ocirc;ng thức 2 -&nbsp;sử dụng sữa c&ocirc;ng thức</strong></h2>

<p>Sfood sẽ giải th&iacute;ch cho c&aacute;c mẹ biết sữa c&ocirc;ng thức l&agrave; sữa g&igrave; nh&eacute;, sữa c&ocirc;ng thức c&ograve;n được gọi với t&ecirc;n gọi kh&aacute;c l&agrave; sữa bột trẻ em đ&acirc;y l&agrave; loại được sản xuất d&agrave;nh ri&ecirc;ng l&agrave;m thức ăn cho trẻ sơ sinh v&agrave; trẻ em dưới 12 th&aacute;ng tuổi. Th&agrave;nh phần của sữa c&ocirc;ng thức c&oacute; nhiều chất dinh dưỡng giống sữa mẹ v&igrave; thế n&oacute; hay được d&ugrave;ng để thay thế ho&agrave;n to&agrave;n hoặc một phần sữa mẹ&nbsp;<br />
&nbsp;</p>

<p>Bước đầu ti&ecirc;n cũng như sử dụng sữa tươi đ&oacute; ch&iacute;nh l&agrave; bạn cần mua những nguy&ecirc;n liệu để nấu như l&agrave; sữa c&ocirc;ng thức, nước lọc, kem tươi v&agrave; th&ecirc;m một &iacute;t bột như l&agrave; bột năng hay l&agrave; bột ng&ocirc; để cho khi l&agrave;m v&aacute;ng sữa ra n&oacute; c&oacute; thể đặc v&agrave; ăn ngon hơn.</p>

<p><img src="https://bizweb.dktcdn.net/100/311/398/files/vang-sua-sfood.jpg?v=1528972694663" /></p>

<h2><strong>4. C&aacute;ch l&agrave;m v&aacute;ng sữa ngon từ sữa c&ocirc;ng thức</strong></h2>

<p>C&aacute;ch&nbsp;<strong>l&agrave;m v&aacute;ng sữa</strong>&nbsp;từ sữa c&ocirc;ng thức đ&oacute; ch&iacute;nh l&agrave; đầu ti&ecirc;n bạn đun n&oacute;ng một &iacute;t nước cho đến khi nước hơi ấm th&igrave; cho sữa bột m&agrave; b&eacute; của bạn đang sử dụng v&agrave;o v&agrave; cho th&ecirc;m sữa c&ocirc;ng thức v&agrave;o khuấy đều đến khi hỗn hợp tan hết. Sau đ&oacute; bạn cho th&ecirc;m một &iacute;t bột năng v&agrave;o. Sau đ&oacute; bạn đun hỗn hợp n&agrave;y với lửa nhỏ để hỗn hợp của bạn sẽ săn lại v&agrave; bạn ch&uacute; &yacute; l&agrave; khi đun th&igrave; bạn n&ecirc;n d&ugrave;ng đũa hoặc muỗng khuấy đều hỗn hợp tr&aacute;nh trường hợp phần ở dưới bị ch&aacute;y nh&eacute;. Bạn cũng kh&ocirc;ng được đun qu&aacute; n&oacute;ng đến khi hỗ hợp s&ocirc;i v&igrave; nếu s&ocirc;i th&igrave; chất dinh dưỡng sẽ mất hết.<br />
&nbsp;</p>

<p>Tham khảo video hướng dẫn chế biến v&aacute;ng sữa ngon c&aacute;c mẹ nh&eacute;</p>

<p>&nbsp;</p>

<p><iframe frameborder="0" height="480" src="https://www.youtube.com/embed/lalkgrmAcLw" width="640"></iframe></p>
', CAST(N'2021-05-16' AS Date), N'/admin/content/images/tuvandinhduong/vangsua.jpg', N'minh', 1, NULL, NULL)
INSERT [dbo].[TinTuc] ([Ma], [MaCM], [MotaNgan], [Mota], [NgayDang], [Anh], [NguoiDang], [TieuBieu], [LoaiTin], [TieuDe]) VALUES (1015, 24, N'TOP NHỮNG DƯỠNG CHẤT MÀ MẸ BẦU CẦN BỔ SUNG NGAY LẬP TỨC', N'<div class="rte">
<p style="margin-left:0px; margin-right:0px"><span style="font-family:Cambria; font-size:medium">Trong giai đoạn mang thai người mẹ cần bổ sung rất nhiều chất dinh dưỡng để trẻ ph&aacute;t triển được đầy đủ v&agrave; ho&agrave;n thiện nhất, trong đ&oacute; c&oacute; những dưỡng chất cực k&igrave; quan trọng m&agrave; mỗi b&agrave; bầu cần trang bị cho m&igrave;n</span></p>

<p style="margin-left:0px; margin-right:0px"><span style="font-size:medium"><strong><span style="font-family:Cambria">Top những dưỡng chất cần thiết m&agrave; mẹ bầu cần bổ sung:</span></strong></span></p>

<p style="margin-left:0px; margin-right:0px"><span style="font-family:Cambria; font-size:medium">Protein: L&agrave; th&agrave;nh phần quan trọng nhất gi&uacute;p cơ thể của trẻ c&oacute; thể ph&aacute;t triển b&igrave;nh thường, đặc biệt l&agrave; c&aacute;c tế b&agrave;o thần kinh. Cần bổ sung 70-80g/ ng&agrave;y. </span></p>

<p style="margin-left:0px; margin-right:0px"><span style="font-family:Cambria; font-size:medium">Xem ngay những thực phầm cung cấp h&agrave;m lượng protein cao</span></p>

<p style="margin-left:0px; margin-right:0px"><span style="font-family:Cambria; font-size:medium">Vitamin: </span></p>

<p style="margin-left:0px; margin-right:0px"><span style="font-family:Cambria"><span style="font-size:medium">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Vitamin D : 800IU/ ng&agrave;y:</span></span></p>

<p style="margin-left:0px; margin-right:0px"><span style="font-family:Cambria"><span style="font-size:medium">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vitamin A: 800mcg/ng&agrave;y:</span></span></p>

<p style="margin-left:0px; margin-right:0px"><span style="font-family:Cambria"><span style="font-size:medium">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Vitamin E: 10-15mg/ ng&agrave;y</span></span></p>

<p style="margin-left:0px; margin-right:0px"><span style="font-family:Cambria"><span style="font-size:medium">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Vitamin C: 70-90mg/ ng&agrave;y</span></span></p>

<p style="margin-left:0px; margin-right:0px"><span style="font-family:Cambria"><span style="font-size:medium">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Vitamin A, C, D, E c&oacute; nhiều trong đ&acirc;u?</span></span></p>

<p style="margin-left:0px; margin-right:0px"><span style="font-family:Cambria; font-size:medium">&nbsp;</span></p>

<p><img src="https://file.hstatic.net/1000191320/file/tp_7f800155783949feac0c25d88d27a03a_grande.jpg" style="display:block; margin-left:auto; margin-right:auto" /></p>

<p style="margin-left:0px; margin-right:0px"><span style="font-family:Cambria; font-size:medium">Canxi: H&igrave;nh th&agrave;nh xương v&agrave; răng vững chắc cho b&eacute; 3 th&aacute;ng đầu. Cần bổ sung 300mg/ ng&agrave;y trong 3 th&aacute;ng đầu để những dưỡng chất được hấp thụ v&agrave;o cơ thể của mẹ rồi dần dần đưa v&agrave;o b&eacute;.</span></p>

<p style="margin-left:0px; margin-right:0px"><span style="font-family:Cambria; font-size:medium">Sắt: L&agrave; nh&acirc;n tố quan trọng trong mọi giai đoạn của thai kỳ, cần bổ sung 30mg/ ng&agrave;y</span></p>

<p style="margin-left:0px; margin-right:0px"><span style="font-family:Cambria; font-size:medium">DHA: L&agrave; một loại Omega3 gi&uacute;p tăng cường hoạt đọng của tr&iacute; n&atilde;o v&agrave; tổng chỉ huy sự nh&igrave;n của mắt, chiếm 20% trọng lượng n&atilde;o bộ v&agrave; 60% v&otilde;ng mạc. Cần dung nạp 200mg/ ng&agrave;y</span></p>

<p style="margin-left:0px; margin-right:0px"><span style="font-family:Cambria; font-size:medium">Cholin: Gi&uacute;p ph&aacute;t triển v&agrave; duy tr&igrave; chức năng tế b&agrave;o n&atilde;o v&agrave; th&uacute;c đẩy sự sinh sản của c&aacute;c tế b&agrave;o thần kinh ở trung t&acirc;m n&atilde;o. Bổ sung 450mg/ ng&agrave;y.</span></p>

<p style="margin-left:0px; margin-right:0px"><span style="font-family:Cambria; font-size:medium">Acid folic: Ảnh hưởng trực tiếp đến sự ph&aacute;t triển ống thần kinh của b&eacute;. Cần bổ sung 0,4 mg/ ng&agrave;y đều đặn.</span></p>

<p style="margin-left:0px; margin-right:0px"><span style="font-family:Cambria; font-size:medium">Iot: L&agrave; một nh&acirc;n tố quan trọng, nếu thiếu iot sẽ dẫn đến những hậu quả xấu như xảy thai, sinh non. Cần bổ sung 200mgg/ ng&agrave;y.</span></p>
</div>
', CAST(N'2021-05-07' AS Date), N'/admin/content/images/tuvandinhduong/mebau.jpg', NULL, 1, N'chomebau', NULL)
INSERT [dbo].[TinTuc] ([Ma], [MaCM], [MotaNgan], [Mota], [NgayDang], [Anh], [NguoiDang], [TieuBieu], [LoaiTin], [TieuDe]) VALUES (1016, 25, N'Cỏ Vetiver', N'<table class="mce-item-table" style="width:100%">
	<tbody>
		<tr>
			<td>
			<p><strong><em>Kỹ thuật trồng</em></strong></p>

			<p><em>Đ&agrave;o r&atilde;nh rộng x s&acirc;u = 0.2m x 0.2m, b&oacute;n l&oacute;t ph&acirc;n chuồng ủ hoai mục l&agrave; tốt nhất. Lượng ph&acirc;n t&ugrave;y thuộc v&agrave;o loại đất</em><em>: b&oacute;n nhiều l&ecirc;n với đất xấu v&agrave; &iacute;t đi với đất tốt</em><em>. Trong 1 th&aacute;ng đầu cần thường xuy&ecirc;n tưới nước để c&acirc;y sống</em><em>. C&oacute; thể tự nh&acirc;n giống bằng c&aacute;ch tỉa bớt sau v&agrave;i năm trồng</em></p>
			</td>
		</tr>
	</tbody>
</table>

<p>Cỏ Vetiver l&agrave; c&acirc;y rất đa dụng để bảo vệ đất khỏi sạt lở nhờ bộ rễ cắm s&acirc;u 2m-4m; l&agrave;m h&agrave;ng r&agrave;o sinh học ngăn ngừa v&agrave; dẫn dụ c&ocirc;n tr&ugrave;ng; thu h&uacute;t vi sinh vật v&agrave; nấm dưới l&ograve;ng đất. Mặt kh&aacute;c Vetiver th&iacute;ch ứng tốt với nhiều điều kiện v&ugrave;ng miền kh&aacute;c nhau, rất an to&agrave;n với m&ocirc;i trường tự nhi&ecirc;n. Tuy nhi&ecirc;n, hạt cỏ Vetiver l&agrave; hạt giống bất thụ, kh&ocirc;ng lan truyền bừa b&atilde;i v&agrave; phải trồng bằng hom khi muốn nh&acirc;n rộng.</p>

<p><img src="https://file.hstatic.net/1000191320/file/ada_850161960d664357a0270490b29f41d3_grande.jpg" style="display:block; margin-left:auto; margin-right:auto" /></p>

<p><img src="https://file.hstatic.net/1000191320/file/fdsfds_f074c9cdbc8c40578c09f43890882f9c_grande.jpg" style="display:block; margin-left:auto; margin-right:auto" /></p>

<p>Cỏ Vetiver c&oacute; dạng th&acirc;n cọng, mọc th&agrave;nh bụi d&agrave;y. Từ gốc mọc ra nhiều chồi ở c&aacute;c hướng. Th&acirc;n mọc thẳng đứng, cao trung b&igrave;nh 1,5 &ndash; 3m. Phần th&acirc;n tr&ecirc;n kh&ocirc;ng ph&acirc;n nh&aacute;nh, phần dưới đẻ nh&aacute;nh rất mạnh. Phần l&aacute; non c&oacute; thể l&agrave;m thức ăn gia s&uacute;c.</p>

<p>Phiến l&aacute; hẹp 6-12mm, d&agrave;i khoảng 45-100cm, l&aacute; nhẵn, m&eacute;p nh&aacute;m. Cụm hoa l&agrave; ch&ugrave;y tận c&ugrave;ng, thẳng, d&agrave;i 20-30cm, cuống chung lớn, ph&acirc;n nh&aacute;nh nhiều. B&ocirc;ng nhỏ kh&ocirc;ng cuống, l&agrave; loại lưỡng t&iacute;nh, h&igrave;nh dẹt, b&ocirc;ng c&oacute; cuống l&agrave; b&ocirc;ng đực; cỏ Vetiver &iacute;t ra hoa, nếu c&oacute; th&igrave; hoa thường bất thụ, quả hơi dẹt.</p>

<p><img src="https://file.hstatic.net/1000191320/file/jkhj_hj_kj_f99a2d7bcf044f77a31ee307007aff59_grande.jpg" /></p>

<p><img src="https://file.hstatic.net/1000191320/file/fdsfsdfdfsdfsd_a180c992d21d4bc9be656c5e9cbbcb4d_grande.jpg" style="display:block; margin-left:auto; margin-right:auto" /></p>

<p>Rễ l&agrave; phần c&oacute; t&aacute;c dụng lớn&nbsp;v&agrave; quan trọng nhất cho khả năng chống x&oacute;i m&ograve;n của cỏ Vetiver. Rễ cắm thẳng đứng s&acirc;u v&agrave;o trong đất, kể cả rễ thứ cấp. Rễ c&oacute; dạng ch&ugrave;m, d&agrave;y đặc, cắm s&acirc;u 3-5m,&nbsp; rộng đến 2,5m sau v&agrave;i&nbsp;năm trồng. Do đ&oacute; ngăn cản sự x&oacute;i m&ograve;n cũng như khống chế sự dịch chuyển vật chất tr&ecirc;n mặt đất, đồng thời giữ cho c&acirc;y sống được qua thời kỳ hạn h&aacute;n.</p>

<p><img src="https://file.hstatic.net/1000191320/file/fsdfdf_89fdac6501184b96a059b6c10ff4223a_grande.jpg" style="display:block; margin-left:auto; margin-right:auto" /></p>

<h3>Vetiver thuộc nh&oacute;m thực vật C4, sử dụng CO2 hiệu quả hơn theo con đường quang hợp b&igrave;nh thường. Điều lưu &yacute; l&agrave; hầu hết thực vật C4 chuyển h&oacute;a CO2 th&agrave;nh đường lại sử dụng rất &iacute;t nước, đ&acirc;y l&agrave; một yếu tố gi&uacute;p c&acirc;y ph&aacute;t triển trong điều kiện kh&ocirc; hạn.</h3>

<p>Cỏ Vetiver c&oacute; sức chịu đựng đối với biến động kh&iacute; hậu lớn như hạn h&aacute;n k&eacute;o d&agrave;i, lũ lụt. Khả năng chịu ngập &uacute;ng k&eacute;o d&agrave;i đến 45 ng&agrave;y ở luồng nước s&acirc;u 0,6-0,8m. Cỏ c&oacute; thể mọc v&agrave; ph&aacute;t triển lại rất nhanh sau khi bị ảnh hưởng của hạn h&aacute;n, sương muối, nước mặn, c&aacute;c h&oacute;a chất v&agrave; độc chất trong đất. Cỏ ph&aacute;t triển tốt trong đất ngh&egrave;o dinh dưỡng, đất nhiễm ph&egrave;n, ngập mặn, đất bị nhiễm kim loại nặng.Chịu được ngưỡng biến động cao của pH đất từ 3-10,5.</p>

<p>Tinh dầu trong rễ c&oacute; m&ugrave;i thơm khỏe đến mức kh&ocirc;ng hấp dẫn đối với lo&agrave;i gặm nhấm v&agrave; c&aacute;c loại c&ocirc;n tr&ugrave;ng g&acirc;y hại kh&aacute;c, n&oacute; c&ograve;n ngăn chặn kh&ocirc;ng cho chuột l&agrave;m tổ gần h&agrave;ng r&agrave;o, l&aacute; cỏ cứng v&agrave; sắc ngăn cản rắn sinh sống.</p>

<p><img src="https://file.hstatic.net/1000191320/file/sdfdsfdsf_a3c4f6e16a194c64a36c60bf88e7a582_grande.jpg" style="display:block; margin-left:auto; margin-right:auto" /></p>

<p><img src="https://file.hstatic.net/1000191320/file/jkhjkhjkjhjkhjkk__2dba22bec619462c892db602feebf1d2_grande.jpg" style="display:block; margin-left:auto; margin-right:auto" /></p>

<p>Nhiều vi sinh vật như vi khuẩn v&agrave; nấm được ph&aacute;t hiện xung quanh bộ rễ cỏ Vetiver. C&aacute;c vi sinh vật x&acirc;m nhập v&agrave;o mặt tr&ecirc;n rễ, tạo th&agrave;nh những đường dẫn truyền dinh dưỡng nối đất v&agrave; c&acirc;y, rễ tiết ra polysaccharide l&agrave; chất hữu cơ h&ograve;a tan gi&uacute;p cho sự chuyển h&oacute;a sinh học của đất v&agrave; sự th&iacute;ch nghi của c&acirc;y.</p>

<p>Vi sinh vật gắn liền với rễ cỏ Vetiver l&agrave; c&aacute;c vi khuẩn cố định đạm, vi khuẩn h&ograve;a tan, c&aacute;c nấm rễ v&agrave; c&aacute;c vi khuẩn ph&acirc;n giải cellulos sản xuất chất dinh dưỡng cho sự ph&aacute;t triển v&agrave; th&uacute;c đẩy hormone sinh trưởng thực vật t&aacute;c động trực tiếp l&ecirc;n Vetiver v&agrave; c&aacute;c c&acirc;y trồng cộng sinh.</p>

<p>Cỏ Vetiver l&agrave;m h&agrave;ng r&agrave;o sinh học để ngăn chặn v&agrave; dẫn dụ c&aacute;c lo&agrave;i c&ocirc;n tr&ugrave;ng c&oacute; hại cho c&acirc;y trồng như s&acirc;u đục th&acirc;n, rầy mềm, v&agrave; rệp s&aacute;p. C&aacute;c lo&agrave;i g&acirc;y hại n&agrave;y sống v&agrave; sinh sản tr&ecirc;n Vetiver n&ecirc;n sẽ hạn chế g&acirc;y hại c&acirc;y trồng ch&iacute;nh. Mặt kh&aacute;c, bộ rễ của Vetiver thu h&uacute;t c&aacute;c loại tuyến tr&ugrave;ng v&agrave; nấm hại để hạn chế ch&uacute;ng tấn c&ocirc;ng sang rễ của c&acirc;y trồng ch&iacute;nh.</p>

<p>Đồng thời, Vetiver cũng thu h&uacute;t c&aacute;c lo&agrave;i&nbsp;thi&ecirc;n địch&nbsp;rất tốt như bọ r&ugrave;a, bọ ngựa, v&agrave; kiến. Đ&acirc;y l&agrave; những chiến binh &acirc;m thầm chống lại s&acirc;u bệnh hại v&agrave; bảo vệ c&acirc;y trồng. T&aacute;c dụng tuyệt vời n&agrave;y được chứng minh tr&ecirc;n c&aacute;c ruộng trồng xen canh canh rau quả như h&igrave;nh b&ecirc;n.</p>

<p><img src="https://file.hstatic.net/1000191320/file/jkhjkhjk_01d619c8da094de58b70dc0032989a1f_grande.jpg" style="display:block; margin-left:auto; margin-right:auto" /></p>

<p>Nhờ h&igrave;nh th&aacute;i bụi cao v&agrave; d&agrave;y, tuổi thọ cao, lại c&oacute; tốc độ ph&aacute;t triển nhanh n&ecirc;n Vetiver cho lượng sinh khối hữu cơ lớn. Nếu được trồng ở nơi ph&ugrave; hợp th&igrave; h&agrave;ng th&aacute;ng c&oacute; thể cắt tỉa lấy sinh khối l&agrave;m vật chất hữu cơ gi&aacute; trị cao bằng c&aacute;ch phủ xuống mặt đất. Lớp phủ n&agrave;y sẽ l&agrave; thức ăn cho c&aacute;c vi sinh vật bản địa, gi&uacute;p ch&uacute;ng ph&aacute;t triển mạnh hơn. N&oacute; cũng gi&uacute;p giữ nước tốt hơn cho cả hệ sinh th&aacute;i c&acirc;y trồng.</p>

<p>Một ứng dụng th&uacute; vị nữa l&agrave; khi sống cộng sinh với c&acirc;y kh&aacute;c (tất cả c&aacute;c loại, ngoại trừ c&acirc;y lấy củ), Vetiver l&agrave;m giảm &aacute;p lực c&ocirc;n tr&ugrave;ng, nấm hại ở tr&ecirc;n v&agrave; dưới cho c&acirc;y ch&iacute;nh.</p>
', CAST(N'2021-05-14' AS Date), N'/admin/content/images/tintuchangngay/covertito.jpg', N'minh', 1, N'TinTucHangNgay', NULL)
INSERT [dbo].[TinTuc] ([Ma], [MaCM], [MotaNgan], [Mota], [NgayDang], [Anh], [NguoiDang], [TieuBieu], [LoaiTin], [TieuDe]) VALUES (1017, 25, N'Lẩu riêu cua bắp bò ngon khó cưỡng', N'<p>Một m&oacute;n ngon cho cả nh&agrave; thưởng thức mỗi khi muốn đổi vị &quot;Lẩu ri&ecirc;u cua bắp b&ograve;&quot;. Đ&acirc;y&nbsp;l&agrave; m&oacute;n ăn kho&aacute;i khẩu của nhiều người bởi&nbsp;vị ngọt thanh m&aacute;t, thơm mềm v&agrave; m&ugrave;i hương l&ocirc;i cuốn kh&ocirc;ng thể cưỡng nổi.&nbsp;&nbsp;</p>

<p><img src="https://file.hstatic.net/1000191320/file/98263c04256645cfae5e1301d1c1c2e5_grande.jpg" style="display:block; margin-left:auto; margin-right:auto" /></p>

<p><strong>1. Nguy&ecirc;n liệu</strong></p>

<p>- Cua đồng: 1kg (c&oacute; thể mua loại chế biến sẵn tại c&aacute;c cửa h&agrave;ng B&aacute;c T&ocirc;m)</p>

<p>- Bắp b&ograve;: 500gr.</p>

<p>- Sườn non: 500gr.</p>

<p>- Đậu hũ: 5 miếng.</p>

<p>- B&uacute;n sợi nhỏ: 1.5kg.</p>

<p>- C&agrave; chua: 3 tr&aacute;i.</p>

<p>- Tỏi: 1 củ</p>

<p>- Ớt: 2 tr&aacute;i.</p>

<p>- Rau sống: Rau muống b&agrave;o, hoa chuối, x&agrave; l&aacute;ch, t&iacute;a t&ocirc;, kinh giới, gi&aacute; v&agrave; ng&ograve; t&agrave;u.</p>

<p>- Mẻ, dấm bỗng, mắm t&ocirc;m: mỗi thứ 1 ch&eacute;n nhỏ.</p>

<p>- Hạt n&ecirc;m, đường, muối v&agrave; dầu ăn.</p>

<p><strong>2. Sơ chế nguy&ecirc;n liệu</strong></p>

<p>Tỏi b&oacute;c vỏ, rửa sạch rồi đem đập dập, băm nhỏ, để ri&ecirc;ng. C&agrave; chua cắt bỏ cuống, rửa sạch rồi đem xắt m&uacute;i cau. Ớt bỏ cuống, rửa sạch rồi xắt l&aacute;t nhỏ, để ri&ecirc;ng.</p>

<p>Rau sống gồm rau muống b&agrave;o, hoa chuối, x&agrave; l&aacute;ch, t&iacute;a t&ocirc;, kinh giới, gi&aacute; v&agrave; ng&ograve; t&agrave;u đem lặt sạch, rửa kỹ rồi ng&acirc;m nước muối pha lo&atilde;ng 15 ph&uacute;t rồi xả lại với nước sạch, vẩy kh&ocirc; v&agrave; để r&aacute;o.</p>

<p>Đậu hũ rửa sạch v&agrave; cắt miếng vừa ăn rồi để ri&ecirc;ng.</p>

<p>Sườn non rửa sạch, để r&aacute;o. Sau đ&oacute; ướp với sườn non với 1 muỗng cafe hạt n&ecirc;m, 1/2 muỗng muối, 1/2 muỗng đường v&agrave; 1/2 muỗng tỏi băm nhỏ. Bạn trộn đều v&agrave; để 30 ph&uacute;t cho sườn thấm gia vị.</p>

<p>Bắp b&ograve; rửa sạch với nước muối pha lo&atilde;ng rồi xả lại với nước sạch v&agrave; để r&aacute;o. Sau đ&oacute;, xắt bắp b&ograve; th&agrave;nh những miếng mỏng vừa ăn. Sau khi xắt xong, bạn ướp bắp b&ograve; với 1 muỗng cafe hạt n&ecirc;m v&agrave; để khoảng 30 ph&uacute;t cho bắp b&ograve; thấm gia vị rồi xếp bắp b&ograve; ra đĩa, để ri&ecirc;ng.</p>

<p>Cua đồng l&agrave;m sạch, t&aacute;ch m&igrave;nh cua để khều lấy gạch cua để ri&ecirc;ng ra ch&eacute;n nhỏ. Tiếp theo, bạn đem cua rửa sạch rồi cho v&agrave;o cối, cho th&ecirc;m ch&uacute;t muối v&agrave; gi&atilde; n&aacute;t (hoặc bạn c&oacute; thể sử dụng m&aacute;y xay sinh tố để xay cua). Sau khi gi&atilde; xong, bạn h&atilde;y lọc lấy nước v&agrave; bỏ phần x&aacute;c cua.</p>

<p><strong>3 C&aacute;ch l&agrave;m</strong></p>

<p>Bật bếp, cho sườn non v&agrave;o nồi &aacute;p suất đem ninh khoảng 15-20 ph&uacute;t cho sườn ch&iacute;n mềm.</p>

<p>Tiếp theo, phi thơm tỏi băm nhỏ v&agrave; cho phần gạch cua đ&atilde; t&aacute;ch ri&ecirc;ng l&uacute;c n&atilde;y v&agrave;o x&agrave;o ch&iacute;n, n&ecirc;m th&ecirc;m ch&uacute;t nước mắm cho vừa miệng rồi tr&uacute;t ra ch&eacute;n, để ri&ecirc;ng.</p>

<p>Tiếp nữa, bạn cho th&ecirc;m dầu ăn v&agrave;o sao cho ngập mặt chảo, chờ cho dầu s&ocirc;i th&igrave; cho đậu hũ đ&atilde; xắt miếng v&agrave;o chi&ecirc;n ch&iacute;n v&agrave;ng c&aacute;c mặt. Khi đậu hũ ch&iacute;n v&agrave;ng, vớt ra để tr&ecirc;n đĩa c&oacute; l&oacute;t sẵn giấy thấm dầu cho r&aacute;o.</p>

<p>Sau khi chi&ecirc;n đậu hũ xong, bạn cho nồi nấu lẩu l&ecirc;n bếp, cho 1 ch&uacute;t dầu chi&ecirc;n đậu hũ v&agrave;o nồi, cho th&ecirc;m 1 muỗng tỏi băm v&agrave;o phi thơm. Khi h&agrave;nh tỏi dậy m&ugrave;i thơm, bạn cho hết t&ocirc; nước lọc cua v&agrave;o, cho th&ecirc;m 1 muỗng cafe mắm t&ocirc;m, 1 muỗng hạt n&ecirc;m, 1 muỗng đường v&agrave; 1 muỗng cafe muối v&agrave;o, khuấy nhẹ tay rồi đun s&ocirc;i. Khi gạch cua nổi l&ecirc;n th&igrave; bạn cho nhỏ lửa, d&ugrave;ng v&aacute; (mu&ocirc;i) vớt hết gạch cua cho v&agrave;o c&aacute;i ch&eacute;n ri&ecirc;ng để khi ăn lẩu th&igrave; d&ugrave;ng.</p>

<p>Tiếp theo, cho c&agrave; chua v&agrave;o nồi nước lẩu, cho hết phần nước v&agrave; sườn non đ&atilde; ninh ch&iacute;n mềm v&agrave;o, cho th&ecirc;m 3 muỗng mẻ, 2 muỗng dấm bỗng v&agrave;o v&agrave; đun cho s&ocirc;i lại th&igrave; n&ecirc;m nếm cho vừa miệng.</p>

<p>Khi ăn, chỉ cần dọn hết nguy&ecirc;n liệu l&ecirc;n v&agrave; nh&uacute;ng thịt bắp b&ograve; v&agrave; rau sống v&agrave;o nồi lẩu ri&ecirc;u cua. Nếu th&iacute;ch ăn cay, bạn c&oacute; thể cho th&ecirc;m ớt theo &yacute; th&iacute;ch của bạn.</p>
', CAST(N'2021-05-14' AS Date), N'/admin/content/images/tintuchangngay/laurieuto.jpg', N'minh', 1, N'TinTucHangNgay', NULL)
INSERT [dbo].[TinTuc] ([Ma], [MaCM], [MotaNgan], [Mota], [NgayDang], [Anh], [NguoiDang], [TieuBieu], [LoaiTin], [TieuDe]) VALUES (1018, 25, N'15 phút đơn giản cho món thịt bò bít tết ngon (Beef steak)', N'<div class="rte">
<p>B&ograve; b&iacute;t tết l&agrave; m&oacute;n ăn ngon, bổ dưỡng v&agrave; được nhiều người ưa th&iacute;ch. M&oacute;n b&ograve; b&iacute;t tết n&agrave;y c&oacute; rất nhiều kiểu chế biến với những hương vị kh&aacute;c nhau. H&ocirc;m nay, B&aacute;c T&ocirc;m sẽ hưỡng dẫn cả nh&agrave; một m&oacute;n b&iacute;t tết đ&uacute;ng chuẩn với b&ograve; b&iacute;t tết, trứng ốp l&agrave; v&agrave; khoai t&acirc;y chi&ecirc;n.</p>

<p><strong>1. Nguy&ecirc;n liệu chuẩn bị</strong></p>

<ul>
	<li>Thịt b&ograve; thăn: 300gr ~ 400gr (t&ugrave;y lượng ăn)</li>
	<li>Khoai t&acirc;y</li>
	<li>H&agrave;nh t&acirc;y</li>
	<li>X&agrave; l&aacute;ch</li>
	<li>Dưa chuột</li>
	<li>Trứng</li>
	<li>Gia vị: đường, ti&ecirc;u, dầu olive, muối, giấm, dầu h&agrave;o, bột năng&nbsp;</li>
</ul>

<p><strong>2. C&aacute;ch chế biến</strong></p>

<ul>
	<li><strong>Sơ chế</strong></li>
</ul>

<p>Thịt b&ograve; sau khi mua về rửa sạch, để r&aacute;o nước, d&ugrave;ng khăn giấy lau kh&ocirc; rồi th&aacute;i th&agrave;nh những l&aacute;t mỏng vừa ăn. Tiếp theo, bạn quay ngược c&aacute;n dao lại, d&ugrave;ng đầu c&aacute;n dao đập đập tr&ecirc;n bề mặt thịt (kh&ocirc;ng sợ n&aacute;t thịt đ&acirc;u ạ, v&igrave; l&aacute;t nữa tẩm ướp thịt b&ograve; lại tự co v&agrave;o)</p>

<p>Đem thịt b&ograve; ướp với 1 ch&uacute;t muối, 1 th&igrave;a dầu h&agrave;o (c&oacute; thể thay bằng dầu ăn), 1 th&igrave;a c&agrave; ph&ecirc; bột năng. Trộn đều thịt b&ograve; với hỗn hợp gia vị tr&ecirc;n rồi để nguy&ecirc;n trong khoảng 15 ph&uacute;t để thịt ngấm gia vị v&agrave; mềm hơn.</p>

<p><img src="https://file.hstatic.net/1000191320/file/dap-mem-thit_grande.jpg" style="display:block; margin-left:auto; margin-right:auto" /></p>

<p>Tiếp theo, khoai t&acirc;y rửa sạch, gọt vỏ, cắt th&agrave;nh từng sợ vừa ăn như ng&oacute;n &uacute;t rồi ng&acirc;m với nước lạnh pha th&ecirc;m ch&uacute;t muối. Sau khi ng&acirc;m 30 ph&uacute;t th&igrave; vớt ra để t&aacute;o rồi đem đi chi&ecirc;n v&agrave;ng.</p>

<p>H&agrave;nh t&acirc;y b&oacute;c vỏ, rửa sạch, cắt cạnh d&agrave;y khoảng 2 cm rồi đem ng&acirc;m với nước.</p>

<p>Rau x&agrave; l&aacute;ch sau khi nhặt bỏ phần hư, rửa sạch th&igrave; đem cắt kh&uacute;c ngắn vừa ăn v&agrave; trộn đều với 1 &iacute;t muối, &iacute;t đường v&agrave; 1 &iacute;t giấm sao cho c&oacute; vị hơi chua chua ngọt ngọt l&agrave; được.</p>

<p>Dưa leo cắt bỏ cuống, rửa sạch rồi cắt l&aacute;t vừa ăn. Sau đ&oacute; đem dưa leo trộn với 1 &iacute;t muối, &iacute;t đường v&agrave; 1 &iacute;t giấm, n&ecirc;m c&oacute; vị hơi chua chua ngọt ngọt l&agrave; được.</p>

<ul>
	<li><strong>Chế biến</strong></li>
</ul>

<p>Tiếp theo, bạn đập 1 quả trứng g&agrave; v&agrave;o rồi th&ecirc;m 1 pate v&agrave; h&agrave;nh t&acirc;y v&agrave;o.</p>

<p>Sau đ&oacute;, bạn tắt bếp, nhấc chảo ra, do chảo vẫn đang c&ograve;n n&oacute;ng n&ecirc;n trứng c&agrave; h&agrave;nh t&acirc;y sẽ tiếp tục ch&iacute;n.</p>

<p>Bạn c&oacute; thể rắc th&ecirc;m v&agrave;i cọng ng&ograve; gai v&agrave; ti&ecirc;u l&ecirc;n cho m&oacute;n ăn th&ecirc;m đậm đ&agrave;. Khi ăn m&oacute;n b&ograve; b&iacute;t tết với trứng ốp la n&agrave;y, bạn trộn đều trứng, thịt b&ograve; v&agrave; ăn k&egrave;m với khoai t&acirc;y chi&ecirc;n, b&aacute;nh m&igrave; c&ugrave;ng dưa leo, rau x&agrave; l&aacute;ch chua ngọt l&agrave; tuyệt nhất.</p>

<p><img src="https://file.hstatic.net/1000191320/file/bo-bit-tet-ba-duy_2012913105840286_grande.jpg" style="display:block; margin-left:auto; margin-right:auto" /></p>

<p>Vậy chỉ trong thời gian ngắn l&agrave; gia đ&igrave;nh c&oacute; thể thưởng thức m&oacute;n b&ograve; b&iacute;t tết vừa ngon vừa dễ l&agrave;m rồi.</p>
</div>
', CAST(N'2021-05-14' AS Date), N'/admin/content/images/tintuchangngay/bittetto.jpg', N'minh', 1, N'TinTucHangNgay', NULL)
INSERT [dbo].[TinTuc] ([Ma], [MaCM], [MotaNgan], [Mota], [NgayDang], [Anh], [NguoiDang], [TieuBieu], [LoaiTin], [TieuDe]) VALUES (1019, 25, N'CÁ HỒI ORGANIC VIKENCO - HƯƠNG VỊ CỦA TỰ NHIÊN !', N'<p>C&aacute; hồi organic Vikenco với sắc m&agrave;u quyến rũ c&ugrave;ng vị ngon tuyệt vời tự nhi&ecirc;n tuyệt vời sẽ hấp dẫn c&aacute;c mẹ ngay từ lần đầu ti&ecirc;n!</p>

<p>.</p>

<p>C&Aacute; HỒI ORGANIC VIKENCO L&Agrave; G&Igrave; ?<br />
.<br />
✔Vikenco l&agrave; farm nu&ocirc;i c&aacute; hồi được h&igrave;nh th&agrave;nh v&agrave; ph&aacute;t triển l&acirc;u đời tại Nauy với hơn 40 năm kinh nghiệm trong ng&agrave;nh, cụ thể mời chị em tham khảo tại link dưới đ&acirc;y: http://www.vikenco.no/<br />
✔Với farm Vikenco, c&aacute; hồi được nu&ocirc;i theo ti&ecirc;u chuẩn Organic v&agrave; được 2 tổ chức độc lập kiểm so&aacute;t, đ&aacute;nh gi&aacute;, cấp chứng nhận l&agrave; Euro Leaf (Thường gọi l&agrave; l&aacute; xanh) v&agrave;</p>

<p>Debio.</p>

<p><img src="https://file.hstatic.net/1000191320/file/11_master.jpg" style="float:left" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>1. Debio Nauy : http://www.debio.no/<br />
2. Euro Leaf: http://www.euroleaf.org/<br />
Đ&acirc;y l&agrave; một trong những cơ quan quản l&yacute; ch&iacute;nh trong việc kiểm so&aacute;t chất lượng nu&ocirc;i trồng của Vikenco.</p>

<p>????C&Aacute; HỒI VIKENCO C&Oacute; G&Igrave; KH&Aacute;C BIỆT?</p>

<p><img src="https://file.hstatic.net/1000191320/file/12_master.jpg" /></p>

<p>✔Giống thuần chủng Alantic Salmon<br />
✔100% C&aacute; hồi được sống trong m&ocirc;i trường tự nhi&ecirc;n, mật độ nu&ocirc;i l&agrave; 10Kg/m3<br />
✔Thức ăn non - GMO được kiểm so&aacute;t bởi MSC<br />
✔Mầu sắc c&aacute; hồi v&agrave;ng cam tự nhi&ecirc;n với độ mượt m&agrave; quyến rũ<br />
✔&lt;3 Sử dụng c&aacute;c loại thi&ecirc;n địch để ti&ecirc;u diệt rận biển<br />
✔ Kh&ocirc;ng sử dụng c&aacute;c loại h&oacute;a chất để l&agrave;m sạch bề mặt lưới chuồng nu&ocirc;i, kh&ocirc;ng sử dụng c&aacute;c h&oacute;a chất c&oacute; gốc đồng, gốc dầu.To&agrave;n bộ l&agrave;m việc bằng m&aacute;y m&oacute;c hoặc thủ c&ocirc;ng.<br />
✔ C&aacute; LU&Ocirc;N LU&Ocirc;N được Fillet v&agrave; sơ chế trong ng&agrave;y để đảm bảo độ tươi ngon của sản phẩm</p>

<p><img src="https://file.hstatic.net/1000191320/file/13_master.jpg" /></p>

<p>↪Quy tr&igrave;nh nu&ocirc;i c&aacute; chi tiết theo link:<br />
http://www.salmar.no/en/norwegian-organic-salmon-farmed-processed-and-sold-by-salmar<br />
????HƯƠNG VỊ TỰ NHI&Ecirc;N TUYỆT VỜI !<br />
.<br />
✔Độ dai gi&ograve;n, B&Eacute;O NGẬY &amp; ĐẬM Đ&Agrave; m&agrave; c&aacute; hồi thường kh&ocirc;ng thể so s&aacute;nh. Từng hạt mỡ ngậy nhưng kh&ocirc;ng ngấy, kh&ocirc;ng ướt. Khi ăn B&Eacute;O B&Ugrave;I l&agrave;m m&igrave;nh gắp, lại gắp =)).????????????<br />
✔C&aacute;c v&acirc;n mỡ, c&aacute;c m&ocirc; li&ecirc;n kết h&ograve;a quyện MƯỢT M&Agrave; với m&agrave;u V&Agrave;NG NGHỆ cho miếng phile ho&agrave;n hảo<br />
.<br />
♊C&aacute; về đầy đủ tem, m&aacute;c, nh&atilde;n đầu th&ugrave;ng, số palet, m&atilde; chứng nhận tr&ecirc;n đầu th&ugrave;ng với c&aacute; hồi Organic.</p>

<p><img src="https://file.hstatic.net/1000191320/file/14_master.jpg" /></p>

<p>Để bảo vệ sức khỏe của m&igrave;nh v&agrave; cả gia đ&igrave;nh, đầu bếp nh&agrave; B&aacute;c T&ocirc;m khuy&ecirc;n c&aacute;c chị em nội trợ n&ecirc;n mua c&aacute; hồi thường xuy&ecirc;n v&agrave; ăn 2 lần tr&ecirc;n một tuần bởi c&aacute; hồi gi&uacute;p giảm lượng Cholesterol c&oacute; trong m&aacute;u, giảm huyết &aacute;p v&agrave; c&aacute;c chứng đau khớp thất thường.. Đặc biệt với những người hay h&uacute;t thuốc l&aacute; th&igrave; c&aacute; hồi l&agrave; một lựa chọn hết sức th&ocirc;ng minh v&igrave; n&oacute; c&oacute; khả năng hạn chế v&agrave; giảm t&aacute;c hại của thuốc l&aacute; rất tốt.</p>

<p>B&aacute;c T&ocirc;m đảm bảo sẽ mang đến cho c&aacute;c kh&aacute;ch h&agrave;ng những thực phẩm tươi ngon nhất với chất lượng tốt nhất, xuất xứ đảm bảo nhất cũng như mức gi&aacute; hợp l&iacute; nhất.</p>
', CAST(N'2021-05-14' AS Date), N'/admin/content/images/tintuchangngay/cahoito.jpg', N'minh', 1, N'TinTucHangNgay', NULL)
SET IDENTITY_INSERT [dbo].[Sp] OFF
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_SP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SP] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_SP]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([Ma])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[SP]  WITH CHECK ADD  CONSTRAINT [FK_SP_LoaiSP] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSP] ([Ma])
GO
ALTER TABLE [dbo].[SP] CHECK CONSTRAINT [FK_SP_LoaiSP]
GO
ALTER TABLE [dbo].[TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TinTuc_ChuyenMuc] FOREIGN KEY([MaCM])
REFERENCES [dbo].[ChuyenMuc] ([Ma])
GO
ALTER TABLE [dbo].[TinTuc] CHECK CONSTRAINT [FK_TinTuc_ChuyenMuc]
GO
USE [master]
GO
ALTER DATABASE [OrganicFoodStore] SET  READ_WRITE 
GO
