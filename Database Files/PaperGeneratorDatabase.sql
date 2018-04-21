---- Date : 21/04/2018 / By Bhargav J Patel

CREATE TABLE [dbo].[TblCompany](
	[cCompany_ID] [uniqueidentifier] NOT NULL,
	[cCompName] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_TblCompany] PRIMARY KEY CLUSTERED 
(
	[cCompany_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[TblCompany] ADD  CONSTRAINT [DF_TblCompany_NID]  DEFAULT (newid()) FOR [cCompany_ID]
GO


CREATE TABLE [dbo].[Login](
	[cLogin_ID] [uniqueidentifier] NOT NULL,
	[cName] [nvarchar](250) NOT NULL,
	[cContactNo] [nvarchar](250) NULL,
	[cUserName] [nvarchar](250) NOT NULL,
	[cPassword] [nvarchar](250) NOT NULL,
	[cCompany_ID] [uniqueidentifier] NOT NULL,
	[cActive] [bit] NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[cLogin_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Login] ADD  CONSTRAINT [DF_Login_NID]  DEFAULT (newid()) FOR [cLogin_ID]
GO

ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_TblCompany] FOREIGN KEY([cCompany_ID])
REFERENCES [dbo].[TblCompany] ([cCompany_ID])
GO

ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_TblCompany]
GO


USE [PaperGenerator]
GO

/****** Object:  Table [dbo].[Tbl_MidiumMaster]    Script Date: 21/04/2018 15:12:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tbl_MidiumMaster](
	[cMedium_ID] [uniqueidentifier] NOT NULL,
	[cMedium] [nvarchar](250) NOT NULL,
	[cCompany_ID] [uniqueidentifier] NULL,
	[cInsetedBy] [uniqueidentifier] NULL,
	[dInserted_Date] [datetime] NULL,
	[cUpdatedBy] [uniqueidentifier] NULL,
	[dUpdated_Date] [datetime] NULL,
 CONSTRAINT [PK_Tbl_MidiumMaster] PRIMARY KEY CLUSTERED 
(
	[cMedium_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Tbl_MidiumMaster] ADD  CONSTRAINT [DF_Tbl_MidiumMaster_NID]  DEFAULT (newid()) FOR [cMedium_ID]
GO

ALTER TABLE [dbo].[Tbl_MidiumMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_MidiumMaster_Login_InsertedBy] FOREIGN KEY([cInsetedBy])
REFERENCES [dbo].[Login] ([cLogin_ID])
GO

ALTER TABLE [dbo].[Tbl_MidiumMaster] CHECK CONSTRAINT [FK_Tbl_MidiumMaster_Login_InsertedBy]
GO

ALTER TABLE [dbo].[Tbl_MidiumMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_MidiumMaster_Login_UpdatedBy] FOREIGN KEY([cUpdatedBy])
REFERENCES [dbo].[Login] ([cLogin_ID])
GO

ALTER TABLE [dbo].[Tbl_MidiumMaster] CHECK CONSTRAINT [FK_Tbl_MidiumMaster_Login_UpdatedBy]
GO

ALTER TABLE [dbo].[Tbl_MidiumMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_MidiumMaster_TblCompany] FOREIGN KEY([cCompany_ID])
REFERENCES [dbo].[TblCompany] ([cCompany_ID])
GO

ALTER TABLE [dbo].[Tbl_MidiumMaster] CHECK CONSTRAINT [FK_Tbl_MidiumMaster_TblCompany]
GO




CREATE TABLE [dbo].[Tbl_StandardMaster](
	[cStandard_ID] [uniqueidentifier] NOT NULL,
	[cMedium_ID] [uniqueidentifier] NOT NULL,
	[cStandardName] [nvarchar](100) NOT NULL,
	[cCompany_ID] [uniqueidentifier] NOT NULL,
	[cInsetedBy] [uniqueidentifier] NULL,
	[dInserted_Date] [datetime] NULL,
	[cUpdatedBy] [uniqueidentifier] NULL,
	[dUpdated_Date] [datetime] NULL,
 CONSTRAINT [PK_Tbl_StandardMaster] PRIMARY KEY CLUSTERED 
(
	[cStandard_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Tbl_StandardMaster] ADD  CONSTRAINT [DF_Tbl_StandardMaster_cStandard_ID]  DEFAULT (newid()) FOR [cStandard_ID]
GO

ALTER TABLE [dbo].[Tbl_StandardMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_StandardMaster_Login_InsrtedBy] FOREIGN KEY([cInsetedBy])
REFERENCES [dbo].[Login] ([cLogin_ID])
GO

ALTER TABLE [dbo].[Tbl_StandardMaster] CHECK CONSTRAINT [FK_Tbl_StandardMaster_Login_InsrtedBy]
GO

ALTER TABLE [dbo].[Tbl_StandardMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_StandardMaster_Login_UpdatedBy] FOREIGN KEY([cUpdatedBy])
REFERENCES [dbo].[Login] ([cLogin_ID])
GO

ALTER TABLE [dbo].[Tbl_StandardMaster] CHECK CONSTRAINT [FK_Tbl_StandardMaster_Login_UpdatedBy]
GO

ALTER TABLE [dbo].[Tbl_StandardMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_StandardMaster_Tbl_MidiumMaster] FOREIGN KEY([cMedium_ID])
REFERENCES [dbo].[Tbl_MidiumMaster] ([cMedium_ID])
GO

ALTER TABLE [dbo].[Tbl_StandardMaster] CHECK CONSTRAINT [FK_Tbl_StandardMaster_Tbl_MidiumMaster]
GO

ALTER TABLE [dbo].[Tbl_StandardMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_StandardMaster_TblCompany] FOREIGN KEY([cCompany_ID])
REFERENCES [dbo].[TblCompany] ([cCompany_ID])
GO

ALTER TABLE [dbo].[Tbl_StandardMaster] CHECK CONSTRAINT [FK_Tbl_StandardMaster_TblCompany]
GO






CREATE TABLE [dbo].[Tbl_SubjectMaster](
	[cSubject_ID] [uniqueidentifier] NOT NULL,
	[cMedium_ID] [uniqueidentifier] NOT NULL,
	[cStandard_ID] [uniqueidentifier] NOT NULL,
	[cSubjectName] [nvarchar](100) NOT NULL,
	[cCompany_ID] [uniqueidentifier] NOT NULL,
	[cInsetedBy] [uniqueidentifier] NULL,
	[dInserted_Date] [datetime] NULL,
	[cUpdatedBy] [uniqueidentifier] NULL,
	[dUpdated_Date] [datetime] NULL,
 CONSTRAINT [PK_Tbl_SubjectMaster] PRIMARY KEY CLUSTERED 
(
	[cSubject_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Tbl_SubjectMaster] ADD  CONSTRAINT [DF_Tbl_SubjectMaster_cSubject_ID]  DEFAULT (newid()) FOR [cSubject_ID]
GO

ALTER TABLE [dbo].[Tbl_SubjectMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_SubjectMaster_Login_InsrtedBy] FOREIGN KEY([cInsetedBy])
REFERENCES [dbo].[Login] ([cLogin_ID])
GO

ALTER TABLE [dbo].[Tbl_SubjectMaster] CHECK CONSTRAINT [FK_Tbl_SubjectMaster_Login_InsrtedBy]
GO

ALTER TABLE [dbo].[Tbl_SubjectMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_SubjectMaster_Login_UpdatedBy] FOREIGN KEY([cUpdatedBy])
REFERENCES [dbo].[Login] ([cLogin_ID])
GO

ALTER TABLE [dbo].[Tbl_SubjectMaster] CHECK CONSTRAINT [FK_Tbl_SubjectMaster_Login_UpdatedBy]
GO

ALTER TABLE [dbo].[Tbl_SubjectMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_SubjectMaster_Tbl_MidiumMaster] FOREIGN KEY([cMedium_ID])
REFERENCES [dbo].[Tbl_MidiumMaster] ([cMedium_ID])
GO

ALTER TABLE [dbo].[Tbl_SubjectMaster] CHECK CONSTRAINT [FK_Tbl_SubjectMaster_Tbl_MidiumMaster]
GO

ALTER TABLE [dbo].[Tbl_SubjectMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_SubjectMaster_Tbl_StandardMaster] FOREIGN KEY([cStandard_ID])
REFERENCES [dbo].[Tbl_StandardMaster] ([cStandard_ID])
GO

ALTER TABLE [dbo].[Tbl_SubjectMaster] CHECK CONSTRAINT [FK_Tbl_SubjectMaster_Tbl_StandardMaster]
GO

ALTER TABLE [dbo].[Tbl_SubjectMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_SubjectMaster_TblCompany] FOREIGN KEY([cCompany_ID])
REFERENCES [dbo].[TblCompany] ([cCompany_ID])
GO

ALTER TABLE [dbo].[Tbl_SubjectMaster] CHECK CONSTRAINT [FK_Tbl_SubjectMaster_TblCompany]
GO





CREATE TABLE [dbo].[Tbl_ChapterMaster](
	[cChapter_ID] [uniqueidentifier] NOT NULL,
	[cMedium_ID] [uniqueidentifier] NOT NULL,
	[cStandard_ID] [uniqueidentifier] NOT NULL,
	[cSubject_ID] [uniqueidentifier] NOT NULL,
	[nChaper_Index] [int] NOT NULL,
	[cChapterName] [nvarchar](100) NOT NULL,
	[bDemo] [bit] NULL,
	[cCompany_ID] [uniqueidentifier] NOT NULL,
	[cInsetedBy] [uniqueidentifier] NULL,
	[dInserted_Date] [datetime] NULL,
	[cUpdatedBy] [uniqueidentifier] NULL,
	[dUpdated_Date] [datetime] NULL,
 CONSTRAINT [PK_Tbl_ChapterMaster] PRIMARY KEY CLUSTERED 
(
	[cChapter_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Tbl_ChapterMaster] ADD  CONSTRAINT [DF_Tbl_ChapterMaster_cChapter_ID]  DEFAULT (newid()) FOR [cChapter_ID]
GO

ALTER TABLE [dbo].[Tbl_ChapterMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_ChapterMaster_Login_InsrtedBy] FOREIGN KEY([cInsetedBy])
REFERENCES [dbo].[Login] ([cLogin_ID])
GO

ALTER TABLE [dbo].[Tbl_ChapterMaster] CHECK CONSTRAINT [FK_Tbl_ChapterMaster_Login_InsrtedBy]
GO

ALTER TABLE [dbo].[Tbl_ChapterMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_ChapterMaster_Login_UpdatedBy] FOREIGN KEY([cUpdatedBy])
REFERENCES [dbo].[Login] ([cLogin_ID])
GO

ALTER TABLE [dbo].[Tbl_ChapterMaster] CHECK CONSTRAINT [FK_Tbl_ChapterMaster_Login_UpdatedBy]
GO

ALTER TABLE [dbo].[Tbl_ChapterMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_ChapterMaster_Tbl_MidiumMaster] FOREIGN KEY([cMedium_ID])
REFERENCES [dbo].[Tbl_MidiumMaster] ([cMedium_ID])
GO

ALTER TABLE [dbo].[Tbl_ChapterMaster] CHECK CONSTRAINT [FK_Tbl_ChapterMaster_Tbl_MidiumMaster]
GO

ALTER TABLE [dbo].[Tbl_ChapterMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_ChapterMaster_Tbl_StandardMaster] FOREIGN KEY([cStandard_ID])
REFERENCES [dbo].[Tbl_StandardMaster] ([cStandard_ID])
GO

ALTER TABLE [dbo].[Tbl_ChapterMaster] CHECK CONSTRAINT [FK_Tbl_ChapterMaster_Tbl_StandardMaster]
GO

ALTER TABLE [dbo].[Tbl_ChapterMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_ChapterMaster_Tbl_SubjectMaster] FOREIGN KEY([cSubject_ID])
REFERENCES [dbo].[Tbl_SubjectMaster] ([cSubject_ID])
GO

ALTER TABLE [dbo].[Tbl_ChapterMaster] CHECK CONSTRAINT [FK_Tbl_ChapterMaster_Tbl_SubjectMaster]
GO

ALTER TABLE [dbo].[Tbl_ChapterMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_ChapterMaster_TblCompany] FOREIGN KEY([cCompany_ID])
REFERENCES [dbo].[TblCompany] ([cCompany_ID])
GO

ALTER TABLE [dbo].[Tbl_ChapterMaster] CHECK CONSTRAINT [FK_Tbl_ChapterMaster_TblCompany]
GO




CREATE TABLE [dbo].[Tbl_TopicMaster](
	[cTopic_ID] [uniqueidentifier] NOT NULL,
	[cMedium_ID] [uniqueidentifier] NOT NULL,
	[cStandard_ID] [uniqueidentifier] NOT NULL,
	[cSubject_ID] [uniqueidentifier] NOT NULL,
	[cChapter_ID] [uniqueidentifier] NOT NULL,
	[nTopic_Index] [int] NOT NULL,
	[cTopicName] [nvarchar](250) NOT NULL,
	[cCompany_ID] [uniqueidentifier] NOT NULL,
	[cInsetedBy] [uniqueidentifier] NULL,
	[dInserted_Date] [datetime] NULL,
	[cUpdatedBy] [uniqueidentifier] NULL,
	[dUpdated_Date] [datetime] NULL,
 CONSTRAINT [PK_Tbl_TopicMaster] PRIMARY KEY CLUSTERED 
(
	[cTopic_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Tbl_TopicMaster] ADD  CONSTRAINT [DF_Tbl_TopicMaster_cTopic_ID]  DEFAULT (newid()) FOR [cTopic_ID]
GO

ALTER TABLE [dbo].[Tbl_TopicMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_TopicMaster_Login_InsrtedBy] FOREIGN KEY([cInsetedBy])
REFERENCES [dbo].[Login] ([cLogin_ID])
GO

ALTER TABLE [dbo].[Tbl_TopicMaster] CHECK CONSTRAINT [FK_Tbl_TopicMaster_Login_InsrtedBy]
GO

ALTER TABLE [dbo].[Tbl_TopicMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_TopicMaster_Login_UpdatedBy] FOREIGN KEY([cUpdatedBy])
REFERENCES [dbo].[Login] ([cLogin_ID])
GO

ALTER TABLE [dbo].[Tbl_TopicMaster] CHECK CONSTRAINT [FK_Tbl_TopicMaster_Login_UpdatedBy]
GO

ALTER TABLE [dbo].[Tbl_TopicMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_TopicMaster_Tbl_ChapterMaster] FOREIGN KEY([cChapter_ID])
REFERENCES [dbo].[Tbl_ChapterMaster] ([cChapter_ID])
GO

ALTER TABLE [dbo].[Tbl_TopicMaster] CHECK CONSTRAINT [FK_Tbl_TopicMaster_Tbl_ChapterMaster]
GO

ALTER TABLE [dbo].[Tbl_TopicMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_TopicMaster_Tbl_MidiumMaster] FOREIGN KEY([cMedium_ID])
REFERENCES [dbo].[Tbl_MidiumMaster] ([cMedium_ID])
GO

ALTER TABLE [dbo].[Tbl_TopicMaster] CHECK CONSTRAINT [FK_Tbl_TopicMaster_Tbl_MidiumMaster]
GO

ALTER TABLE [dbo].[Tbl_TopicMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_TopicMaster_Tbl_StandardMaster] FOREIGN KEY([cStandard_ID])
REFERENCES [dbo].[Tbl_StandardMaster] ([cStandard_ID])
GO

ALTER TABLE [dbo].[Tbl_TopicMaster] CHECK CONSTRAINT [FK_Tbl_TopicMaster_Tbl_StandardMaster]
GO

ALTER TABLE [dbo].[Tbl_TopicMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_TopicMaster_Tbl_SubjectMaster] FOREIGN KEY([cSubject_ID])
REFERENCES [dbo].[Tbl_SubjectMaster] ([cSubject_ID])
GO

ALTER TABLE [dbo].[Tbl_TopicMaster] CHECK CONSTRAINT [FK_Tbl_TopicMaster_Tbl_SubjectMaster]
GO

ALTER TABLE [dbo].[Tbl_TopicMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_TopicMaster_TblCompany] FOREIGN KEY([cCompany_ID])
REFERENCES [dbo].[TblCompany] ([cCompany_ID])
GO

ALTER TABLE [dbo].[Tbl_TopicMaster] CHECK CONSTRAINT [FK_Tbl_TopicMaster_TblCompany]
GO


CREATE TABLE [dbo].[Tbl_Question_Type_Master](
	[cQuestion_Type_ID] [uniqueidentifier] NOT NULL,
	[cMedium_ID] [uniqueidentifier] NOT NULL,
	[cStandard_ID] [uniqueidentifier] NOT NULL,
	[cSubject_ID] [uniqueidentifier] NOT NULL,
	[cDescription] [nvarchar](max) NOT NULL,
	[cCompany_ID] [uniqueidentifier] NOT NULL,
	[cInsetedBy] [uniqueidentifier] NULL,
	[dInserted_Date] [datetime] NULL,
	[cUpdatedBy] [uniqueidentifier] NULL,
	[dUpdated_Date] [datetime] NULL,
 CONSTRAINT [PK_Tbl_Question_Type_Master] PRIMARY KEY CLUSTERED 
(
	[cQuestion_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Tbl_Question_Type_Master] ADD  CONSTRAINT [DF_Tbl_Question_Type_Master_cQuestion_Type_ID]  DEFAULT (newid()) FOR [cQuestion_Type_ID]
GO

ALTER TABLE [dbo].[Tbl_Question_Type_Master]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Question_Type_Master_Login_InsrtedBy] FOREIGN KEY([cInsetedBy])
REFERENCES [dbo].[Login] ([cLogin_ID])
GO

ALTER TABLE [dbo].[Tbl_Question_Type_Master] CHECK CONSTRAINT [FK_Tbl_Question_Type_Master_Login_InsrtedBy]
GO

ALTER TABLE [dbo].[Tbl_Question_Type_Master]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Question_Type_Master_Login_UpdatedBy] FOREIGN KEY([cUpdatedBy])
REFERENCES [dbo].[Login] ([cLogin_ID])
GO

ALTER TABLE [dbo].[Tbl_Question_Type_Master] CHECK CONSTRAINT [FK_Tbl_Question_Type_Master_Login_UpdatedBy]
GO

ALTER TABLE [dbo].[Tbl_Question_Type_Master]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Question_Type_Master_Tbl_MidiumMaster] FOREIGN KEY([cMedium_ID])
REFERENCES [dbo].[Tbl_MidiumMaster] ([cMedium_ID])
GO

ALTER TABLE [dbo].[Tbl_Question_Type_Master] CHECK CONSTRAINT [FK_Tbl_Question_Type_Master_Tbl_MidiumMaster]
GO

ALTER TABLE [dbo].[Tbl_Question_Type_Master]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Question_Type_Master_Tbl_StandardMaster] FOREIGN KEY([cStandard_ID])
REFERENCES [dbo].[Tbl_StandardMaster] ([cStandard_ID])
GO

ALTER TABLE [dbo].[Tbl_Question_Type_Master] CHECK CONSTRAINT [FK_Tbl_Question_Type_Master_Tbl_StandardMaster]
GO

ALTER TABLE [dbo].[Tbl_Question_Type_Master]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Question_Type_Master_Tbl_SubjectMaster] FOREIGN KEY([cSubject_ID])
REFERENCES [dbo].[Tbl_SubjectMaster] ([cSubject_ID])
GO

ALTER TABLE [dbo].[Tbl_Question_Type_Master] CHECK CONSTRAINT [FK_Tbl_Question_Type_Master_Tbl_SubjectMaster]
GO

ALTER TABLE [dbo].[Tbl_Question_Type_Master]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Question_Type_Master_TblCompany] FOREIGN KEY([cCompany_ID])
REFERENCES [dbo].[TblCompany] ([cCompany_ID])
GO

ALTER TABLE [dbo].[Tbl_Question_Type_Master] CHECK CONSTRAINT [FK_Tbl_Question_Type_Master_TblCompany]
GO




CREATE TABLE [dbo].[Tbl_LevelMaster](
	[cLevel_ID] [uniqueidentifier] NOT NULL,
	[cLevelName] [nvarchar](500) NOT NULL,
	[cCompany_ID] [uniqueidentifier] NOT NULL,
	[cInsetedBy] [uniqueidentifier] NULL,
	[dInserted_Date] [datetime] NULL,
	[cUpdatedBy] [uniqueidentifier] NULL,
	[dUpdated_Date] [datetime] NULL,
 CONSTRAINT [PK_Tbl_LevelMaster] PRIMARY KEY CLUSTERED 
(
	[cLevel_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Tbl_LevelMaster] ADD  CONSTRAINT [DF_Tbl_LevelMaster_cLevel_ID]  DEFAULT (newid()) FOR [cLevel_ID]
GO

ALTER TABLE [dbo].[Tbl_LevelMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_LevelMaster_Login_InsrtedBy] FOREIGN KEY([cInsetedBy])
REFERENCES [dbo].[Login] ([cLogin_ID])
GO

ALTER TABLE [dbo].[Tbl_LevelMaster] CHECK CONSTRAINT [FK_Tbl_LevelMaster_Login_InsrtedBy]
GO

ALTER TABLE [dbo].[Tbl_LevelMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_LevelMaster_Login_UpdatedBy] FOREIGN KEY([cUpdatedBy])
REFERENCES [dbo].[Login] ([cLogin_ID])
GO

ALTER TABLE [dbo].[Tbl_LevelMaster] CHECK CONSTRAINT [FK_Tbl_LevelMaster_Login_UpdatedBy]
GO

ALTER TABLE [dbo].[Tbl_LevelMaster]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_LevelMaster_TblCompany] FOREIGN KEY([cCompany_ID])
REFERENCES [dbo].[TblCompany] ([cCompany_ID])
GO

ALTER TABLE [dbo].[Tbl_LevelMaster] CHECK CONSTRAINT [FK_Tbl_LevelMaster_TblCompany]
GO



















CREATE PROCEDURE [dbo].[usp_GetSubjectMaster]
@DisplayLength int,
@DisplayStart int,
@SortCol int,
@SortDir nvarchar(10),
@Search nvarchar(255) = NULL,
@compid AS NVARCHAR(250)

AS

BEGIN

	DECLARE @FirstRec int, @LastRec int
	SET @FirstRec = @DisplayStart;
	SET @LastRec = @DisplayStart + @DisplayLength;

	WITH CTE_TblMasterAssembly AS
	(
		SELECT ROW_NUMBER() OVER (ORDER BY 
								CASE WHEN (@SortCol = 0 and @SortDir = 'asc') then	
								cMedium END ASC,
								CASE WHEN (@SortCol = 0 and @SortDir = 'desc') then	
								cMedium END DESC,
								CASE WHEN (@SortCol = 1 and @SortDir = 'asc') then	
								cStandardName END ASC,
								CASE WHEN (@SortCol = 1 and @SortDir = 'desc') then	
								cStandardName END DESC,
								CASE WHEN (@SortCol = 2 and @SortDir = 'asc') then	
								cSubjectName END ASC,
								CASE WHEN (@SortCol = 2 and @SortDir = 'desc') then	
								cSubjectName END DESC
								) AS RowNum,
								count(*) OVER() as TotalCount,
								mm.cMedium,
								sm.cStandardName,
								subm.cSubjectName,
								--'<a href="MasterMedium.aspx?ID='+ convert(nvarchar(100),A.NID) +'&E=1" title="Edit"><img src="assets/img/edit.png" />' as cedit,
								--'<a href="MasterMedium.aspx?ID='+ convert(nvarchar(100),A.NID) +'&D=1" title="Delete"><img src="assets/img/delete.png" /></a>' as cdelete
								--'' as editdelete,
								'' as cedit, '' as cdelete
								FROM Tbl_SubjectMaster(nolock) subm
								INNER JOIN Tbl_StandardMaster(nolock) sm on sm.cStandard_ID = subm.cStandard_ID
								INNER JOIN Tbl_MidiumMaster(nolock) mm ON mm.cMedium_ID = subm.cMedium_ID
								WHERE subm.cCompany_ID =@compid and (@Search IS NULL
										OR cMedium LIKE	'%' + @Search + '%'
										OR cStandardName LIKE	'%' + @Search + '%'
										OR cSubjectName LIKE	'%' + @Search + '%'
										
									  )
							)
	
	SELECT * FROM CTE_TblMasterAssembly
	WHERE RowNum > @FirstRec AND RowNum <= @LastRec

END

--SP_ListMasterZone '5','0','0','asc',''
GO

/****** Object:  StoredProcedure [dbo].[usp_GetChapterMaster]    Script Date: 21/04/2018 15:16:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetChapterMaster]
@DisplayLength int,
@DisplayStart int,
@SortCol int,
@SortDir nvarchar(10),
@Search nvarchar(255) = NULL,
@compid AS NVARCHAR(250)

AS

BEGIN

	DECLARE @FirstRec int, @LastRec int
	SET @FirstRec = @DisplayStart;
	SET @LastRec = @DisplayStart + @DisplayLength;

	WITH CTE_TblMasterAssembly AS
	(
		SELECT ROW_NUMBER() OVER (ORDER BY 
								CASE WHEN (@SortCol = 0 and @SortDir = 'asc') then	
								cMedium END ASC,
								CASE WHEN (@SortCol = 0 and @SortDir = 'desc') then	
								cMedium END DESC,
								CASE WHEN (@SortCol = 1 and @SortDir = 'asc') then	
								cStandardName END ASC,
								CASE WHEN (@SortCol = 1 and @SortDir = 'desc') then	
								cStandardName END DESC,
								CASE WHEN (@SortCol = 2 and @SortDir = 'asc') then	
								cSubjectName END ASC,
								CASE WHEN (@SortCol = 2 and @SortDir = 'desc') then	
								cSubjectName END DESC,
								CASE WHEN (@SortCol = 3 and @SortDir = 'asc') then	
								cChapterName END ASC,
								CASE WHEN (@SortCol = 3 and @SortDir = 'desc') then	
								cChapterName END DESC,
								CASE WHEN (@SortCol = 4 and @SortDir = 'asc') then	
								nChaper_Index END ASC,
								CASE WHEN (@SortCol = 4 and @SortDir = 'desc') then	
								nChaper_Index END DESC
								) AS RowNum,
								count(*) OVER() as TotalCount,
								mm.cMedium,
								sm.cStandardName,
								subm.cSubjectName,
								--'<a href="MasterMedium.aspx?ID='+ convert(nvarchar(100),A.NID) +'&E=1" title="Edit"><img src="assets/img/edit.png" />' as cedit,
								--'<a href="MasterMedium.aspx?ID='+ convert(nvarchar(100),A.NID) +'&D=1" title="Delete"><img src="assets/img/delete.png" /></a>' as cdelete
								--'' as editdelete,
								'' as cedit, '' as cdelete
								FROM Tbl_ChapterMaster(nolock) cm
								INNER JOIN Tbl_SubjectMaster(nolock) subm on subm.cSubject_ID = cm.cSubject_ID
								INNER JOIN Tbl_StandardMaster(nolock) sm on sm.cStandard_ID = cm.cStandard_ID
								INNER JOIN Tbl_MidiumMaster(nolock) mm ON mm.cMedium_ID = cm.cMedium_ID
								WHERE cm.cCompany_ID =@compid and (@Search IS NULL
										OR cMedium LIKE	'%' + @Search + '%'
										OR cStandardName LIKE	'%' + @Search + '%'
										OR cSubjectName LIKE	'%' + @Search + '%'
										OR cChapterName LIKE	'%' + @Search + '%'
										
									  )
							)
	
	SELECT * FROM CTE_TblMasterAssembly
	WHERE RowNum > @FirstRec AND RowNum <= @LastRec

END

--SP_ListMasterZone '5','0','0','asc',''
GO

/****** Object:  StoredProcedure [dbo].[usp_GetTopicMaster]    Script Date: 21/04/2018 15:16:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetTopicMaster]
@DisplayLength int,
@DisplayStart int,
@SortCol int,
@SortDir nvarchar(10),
@Search nvarchar(255) = NULL,
@compid AS NVARCHAR(250)

AS

BEGIN

	DECLARE @FirstRec int, @LastRec int
	SET @FirstRec = @DisplayStart;
	SET @LastRec = @DisplayStart + @DisplayLength;

	WITH CTE_TblMasterAssembly AS
	(
		SELECT ROW_NUMBER() OVER (ORDER BY 
								CASE WHEN (@SortCol = 0 and @SortDir = 'asc') then	
								cMedium END ASC,
								CASE WHEN (@SortCol = 0 and @SortDir = 'desc') then	
								cMedium END DESC,
								CASE WHEN (@SortCol = 1 and @SortDir = 'asc') then	
								cStandardName END ASC,
								CASE WHEN (@SortCol = 1 and @SortDir = 'desc') then	
								cStandardName END DESC,
								CASE WHEN (@SortCol = 2 and @SortDir = 'asc') then	
								cSubjectName END ASC,
								CASE WHEN (@SortCol = 2 and @SortDir = 'desc') then	
								cSubjectName END DESC,
								CASE WHEN (@SortCol = 3 and @SortDir = 'asc') then	
								cChapterName END ASC,
								CASE WHEN (@SortCol = 3 and @SortDir = 'desc') then	
								cChapterName END DESC,
								CASE WHEN (@SortCol = 4 and @SortDir = 'asc') then	
								nTopic_Index END ASC,
								CASE WHEN (@SortCol = 4 and @SortDir = 'desc') then	
								nTopic_Index END DESC,
								CASE WHEN (@SortCol = 5 and @SortDir = 'asc') then	
								cTopicName END ASC,
								CASE WHEN (@SortCol = 5 and @SortDir = 'desc') then	
								cTopicName END DESC
								) AS RowNum,
								count(*) OVER() as TotalCount,
								mm.cMedium,
								sm.cStandardName,
								subm.cSubjectName,
								cm.cChapterName,
								tm.nTopic_Index,
								tm.cTopicName,
								--'<a href="MasterMedium.aspx?ID='+ convert(nvarchar(100),A.NID) +'&E=1" title="Edit"><img src="assets/img/edit.png" />' as cedit,
								--'<a href="MasterMedium.aspx?ID='+ convert(nvarchar(100),A.NID) +'&D=1" title="Delete"><img src="assets/img/delete.png" /></a>' as cdelete
								--'' as editdelete,
								'' as cedit, '' as cdelete
								FROM Tbl_TopicMaster(nolock) tm 
								INNER JOIN Tbl_ChapterMaster(nolock) cm on cm.cChapter_ID = tm.cChapter_ID
								INNER JOIN Tbl_SubjectMaster(nolock) subm on subm.cSubject_ID = tm.cSubject_ID
								INNER JOIN Tbl_StandardMaster(nolock) sm on sm.cStandard_ID = tm.cStandard_ID
								INNER JOIN Tbl_MidiumMaster(nolock) mm ON mm.cMedium_ID = tm.cMedium_ID
								WHERE tm.cCompany_ID =@compid and (@Search IS NULL
										OR cMedium LIKE	'%' + @Search + '%'
										OR cStandardName LIKE	'%' + @Search + '%'
										OR cSubjectName LIKE	'%' + @Search + '%'
										OR cChapterName LIKE	'%' + @Search + '%'
										OR cTopicName LIKE	'%' + @Search + '%'
									)
							)
	
	SELECT * FROM CTE_TblMasterAssembly
	WHERE RowNum > @FirstRec AND RowNum <= @LastRec

END

--SP_ListMasterZone '5','0','0','asc',''
GO

/****** Object:  StoredProcedure [dbo].[usp_GetLevelMaster]    Script Date: 21/04/2018 15:16:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetLevelMaster]
@DisplayLength int,
@DisplayStart int,
@SortCol int,
@SortDir nvarchar(10),
@Search nvarchar(255) = NULL,
@compid AS NVARCHAR(250)

AS

BEGIN

	DECLARE @FirstRec int, @LastRec int
	SET @FirstRec = @DisplayStart;
	SET @LastRec = @DisplayStart + @DisplayLength;

	WITH CTE_TblMasterAssembly AS
	(
		SELECT ROW_NUMBER() OVER (ORDER BY 
								CASE WHEN (@SortCol = 0 and @SortDir = 'asc') then	
								cLevelName END ASC,
								CASE WHEN (@SortCol = 0 and @SortDir = 'desc') then	
								cLevelName END DESC
								) AS RowNum,
								count(*) OVER() as TotalCount,
								cLevelName,
								--'<a href="MasterMedium.aspx?ID='+ convert(nvarchar(100),A.NID) +'&E=1" title="Edit"><img src="assets/img/edit.png" />' as cedit,
								--'<a href="MasterMedium.aspx?ID='+ convert(nvarchar(100),A.NID) +'&D=1" title="Delete"><img src="assets/img/delete.png" /></a>' as cdelete
								--'' as editdelete,
								'' as cedit, '' as cdelete
								FROM Tbl_LevelMaster(nolock) LM   
								WHERE LM.cCompany_ID =@compid and (@Search IS NULL
										OR cLevelName LIKE	'%' + @Search + '%'
								
									)
							)
	
	SELECT * FROM CTE_TblMasterAssembly
	WHERE RowNum > @FirstRec AND RowNum <= @LastRec

END

--SP_ListMasterZone '5','0','0','asc',''
GO

/****** Object:  StoredProcedure [dbo].[usp_GetQuetionTypeMaster]    Script Date: 21/04/2018 15:16:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetQuetionTypeMaster]
@DisplayLength int,
@DisplayStart int,
@SortCol int,
@SortDir nvarchar(10),
@Search nvarchar(255) = NULL,
@compid AS NVARCHAR(250)

AS

BEGIN

	DECLARE @FirstRec int, @LastRec int
	SET @FirstRec = @DisplayStart;
	SET @LastRec = @DisplayStart + @DisplayLength;

	WITH CTE_TblMasterAssembly AS
	(
		SELECT ROW_NUMBER() OVER (ORDER BY 
								CASE WHEN (@SortCol = 0 and @SortDir = 'asc') then	
								cMedium END ASC,
								CASE WHEN (@SortCol = 0 and @SortDir = 'desc') then	
								cMedium END DESC,
								CASE WHEN (@SortCol = 1 and @SortDir = 'asc') then	
								cStandardName END ASC,
								CASE WHEN (@SortCol = 1 and @SortDir = 'desc') then	
								cStandardName END DESC,
								CASE WHEN (@SortCol = 2 and @SortDir = 'asc') then	
								cSubjectName END ASC,
								CASE WHEN (@SortCol = 2 and @SortDir = 'desc') then	
								cSubjectName END DESC,
								CASE WHEN (@SortCol = 3 and @SortDir = 'asc') then	
								cDescription END ASC,
								CASE WHEN (@SortCol = 3 and @SortDir = 'desc') then	
								cDescription END DESC
								) AS RowNum,
								count(*) OVER() as TotalCount,
								mm.cMedium,
								sm.cStandardName,
								subm.cSubjectName,
								QTM.cDescription,
								--'<a href="MasterMedium.aspx?ID='+ convert(nvarchar(100),A.NID) +'&E=1" title="Edit"><img src="assets/img/edit.png" />' as cedit,
								--'<a href="MasterMedium.aspx?ID='+ convert(nvarchar(100),A.NID) +'&D=1" title="Delete"><img src="assets/img/delete.png" /></a>' as cdelete
								--'' as editdelete,
								'' as cedit, '' as cdelete
								FROM Tbl_Question_Type_Master(nolock) QTM   
								INNER JOIN Tbl_SubjectMaster(nolock) subm on subm.cSubject_ID = QTM.cSubject_ID
								INNER JOIN Tbl_StandardMaster(nolock) sm on sm.cStandard_ID = QTM.cStandard_ID
								INNER JOIN Tbl_MidiumMaster(nolock) mm ON mm.cMedium_ID = QTM.cMedium_ID
								WHERE QTM.cCompany_ID =@compid and (@Search IS NULL
										OR cMedium LIKE	'%' + @Search + '%'
										OR cStandardName LIKE	'%' + @Search + '%'
										OR cSubjectName LIKE	'%' + @Search + '%'
										OR cDescription LIKE	'%' + @Search + '%'
									)
							)
	
	SELECT * FROM CTE_TblMasterAssembly
	WHERE RowNum > @FirstRec AND RowNum <= @LastRec

END

--SP_ListMasterZone '5','0','0','asc',''
GO

/****** Object:  StoredProcedure [dbo].[usp_CurdLevelMaster]    Script Date: 21/04/2018 15:16:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_CurdLevelMaster]
(
@Type AS VARCHAR(10),@cLevel_ID AS VARCHAR(100), @cLevelName AS NVARCHAR(200), @cCompany_ID AS VARCHAR(100), @cInsetedBy AS VARCHAR(100)
)

AS
BEGIN
SET NOCOUNT ON;

BEGIN TRANSACTION;
Declare @ErrorMsg nvarchar(4000)

SET DATEFORMAT DMY

BEGIN TRY
	if @Type='I'
	begin
		INSERT INTO dbo.Tbl_LevelMaster (cLevelName, cCompany_ID, cInsetedBy, dInserted_Date)
		VALUES (@cLevelName, @cCompany_ID, @cInsetedBy,GETDATE())
	end

	if @Type='U'
	begin
		UPDATE dbo.Tbl_LevelMaster
		SET cLevelName = @cLevelName,
			cCompany_ID = @cCompany_ID,
			cUpdatedBy = @cInsetedBy,
			dUpdated_Date = GETDATE()
		WHERE cLevel_ID = @cLevel_ID
	end
	if @Type='D'
	begin
		DELETE FROM  dbo.Tbl_LevelMaster WHERE cLevel_ID = @cLevel_ID
	end

COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	select @ErrorMsg = ERROR_MESSAGE();
	if (XACT_STATE() = -1)
		begin
			ROLLBACK TRANSACTION;
			RAISERROR(@ErrorMsg,16,1);
		end
	if (XACT_STATE() = 1)
		begin
			COMMIT TRANSACTION;
			RAISERROR(@ErrorMsg,16,1);
		end
END CATCH
END
GO

/****** Object:  StoredProcedure [dbo].[usp_CurdQuestionTypeMaster]    Script Date: 21/04/2018 15:16:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_CurdQuestionTypeMaster]
(
@Type AS VARCHAR(10),@cQuestion_Type_ID AS VARCHAR(100), @cMedium_ID AS VARCHAR(100), @cStandard_ID AS VARCHAR(100), @cSubject_ID AS VARCHAR(100),
@cDescription AS NVARCHAR(MAX), @cCompany_ID AS VARCHAR(100), @cInsetedBy AS VARCHAR(100)
)

AS
BEGIN
SET NOCOUNT ON;

BEGIN TRANSACTION;
Declare @ErrorMsg nvarchar(4000)

SET DATEFORMAT DMY

BEGIN TRY
	if @Type='I'
	begin
		INSERT INTO dbo.Tbl_Question_Type_Master (cMedium_ID, cStandard_ID, cSubject_ID, cDescription, cCompany_ID, cInsetedBy, dInserted_Date)
		VALUES (@cMedium_ID, @cStandard_ID, @cSubject_ID, @cDescription, @cCompany_ID, @cInsetedBy, GETDATE())
	end

	if @Type='U'
	begin
		UPDATE dbo.Tbl_Question_Type_Master
		SET cMedium_ID = @cMedium_ID,
			cStandard_ID = @cStandard_ID,
			cSubject_ID = @cSubject_ID,
			cDescription = @cDescription,
			cCompany_ID = @cCompany_ID,
			cUpdatedBy = @cInsetedBy,
			dUpdated_Date = GETDATE()
		WHERE cQuestion_Type_ID = @cQuestion_Type_ID
	end
	if @Type='D'
	begin
		DELETE FROM dbo.Tbl_Question_Type_Master WHERE cQuestion_Type_ID = @cQuestion_Type_ID
	end

COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	select @ErrorMsg = ERROR_MESSAGE();
	if (XACT_STATE() = -1)
		begin
			ROLLBACK TRANSACTION;
			RAISERROR(@ErrorMsg,16,1);
		end
	if (XACT_STATE() = 1)
		begin
			COMMIT TRANSACTION;
			RAISERROR(@ErrorMsg,16,1);
		end
END CATCH
END
GO

/****** Object:  StoredProcedure [dbo].[usp_CurdTopicMaster]    Script Date: 21/04/2018 15:16:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_CurdTopicMaster]
(
@Type AS VARCHAR(10),@cTopic_ID AS VARCHAR(100),
@cMedium_ID AS VARCHAR(100), @cStandard_ID AS VARCHAR(100), @cSubject_ID AS VARCHAR(100), @cChapter_ID AS VARCHAR(100),
@nTopic_Index AS INT, @cTopicName AS NVARCHAR(500), @cCompany_ID AS VARCHAR(100), @cInsetedBy AS VARCHAR(100)
)

AS
BEGIN
SET NOCOUNT ON;

BEGIN TRANSACTION;
Declare @ErrorMsg nvarchar(4000)

SET DATEFORMAT DMY

BEGIN TRY
	if @Type='I'
	begin
		INSERT INTO dbo.Tbl_TopicMaster (cMedium_ID, cStandard_ID, cSubject_ID, cChapter_ID, nTopic_Index, cTopicName, cCompany_ID, cInsetedBy, dInserted_Date)
		VALUES (@cMedium_ID, @cStandard_ID, @cSubject_ID, @cChapter_ID, @nTopic_Index, @cTopicName, @cCompany_ID, @cInsetedBy, GETDATE())
	end

	if @Type='U'
	begin
		UPDATE dbo.Tbl_TopicMaster
		SET cMedium_ID = @cMedium_ID,
			cStandard_ID = @cStandard_ID,
			cSubject_ID = @cSubject_ID,
			cChapter_ID = @cChapter_ID,
			nTopic_Index = @nTopic_Index,
			cTopicName = @cTopicName,
			cCompany_ID = @cCompany_ID,
			cUpdatedBy = @cInsetedBy,
			dUpdated_Date = GETDATE()
		WHERE cTopic_ID = @cTopic_ID
	end
	if @Type='D'
	begin
		DELETE FROM dbo.Tbl_TopicMaster WHERE cTopic_ID = @cTopic_ID
	end

COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	select @ErrorMsg = ERROR_MESSAGE();
	if (XACT_STATE() = -1)
		begin
			ROLLBACK TRANSACTION;
			RAISERROR(@ErrorMsg,16,1);
		end
	if (XACT_STATE() = 1)
		begin
			COMMIT TRANSACTION;
			RAISERROR(@ErrorMsg,16,1);
		end
END CATCH
END
GO

/****** Object:  StoredProcedure [dbo].[usp_CurdChapterMaster]    Script Date: 21/04/2018 15:16:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_CurdChapterMaster]
(
@Type AS VARCHAR(10),@cChapter_ID as VARCHAR(100),
@cMedium_ID AS VARCHAR(100), @cStandard_ID AS VARCHAR(100), @cSubject_ID AS VARCHAR(100), @nChaper_Index INT, @cChapterName AS VARCHAR(200), @bDemo BIT,
@cCompany_ID AS VARCHAR(100), @cInsetedBy AS VARCHAR(100)
)

AS
BEGIN
SET NOCOUNT ON;

BEGIN TRANSACTION;
Declare @ErrorMsg nvarchar(4000)

SET DATEFORMAT DMY

BEGIN TRY
	if @Type='I'
	begin
		INSERT INTO dbo.Tbl_ChapterMaster (cMedium_ID, cStandard_ID, cSubject_ID, nChaper_Index, cChapterName, bDemo, cCompany_ID, cInsetedBy, dInserted_Date)
		VALUES (@cMedium_ID, @cStandard_ID, @cSubject_ID, @nChaper_Index, @cChapterName, @bDemo, @cCompany_ID, @cInsetedBy, GETDATE())
	end

	if @Type='U'
	begin
		UPDATE dbo.Tbl_ChapterMaster
		SET cMedium_ID = @cMedium_ID,
			cStandard_ID = @cStandard_ID,
			cSubject_ID = @cSubject_ID,
			nChaper_Index = @nChaper_Index,
			cChapterName = @cChapterName,
			bDemo = @bDemo,
			cCompany_ID = @cCompany_ID,
			cUpdatedBy = @cInsetedBy,
			dUpdated_Date = GETDATE()
		WHERE cChapter_ID = @cChapter_ID


	end
	if @Type='D'
	begin
		DELETE FROM dbo.Tbl_ChapterMaster WHERE cChapter_ID = @cChapter_ID
	end

COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	select @ErrorMsg = ERROR_MESSAGE();
	if (XACT_STATE() = -1)
		begin
			ROLLBACK TRANSACTION;
			RAISERROR(@ErrorMsg,16,1);
		end
	if (XACT_STATE() = 1)
		begin
			COMMIT TRANSACTION;
			RAISERROR(@ErrorMsg,16,1);
		end
END CATCH
END
GO

/****** Object:  StoredProcedure [dbo].[usp_CurdMediumMaster]    Script Date: 21/04/2018 15:16:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_CurdMediumMaster]
@type as nvarchar(250),
@medium as nvarchar(250),
@compid as nvarchar(250),
@loginid as nvarchar(250),
@id as nvarchar(250)
as
begin

SET NOCOUNT ON;

BEGIN TRANSACTION;
Declare @ErrorMsg nvarchar(4000)


BEGIN TRY
	if @type='I'
	begin
		insert into Tbl_MidiumMaster(cMedium, cCompany_ID , cInsetedBy, dInserted_Date)
		values(@medium,@compid,@loginid,GETDATE())
	end

	if @type='U'
	begin
		update Tbl_MidiumMaster set cMedium=@medium,
		cUpdatedBy=@loginid,dUpdated_Date=GETDATE()
		where cMedium_ID=@id
	
	end

	if @type='D'
	begin
		delete from Tbl_MidiumMaster where cMedium_ID =@id
	end
	COMMIT TRANSACTION Medium;
END TRY
BEGIN CATCH
	select @ErrorMsg = ERROR_MESSAGE();
	if (XACT_STATE() = -1)
		begin
			ROLLBACK TRANSACTION;
			RAISERROR(@ErrorMsg,16,1);
		end
	if (XACT_STATE() = 1)
		begin
			COMMIT TRANSACTION;
			RAISERROR(@ErrorMsg,16,1);
		end
END CATCH
END

GO

/****** Object:  StoredProcedure [dbo].[usp_CurdStandardMaster]    Script Date: 21/04/2018 15:16:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_CurdStandardMaster]
(
@Type AS VARCHAR(10),
@cStandard_ID AS VARCHAR(100),
@cMedium_ID AS VARCHAR(100),
@cStandardName AS NVARCHAR(100),
@cCompany_ID AS VARCHAR(100),
@cInsetedBy AS VARCHAR(100)
)

AS
BEGIN
SET NOCOUNT ON;
SET DATEFORMAT DMY

BEGIN TRANSACTION;
Declare @ErrorMsg nvarchar(4000)

SET DATEFORMAT DMY

BEGIN TRY
	if @Type='I'
	begin
		INSERT INTO dbo.Tbl_StandardMaster (cMedium_ID, cStandardName, cCompany_ID, cInsetedBy, dInserted_Date)
		VALUES (@cMedium_ID, @cStandardName, @cCompany_ID, @cInsetedBy, getdate())
	end

	if @Type='U'
	begin
		UPDATE dbo.Tbl_StandardMaster
		SET cMedium_ID = @cMedium_ID,
			cStandardName = @cStandardName,
			cUpdatedBy = @cInsetedBy,
			dUpdated_Date = GETDATE()
		WHERE cStandard_ID = @cStandard_ID 
	end
	if @Type='D'
	begin
		DELETE FROM Tbl_StandardMaster WHERE cStandard_ID = @cStandard_ID	
	end

COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	select @ErrorMsg = ERROR_MESSAGE();
	if (XACT_STATE() = -1)
		begin
			ROLLBACK TRANSACTION;
			RAISERROR(@ErrorMsg,16,1);
		end
	if (XACT_STATE() = 1)
		begin
			COMMIT TRANSACTION;
			RAISERROR(@ErrorMsg,16,1);
		end
END CATCH
END
GO

/****** Object:  StoredProcedure [dbo].[usp_CurdSubjectMaster]    Script Date: 21/04/2018 15:16:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_CurdSubjectMaster]
(
@Type AS VARCHAR(10),@cSubject_ID VARCHAR(100),
@cMedium_ID AS VARCHAR(100), @cStandard_ID AS VARCHAR(100), @cSubjectName AS NVARCHAR(200), @cCompany_ID AS VARCHAR(100), @cInsetedBy AS VARCHAR(100)

)

AS
BEGIN
SET NOCOUNT ON;

BEGIN TRANSACTION;
Declare @ErrorMsg nvarchar(4000)

SET DATEFORMAT DMY

BEGIN TRY
	if @Type='I'
	begin
		INSERT INTO dbo.Tbl_SubjectMaster (cMedium_ID, cStandard_ID, cSubjectName, cCompany_ID, cInsetedBy, dInserted_Date)
		VALUES (@cMedium_ID, @cStandard_ID, @cSubjectName, @cCompany_ID, @cInsetedBy, GETDATE() )
	end

	if @Type='U'
	begin
		UPDATE dbo.Tbl_SubjectMaster
		SET cMedium_ID = @cmedium_id,
			cStandard_ID = @cstandard_id,
			cSubjectName = @csubjectname,
			cCompany_ID = @ccompany_id,
			cUpdatedBy = @cInsetedBy,
			dUpdated_Date = GETDATE()
		WHERE cSubject_ID = @cSubject_ID

	end
	if @Type='D'
	begin
		DELETE FROM dbo.Tbl_SubjectMaster WHERE cSubject_ID = @cSubject_ID
	end

COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	select @ErrorMsg = ERROR_MESSAGE();
	if (XACT_STATE() = -1)
		begin
			ROLLBACK TRANSACTION;
			RAISERROR(@ErrorMsg,16,1);
		end
	if (XACT_STATE() = 1)
		begin
			COMMIT TRANSACTION;
			RAISERROR(@ErrorMsg,16,1);
		end
END CATCH
END
GO

/****** Object:  StoredProcedure [dbo].[usp_SearchMaster]    Script Date: 21/04/2018 15:16:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_SearchMaster]
@Type as varchar(20),
@Id  as varchar(100)
as
begin

if @type='Medium'
begin
	select cMedium from Tbl_MidiumMaster(nolock) where cMedium_ID=@id
end
ELSE if @type='Standard'
begin
	select cStandard_ID , cStandardName , cMedium_ID  from Tbl_StandardMaster(nolock) where cStandard_ID =@id
end
ELSE IF @type = 'Subject'
 	BEGIN
 		SELECT cMedium_ID,cStandard_ID,cSubjectName FROM Tbl_SubjectMaster(nolock) WHERE cSubject_ID = @id
 	END
ELSE IF @type = 'Chapter'
 	BEGIN
 		SELECT  cMedium_ID,cStandard_ID,cSubject_ID,nChaper_Index,cChapterName,bDemo  FROM Tbl_ChapterMaster(nolock) WHERE cChapter_ID = @id
 	END
ELSE IF @type = 'Topic'
 	BEGIN
 		SELECT cMedium_ID,cStandard_ID,cSubject_ID,cChapter_ID,nTopic_Index,cTopicName  FROM Tbl_TopicMaster(nolock) WHERE cTopic_ID = @id
 	END
ELSE IF @type = 'QuestionTypeMaster'
 	BEGIN
 		SELECT cMedium_ID,cStandard_ID,cSubject_ID,cDescription  FROM Tbl_Question_Type_Master(nolock) WHERE cQuestion_Type_ID = @id
 	END
ELSE IF @type = 'LevelMaster'
 	BEGIN
 		SELECT cLevelName  FROM Tbl_LevelMaster(nolock) WHERE cLevel_ID = @id
 	END
END

GO

/****** Object:  StoredProcedure [dbo].[usp_GetTotalCount]    Script Date: 21/04/2018 15:16:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_GetTotalCount]
(
@PageName AS NVARCHAR(MAX),
@compid AS NVARCHAR(MAX)

)

AS

IF @PageName = 'Midium'
 	BEGIN
 		SELECT count(*) FROM Tbl_MidiumMaster(nolock) WHERE cCompany_ID = @compid
 	END
ELSE IF @PageName = 'Standard'
 	BEGIN
 		SELECT count(*) FROM Tbl_StandardMaster(nolock) WHERE cCompany_ID = @compid
 	END
ELSE IF @PageName = 'Subject'
 	BEGIN
 		SELECT count(*) FROM Tbl_SubjectMaster(nolock) WHERE cCompany_ID = @compid
 	END
ELSE IF @PageName = 'Chapter'
 	BEGIN
 		SELECT count(*) FROM Tbl_ChapterMaster(nolock) WHERE cCompany_ID = @compid
 	END
ELSE IF @PageName = 'Topic'
 	BEGIN
 		SELECT count(*) FROM Tbl_TopicMaster(nolock) WHERE cCompany_ID = @compid
 	END
ELSE IF @PageName = 'QuestionTypeMaster'
 	BEGIN
 		SELECT count(*) FROM Tbl_Question_Type_Master(nolock) WHERE cCompany_ID = @compid
 	END
ELSE IF @PageName = 'LevelMaster'
 	BEGIN
 		SELECT count(*) FROM Tbl_LevelMaster(nolock) WHERE cCompany_ID = @compid
 	END
GO

/****** Object:  StoredProcedure [dbo].[usp_GetStandardMaster]    Script Date: 21/04/2018 15:16:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetStandardMaster]
@DisplayLength int,
@DisplayStart int,
@SortCol int,
@SortDir nvarchar(10),
@Search nvarchar(255) = NULL,
@compid AS NVARCHAR(250)

AS

BEGIN

	DECLARE @FirstRec int, @LastRec int
	SET @FirstRec = @DisplayStart;
	SET @LastRec = @DisplayStart + @DisplayLength;

	WITH CTE_TblMasterAssembly AS
	(
		SELECT ROW_NUMBER() OVER (ORDER BY 
								CASE WHEN (@SortCol = 0 and @SortDir = 'asc') then	
								cMedium END ASC,
								CASE WHEN (@SortCol = 0 and @SortDir = 'desc') then	
								cMedium END DESC,
								CASE WHEN (@SortCol = 1 and @SortDir = 'asc') then	
								cStandardName END ASC,
								CASE WHEN (@SortCol = 1 and @SortDir = 'desc') then	
								cStandardName END DESC
								) AS RowNum,
								count(*) OVER() as TotalCount,
								mm.cMedium,
								sm.cStandardName,
								--'<a href="MasterMedium.aspx?ID='+ convert(nvarchar(100),A.NID) +'&E=1" title="Edit"><img src="assets/img/edit.png" />' as cedit,
								--'<a href="MasterMedium.aspx?ID='+ convert(nvarchar(100),A.NID) +'&D=1" title="Delete"><img src="assets/img/delete.png" /></a>' as cdelete
								--'' as editdelete,
								'' as cedit, '' as cdelete
								FROM Tbl_StandardMaster(nolock) sm
								INNER JOIN Tbl_MidiumMaster(nolock) mm ON mm.cMedium_ID = sm.cMedium_ID
								WHERE sm.cCompany_ID =@compid and (@Search IS NULL
										OR cMedium LIKE	'%' + @Search + '%'
										OR cStandardName LIKE	'%' + @Search + '%'
									  )
							)
	
	SELECT * FROM CTE_TblMasterAssembly
	WHERE RowNum > @FirstRec AND RowNum <= @LastRec

END

--SP_ListMasterZone '5','0','0','asc',''
GO

/****** Object:  StoredProcedure [dbo].[usp_GetMediumMaster]    Script Date: 21/04/2018 15:16:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetMediumMaster]
@DisplayLength int,
@DisplayStart int,
@SortCol int,
@SortDir nvarchar(10),
@Search nvarchar(255) = NULL,
@compid AS NVARCHAR(250)

AS

BEGIN

	DECLARE @FirstRec int, @LastRec int
	SET @FirstRec = @DisplayStart;
	SET @LastRec = @DisplayStart + @DisplayLength;

	WITH CTE_TblMasterAssembly AS
	(
		SELECT ROW_NUMBER() OVER (ORDER BY 
								CASE WHEN (@SortCol = 0 and @SortDir = 'asc') then	
								cMedium END ASC,
								CASE WHEN (@SortCol = 0 and @SortDir = 'desc') then	
								cMedium END Desc
								
								) AS RowNum,
								count(*) OVER() as TotalCount,
								cMedium,cMedium_ID,
								
								'<a href="MasterMedium.aspx?ID='+ convert(nvarchar(100),A.cMedium_ID) +'&E=1" title="Edit"><img src="assets/img/edit.png" />' as cedit,
								'<a href="MasterMedium.aspx?ID='+ convert(nvarchar(100),A.cMedium_ID) +'&D=1" title="Delete"><img src="assets/img/delete.png" /></a>' as cdelete
								--'' as editdelete,
								
								from Tbl_MidiumMaster A
								WHERE cCompany_ID=@compid and (@Search IS NULL
										OR cMedium LIKE	'%' + @Search + '%'
										
									  )
							)
	
	SELECT * FROM CTE_TblMasterAssembly
	WHERE RowNum > @FirstRec AND RowNum <= @LastRec

END

--SP_ListMasterZone '5','0','0','asc',''

GO

/****** Object:  StoredProcedure [dbo].[usp_GetLogin]    Script Date: 21/04/2018 15:16:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_GetLogin]
@type as nvarchar(250),
@username as nvarchar(250),
@password as nvarchar(250)

as
begin

		select l.cLogin_ID,cname,l.cCompany_ID ,cCompName
		from login l,TblCompany c
		where l.cCompany_ID=c.cCompany_ID and cUserName=@username and cPassword=@password 
		and cactive='1'
end

GO



CREATE PROCEDURE [dbo].[usp_GetComboList]
@Type as varchar(20),
@Id  as varchar(100),
@cCompany_ID as varchar(100)
as
BEGIN
IF @Type = 'Medium'
	BEGIN
		select  cMedium_ID , cMedium from Tbl_MidiumMaster(nolock) where cCompany_ID =  @cCompany_ID
	END
ELSE IF @Type = 'Standard'
	BEGIN
		select cStandard_ID , cStandardName from Tbl_StandardMaster(nolock) where cMedium_ID = @Id and cCompany_ID =  @cCompany_ID
	END
ELSE IF @Type = 'Subject'
	BEGIN
		select cSubject_ID, cSubjectName from Tbl_SubjectMaster(nolock) where cStandard_ID = @Id and cCompany_ID =  @cCompany_ID
	END
ELSE IF @Type = 'Chapter'
	BEGIN
		select cChapter_ID , cChapterName from Tbl_ChapterMaster(nolock) where cSubject_ID  = @Id and cCompany_ID =  @cCompany_ID
	END
END
GO








