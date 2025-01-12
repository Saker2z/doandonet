USE [master]
GO
/****** Object:  Database [QL_ThuVien]    Script Date: 20/10/2023 12:09:36 PM ******/
CREATE DATABASE [QL_ThuVien]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_ThuVien', FILENAME = N'D:\Program\Microsoft SQL Server\MSSQL16.PHUOCDAT\MSSQL\DATA\QL_ThuVien.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QL_ThuVien_log', FILENAME = N'D:\Program\Microsoft SQL Server\MSSQL16.PHUOCDAT\MSSQL\DATA\QL_ThuVien_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_ThuVien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_ThuVien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_ThuVien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_ThuVien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_ThuVien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_ThuVien] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_ThuVien] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QL_ThuVien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_ThuVien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_ThuVien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_ThuVien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_ThuVien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_ThuVien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_ThuVien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_ThuVien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_ThuVien] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QL_ThuVien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_ThuVien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_ThuVien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_ThuVien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_ThuVien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_ThuVien] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_ThuVien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_ThuVien] SET RECOVERY FULL 
GO
ALTER DATABASE [QL_ThuVien] SET  MULTI_USER 
GO
ALTER DATABASE [QL_ThuVien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_ThuVien] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QL_ThuVien] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QL_ThuVien] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QL_ThuVien] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QL_ThuVien] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QL_ThuVien', N'ON'
GO
ALTER DATABASE [QL_ThuVien] SET QUERY_STORE = ON
GO
ALTER DATABASE [QL_ThuVien] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QL_ThuVien]
GO
/****** Object:  Table [dbo].[DocGia]    Script Date: 20/10/2023 12:09:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocGia](
	[MaDocGia] [varchar](20) NOT NULL,
	[TenDocGia] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTInh] [nvarchar](10) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[NgayLamThe] [date] NULL,
	[SoDT] [varchar](12) NULL,
 CONSTRAINT [PK_DocGia] PRIMARY KEY CLUSTERED 
(
	[MaDocGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DSQuaHan]    Script Date: 20/10/2023 12:09:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DSQuaHan](
	[MaPhieuMuon] [varchar](50) NOT NULL,
	[SoNgayTre] [int] NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_DSQuaHan] PRIMARY KEY CLUSTERED 
(
	[MaPhieuMuon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuMuon]    Script Date: 20/10/2023 12:09:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuMuon](
	[MaPhieuMuon] [varchar](50) NOT NULL,
	[MaDocGia] [varchar](20) NULL,
	[MaSach] [varchar](20) NULL,
	[MaQuanLy] [varchar](10) NULL,
	[TenSach] [nvarchar](80) NULL,
	[TenDocGia] [nvarchar](60) NULL,
	[SoLuongMuon] [int] NULL,
	[NgayMuon] [date] NULL,
	[HenTra] [date] NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[TenNhanVien] [nvarchar](80) NULL,
 CONSTRAINT [PK_PhieuMuon] PRIMARY KEY CLUSTERED 
(
	[MaPhieuMuon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuTra]    Script Date: 20/10/2023 12:09:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuTra](
	[MaPhieuMuon] [varchar](50) NOT NULL,
	[MaSach] [varchar](20) NOT NULL,
	[SoLuongMuon] [int] NULL,
	[NgayMuon] [date] NULL,
	[HenTra] [date] NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhieuTra_1] PRIMARY KEY CLUSTERED 
(
	[MaPhieuMuon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuanLy]    Script Date: 20/10/2023 12:09:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanLy](
	[MaQuanLy] [varchar](10) NOT NULL,
	[TenQuanLy] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[DiaChi] [nvarchar](60) NULL,
	[NgayVL] [date] NULL,
	[SoDT] [varchar](12) NULL,
	[AnhThe] [image] NULL,
	[VaiTro] [nvarchar](20) NULL,
	[MatKhau] [varchar](50) NULL,
 CONSTRAINT [PK_QuanLy] PRIMARY KEY CLUSTERED 
(
	[MaQuanLy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 20/10/2023 12:09:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[MaSach] [varchar](20) NOT NULL,
	[TenSach] [nvarchar](50) NULL,
	[AnhBia] [image] NULL,
	[NhaXB] [nvarchar](50) NULL,
	[MoTa] [nvarchar](500) NULL,
	[SoLuong] [int] NULL,
	[MaTheLoai] [varchar](10) NULL,
	[MaTacGia] [varchar](10) NULL,
	[NamXuatBan] [int] NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 20/10/2023 12:09:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[MaTacGia] [varchar](10) NOT NULL,
	[TenTacGia] [nvarchar](70) NULL,
	[NamSinh] [date] NULL,
	[TieuSu] [nvarchar](500) NULL,
	[QueQuan] [nvarchar](50) NULL,
 CONSTRAINT [PK_TacGia] PRIMARY KEY CLUSTERED 
(
	[MaTacGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 20/10/2023 12:09:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TaiKhoan_1] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC,
	[MatKhau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 20/10/2023 12:09:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaTheLoai] [varchar](10) NOT NULL,
	[TenTheLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [AnhBia], [NhaXB], [MoTa], [SoLuong], [MaTheLoai], [MaTacGia], [NamXuatBan]) VALUES (N'SH001', N'Truyện Kiều', NULL, N'Trẻ', N'Truyện Kiều là một truyện thơ của đại thi hào Nguyễn Du. Đây được xem là truyện thơ nổi tiếng nhất và xét vào hàng kinh điển trong văn học Việt Nam, tác phẩm được viết bằng chữ Nôm, theo thể lục bát, gồm 3.254 câu.', 20, N'TL001', N'TG001', 2010)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [AnhBia], [NhaXB], [MoTa], [SoLuong], [MaTheLoai], [MaTacGia], [NamXuatBan]) VALUES (N'SH002', N'Kim, Vân, Kiều', NULL, N'Hồng Đức', N'Kim, Vân, Kiều là tiểu thuyết chương hồi của Thanh Tâm Tài nhân - Tác giả đời nhà Minh, Trung Quốc. Nguyễn Du lấy cảm hứng từ tác phẩm này viết nên "Truyện Kiều" - Áng văn bất hủ của văn chương Việt Nam.', 5, N'TL001', N'TG001', 2012)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [AnhBia], [NhaXB], [MoTa], [SoLuong], [MaTheLoai], [MaTacGia], [NamXuatBan]) VALUES (N'SH003', N'Đất rừng phương Nam', NULL, N'Kim Đồng', N'Đất rừng phương Nam là tiểu thuyết của nhà văn Đoàn Giỏi viết về cuộc đời phiêu bạt của cậu bé tên An. Bối cảnh của tiểu thuyết là miền Tây Nam Bộ, Việt Nam vào những năm 1930, sau khi thực dân Pháp quay trở lại xâm chiếm Nam Bộ.', 9, N'TL002', N'TG002', 2022)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [AnhBia], [NhaXB], [MoTa], [SoLuong], [MaTheLoai], [MaTacGia], [NamXuatBan]) VALUES (N'SH004', N'Cá bống mú', NULL, N'Văn Học', N'Truyện ngắn Cá bống mú ra đời dưới ngòi bút tài hoa của nhà văn Đoàn Giỏi. Đây là một trong những tác phẩm cho thấy cuộc sống của người dân Nam Bộ khi phải chịu khổ cực, bị đàn áp, bóc lột dã man dưới tay bọn thực dân và cường hào, địa chủ.', 11, N'TL002', N'TG002', 2022)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [AnhBia], [NhaXB], [MoTa], [SoLuong], [MaTheLoai], [MaTacGia], [NamXuatBan]) VALUES (N'SH005', N'Hoa Hướng Dương', NULL, N'Kim Đồng', N'Truyện đã khắc họa vùng đất, tâm hồn người miền Tây thời kỳ trước Cách mạng tháng Tám vô cùng ấn tượng. Hành trình của người mẹ cũng là người chiến sĩ can trường sinh con trong muôn ngàn nguy biến, lồng ghép tuyệt vời với văn hóa sông nước Nam bộ hiện lên sống động, lôi cuốn như những thước phim hay nhất về chiến tranh và sức sống con người.', 14, N'TL003', N'TG002', 2022)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [AnhBia], [NhaXB], [MoTa], [SoLuong], [MaTheLoai], [MaTacGia], [NamXuatBan]) VALUES (N'SH006', N'Dế Mèn Phiêu Lưu Ký', NULL, N'Kim Đồng', N' "Dế Mèn phiêu lưu kí" là một trong những sáng tác tâm đắc nhất của nhà văn Tô Hoài. Tác phẩm đã được tái bản nhiều lần và được dịch ra hơn 20 thứ tiếng trên thế giới và luôn được các thế hệ độc giả nhỏ tuổi đón nhận. Tác phẩm đã được xuất bản với nhiều hình thức khác nhau.', 18, N'TL002', N'TG003', 2022)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [AnhBia], [NhaXB], [MoTa], [SoLuong], [MaTheLoai], [MaTacGia], [NamXuatBan]) VALUES (N'SH007', N'Kim Đồng', NULL, N'Kim Đồng', N'Cuốn sách là câu chuyện cảm động về một trong những đội viên đầu tiên của Đội Thiếu niên Tiền phong Hồ Chí Minh - anh Kim Đồng.', 11, N'TL004', N'TG003', 2022)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [AnhBia], [NhaXB], [MoTa], [SoLuong], [MaTheLoai], [MaTacGia], [NamXuatBan]) VALUES (N'SH008', N'Chiều Chiều', NULL, N'Hội Nhà Văn', N'Chiều Chiều là con sông dài, qua bao nhiêu ghềnh thác vẫn tiếp tục xuôi dòng hồi ức 80 năm của Tô Hoài, mà vẫn chưa hò hẹn ngày xuống đồng bằng hay đổ ra biển cả. Vậy Chiều Chiều đã mang lại cho người đọc những cảm thụ gì mới? So với những tự truyện trước, Chiều Chiều nặng phần phê phán thời đại mà tác giả đã trải qua; ở các tác phẩm trước, Tô Hoài thường bao che, bào chữa, như là một hồi ký bao cấp.', 3, N'TL002', N'TG003', 2022)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [AnhBia], [NhaXB], [MoTa], [SoLuong], [MaTheLoai], [MaTacGia], [NamXuatBan]) VALUES (N'SH009', N'Thơ Thơ', NULL, N'Hội Nhà Văn', N'Thơ Thơ là tên một tập thơ được xuất bản năm 1938, là tập thơ đầu tay của xuân diệu, cùng với Gửi hương cho gió, cho đến nay vẫn là hai tác phẩm nổi bật nhất của Xuân Diệu.', 4, N'TL001', N'TG004', 2022)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [AnhBia], [NhaXB], [MoTa], [SoLuong], [MaTheLoai], [MaTacGia], [NamXuatBan]) VALUES (N'SH010', N'Những ngày lưu lạc', NULL, N'Văn Học', N'“Những ngày lưu lạc” nằm trong Bộ ba tiểu thuyết thiếu nhi Từ giã tuổi thơ - Những ngày lưu lạc - Đảo đá kỳ lạ của Nguyễn Minh Châu. Tác phẩm là câu chuyện về cuộc đời của chú bé Nến, bố mẹ bị giặc giết hại, chú lưu lạc khắp nơi.', 8, N'TL002', N'TG005', 2022)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [AnhBia], [NhaXB], [MoTa], [SoLuong], [MaTheLoai], [MaTacGia], [NamXuatBan]) VALUES (N'SH011', N'Đảo đá kì lạ', NULL, N'Kim Đồng', N'Sau Những ngày lưu lạc, chú bé Nến tình cờ được đưa đến Đảo đá kì lạ. Tại đây, cậu bé đã gặp lại người du kích đồng hương, biết giá trị của loại đá quý hiếm trên đảo và quyết tâm giữ gìn tài nguyên của đất nước của các chiến sĩ cách mạng bị giam cầm trên đảo.', 13, N'TL002', N'TG005', 2022)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [AnhBia], [NhaXB], [MoTa], [SoLuong], [MaTheLoai], [MaTacGia], [NamXuatBan]) VALUES (N'SH012', N'Từ giã tuổi thơ', NULL, N'Văn Học', N'“Từ giã tuổi thơ” nằm trong Bộ ba tiểu thuyết thiếu nhi Từ giã tuổi thơ - Những ngày lưu lạc - Đảo đá kỳ lạ  của Nguyễn Minh Châu. Tác phẩm viết về cuộc đời của chú bé Nến, bố mẹ bị giặc giết hại, chú lưu lạc khắp nơi, về quê cũ, bị địch bắt đi phu, bắt ra đảo hoang… Nhưng trong hoàn cảnh nào chú vẫn giữ được  tình yêu quê hương đất nước và lòng căm thù giặc.', 22, N'TL002', N'TG005', 2022)
GO
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NamSinh], [TieuSu], [QueQuan]) VALUES (N'TG001', N'Nguyễn Du', CAST(N'1765-01-03' AS Date), N'Nguyễn Du là một nhà thơ, nhà văn hóa lớn thời Lê mạt Nguyễn sơ ở Việt Nam. Ông được người Việt kính trọng tôn xưng là "Đại thi hào dân tộc" và được UNESCO vinh danh là "Danh nhân văn hóa thế giới".', N'Hà Tĩnh')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NamSinh], [TieuSu], [QueQuan]) VALUES (N'TG002', N'Đoàn Giỏi', CAST(N'1925-05-17' AS Date), N'Đoàn Giỏi là một nhà văn Việt Nam, hội viên Hội Nhà văn Việt Nam từ năm 1957. Ông có những bút danh khác như: Nguyễn Hoài, Nguyễn Phú Lễ, Huyền Tư.', N'Mỹ Tho')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NamSinh], [TieuSu], [QueQuan]) VALUES (N'TG003', N'Tô Hoài', CAST(N'1920-09-27' AS Date), N'Tô Hoài là một nhà văn Việt Nam. Ông được nhà nước Việt Nam trao tặng Giải thưởng Hồ Chí Minh về Văn học – Nghệ thuật.', N'Hà Nội')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NamSinh], [TieuSu], [QueQuan]) VALUES (N'TG004', N'Xuân Diệu', CAST(N'1916-02-02' AS Date), N'uân Diệu còn được mệnh danh là "ông hoàng thơ tình".', N'Bình Định')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NamSinh], [TieuSu], [QueQuan]) VALUES (N'TG005', N'Nguyễn Minh Châu', CAST(N'1930-10-20' AS Date), N'Nguyễn Minh Châu là một nhà văn có ảnh hưởng quan trọng đối với văn học Việt Nam trong giai đoạn chiến tranh Việt Nam và thời kỳ đầu của đổi mới.', N'Nghệ An')
GO
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL001', N'Truyện thơ')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL002', N'Tiểu thuyết')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL003', N'Truyện dài')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL004', N'Truyện ngắn')
GO
ALTER TABLE [dbo].[DSQuaHan]  WITH CHECK ADD  CONSTRAINT [FK_DSQuaHan_PhieuMuon] FOREIGN KEY([MaPhieuMuon])
REFERENCES [dbo].[PhieuMuon] ([MaPhieuMuon])
GO
ALTER TABLE [dbo].[DSQuaHan] CHECK CONSTRAINT [FK_DSQuaHan_PhieuMuon]
GO
ALTER TABLE [dbo].[PhieuMuon]  WITH CHECK ADD  CONSTRAINT [FK_PhieuMuon_DocGia] FOREIGN KEY([MaDocGia])
REFERENCES [dbo].[DocGia] ([MaDocGia])
GO
ALTER TABLE [dbo].[PhieuMuon] CHECK CONSTRAINT [FK_PhieuMuon_DocGia]
GO
ALTER TABLE [dbo].[PhieuMuon]  WITH CHECK ADD  CONSTRAINT [FK_PhieuMuon_QuanLy] FOREIGN KEY([MaQuanLy])
REFERENCES [dbo].[QuanLy] ([MaQuanLy])
GO
ALTER TABLE [dbo].[PhieuMuon] CHECK CONSTRAINT [FK_PhieuMuon_QuanLy]
GO
ALTER TABLE [dbo].[PhieuTra]  WITH CHECK ADD  CONSTRAINT [FK_PhieuTra_PhieuMuon] FOREIGN KEY([MaPhieuMuon])
REFERENCES [dbo].[PhieuMuon] ([MaPhieuMuon])
GO
ALTER TABLE [dbo].[PhieuTra] CHECK CONSTRAINT [FK_PhieuTra_PhieuMuon]
GO
ALTER TABLE [dbo].[PhieuTra]  WITH CHECK ADD  CONSTRAINT [FK_PhieuTra_Sach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[PhieuTra] CHECK CONSTRAINT [FK_PhieuTra_Sach]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_TacGia] FOREIGN KEY([MaTacGia])
REFERENCES [dbo].[TacGia] ([MaTacGia])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_TacGia]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_TheLoai] FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[TheLoai] ([MaTheLoai])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_TheLoai]
GO
USE [master]
GO
ALTER DATABASE [QL_ThuVien] SET  READ_WRITE 
GO

 INSERT INTO QuanLy VALUES('ADMIN', 'ADMIN001', '2003/02/25', 'Nam', 'SG', '2023/11/13', '234', null, 'ADMIN', '123')











CREATE TRIGGER CreatePhieuTraOnInsert
ON PhieuMuon
AFTER INSERT
AS
BEGIN
    -- Lấy thông tin từ phiếu Mượn
    DECLARE @maPhieuMuon NVARCHAR(50)
    DECLARE @maSach NVARCHAR(20)
    DECLARE @soLuongMuon INT
    DECLARE @ngayMuon DATE
    DECLARE @henTra DATE
	DECLARE @tinhTrang Nvarchar(50)

    SELECT @maPhieuMuon = i.MaPhieuMuon,
           @maSach = i.MaSach,
           @soLuongMuon = i.SoLuongMuon,
           @ngayMuon = i.NgayMuon,
		   @tinhTrang =  i.TinhTrang,
           @henTra = i.HenTra
	
    FROM inserted i

    -- Tạo phiếu Trả
    INSERT INTO PhieuTra (MaPhieuMuon, MaSach, SoLuongMuon, NgayMuon, HenTra, TinhTrang, GhiChu)
    VALUES (@maPhieuMuon, @maSach, @soLuongMuon, @ngayMuon, @henTra, @tinhTrang, N'Chưa xử lý')
END
///


CREATE TRIGGER UpdatePhieuTraOnPhieuMuonUpdate
ON PhieuMuon
AFTER UPDATE
AS
BEGIN
    -- Check if the relevant columns have been updated
    IF UPDATE(MaSach) OR UPDATE(SoLuongMuon) OR UPDATE(NgayMuon) OR UPDATE(HenTra) OR UPDATE(TinhTrang)
    BEGIN
        -- Lấy thông tin từ phiếu Mượn
        DECLARE @maPhieuMuon NVARCHAR(50)
        DECLARE @maSach NVARCHAR(20)
        DECLARE @soLuongMuon INT
        DECLARE @ngayMuon DATE
        DECLARE @henTra DATE
		DECLARE @tinhTrang nvarchar(50)

        SELECT @maPhieuMuon = i.MaPhieuMuon,
               @maSach = i.MaSach,
               @soLuongMuon = i.SoLuongMuon,
               @ngayMuon = i.NgayMuon,
               @henTra = i.HenTra,
			   @tinhTrang = i.TinhTrang
        FROM inserted i

        -- Kiểm tra xem thông tin đã tồn tại trong bảng PhieuTra
        IF EXISTS (SELECT 1 FROM PhieuTra WHERE MaPhieuMuon = @maPhieuMuon)
        BEGIN
            -- Thực hiện cập nhật thông tin trong bảng PhieuTra
            UPDATE PhieuTra
            SET MaSach = @maSach,
                SoLuongMuon = @soLuongMuon,
                NgayMuon = @ngayMuon,
                HenTra = @henTra,
				TinhTrang = @tinhTrang
            WHERE MaPhieuMuon = @maPhieuMuon
        END
     
    END
END
//

CREATE TRIGGER UpdatePhieuMuonOnDocGiaUpdate
ON DocGia
AFTER UPDATE
AS
BEGIN
    -- Kiểm tra xem có sự thay đổi trong các cột cần quan tâm của bảng DocGia
    IF UPDATE(TenDocGia)
    BEGIN
        -- Cập nhật bảng PhieuMuon với thông tin mới từ bảng DocGia
        UPDATE PhieuMuon
        SET TenDocGia = inserted.TenDocGia
        FROM PhieuMuon
        INNER JOIN inserted ON PhieuMuon.MaDocGia = inserted.MaDocGia;
    END
END
//

CREATE TRIGGER UpdatePhieuMuonOnSachUpdate
ON Sach
AFTER UPDATE
AS
BEGIN
    -- Kiểm tra xem có sự thay đổi trong cột TenSach
    IF UPDATE(TenSach)
    BEGIN
        -- Cập nhật bảng PhieuMuon với thông tin mới từ bảng Sach
        UPDATE PhieuMuon
        SET TenSach = i.TenSach
        FROM PhieuMuon
        INNER JOIN inserted i ON PhieuMuon.MaSach = i.MaSach;
    END
END




----------------------------
CREATE PROCEDURE SearchPhieuMuonByMaDocGia
    @MaDocGia varchar(20)
AS
BEGIN
    SELECT *
    FROM PhieuMuon
    WHERE MaDocGia = @MaDocGia
END
-----------------------------------------------------------------------
CREATE PROCEDURE SearchTheLoai_Ma
    @MaTheLoai varchar(20)
AS
BEGIN
    SELECT *
    FROM TheLoai
    WHERE MaTheLoai = @MaTheLoai
END
-----------------------------------------------------------------------
CREATE PROCEDURE SearchTheLoai_Ten
    @Ten Nvarchar(50)
AS
BEGIN
    SELECT *
    FROM TheLoai
    WHERE TenTheLoai = @Ten
END
-------------------------------------------------------------------------
CREATE PROCEDURE SearchTacGia_Ten
    @Ten Nvarchar(50)
AS
BEGIN
    SELECT *
    FROM TacGia
    WHERE TenTacGia = @Ten
END
-----------------------------------------------------------------------
CREATE PROCEDURE SearchTacGia_Ma
    @Ma Nvarchar(50)
AS
BEGIN
    SELECT *
    FROM TacGia
    WHERE MaTacGia = @Ma
END
----------------------------------------------------------------------------
CREATE PROCEDURE SearchPhieuMuonByMaSach
    @MaSach varchar(20)
AS
BEGIN
    SELECT *
    FROM PhieuMuon
    WHERE MaSach = @MaSach
END
---------------------------------------------------------------
CREATE PROCEDURE SearchTraMuonByMaPM
    @Ma varchar(20)
AS
BEGIN
    SELECT *
    FROM PhieuTra
    WHERE MaPhieuMuon = @Ma
END
----------------------------------------------
CREATE PROCEDURE SearchTraMuonByMaSach
    @Ma varchar(20)
AS
BEGIN
    SELECT *
    FROM PhieuTra
    WHERE MaSach = @Ma
END
-------------------------------------------------------------------

CREATE PROCEDURE SearchPhieuMuonByMaPM
    @MAPM varchar(20)
AS
BEGIN
    SELECT *
    FROM PhieuMuon
    WHERE MaPhieuMuon = @MAPM
END