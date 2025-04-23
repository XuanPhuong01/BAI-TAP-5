CREATE TABLE [dbo].[CauHoi](
	[MaCH] [varchar](10) NOT NULL,
	[NoiDung] [nvarchar](200) NULL,
	[LinhVuc] [nvarchar](50) NULL,
 CONSTRAINT [PK_CauHoi] PRIMARY KEY CLUSTERED 
(
	[MaCH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [HT chọn Ngành]
GO

/****** Object:  Table [dbo].[GoiYNganh]    Script Date: 4/23/2025 6:47:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GoiYNganh](
	[MaSV] [varchar](10) NULL,
	[MaNganh] [varchar](10) NULL,
	[MucDoPhuHop] [float] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[GoiYNganh]  WITH CHECK ADD  CONSTRAINT [FK_GoiYNganh_Nganh] FOREIGN KEY([MaNganh])
REFERENCES [dbo].[Nganh] ([MaNganh])
GO

ALTER TABLE [dbo].[GoiYNganh] CHECK CONSTRAINT [FK_GoiYNganh_Nganh]
GO

ALTER TABLE [dbo].[GoiYNganh]  WITH CHECK ADD  CONSTRAINT [FK_GoiYNganh_SinhVien] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SinhVien] ([MaSV])
GO

ALTER TABLE [dbo].[GoiYNganh] CHECK CONSTRAINT [FK_GoiYNganh_SinhVien]
GO

ALTER TABLE [dbo].[GoiYNganh]  WITH CHECK ADD  CONSTRAINT [CK_GoiYNganh] CHECK  (([MucDoPhuHop]>=(0) AND [MucDoPhuHop]<=(100)))
GO

ALTER TABLE [dbo].[GoiYNganh] CHECK CONSTRAINT [CK_GoiYNganh]
GO

USE [HT chọn Ngành]
GO

/****** Object:  Table [dbo].[Nganh]    Script Date: 4/23/2025 6:49:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Nganh](
	[MaNganh] [varchar](10) NOT NULL,
	[TenNganh] [nvarchar](20) NULL,
	[KhoiXetTuyen] [varchar](10) NULL,
	[MoTa] [nvarchar](300) NULL,
 CONSTRAINT [PK_Nganh] PRIMARY KEY CLUSTERED 
(
	[MaNganh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [HT chọn Ngành]
GO

/****** Object:  Table [dbo].[SinhVien]    Script Date: 4/23/2025 6:49:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SinhVien](
	[MaSV] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](20) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[DiemTB] [float] NULL,
	[SoThich] [nvarchar](100) NULL,
	[SoNganhPhuHop] [int] NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [CK_SinhVien] CHECK  (([ngaysinh]<=getdate()))
GO

ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [CK_SinhVien]
GO

USE [HT chọn Ngành]
GO

/****** Object:  Table [dbo].[TraLoi]    Script Date: 4/23/2025 6:50:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TraLoi](
	[MaSV] [varchar](10) NULL,
	[MaCH] [varchar](10) NULL,
	[Diem] [float] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TraLoi]  WITH CHECK ADD  CONSTRAINT [FK_TraLoi_CauHoi] FOREIGN KEY([MaCH])
REFERENCES [dbo].[CauHoi] ([MaCH])
GO

ALTER TABLE [dbo].[TraLoi] CHECK CONSTRAINT [FK_TraLoi_CauHoi]
GO

ALTER TABLE [dbo].[TraLoi]  WITH CHECK ADD  CONSTRAINT [FK_TraLoi_SinhVien] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SinhVien] ([MaSV])
GO

ALTER TABLE [dbo].[TraLoi] CHECK CONSTRAINT [FK_TraLoi_SinhVien]
GO


USE [HT chọn Ngành]
GO
/****** Object:  Trigger [dbo].[trg_CapNhatSoNganhPhuHop]    Script Date: 4/23/2025 6:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[trg_CapNhatSoNganhPhuHop]
ON [dbo].[GoiYNganh]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE SinhVien
    SET SoNganhPhuHop = (
        SELECT COUNT(*)
        FROM GoiYNganh
        WHERE GoiYNganh.MaSV = SinhVien.MaSV AND MucDoPhuHop > 60
    )
    WHERE MaSV IN (
        SELECT MaSV FROM inserted
        UNION
        SELECT MaSV FROM deleted
    );
END;

