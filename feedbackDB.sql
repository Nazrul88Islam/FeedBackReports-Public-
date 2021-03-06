USE [feedbackreport]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 05/14/2020 22:22:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] NOT NULL,
	[p_Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Posts] ([Id], [p_Name]) VALUES (1, N'post1')
INSERT [dbo].[Posts] ([Id], [p_Name]) VALUES (2, N'post2')
INSERT [dbo].[Posts] ([Id], [p_Name]) VALUES (3, N'post3')
INSERT [dbo].[Posts] ([Id], [p_Name]) VALUES (4, N'post4')
/****** Object:  Table [dbo].[comments]    Script Date: 05/14/2020 22:22:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comments](
	[Id] [int] NOT NULL,
	[c_Name] [varchar](50) NULL,
	[user] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[p_Id] [int] NULL,
 CONSTRAINT [PK_comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[comments] ([Id], [c_Name], [user], [Date], [p_Id]) VALUES (1, N'comment1', N'user1', CAST(0x0000ABBB00D02C5D AS DateTime), 1)
INSERT [dbo].[comments] ([Id], [c_Name], [user], [Date], [p_Id]) VALUES (2, N'comment2', N'user2', CAST(0x0000ABBB00D02C5D AS DateTime), 1)
INSERT [dbo].[comments] ([Id], [c_Name], [user], [Date], [p_Id]) VALUES (3, N'comment3', N'user3', CAST(0x0000ABBB00D02C5D AS DateTime), 1)
INSERT [dbo].[comments] ([Id], [c_Name], [user], [Date], [p_Id]) VALUES (4, N'comment4', N'user1', CAST(0x0000ABBB00D02C5D AS DateTime), 2)
INSERT [dbo].[comments] ([Id], [c_Name], [user], [Date], [p_Id]) VALUES (5, N'comment5', N'user2', CAST(0x0000ABBB00D02C5D AS DateTime), 2)
INSERT [dbo].[comments] ([Id], [c_Name], [user], [Date], [p_Id]) VALUES (6, N'comment6', N'user3', CAST(0x0000ABBB00D02C5D AS DateTime), 2)
INSERT [dbo].[comments] ([Id], [c_Name], [user], [Date], [p_Id]) VALUES (7, N'comment7', N'user3', CAST(0x0000ABBB00D02C5D AS DateTime), 2)
INSERT [dbo].[comments] ([Id], [c_Name], [user], [Date], [p_Id]) VALUES (8, N'comment8', N'user1', CAST(0x0000ABBB00D02C5D AS DateTime), 3)
INSERT [dbo].[comments] ([Id], [c_Name], [user], [Date], [p_Id]) VALUES (9, N'comment9', N'user1', CAST(0x0000ABBB00D02C5D AS DateTime), 4)
/****** Object:  Table [dbo].[Like_Dislike]    Script Date: 05/14/2020 22:22:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Like_Dislike](
	[Id] [int] NOT NULL,
	[like] [int] NULL,
	[dislike] [int] NULL,
	[c_id] [int] NULL,
 CONSTRAINT [PK_Like] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Like_Dislike] ([Id], [like], [dislike], [c_id]) VALUES (1, 256, 128, 1)
INSERT [dbo].[Like_Dislike] ([Id], [like], [dislike], [c_id]) VALUES (2, 268, 120, 2)
INSERT [dbo].[Like_Dislike] ([Id], [like], [dislike], [c_id]) VALUES (3, 268, 128, 3)
INSERT [dbo].[Like_Dislike] ([Id], [like], [dislike], [c_id]) VALUES (4, 268, 128, 4)
INSERT [dbo].[Like_Dislike] ([Id], [like], [dislike], [c_id]) VALUES (5, 268, 128, 5)
INSERT [dbo].[Like_Dislike] ([Id], [like], [dislike], [c_id]) VALUES (6, 268, 128, 6)
INSERT [dbo].[Like_Dislike] ([Id], [like], [dislike], [c_id]) VALUES (7, 268, 128, 7)
INSERT [dbo].[Like_Dislike] ([Id], [like], [dislike], [c_id]) VALUES (8, 268, 128, 8)
INSERT [dbo].[Like_Dislike] ([Id], [like], [dislike], [c_id]) VALUES (9, 268, 128, 9)
/****** Object:  StoredProcedure [dbo].[GetReportData]    Script Date: 05/14/2020 22:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
/*
exec GetReportData
*/
-- =============================================
CREATE PROCEDURE [dbo].[GetReportData]

	
AS
BEGIN

	SET NOCOUNT ON;
	
	select ps.p_Name as postname,cm.c_Name as CustomerName, cm.[user] as username, cm.Date as date,lids.[like],lids.dislike as Dislike
	      from Posts as ps, comments as cm, like_dislike as lids
	      where ps.Id=cm.p_id and cm.id=lids.c_id
	
	
	
	
END
GO
/****** Object:  ForeignKey [FK_comments_Posts]    Script Date: 05/14/2020 22:22:03 ******/
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_Posts] FOREIGN KEY([p_Id])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments_Posts]
GO
/****** Object:  ForeignKey [FK_Like_Dislike_comments]    Script Date: 05/14/2020 22:22:03 ******/
ALTER TABLE [dbo].[Like_Dislike]  WITH CHECK ADD  CONSTRAINT [FK_Like_Dislike_comments] FOREIGN KEY([c_id])
REFERENCES [dbo].[comments] ([Id])
GO
ALTER TABLE [dbo].[Like_Dislike] CHECK CONSTRAINT [FK_Like_Dislike_comments]
GO
