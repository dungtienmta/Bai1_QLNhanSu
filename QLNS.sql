
use QLNS
go
CREATE TABLE [dbo].[tblNhanVien](
	[MaNV] [char](10) NOT NULL,
	[HoDem] [nvarchar](50) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[NS] [date] NULL,
	[GT] [char](3) NULL,
	[LUONG] [int] NULL,
	[DC] [nvarchar](50) NULL,
	[Ma_NQL] [nvarchar](50) NULL,
	[MaDV] [char](10) NULL,
	[ChucVu] [nvarchar](50) NULL,
	[DT] [int] NULL,
 CONSTRAINT [NV_MaNV_PK] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblNhanVien] ([MaNV], [HoDem], [TenNV], [NS], [GT], [LUONG], [DC], [Ma_NQL], [MaDV], [ChucVu], [DT]) VALUES (N'NV01      ', N'Phạm Văn', N'Lượng', CAST(0x92390B00 AS Date), N'Nam', 1000000, NULL, NULL, N'DV03      ', NULL, NULL)
INSERT [dbo].[tblNhanVien] ([MaNV], [HoDem], [TenNV], [NS], [GT], [LUONG], [DC], [Ma_NQL], [MaDV], [ChucVu], [DT]) VALUES (N'NV02      ', N'Lê Tiến', N'Dũng', CAST(0x92390B00 AS Date), N'Nam', 50000000, NULL, NULL, N'DV03      ', NULL, NULL)
INSERT [dbo].[tblNhanVien] ([MaNV], [HoDem], [TenNV], [NS], [GT], [LUONG], [DC], [Ma_NQL], [MaDV], [ChucVu], [DT]) VALUES (N'NV03      ', N'Đoàn Quang', N'Long', CAST(0x92390B00 AS Date), N'Nam', 4000000, NULL, NULL, N'DV03      ', NULL, NULL)
INSERT [dbo].[tblNhanVien] ([MaNV], [HoDem], [TenNV], [NS], [GT], [LUONG], [DC], [Ma_NQL], [MaDV], [ChucVu], [DT]) VALUES (N'NV04      ', N'Bạch Thị Diệu', N'Linh', CAST(0x92390B00 AS Date), N'Nu ', 50000, NULL, NULL, N'DV03      ', NULL, NULL)
INSERT [dbo].[tblNhanVien] ([MaNV], [HoDem], [TenNV], [NS], [GT], [LUONG], [DC], [Ma_NQL], [MaDV], [ChucVu], [DT]) VALUES (N'NV05      ', N'Trần Minh', N'Nghiệp', CAST(0x92390B00 AS Date), N'Nam', 1000000, NULL, NULL, N'DV03      ', NULL, NULL)
/****** Object:  Table [dbo].[tblDonVi]    Script Date: 09/25/2015 08:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDonVi](
	[MaDV] [char](10) NOT NULL,
	[TenDV] [nvarchar](50) NOT NULL,
	[NQL] [char](10) NULL,
	[DC] [nvarchar](50) NULL,
	[SoDT] [int] NULL,
 CONSTRAINT [DV_MaDV_PK] PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblDonVi] ([MaDV], [TenDV], [NQL], [DC], [SoDT]) VALUES (N'DV02      ', N'TD4', N'NV01      ', NULL, 187126378)
INSERT [dbo].[tblDonVi] ([MaDV], [TenDV], [NQL], [DC], [SoDT]) VALUES (N'DV03      ', N'TD3', N'NV01      ', NULL, 122222222)
INSERT [dbo].[tblDonVi] ([MaDV], [TenDV], [NQL], [DC], [SoDT]) VALUES (N'DV11      ', N'Khoa CNTT', N'NV02      ', NULL, 974877878)
/****** Object:  Default [NV_NS_DF]    Script Date: 09/25/2015 08:35:33 ******/
ALTER TABLE [dbo].[tblNhanVien] ADD  CONSTRAINT [NV_NS_DF]  DEFAULT (getdate()) FOR [NS]
GO
/****** Object:  Default [DF__tblNhanVi__LUONG__014935CB]    Script Date: 09/25/2015 08:35:33 ******/
ALTER TABLE [dbo].[tblNhanVien] ADD  DEFAULT ((1000)) FOR [LUONG]
GO
/****** Object:  Check [NV_GT_CHK]    Script Date: 09/25/2015 08:35:33 ******/
ALTER TABLE [dbo].[tblNhanVien]  WITH CHECK ADD  CONSTRAINT [NV_GT_CHK] CHECK  (([GT]='Nu' OR [GT]='Nam'))
GO
ALTER TABLE [dbo].[tblNhanVien] CHECK CONSTRAINT [NV_GT_CHK]
GO
/****** Object:  ForeignKey [DV_NQL_FK]    Script Date: 09/25/2015 08:35:33 ******/
ALTER TABLE [dbo].[tblDonVi]  WITH CHECK ADD  CONSTRAINT [DV_NQL_FK] FOREIGN KEY([NQL])
REFERENCES [dbo].[tblNhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[tblDonVi] CHECK CONSTRAINT [DV_NQL_FK]
GO
