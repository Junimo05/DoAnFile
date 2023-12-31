USE [master]
GO
/****** Object:  Database [QLBA_Final]    Script Date: 28/06/2023 5:58:58 CH ******/
CREATE DATABASE [QLBA_Final]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBA_Final', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.NAT05\MSSQL\DATA\QLBA_Final.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLBA_Final_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.NAT05\MSSQL\DATA\QLBA_Final_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLBA_Final] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBA_Final].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBA_Final] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBA_Final] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBA_Final] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBA_Final] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBA_Final] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBA_Final] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBA_Final] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBA_Final] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBA_Final] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBA_Final] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBA_Final] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBA_Final] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBA_Final] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBA_Final] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBA_Final] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLBA_Final] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBA_Final] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBA_Final] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBA_Final] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBA_Final] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBA_Final] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBA_Final] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBA_Final] SET RECOVERY FULL 
GO
ALTER DATABASE [QLBA_Final] SET  MULTI_USER 
GO
ALTER DATABASE [QLBA_Final] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBA_Final] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBA_Final] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBA_Final] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLBA_Final] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLBA_Final] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLBA_Final', N'ON'
GO
ALTER DATABASE [QLBA_Final] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLBA_Final] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLBA_Final]
GO
/****** Object:  Table [dbo].[tbl_ChamCong]    Script Date: 28/06/2023 5:58:58 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ChamCong](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Mã Nhân Viên] [nvarchar](50) NOT NULL,
	[Số Giờ Làm] [int] NOT NULL,
	[Lương Theo Giờ] [float] NOT NULL,
	[Ngày Làm] [date] NOT NULL,
 CONSTRAINT [PK_ChamCong_tbl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_MonAn]    Script Date: 28/06/2023 5:58:58 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MonAn](
	[Mã Món Ăn] [nvarchar](50) NOT NULL,
	[Tên Món Ăn] [nvarchar](20) NULL,
	[Đơn Giá] [float] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_MonAn_tbl] PRIMARY KEY CLUSTERED 
(
	[Mã Món Ăn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_MonAn_NguyenLieu]    Script Date: 28/06/2023 5:58:58 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MonAn_NguyenLieu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Mã Món Ăn] [nvarchar](50) NOT NULL,
	[Mã Nguyên Liệu] [int] NOT NULL,
	[Số Lượng(g)] [float] NOT NULL,
 CONSTRAINT [PK_MonAn_NguyenLieu_tbl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_MonAn_SuatAn]    Script Date: 28/06/2023 5:58:58 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MonAn_SuatAn](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Mã Suất Ăn] [int] NOT NULL,
	[Mã Món Ăn] [nvarchar](50) NOT NULL,
	[Số Lượng] [int] NOT NULL,
 CONSTRAINT [PK_MonAn_SuatAn_tbl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_NguyenLieu]    Script Date: 28/06/2023 5:58:58 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_NguyenLieu](
	[Mã Nguyên Liệu] [int] NOT NULL,
	[Tên Nguyên Liệu] [nvarchar](100) NOT NULL,
	[Ngày Nhập] [date] NOT NULL,
	[Đơn Giá] [int] NOT NULL,
	[Khối Lượng(kg)] [float] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_NguyenLieu_tbl] PRIMARY KEY CLUSTERED 
(
	[Mã Nguyên Liệu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_NhanVien]    Script Date: 28/06/2023 5:58:58 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_NhanVien](
	[Mã Nhân Viên] [nvarchar](50) NOT NULL,
	[Tên Nhân Viên] [nvarchar](20) NOT NULL,
	[Giới Tính] [bit] NOT NULL,
	[Tuổi] [int] NOT NULL,
	[Số Điện Thoại] [int] NOT NULL,
 CONSTRAINT [PK_NhanVien_tbl] PRIMARY KEY CLUSTERED 
(
	[Mã Nhân Viên] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_NhanVien_ChamCong]    Script Date: 28/06/2023 5:58:58 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_NhanVien_ChamCong](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Mã Nhân Viên] [nvarchar](50) NOT NULL,
	[Time_In] [nvarchar](50) NULL,
	[Time_Out] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_NhanVien_ChamCong] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SuatAn]    Script Date: 28/06/2023 5:58:58 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SuatAn](
	[Mã Suất Ăn] [int] IDENTITY(1,1) NOT NULL,
	[Sẵn Sàng] [bit] NOT NULL,
	[Tổng Giá Tiền] [int] NULL,
	[Thời Gian] [date] NOT NULL,
	[Lợi Nhuận] [float] NULL,
 CONSTRAINT [PK_SuatAn_tbl] PRIMARY KEY CLUSTERED 
(
	[Mã Suất Ăn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ThongKe]    Script Date: 28/06/2023 5:58:58 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ThongKe](
	[Thời Gian] [date] NOT NULL,
	[Số Suất Ăn] [int] NOT NULL,
	[Số Món Ăn] [int] NOT NULL,
	[Doanh Thu] [int] NOT NULL,
 CONSTRAINT [PK_BuCheems_tbl] PRIMARY KEY CLUSTERED 
(
	[Thời Gian] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_ChamCong] ON 

INSERT [dbo].[tbl_ChamCong] ([ID], [Mã Nhân Viên], [Số Giờ Làm], [Lương Theo Giờ], [Ngày Làm]) VALUES (2, N'178167', 8, 21000, CAST(N'2023-02-05' AS Date))
INSERT [dbo].[tbl_ChamCong] ([ID], [Mã Nhân Viên], [Số Giờ Làm], [Lương Theo Giờ], [Ngày Làm]) VALUES (3, N'178168', 4, 19000, CAST(N'2023-02-05' AS Date))
INSERT [dbo].[tbl_ChamCong] ([ID], [Mã Nhân Viên], [Số Giờ Làm], [Lương Theo Giờ], [Ngày Làm]) VALUES (4, N'178169', 8, 22000, CAST(N'2023-02-05' AS Date))
INSERT [dbo].[tbl_ChamCong] ([ID], [Mã Nhân Viên], [Số Giờ Làm], [Lương Theo Giờ], [Ngày Làm]) VALUES (5, N'178166', 0, 19000, CAST(N'2023-06-28' AS Date))
SET IDENTITY_INSERT [dbo].[tbl_ChamCong] OFF
GO
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'1', N'Cơm trắng', 5000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'10', N'Dưa chua xào thịt', 30000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'11', N'Đậu phụ nhồi thịt', 30000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'12', N'Nem rán', 30000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'13', N'Mướp đắng nhồi thịt', 30000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'14', N'Khoai tây xào thịt ', 30000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'15', N'Ốc om chuối đậu', 25000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'16', N'Trứng cuộn', 35000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'17', N'Chả lá lốt ', 30000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'18', N'Bắp cải xào ', 20000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'19', N'Cải mèo luộc', 20000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'2', N'Thịt kho cùi dừa', 30000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'20', N'Cải ngọt xào tỏi', 20000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'21', N'Bắp cả luộc ', 20000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'22', N'Canh cải thảo', 15000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'23', N'Canh bí xanh', 15000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'24', N'Canh bắp cải ', 15000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'25', N'Canh mùng tơi', 15000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'26', N'Chả Cá', 26000, 1)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'3', N'Gà quay ngũ vị', 30000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'4', N'Sườn xào chua ngọt', 30000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'5', N'Bò nấu cari', 35000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'6', N'Gà rang gừng', 30000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'7', N'Móng giò om dầu hào ', 30000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'8', N'Gà hấp lá tranh ', 30000, 0)
INSERT [dbo].[tbl_MonAn] ([Mã Món Ăn], [Tên Món Ăn], [Đơn Giá], [IsDeleted]) VALUES (N'9', N'Thịt kho trứng', 30000, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_MonAn_NguyenLieu] ON 

INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (6, N'11', 10, 100)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (7, N'11', 3, 100)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (8, N'9', 3, 100)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (12, N'12', 3, 100)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (13, N'13', 3, 100)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (14, N'13', 11, 800)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (18, N'9', 2, 300)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (20, N'10', 9, 200)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (21, N'10', 3, 200)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (23, N'1', 1, 200)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (25, N'2', 3, 300)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (26, N'2', 6, 200)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (27, N'3', 5, 100)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (28, N'4', 3, 500)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (29, N'4', 24, 300)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (30, N'5', 4, 800)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (31, N'5', 22, 300)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (32, N'5', 23, 200)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (33, N'5', 24, 100)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (34, N'6', 5, 1000)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (35, N'6', 7, 300)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (36, N'6', 8, 100)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (37, N'7', 25, 900)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (38, N'8', 5, 800)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (39, N'8', 7, 200)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (40, N'12', 26, 2000)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (41, N'12 ', 22, 900)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (42, N'12', 24, 1000)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (43, N'12', 2, 500)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (44, N'14', 23, 1000)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (45, N'14', 3, 400)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (46, N'15', 12, 600)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (47, N'15', 10, 1000)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (48, N'15', 13, 500)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (49, N'15', 27, 200)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (50, N'16', 2, 1200)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (52, N'17', 3, 600)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (53, N'17', 14, 1200)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (54, N'18', 27, 100)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (55, N'18', 15, 1000)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (58, N'19', 28, 700)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (59, N'20', 17, 1000)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (60, N'20', 27, 200)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (61, N'21', 15, 500)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (63, N'22', 18, 600)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (64, N'22', 3, 200)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (66, N'23', 19, 500)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (67, N'24', 15, 600)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (68, N'25', 20, 400)
INSERT [dbo].[tbl_MonAn_NguyenLieu] ([ID], [Mã Món Ăn], [Mã Nguyên Liệu], [Số Lượng(g)]) VALUES (70, N'26', 1, 1)
SET IDENTITY_INSERT [dbo].[tbl_MonAn_NguyenLieu] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_MonAn_SuatAn] ON 

INSERT [dbo].[tbl_MonAn_SuatAn] ([ID], [Mã Suất Ăn], [Mã Món Ăn], [Số Lượng]) VALUES (38, 32, N'1', 2)
INSERT [dbo].[tbl_MonAn_SuatAn] ([ID], [Mã Suất Ăn], [Mã Món Ăn], [Số Lượng]) VALUES (39, 33, N'10', 2)
INSERT [dbo].[tbl_MonAn_SuatAn] ([ID], [Mã Suất Ăn], [Mã Món Ăn], [Số Lượng]) VALUES (43, 34, N'9', 1)
INSERT [dbo].[tbl_MonAn_SuatAn] ([ID], [Mã Suất Ăn], [Mã Món Ăn], [Số Lượng]) VALUES (45, 37, N'9', 2)
INSERT [dbo].[tbl_MonAn_SuatAn] ([ID], [Mã Suất Ăn], [Mã Món Ăn], [Số Lượng]) VALUES (46, 38, N'1', 1)
INSERT [dbo].[tbl_MonAn_SuatAn] ([ID], [Mã Suất Ăn], [Mã Món Ăn], [Số Lượng]) VALUES (47, 38, N'10', 1)
INSERT [dbo].[tbl_MonAn_SuatAn] ([ID], [Mã Suất Ăn], [Mã Món Ăn], [Số Lượng]) VALUES (48, 38, N'11', 1)
INSERT [dbo].[tbl_MonAn_SuatAn] ([ID], [Mã Suất Ăn], [Mã Món Ăn], [Số Lượng]) VALUES (49, 38, N'12', 1)
INSERT [dbo].[tbl_MonAn_SuatAn] ([ID], [Mã Suất Ăn], [Mã Món Ăn], [Số Lượng]) VALUES (50, 39, N'9', 2)
INSERT [dbo].[tbl_MonAn_SuatAn] ([ID], [Mã Suất Ăn], [Mã Món Ăn], [Số Lượng]) VALUES (51, 40, N'1', 2)
INSERT [dbo].[tbl_MonAn_SuatAn] ([ID], [Mã Suất Ăn], [Mã Món Ăn], [Số Lượng]) VALUES (52, 41, N'1', 1)
SET IDENTITY_INSERT [dbo].[tbl_MonAn_SuatAn] OFF
GO
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (1, N'Gạo', CAST(N'2021-01-01' AS Date), 25000, 49.199996948242188, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (2, N'Trứng', CAST(N'2021-01-01' AS Date), 50000, 5, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (3, N'Thịt lợn', CAST(N'2021-02-01' AS Date), 100000, 47, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (4, N'Thịt bò ', CAST(N'2021-02-01' AS Date), 150000, 50, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (5, N'Thịt gà ', CAST(N'2021-02-01' AS Date), 160000, 35, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (6, N'Dừa', CAST(N'2021-02-01' AS Date), 120000, 25, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (7, N'Gừng', CAST(N'2021-02-01' AS Date), 55000, 14, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (8, N'Lá Chanh', CAST(N'2021-02-01' AS Date), 20000, 10, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (9, N'Dưa chua', CAST(N'2021-02-01' AS Date), 100000, 21, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (10, N'Đậu phụ', CAST(N'2021-02-01' AS Date), 50000, 50, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (11, N'Mướp đắng', CAST(N'2021-02-01' AS Date), 60000, 34, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (12, N'Ốc nhồi ', CAST(N'2021-02-01' AS Date), 80000, 15, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (13, N'Chuối', CAST(N'2021-02-01' AS Date), 50000, 15, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (14, N'Lá lốt', CAST(N'2021-02-01' AS Date), 30000, 15, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (15, N'Bắp cải ', CAST(N'2021-02-01' AS Date), 20000, 15, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (17, N'Cải ngọt', CAST(N'2021-02-01' AS Date), 18000, 16, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (18, N'Cải thảo ', CAST(N'2021-02-01' AS Date), 50000, 16, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (19, N'Bí ', CAST(N'2021-02-01' AS Date), 20000, 20, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (20, N'Mùng tơi ', CAST(N'2021-02-01' AS Date), 20000, 10, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (21, N'Bún', CAST(N'2021-02-01' AS Date), 11000, 15, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (22, N'Cà rốt', CAST(N'2021-02-01' AS Date), 300000, 10, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (23, N'Khoai tây', CAST(N'2021-02-01' AS Date), 500000, 10, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (24, N'Hành tây', CAST(N'2021-02-01' AS Date), 200000, 25, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (25, N'Móng giò', CAST(N'2021-02-01' AS Date), 110000, 34, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (26, N'Bánh đa nem', CAST(N'2021-02-01' AS Date), 60000, 25, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (27, N'Tỏi', CAST(N'2021-02-01' AS Date), 50000, 36, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (28, N'Cải mèo', CAST(N'2021-02-01' AS Date), 80000, 30, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (29, N'Cá Dọn Bể', CAST(N'2023-06-22' AS Date), 50000, 10, 0)
INSERT [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu], [Tên Nguyên Liệu], [Ngày Nhập], [Đơn Giá], [Khối Lượng(kg)], [IsDeleted]) VALUES (30, N'Sầu Riêng', CAST(N'2023-06-14' AS Date), 35000, 10, 1)
GO
INSERT [dbo].[tbl_NhanVien] ([Mã Nhân Viên], [Tên Nhân Viên], [Giới Tính], [Tuổi], [Số Điện Thoại]) VALUES (N'178166', N'Nguyễn Quang An', 1, 20, 338624151)
INSERT [dbo].[tbl_NhanVien] ([Mã Nhân Viên], [Tên Nhân Viên], [Giới Tính], [Tuổi], [Số Điện Thoại]) VALUES (N'178167', N'Đỗ Phúc Đạt', 1, 20, 913824241)
INSERT [dbo].[tbl_NhanVien] ([Mã Nhân Viên], [Tên Nhân Viên], [Giới Tính], [Tuổi], [Số Điện Thoại]) VALUES (N'178168', N'Lê Đức Long', 1, 20, 978101652)
INSERT [dbo].[tbl_NhanVien] ([Mã Nhân Viên], [Tên Nhân Viên], [Giới Tính], [Tuổi], [Số Điện Thoại]) VALUES (N'178169', N'Nguyễn Anh Tuấn', 1, 20, 391256431)
GO
SET IDENTITY_INSERT [dbo].[tbl_NhanVien_ChamCong] ON 

INSERT [dbo].[tbl_NhanVien_ChamCong] ([ID], [Mã Nhân Viên], [Time_In], [Time_Out]) VALUES (916, N'178166', N'2023-02-05 7:00:00', N'2023-02-05 14:58:00')
INSERT [dbo].[tbl_NhanVien_ChamCong] ([ID], [Mã Nhân Viên], [Time_In], [Time_Out]) VALUES (917, N'178167', N'2023-02-05 6:59:00', N'2023-02-05 15:02:45')
INSERT [dbo].[tbl_NhanVien_ChamCong] ([ID], [Mã Nhân Viên], [Time_In], [Time_Out]) VALUES (918, N'178168', N'2023-02-05 15:00:00', N'2023-02-05 23:01:05')
INSERT [dbo].[tbl_NhanVien_ChamCong] ([ID], [Mã Nhân Viên], [Time_In], [Time_Out]) VALUES (919, N'178169', N'2023-02-05 14:55:00', N'2023-02-05 22:58:54')
INSERT [dbo].[tbl_NhanVien_ChamCong] ([ID], [Mã Nhân Viên], [Time_In], [Time_Out]) VALUES (935, N'178166', N'2023-06-28 16:30:53', N'2023-06-28 16:30:56')
SET IDENTITY_INSERT [dbo].[tbl_NhanVien_ChamCong] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_SuatAn] ON 

INSERT [dbo].[tbl_SuatAn] ([Mã Suất Ăn], [Sẵn Sàng], [Tổng Giá Tiền], [Thời Gian], [Lợi Nhuận]) VALUES (32, 1, 10000, CAST(N'2023-05-27' AS Date), 5000)
INSERT [dbo].[tbl_SuatAn] ([Mã Suất Ăn], [Sẵn Sàng], [Tổng Giá Tiền], [Thời Gian], [Lợi Nhuận]) VALUES (33, 1, 60000, CAST(N'2023-05-27' AS Date), 20000)
INSERT [dbo].[tbl_SuatAn] ([Mã Suất Ăn], [Sẵn Sàng], [Tổng Giá Tiền], [Thời Gian], [Lợi Nhuận]) VALUES (34, 1, 30000, CAST(N'2023-05-27' AS Date), 5000)
INSERT [dbo].[tbl_SuatAn] ([Mã Suất Ăn], [Sẵn Sàng], [Tổng Giá Tiền], [Thời Gian], [Lợi Nhuận]) VALUES (37, 0, 60000, CAST(N'2023-05-27' AS Date), NULL)
INSERT [dbo].[tbl_SuatAn] ([Mã Suất Ăn], [Sẵn Sàng], [Tổng Giá Tiền], [Thời Gian], [Lợi Nhuận]) VALUES (38, 0, 95000, CAST(N'2023-05-27' AS Date), NULL)
INSERT [dbo].[tbl_SuatAn] ([Mã Suất Ăn], [Sẵn Sàng], [Tổng Giá Tiền], [Thời Gian], [Lợi Nhuận]) VALUES (39, 1, 60000, CAST(N'2023-05-27' AS Date), 35000)
INSERT [dbo].[tbl_SuatAn] ([Mã Suất Ăn], [Sẵn Sàng], [Tổng Giá Tiền], [Thời Gian], [Lợi Nhuận]) VALUES (40, 1, 10000, CAST(N'2023-05-30' AS Date), 5000)
INSERT [dbo].[tbl_SuatAn] ([Mã Suất Ăn], [Sẵn Sàng], [Tổng Giá Tiền], [Thời Gian], [Lợi Nhuận]) VALUES (41, 1, 5000, CAST(N'2023-06-28' AS Date), 0)
SET IDENTITY_INSERT [dbo].[tbl_SuatAn] OFF
GO
INSERT [dbo].[tbl_ThongKe] ([Thời Gian], [Số Suất Ăn], [Số Món Ăn], [Doanh Thu]) VALUES (CAST(N'2023-06-28' AS Date), 1, 1, 5000)
GO
ALTER TABLE [dbo].[tbl_MonAn_NguyenLieu]  WITH CHECK ADD  CONSTRAINT [FK_MonAn_NguyenLieu_tbl_MonAn_tbl] FOREIGN KEY([Mã Món Ăn])
REFERENCES [dbo].[tbl_MonAn] ([Mã Món Ăn])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_MonAn_NguyenLieu] CHECK CONSTRAINT [FK_MonAn_NguyenLieu_tbl_MonAn_tbl]
GO
ALTER TABLE [dbo].[tbl_MonAn_NguyenLieu]  WITH CHECK ADD  CONSTRAINT [FK_MonAn_NguyenLieu_tbl_NguyenLieu_tbl] FOREIGN KEY([Mã Nguyên Liệu])
REFERENCES [dbo].[tbl_NguyenLieu] ([Mã Nguyên Liệu])
GO
ALTER TABLE [dbo].[tbl_MonAn_NguyenLieu] CHECK CONSTRAINT [FK_MonAn_NguyenLieu_tbl_NguyenLieu_tbl]
GO
ALTER TABLE [dbo].[tbl_MonAn_SuatAn]  WITH CHECK ADD  CONSTRAINT [FK_MonAn_SuatAn_tbl_MonAn_tbl] FOREIGN KEY([Mã Món Ăn])
REFERENCES [dbo].[tbl_MonAn] ([Mã Món Ăn])
GO
ALTER TABLE [dbo].[tbl_MonAn_SuatAn] CHECK CONSTRAINT [FK_MonAn_SuatAn_tbl_MonAn_tbl]
GO
ALTER TABLE [dbo].[tbl_MonAn_SuatAn]  WITH CHECK ADD  CONSTRAINT [FK_MonAn_SuatAn_tbl_SuatAn_tbl] FOREIGN KEY([Mã Suất Ăn])
REFERENCES [dbo].[tbl_SuatAn] ([Mã Suất Ăn])
GO
ALTER TABLE [dbo].[tbl_MonAn_SuatAn] CHECK CONSTRAINT [FK_MonAn_SuatAn_tbl_SuatAn_tbl]
GO
ALTER TABLE [dbo].[tbl_NhanVien_ChamCong]  WITH CHECK ADD  CONSTRAINT [FK_tbl_NhanVien_ChamCong_tbl_NhanVien1] FOREIGN KEY([Mã Nhân Viên])
REFERENCES [dbo].[tbl_NhanVien] ([Mã Nhân Viên])
GO
ALTER TABLE [dbo].[tbl_NhanVien_ChamCong] CHECK CONSTRAINT [FK_tbl_NhanVien_ChamCong_tbl_NhanVien1]
GO
USE [master]
GO
ALTER DATABASE [QLBA_Final] SET  READ_WRITE 
GO
