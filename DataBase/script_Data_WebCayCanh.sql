CREATE DATABASE WebCayCanh				---- Script Owner: Nguyễn Xuân Thuận
GO 
USE [WebCayCanh]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 05/06/2020 10:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[CATEGORY_ID] [nvarchar](20) NOT NULL,
	[CATEGORY_NAME] [nvarchar](50) NOT NULL,
	[CATEGORY_IMAGE] [image] NULL,
	[CATEGORY_DESCRIPTION] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CATEGORY_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 05/06/2020 10:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[CUSTOMER_ID] [nvarchar](20) NOT NULL,
	[FIRST_NAME] [nvarchar](50) NULL,
	[LAST_NAME] [nvarchar](50) NULL,
	[EMAIL] [varchar](50) NULL,
	[PHONE_NUMBER] [varchar](10) NULL,
	[STREET] [nvarchar](50) NULL,
	[DISTRICT] [nvarchar](50) NULL,
	[CITY] [nvarchar](50) NULL,
	[CUSTOMER_DESCRIPTION] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CUSTOMER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MANUFACTURER]    Script Date: 05/06/2020 10:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MANUFACTURER](
	[MANUFACTURER_ID] [nvarchar](20) NOT NULL,
	[MANUFACTURER_NAME] [nvarchar](50) NOT NULL,
	[MANUFACTURER_DESCRIPTION] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MANUFACTURER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDER]    Script Date: 05/06/2020 10:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER](
	[ORDER_ID] [nvarchar](20) NOT NULL,
	[ORDER_DATE] [datetime] NOT NULL,
	[ORDER_NUMBER] [int] NOT NULL,
	[CUSTOMER_ID] [nvarchar](20) NOT NULL,
	[ORDER_DESCRIPTION] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ORDER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDERDETAIL]    Script Date: 05/06/2020 10:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERDETAIL](
	[ORDERDETAIL_ID] [nvarchar](20) NOT NULL,
	[PRICE] [float] NOT NULL,
	[QUANTITY] [int] NOT NULL,
	[DISCOUNT] [float] NULL,
	[ORDER_ID] [nvarchar](20) NOT NULL,
	[PRODUCT_ID] [nvarchar](20) NOT NULL,
	[USERID] [nvarchar](20) NOT NULL,
	[ORDERDETAIL_DESCRIPTION] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ORDERDETAIL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 05/06/2020 10:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[PRODUCT_ID] [nvarchar](20) NOT NULL,
	[PRODUCT_NAME] [nvarchar](50) NOT NULL,
	[AMOUNT] [int] NOT NULL,
	[AMOUNT_REMAINING] [int] NOT NULL,
	[OLD_PRICE] [float] NULL,
	[PRODUCT_IMAGE] [image] NULL,
	[MANUFACTURER_ID] [nvarchar](20) NOT NULL,
	[CATEGORY_ID] [nvarchar](20) NOT NULL,
	[PRODUCT_DESCRIPTION] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PRODUCT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USERS]    Script Date: 05/06/2020 10:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USERS](
	[USERID] [nvarchar](20) NOT NULL,
	[EMAIL] [varchar](50) NULL,
	[FIRST_NAME] [nvarchar](50) NULL,
	[LAST_NAME] [nvarchar](50) NULL,
	[USERNAME] [varchar](50) NOT NULL,
	[PASSWORDS] [varchar](50) NOT NULL,
	[IS_ACTIVE] [bit] NULL CONSTRAINT [Def_Users_Active]  DEFAULT ((1)),
	[PHONE_NUMBER] [varchar](10) NULL,
	[USERS_IMAGE] [image] NULL,
	[USERS_DESCRIPTION] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[USERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CATEGORY] ([CATEGORY_ID], [CATEGORY_NAME], [CATEGORY_IMAGE], [CATEGORY_DESCRIPTION]) VALUES (N'LC01', N'CÂY THỦY SINH', NULL, N'LOẠI 1')
INSERT [dbo].[CATEGORY] ([CATEGORY_ID], [CATEGORY_NAME], [CATEGORY_IMAGE], [CATEGORY_DESCRIPTION]) VALUES (N'LC02', N'CÂY SEN ĐÁ', NULL, N'LOẠI 2')
INSERT [dbo].[CATEGORY] ([CATEGORY_ID], [CATEGORY_NAME], [CATEGORY_IMAGE], [CATEGORY_DESCRIPTION]) VALUES (N'LC03', N'CÂY CẢNH NỘI THẤT', NULL, N'LOẠI 3')
INSERT [dbo].[CATEGORY] ([CATEGORY_ID], [CATEGORY_NAME], [CATEGORY_IMAGE], [CATEGORY_DESCRIPTION]) VALUES (N'LC04', N'CÂY ĂN TRÁI', NULL, N'LOẠI 4')
INSERT [dbo].[CATEGORY] ([CATEGORY_ID], [CATEGORY_NAME], [CATEGORY_IMAGE], [CATEGORY_DESCRIPTION]) VALUES (N'LC05', N'CÂY HOA CẢNH', NULL, N'LOẠI 5')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [FIRST_NAME], [LAST_NAME], [EMAIL], [PHONE_NUMBER], [STREET], [DISTRICT], [CITY], [CUSTOMER_DESCRIPTION]) VALUES (N'KH01', N'An', N'Nguyễn Văn', N'nguyenvanan@gmail.com', N'0568245741', N'Nguyễn Kiệm', N'Gò Vấp', N'Hồ Chí Minh', N'Khác hàng thân thiết')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [FIRST_NAME], [LAST_NAME], [EMAIL], [PHONE_NUMBER], [STREET], [DISTRICT], [CITY], [CUSTOMER_DESCRIPTION]) VALUES (N'KH02', N'Phương', N'Ngô Thị Linh', N'phuonglinh@gmail.com', N'0856369746', N'Dương Quảng Hàm', N'Gò Vấp', N'Hồ Chí Minh', N'Khách hàng mới')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [FIRST_NAME], [LAST_NAME], [EMAIL], [PHONE_NUMBER], [STREET], [DISTRICT], [CITY], [CUSTOMER_DESCRIPTION]) VALUES (N'KH03', N'Trung', N'Nguyễn Nhật', N'NhatTrung@gmail.com', N'0687536958', N'Nguyễn Văn Công', N'Gò Vấp', N'Hồ Chí Minh', N'Khách hàng thân thiết')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [FIRST_NAME], [LAST_NAME], [EMAIL], [PHONE_NUMBER], [STREET], [DISTRICT], [CITY], [CUSTOMER_DESCRIPTION]) VALUES (N'KH04', N'Duy', N'Lê Thành', N'Thanhduy@gmail.com', N'0456369785', N'Nguyễn Văn Công', N'Gò Vấp', N'Hồ Chí Minh', N'Khách hàng yêu thích')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [FIRST_NAME], [LAST_NAME], [EMAIL], [PHONE_NUMBER], [STREET], [DISTRICT], [CITY], [CUSTOMER_DESCRIPTION]) VALUES (N'KH05', N'Linh', N'Nguyễn Chí', N'linh@gmail.com', N'0963587455', N'Âu Cơ', N'Tân Bình', N'Hồ Chí Minh', N'Khách hàng tiềm năng')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [FIRST_NAME], [LAST_NAME], [EMAIL], [PHONE_NUMBER], [STREET], [DISTRICT], [CITY], [CUSTOMER_DESCRIPTION]) VALUES (N'KHBT01', N'Sinh', N'Lê Hải', N'sinh@gmail.com', N'0963587456', N'Tôn Đức Thắng', N'Quận 1', N'Hồ Chí Minh', N'KHBT')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [FIRST_NAME], [LAST_NAME], [EMAIL], [PHONE_NUMBER], [STREET], [DISTRICT], [CITY], [CUSTOMER_DESCRIPTION]) VALUES (N'KHTT01', N'Hào', N'Lê Anh Hào', N'Anhhao@gmail.com', N'0863259965', N'Hai Bà Trưng', N'Ba Đình', N'Hà Nội', N'Khác hàng Thân Thiết')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [FIRST_NAME], [LAST_NAME], [EMAIL], [PHONE_NUMBER], [STREET], [DISTRICT], [CITY], [CUSTOMER_DESCRIPTION]) VALUES (N'KHTT02', N'Hải', N'Lê Quang', N'haiquang@gmail.com', N'0856368547', N'An Thái 1', N'An Nhơn', N'Bình Định', N'Khách hàng thân thiết')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [FIRST_NAME], [LAST_NAME], [EMAIL], [PHONE_NUMBER], [STREET], [DISTRICT], [CITY], [CUSTOMER_DESCRIPTION]) VALUES (N'KHVIP01', N'Thuận', N'Nguyễn Xuân', N'Xuanthuan@gmail.com', N'0856741258', N'Nguyễn Văn Công', N'Gò Vấp', N'Hồ Chí Minh', N'Khách hàng Vip')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [FIRST_NAME], [LAST_NAME], [EMAIL], [PHONE_NUMBER], [STREET], [DISTRICT], [CITY], [CUSTOMER_DESCRIPTION]) VALUES (N'KHVIP02', N'Tú', N'Lê Thị', N'Lethitu@gmail.com', N'0863522236', N'Lê Thánh Tôn', N'Quận Hoàn Kiếm', N'Hà Nội', N'Khách hàng Vip')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [FIRST_NAME], [LAST_NAME], [EMAIL], [PHONE_NUMBER], [STREET], [DISTRICT], [CITY], [CUSTOMER_DESCRIPTION]) VALUES (N'KHVIP03', N'Thư', N'Lê Anh', N'Anhthu@gmail.com', N'0852636698', N'Lộc Minh', N'Hai Bà Trưng', N'Tuyên Quang', N'Khách hàng Vip')
INSERT [dbo].[MANUFACTURER] ([MANUFACTURER_ID], [MANUFACTURER_NAME], [MANUFACTURER_DESCRIPTION]) VALUES (N'PH01', N'Cây Cảnh Lộc Ninh', N'Nhà phân phối số 1')
INSERT [dbo].[MANUFACTURER] ([MANUFACTURER_ID], [MANUFACTURER_NAME], [MANUFACTURER_DESCRIPTION]) VALUES (N'PH02', N'Cây Cảnh Đà Lạt', N'Nhà phân phối ở Đà Lạt')
INSERT [dbo].[MANUFACTURER] ([MANUFACTURER_ID], [MANUFACTURER_NAME], [MANUFACTURER_DESCRIPTION]) VALUES (N'PH03', N'Sen Đá Thuận Phát', N'Nhà Phân phối cây cảnh MINI')
INSERT [dbo].[MANUFACTURER] ([MANUFACTURER_ID], [MANUFACTURER_NAME], [MANUFACTURER_DESCRIPTION]) VALUES (N'PH04', N'Mầm Xanh', N'Nhà phân phối Sen Đá TP HCM')
INSERT [dbo].[MANUFACTURER] ([MANUFACTURER_ID], [MANUFACTURER_NAME], [MANUFACTURER_DESCRIPTION]) VALUES (N'PH05', N'Vườn Cây Việt', N'Địa chỉ cung cấp cây cảnh Mini uy tín')
INSERT [dbo].[MANUFACTURER] ([MANUFACTURER_ID], [MANUFACTURER_NAME], [MANUFACTURER_DESCRIPTION]) VALUES (N'PH06', N'Hoa Dung Quốc', N'Nhà phân phối cây cảnh hoa')
INSERT [dbo].[MANUFACTURER] ([MANUFACTURER_ID], [MANUFACTURER_NAME], [MANUFACTURER_DESCRIPTION]) VALUES (N'PH07', N'Phong Lan Rừng', N'Nhà phân phối hoa Lan')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'OD01', CAST(N'2019-08-02 03:45:05.000' AS DateTime), 1, N'KH01', N'Khách Order 1')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'OD02', CAST(N'2019-10-09 13:40:25.000' AS DateTime), 3, N'KH01', N'Khách Order 2')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'OD03', CAST(N'2019-05-24 08:40:46.000' AS DateTime), 1, N'KH02', N'Đơn Order xử lý gấp')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'OD04', CAST(N'2010-02-28 07:40:05.000' AS DateTime), 5, N'KH03', N'')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'OD05', CAST(N'2010-01-14 07:56:05.000' AS DateTime), 1, N'KH04', N'')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'OD06', CAST(N'2020-03-10 09:45:05.000' AS DateTime), 7, N'KH04', N'')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'OD07', CAST(N'2020-11-12 05:45:05.000' AS DateTime), 1, N'KH05', N'')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'OD08', CAST(N'2018-05-08 04:46:08.000' AS DateTime), 5, N'KH05', N'')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'OD09', CAST(N'2017-04-19 04:46:08.000' AS DateTime), 5, N'KH05', N'')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'OD100', CAST(N'2020-06-05 06:36:58.120' AS DateTime), 0, N'KH01', N'string')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'ODP1', CAST(N'2019-06-20 08:45:08.000' AS DateTime), 10, N'KHBT01', N'')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'ODP2', CAST(N'2020-11-07 07:25:08.000' AS DateTime), 2, N'KHTT02', N'')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'ODP3', CAST(N'2020-04-10 04:46:08.000' AS DateTime), 3, N'KHTT02', N'')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'ODP4', CAST(N'2018-05-08 04:46:08.000' AS DateTime), 20, N'KHVIP01', N'')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'ODP5', CAST(N'2018-05-08 04:46:08.000' AS DateTime), 50, N'KHVIP01', N'')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'ODP6', CAST(N'2020-03-15 08:49:08.000' AS DateTime), 70, N'KHVIP02', N'')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'ODT1', CAST(N'2016-05-08 04:46:08.000' AS DateTime), 4, N'KHVIP03', N'')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'ODT2', CAST(N'2019-05-08 04:46:08.000' AS DateTime), 5, N'KHVIP03', N'')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'ODT3', CAST(N'2020-05-08 04:46:08.000' AS DateTime), 10, N'KHVIP01', N'')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'ODV1', CAST(N'2016-07-08 04:46:08.000' AS DateTime), 13, N'KHVIP02', N'')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'ODV2', CAST(N'2017-08-29 09:46:08.000' AS DateTime), 11, N'KHVIP02', N'')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'ODV3', CAST(N'2018-05-08 04:46:08.000' AS DateTime), 10, N'KHVIP02', N'')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'ODV4', CAST(N'2019-12-31 04:46:08.000' AS DateTime), 48, N'KHVIP02', N'')
INSERT [dbo].[ORDER] ([ORDER_ID], [ORDER_DATE], [ORDER_NUMBER], [CUSTOMER_ID], [ORDER_DESCRIPTION]) VALUES (N'ODV5', CAST(N'2010-12-31 01:54:42.000' AS DateTime), 54, N'KH01', NULL)
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH01', 25000, 1, 0.1, N'OD01', N'SPAT01', N'US01', N'ĐƠN HÀNG 1')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH02', 125000, 5, 0.2, N'OD02', N'SPAT02', N'US01', N'ĐƠN HÀNG 2')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH03', 225.5, 7, 0.1, N'OD03', N'SPAT03', N'US02', N'ĐƠN HÀNG 3')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH04', 50000, 2, 0.2, N'OD04', N'SPH01', N'US03', N'ĐƠN HÀNG 4')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH05', 78000, 4, 0.1, N'OD05', N'SPH02', N'US05', N'ĐƠN HÀNG 5')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH06', 15000, 1, 0, N'OD06', N'SPH03', N'US06', N'ĐƠN HÀNG 6')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH07', 500000, 40, 0.1, N'OD07', N'SPNT01', N'US01', N'ĐƠN HÀNG 7')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH08', 49000, 13, 0.2, N'OD08', N'SPNT02', N'US02', N'ĐƠN HÀNG 8')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH09', 3370000, 6, 0.2, N'OD09', N'SPNT03', N'US03', N'ĐƠN HÀNG 9')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH11', 46000, 2, 0.1, N'ODP1', N'SPS02', N'US05', N'ĐƠN HÀNG 11')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH12', 54000, 4, 0.1, N'ODP2', N'SPS02', N'US06', N'ĐƠN HÀNG 12')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH13', 67000, 4, 0, N'ODP3', N'SPH03', N'US01', N'ĐƠN HÀNG 13')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH14', 500000, 10, 0.2, N'ODP4', N'SPS04', N'US02', N'ĐƠN HÀNG 14')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH15', 449.99, 50, 0.52, N'ODT1', N'SPS05', N'US03', N'ĐƠN HÀNG 15')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH16', 50000, 2, 0.2, N'ODT2', N'SPTS01', N'US04', N'ĐƠN HÀNG 16')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH17', 668.7, 40, 0.1, N'ODV1', N'SPTS02', N'US05', N'ĐƠN HÀNG 17')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH18', 70000, 15, 0.1, N'ODV2', N'SPTS03', N'US06', N'ĐƠN HÀNG 18')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH19', 1554700, 45, 0.1, N'ODV3', N'SPTS04', N'US01', N'ĐƠN HÀNG 19')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH20', 99000, 4, 0, N'OD04', N'SPH01', N'US03', N'ĐƠN HÀNG 20')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH21', 800000, 20, 0.2, N'ODV1', N'SPNT01', N'US01', N'ĐƠN HÀNG 21')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH22', 50000, 2, 0.2, N'ODV2', N'SPTS01', N'US02', N'ĐƠN HÀNG 22')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH23', 40000, 8, 0.4, N'OD01', N'SPH01', N'US05', N'ĐƠN HÀNG 23')
INSERT [dbo].[ORDERDETAIL] ([ORDERDETAIL_ID], [PRICE], [QUANTITY], [DISCOUNT], [ORDER_ID], [PRODUCT_ID], [USERID], [ORDERDETAIL_DESCRIPTION]) VALUES (N'CTDH24', 5000000, 100, 0.5, N'OD02', N'SPH01', N'US01', N'ĐƠN HÀNG 24')
INSERT [dbo].[PRODUCT] ([PRODUCT_ID], [PRODUCT_NAME], [AMOUNT], [AMOUNT_REMAINING], [OLD_PRICE], [PRODUCT_IMAGE], [MANUFACTURER_ID], [CATEGORY_ID], [PRODUCT_DESCRIPTION]) VALUES (N'SPAT01', N'CÂY SUNG MỸ', 36, 20, 250000, NULL, N'PH05', N'LC04', N'CÂY CHUNG MỸ CHO TRÁI SUNG ĂN RẤT NGON')
INSERT [dbo].[PRODUCT] ([PRODUCT_ID], [PRODUCT_NAME], [AMOUNT], [AMOUNT_REMAINING], [OLD_PRICE], [PRODUCT_IMAGE], [MANUFACTURER_ID], [CATEGORY_ID], [PRODUCT_DESCRIPTION]) VALUES (N'SPAT02', N'CÂY CHANH', 4, 3, 286000, NULL, N'PH05', N'LC04', N'CÂY CHANH CHO TRÁI CHANH MÀU XANH')
INSERT [dbo].[PRODUCT] ([PRODUCT_ID], [PRODUCT_NAME], [AMOUNT], [AMOUNT_REMAINING], [OLD_PRICE], [PRODUCT_IMAGE], [MANUFACTURER_ID], [CATEGORY_ID], [PRODUCT_DESCRIPTION]) VALUES (N'SPAT03', N'CÂY CAM VIỆT QUỐC', 50, 32, 128300, NULL, N'PH05', N'LC04', N'CÂY CAM VIỆT CHO TRÁI NGON')
INSERT [dbo].[PRODUCT] ([PRODUCT_ID], [PRODUCT_NAME], [AMOUNT], [AMOUNT_REMAINING], [OLD_PRICE], [PRODUCT_IMAGE], [MANUFACTURER_ID], [CATEGORY_ID], [PRODUCT_DESCRIPTION]) VALUES (N'SPH01', N'HOA PHONG LAN RỪNG', 99, 25, 525000, NULL, N'PH06', N'LC05', N'HOA LAN DÀNH CHO NGƯỜI THÍCH CHƠI HOA. NÓ MANG VẺ ĐẸP TỰ NHIÊN CỦA RỪNG')
INSERT [dbo].[PRODUCT] ([PRODUCT_ID], [PRODUCT_NAME], [AMOUNT], [AMOUNT_REMAINING], [OLD_PRICE], [PRODUCT_IMAGE], [MANUFACTURER_ID], [CATEGORY_ID], [PRODUCT_DESCRIPTION]) VALUES (N'SPH02', N'CÂY LAN TÍM', 41, 35, 250000, NULL, N'PH06', N'LC05', N'NHÀNH LAN TÍM MANG VẺ ĐẸP THUẦN KHIẾT')
INSERT [dbo].[PRODUCT] ([PRODUCT_ID], [PRODUCT_NAME], [AMOUNT], [AMOUNT_REMAINING], [OLD_PRICE], [PRODUCT_IMAGE], [MANUFACTURER_ID], [CATEGORY_ID], [PRODUCT_DESCRIPTION]) VALUES (N'SPH03', N'CÂY LAN HẠT DƯA', 2, 1, 99000, NULL, N'PH06', N'LC05', N'CÂY LAN HẠT DƯA ĐẸP')
INSERT [dbo].[PRODUCT] ([PRODUCT_ID], [PRODUCT_NAME], [AMOUNT], [AMOUNT_REMAINING], [OLD_PRICE], [PRODUCT_IMAGE], [MANUFACTURER_ID], [CATEGORY_ID], [PRODUCT_DESCRIPTION]) VALUES (N'SPNT01', N'CÂY VẠN NIÊN NỘI THẤT', 2, 2, 450000, NULL, N'PH02', N'LC03', N'KHÔNG CÓ MÔ TẢ CHI TIẾT')
INSERT [dbo].[PRODUCT] ([PRODUCT_ID], [PRODUCT_NAME], [AMOUNT], [AMOUNT_REMAINING], [OLD_PRICE], [PRODUCT_IMAGE], [MANUFACTURER_ID], [CATEGORY_ID], [PRODUCT_DESCRIPTION]) VALUES (N'SPNT02', N'CÂY TÙNG SƠN', 5, 3, 350062, NULL, N'PH02', N'LC03', N'CÂY TÙNG SƠN ĐẸP NHẤT')
INSERT [dbo].[PRODUCT] ([PRODUCT_ID], [PRODUCT_NAME], [AMOUNT], [AMOUNT_REMAINING], [OLD_PRICE], [PRODUCT_IMAGE], [MANUFACTURER_ID], [CATEGORY_ID], [PRODUCT_DESCRIPTION]) VALUES (N'SPNT03', N'CÂY TÙNG BỒNG LAI', 2, 0, 1550235, NULL, N'PH05', N'LC03', N'CÂY TÙNG MỌC XỨ BỒNG LAI')
INSERT [dbo].[PRODUCT] ([PRODUCT_ID], [PRODUCT_NAME], [AMOUNT], [AMOUNT_REMAINING], [OLD_PRICE], [PRODUCT_IMAGE], [MANUFACTURER_ID], [CATEGORY_ID], [PRODUCT_DESCRIPTION]) VALUES (N'SPS01', N'SEN ĐÁ THÁI', 5, 4, 25000, NULL, N'PH04', N'LC02', N'SEN ĐÁ NHẬP KHẨU TỪ THÁI')
INSERT [dbo].[PRODUCT] ([PRODUCT_ID], [PRODUCT_NAME], [AMOUNT], [AMOUNT_REMAINING], [OLD_PRICE], [PRODUCT_IMAGE], [MANUFACTURER_ID], [CATEGORY_ID], [PRODUCT_DESCRIPTION]) VALUES (N'SPS02', N'SEN ĐÁ HOA CƯƠNG', 10, 5, 50000, NULL, N'PH04', N'LC02', N'')
INSERT [dbo].[PRODUCT] ([PRODUCT_ID], [PRODUCT_NAME], [AMOUNT], [AMOUNT_REMAINING], [OLD_PRICE], [PRODUCT_IMAGE], [MANUFACTURER_ID], [CATEGORY_ID], [PRODUCT_DESCRIPTION]) VALUES (N'SPS03', N'CÂY XƯƠNG RỒNG XANH', 2, 2, 127500, NULL, N'PH03', N'LC02', N'')
INSERT [dbo].[PRODUCT] ([PRODUCT_ID], [PRODUCT_NAME], [AMOUNT], [AMOUNT_REMAINING], [OLD_PRICE], [PRODUCT_IMAGE], [MANUFACTURER_ID], [CATEGORY_ID], [PRODUCT_DESCRIPTION]) VALUES (N'SPS04', N'CÂY SEN THƯỢC DƯỢC', 12, 2, 65000, NULL, N'PH03', N'LC02', N'CÂY SEN THƯỢC DƯỢT ĐẸP VÀ ĐẦY MÀU SẮC CỦA NÓ')
INSERT [dbo].[PRODUCT] ([PRODUCT_ID], [PRODUCT_NAME], [AMOUNT], [AMOUNT_REMAINING], [OLD_PRICE], [PRODUCT_IMAGE], [MANUFACTURER_ID], [CATEGORY_ID], [PRODUCT_DESCRIPTION]) VALUES (N'SPS05', N'CÂY SEN SAO BIỂN TRẦN CHÂU', 32, 25, 78000, NULL, N'PH03', N'LC02', N'CÂY SEN NÀY CÓ HÌNH DẠNG GIỐNG NHƯ CON SAO BIỂN, RẤT ĐẸP VÀ PHÙ HỢP VỚI DÂN VĂN PHÒNG')
INSERT [dbo].[PRODUCT] ([PRODUCT_ID], [PRODUCT_NAME], [AMOUNT], [AMOUNT_REMAINING], [OLD_PRICE], [PRODUCT_IMAGE], [MANUFACTURER_ID], [CATEGORY_ID], [PRODUCT_DESCRIPTION]) VALUES (N'SPTS01', N'CÂY VẠN LỘC THỦY SINH', 21, 15, 28000, NULL, N'PH01', N'LC03', N'CÂY VẠN LỘC THỦY SINH ĐẸP NHẤT VƯỜN')
INSERT [dbo].[PRODUCT] ([PRODUCT_ID], [PRODUCT_NAME], [AMOUNT], [AMOUNT_REMAINING], [OLD_PRICE], [PRODUCT_IMAGE], [MANUFACTURER_ID], [CATEGORY_ID], [PRODUCT_DESCRIPTION]) VALUES (N'SPTS02', N'CÂY TRẦU BÀ VÀNG THỦY SINH', 30, 14, 78000, NULL, N'PH01', N'LC01', N'CÂY TRẦU BÀ THỦY SINH ĐẸP, PHÙ HỢP VỚI NGƯỜI THÍCH CHƠI CÂY THỦY SINH')
INSERT [dbo].[PRODUCT] ([PRODUCT_ID], [PRODUCT_NAME], [AMOUNT], [AMOUNT_REMAINING], [OLD_PRICE], [PRODUCT_IMAGE], [MANUFACTURER_ID], [CATEGORY_ID], [PRODUCT_DESCRIPTION]) VALUES (N'SPTS03', N'CÂY THỊNH VƯỢN THỦY SINH', 8, 6, 45000, NULL, N'PH01', N'LC01', N'CÂY THỊNH VƯỢN THỦY SINH LÀM CHO NGÔI NHÀ CỦA BẠN THÊM ĐẸP HƠN, MANG ĐẾN SỰ THỊNH VƯỢN CHO NGÔI NHÀ CỦA BẠN')
INSERT [dbo].[PRODUCT] ([PRODUCT_ID], [PRODUCT_NAME], [AMOUNT], [AMOUNT_REMAINING], [OLD_PRICE], [PRODUCT_IMAGE], [MANUFACTURER_ID], [CATEGORY_ID], [PRODUCT_DESCRIPTION]) VALUES (N'SPTS04', N'CÂY PHÚ QUÝ THỦY SINH', 6, 4, 36000, NULL, N'PH01', N'LC01', N'CÂY PHÚ QUÝ THỦY SINH MANG ĐẾN CHO NGÔI NHÀ CỦA BẠN SỰ PHÚ QUÝ')
INSERT [dbo].[USERS] ([USERID], [EMAIL], [FIRST_NAME], [LAST_NAME], [USERNAME], [PASSWORDS], [IS_ACTIVE], [PHONE_NUMBER], [USERS_IMAGE], [USERS_DESCRIPTION]) VALUES (N'US01', N'nguyenxuanthuan.999@gmail.com', N'Thuận', N'Nguyễn Xuân', N'NguyenXuanThuan', N'24091999', 0, N'0962741355', NULL, N'Admin QUẢN TRỊ')
INSERT [dbo].[USERS] ([USERID], [EMAIL], [FIRST_NAME], [LAST_NAME], [USERNAME], [PASSWORDS], [IS_ACTIVE], [PHONE_NUMBER], [USERS_IMAGE], [USERS_DESCRIPTION]) VALUES (N'US02', N'1754050010bao@ou.edu.vn', N'Bảo', N'Dương Trần Hoài Bảo', N'DuongTranHoaiBao', N'123456', 0, N'0936475368', NULL, N'Admin 2')
INSERT [dbo].[USERS] ([USERID], [EMAIL], [FIRST_NAME], [LAST_NAME], [USERNAME], [PASSWORDS], [IS_ACTIVE], [PHONE_NUMBER], [USERS_IMAGE], [USERS_DESCRIPTION]) VALUES (N'US03', N'hienhoa123@gmail.com', N'Hòa', N'Trương Thị Hiền', N'TruongThiHienHoa', N'123456', 0, N'0574368751', NULL, N'Admin 3')
INSERT [dbo].[USERS] ([USERID], [EMAIL], [FIRST_NAME], [LAST_NAME], [USERNAME], [PASSWORDS], [IS_ACTIVE], [PHONE_NUMBER], [USERS_IMAGE], [USERS_DESCRIPTION]) VALUES (N'US04', N'trucngan@gmail.com', N'Ngân', N'Võ Thị Trúc', N'VoThiTrucNgan', N'123456', 0, N'0852367145', NULL, N'Admin 4')
INSERT [dbo].[USERS] ([USERID], [EMAIL], [FIRST_NAME], [LAST_NAME], [USERNAME], [PASSWORDS], [IS_ACTIVE], [PHONE_NUMBER], [USERS_IMAGE], [USERS_DESCRIPTION]) VALUES (N'US05', N'Lemy@gmail.com', N'Mỹ', N'Nguyễn Lệ', N'NguyenLeMy', N'123456', 0, N'0753652854', NULL, N'Admin 5')
INSERT [dbo].[USERS] ([USERID], [EMAIL], [FIRST_NAME], [LAST_NAME], [USERNAME], [PASSWORDS], [IS_ACTIVE], [PHONE_NUMBER], [USERS_IMAGE], [USERS_DESCRIPTION]) VALUES (N'US06', N'test@gmail.com', N'Test', N'Test', N'Test', N'123456', 1, N'1900000025', NULL, N'Admin Test')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__CATEGORY__9374460FC5988437]    Script Date: 05/06/2020 10:39:30 PM ******/
ALTER TABLE [dbo].[CATEGORY] ADD UNIQUE NONCLUSTERED 
(
	[CATEGORY_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__CUSTOMER__161CF72410F262CD]    Script Date: 05/06/2020 10:39:30 PM ******/
ALTER TABLE [dbo].[CUSTOMER] ADD UNIQUE NONCLUSTERED 
(
	[EMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__CUSTOMER__D94A4FFB59706521]    Script Date: 05/06/2020 10:39:30 PM ******/
ALTER TABLE [dbo].[CUSTOMER] ADD UNIQUE NONCLUSTERED 
(
	[PHONE_NUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__USERS__161CF724418514A7]    Script Date: 05/06/2020 10:39:30 PM ******/
ALTER TABLE [dbo].[USERS] ADD UNIQUE NONCLUSTERED 
(
	[EMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__USERS__B15BE12EEF8B8F25]    Script Date: 05/06/2020 10:39:30 PM ******/
ALTER TABLE [dbo].[USERS] ADD UNIQUE NONCLUSTERED 
(
	[USERNAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__USERS__D94A4FFBD2600F79]    Script Date: 05/06/2020 10:39:30 PM ******/
ALTER TABLE [dbo].[USERS] ADD UNIQUE NONCLUSTERED 
(
	[PHONE_NUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD  CONSTRAINT [FK_CUSTOMER] FOREIGN KEY([CUSTOMER_ID])
REFERENCES [dbo].[CUSTOMER] ([CUSTOMER_ID])
GO
ALTER TABLE [dbo].[ORDER] CHECK CONSTRAINT [FK_CUSTOMER]
GO
ALTER TABLE [dbo].[ORDERDETAIL]  WITH CHECK ADD  CONSTRAINT [FK_ORDER] FOREIGN KEY([ORDER_ID])
REFERENCES [dbo].[ORDER] ([ORDER_ID])
GO
ALTER TABLE [dbo].[ORDERDETAIL] CHECK CONSTRAINT [FK_ORDER]
GO
ALTER TABLE [dbo].[ORDERDETAIL]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT] FOREIGN KEY([PRODUCT_ID])
REFERENCES [dbo].[PRODUCT] ([PRODUCT_ID])
GO
ALTER TABLE [dbo].[ORDERDETAIL] CHECK CONSTRAINT [FK_PRODUCT]
GO
ALTER TABLE [dbo].[ORDERDETAIL]  WITH CHECK ADD  CONSTRAINT [FK_USER] FOREIGN KEY([USERID])
REFERENCES [dbo].[USERS] ([USERID])
GO
ALTER TABLE [dbo].[ORDERDETAIL] CHECK CONSTRAINT [FK_USER]
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD  CONSTRAINT [fk_CATEGORY] FOREIGN KEY([CATEGORY_ID])
REFERENCES [dbo].[CATEGORY] ([CATEGORY_ID])
GO
ALTER TABLE [dbo].[PRODUCT] CHECK CONSTRAINT [fk_CATEGORY]
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_MANUFACTURER] FOREIGN KEY([MANUFACTURER_ID])
REFERENCES [dbo].[MANUFACTURER] ([MANUFACTURER_ID])
GO
ALTER TABLE [dbo].[PRODUCT] CHECK CONSTRAINT [FK_MANUFACTURER]
GO
ALTER TABLE dbo.USERS ADD CONSTRAINT Def_Users_Active DEFAULT(1) FOR IS_ACTIVE	-- Thuoc tính mặc định là có hoạt động
GO

-- Create Triggers Phone Number
CREATE TRIGGER tr_PhoneNumberUser
ON dbo.USERS 
FOR INSERT
AS
BEGIN
	DECLARE @PhoneNumberUser VARCHAR(10)
	SELECT @PhoneNumberUser = LEN(PHONE_NUMBER) FROM Inserted
	IF (@PhoneNumberUser != 10)
	BEGIN
			RAISERROR(N'Số điện thoại phải là 10 số', 10, 1);
			ROLLBACK TRAN;
	END 
END

GO
CREATE TRIGGER tr_PhoneNumberCustomer
ON dbo.CUSTOMER
FOR INSERT
AS
BEGIN
	DECLARE @PhoneNumberCustomer VARCHAR(10)
	SELECT @PhoneNumberCustomer = LEN(PHONE_NUMBER) FROM Inserted
	IF (@PhoneNumberCustomer != 10)
	BEGIN
			RAISERROR(N'Số điện thoại phải là 10 số', 10, 1);
			ROLLBACK TRAN;
	END 
END
GO

--  DElete Triggers
-- DROP TRIGGER tr_PhoneNumber
-- Create Triggers
CREATE TRIGGER tr_OrderDate
ON dbo.Orders
FOR INSERT 
AS 
BEGIN		-- Script Owner: Nguyễn Xuân Thuận
	
	IF((SELECT ORDER_DATE FROM Inserted) > GETDATE())
	BEGIN 
		RAISERROR(N'Ngày Order phải nhỏ hơn ngày hiện tại', 10, 1);
		ROLLBACK TRAN;
	END 
END 

GO
-- create index
CREATE INDEX idx_User ON dbo.USERS(FIRST_NAME)
GO 
CREATE INDEX idx_Customer ON dbo.CUSTOMER(FIRST_NAME)
GO 
CREATE INDEX idx_Product ON dbo.PRODUCT(PRODUCT_NAME)
GO
CREATE INDEX idx_Category ON dbo.CATEGORY(CATEGORY_NAME)
GO
CREATE INDEX idx_Manufacturer ON dbo.MANUFACTURER(MANUFACTURER_NAME)
GO
-- Script Owner: Nguyễn Xuân Thuận
