USE [dbOds]
GO
/****** Object:  Table [Ods].[ValueCategory]    Script Date: 01/10/2019 10:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Ods].[ValueCategory](
	[_Key] [bigint] IDENTITY(82000000000,1) NOT NULL,
	[_DbTimestamp] [timestamp] NOT NULL,
	[_Name] [nvarchar](200) NOT NULL,
	[_1stJob] [bigint] NULL,
	[_LastJob] [bigint] NULL,
	[_IsSourceDeleted] [bigint] NOT NULL,
	[_IsDeleted] [bigint] NOT NULL,
	[Comment_U] [nvarchar](max) NULL,
	[Comment_X] [nvarchar](max) NULL,
	[ValueCategoryLocalName_U] [nvarchar](200) NOT NULL,
	[ValueCategoryLocalName_X] [nvarchar](200) NULL,
	[ValueCategoryGlobalName_U] [nvarchar](200) NOT NULL,
	[ValueCategoryGlobalName_X] [nvarchar](200) NULL,
	[_EnterpriseKey] [bigint] NOT NULL,
	[UnitOfMeasurement_U] [nvarchar](200) NULL,
	[UnitOfMeasurement_X] [nvarchar](200) NULL,
	[ValueTypeLocalName_U] [nvarchar](200) NULL,
	[ValueTypeLocalName_X] [nvarchar](200) NULL,
	[ValueTypeGlobalName_U] [nvarchar](200) NULL,
	[ValueTypeGlobalName_X] [nvarchar](200) NULL,
	[ScaleMinimum_U] [decimal](19, 9) NULL,
	[ScaleMinimum_X] [decimal](19, 9) NULL,
	[ScaleMaximum_U] [decimal](19, 9) NULL,
	[ScaleMaximum_X] [decimal](19, 9) NULL,
	[Trait_U] [bigint] NOT NULL,
	[Trait_X] [bigint] NULL,
	[SpecialRelevance_U] [bigint] NOT NULL,
	[SpecialRelevance_X] [bigint] NULL,
	[Format_U] [nvarchar](200) NOT NULL,
	[Format_X] [nvarchar](200) NULL,
	[Classifications] [nvarchar](200) NOT NULL,
	[_EnumerationLink_U] [nvarchar](200) NULL,
	[_EnumerationLink_X] [nvarchar](200) NULL,
	[UnitOfMeasurement_N] [bit] NULL,
	[ValueTypeLocalName_N] [bit] NULL,
	[ValueTypeGlobalName_N] [bit] NULL,
	[ScaleMinimum_N] [bit] NULL,
	[ScaleMaximum_N] [bit] NULL,
	[_EnumerationLink_N] [bit] NULL,
	[ZSortOrder] [nvarchar](200) NOT NULL,
	[DecimalPlaces] [bigint] NULL,
	[Comment]  AS (isnull([Comment_X],[Comment_U])),
	[ValueCategoryLocalName]  AS (isnull([ValueCategoryLocalName_X],[ValueCategoryLocalName_U])),
	[ValueCategoryGlobalName]  AS (isnull([ValueCategoryGlobalName_X],[ValueCategoryGlobalName_U])),
	[UnitOfMeasurement]  AS (case when [UnitOfMeasurement_N]<>(0) then NULL else coalesce([UnitOfMeasurement_X],[UnitOfMeasurement_U]) end),
	[ValueTypeLocalName]  AS (case when [ValueTypeLocalName_N]<>(0) then NULL else coalesce([ValueTypeLocalName_X],[ValueTypeLocalName_U]) end),
	[ValueTypeGlobalName]  AS (case when [ValueTypeGlobalName_N]<>(0) then NULL else coalesce([ValueTypeGlobalName_X],[ValueTypeGlobalName_U]) end),
	[ScaleMinimum]  AS (case when [ScaleMinimum_N]<>(0) then NULL else coalesce([ScaleMinimum_X],[ScaleMinimum_U]) end),
	[ScaleMaximum]  AS (case when [ScaleMaximum_N]<>(0) then NULL else coalesce([ScaleMaximum_X],[ScaleMaximum_U]) end),
	[Trait]  AS (isnull([Trait_X],[Trait_U])),
	[SpecialRelevance]  AS (isnull([SpecialRelevance_X],[SpecialRelevance_U])),
	[Format]  AS (isnull([Format_X],[Format_U])),
	[_EnumerationLink]  AS (case when [_EnumerationLink_N]<>(0) then NULL else coalesce([_EnumerationLink_X],[_EnumerationLink_U]) end) PERSISTED,
	[_XuComment]  AS (case when [Comment_U]<>[Comment_X] AND [Comment_U]<>N'' then [Comment_U]  end),
	[_XuValueCategoryLocalName]  AS (case when [ValueCategoryLocalName_U]<>[ValueCategoryLocalName_X] AND [ValueCategoryLocalName_U]<>N'' then [ValueCategoryLocalName_U]  end),
	[_XuValueCategoryGlobalName]  AS (case when [ValueCategoryGlobalName_U]<>[ValueCategoryGlobalName_X] AND [ValueCategoryGlobalName_U]<>N'' then [ValueCategoryGlobalName_U]  end),
	[_XuUnitOfMeasurement]  AS (case when ([UnitOfMeasurement_U]<>[UnitOfMeasurement_X] OR [UnitOfMeasurement_N]<>(0)) AND [UnitOfMeasurement_U]<>N'' then [UnitOfMeasurement_U]  end),
	[_XuValueTypeLocalName]  AS (case when [ValueTypeLocalName_U]<>[ValueTypeLocalName_X] OR [ValueTypeLocalName_N]<>(0) then [ValueTypeLocalName_U]  end),
	[_XuValueTypeGlobalName]  AS (case when [ValueTypeGlobalName_U]<>[ValueTypeGlobalName_X] OR [ValueTypeGlobalName_N]<>(0) then [ValueTypeGlobalName_U]  end),
	[_XuScaleMinimum]  AS (case when [ScaleMinimum_U]<>[ScaleMinimum_X] OR [ScaleMinimum_N]<>(0) then [ScaleMinimum_U]  end),
	[_XuScaleMaximum]  AS (case when [ScaleMaximum_U]<>[ScaleMaximum_X] OR [ScaleMaximum_N]<>(0) then [ScaleMaximum_U]  end),
	[_XuTrait]  AS (case when [Trait_U]<>[Trait_X] AND [Trait_U]<>(0) then [Trait_U]  end),
	[_XuSpecialRelevance]  AS (case when [SpecialRelevance_U]<>[SpecialRelevance_X] AND [SpecialRelevance_U]<>(0) then [SpecialRelevance_U]  end),
	[_XuFormat]  AS (case when [Format_U]<>[Format_X] AND [Format_U]<>N'#,##0.00' then [Format_U]  end),
	[_Xu_EnumerationLink]  AS (case when [_EnumerationLink_U]<>[_EnumerationLink_X] OR [_EnumerationLink_N]<>(0) then [_EnumerationLink_U]  end),
 CONSTRAINT [PK_ValueCategory_Key] PRIMARY KEY CLUSTERED 
(
	[_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_ValueCategory_Name] UNIQUE NONCLUSTERED 
(
	[_Name] ASC,
	[_EnterpriseKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
ALTER TABLE [Ods].[ValueCategory] ADD  CONSTRAINT [DF_ValueCategory__Name]  DEFAULT (N'') FOR [_Name]
GO
ALTER TABLE [Ods].[ValueCategory] ADD  CONSTRAINT [DF_ValueCategory__IsSourceDeleted]  DEFAULT ((0)) FOR [_IsSourceDeleted]
GO
ALTER TABLE [Ods].[ValueCategory] ADD  CONSTRAINT [DF_ValueCategory__IsDeleted]  DEFAULT ((0)) FOR [_IsDeleted]
GO
ALTER TABLE [Ods].[ValueCategory] ADD  CONSTRAINT [DF_ValueCategory_Comment_U]  DEFAULT (N'') FOR [Comment_U]
GO
ALTER TABLE [Ods].[ValueCategory] ADD  CONSTRAINT [DF_ValueCategory_ValueCategoryLocalName_U]  DEFAULT (N'') FOR [ValueCategoryLocalName_U]
GO
ALTER TABLE [Ods].[ValueCategory] ADD  CONSTRAINT [DF_ValueCategory_ValueCategoryGlobalName_U]  DEFAULT (N'') FOR [ValueCategoryGlobalName_U]
GO
ALTER TABLE [Ods].[ValueCategory] ADD  CONSTRAINT [DF_ValueCategory_UnitOfMeasurement_U]  DEFAULT (N'') FOR [UnitOfMeasurement_U]
GO
ALTER TABLE [Ods].[ValueCategory] ADD  CONSTRAINT [DF_ValueCategory_Trait_U]  DEFAULT ((0)) FOR [Trait_U]
GO
ALTER TABLE [Ods].[ValueCategory] ADD  CONSTRAINT [DF_ValueCategory_SpecialRelevance_U]  DEFAULT ((0)) FOR [SpecialRelevance_U]
GO
ALTER TABLE [Ods].[ValueCategory] ADD  CONSTRAINT [DF_ValueCategory_Format_U]  DEFAULT (N'#,##0.00') FOR [Format_U]
GO
ALTER TABLE [Ods].[ValueCategory] ADD  CONSTRAINT [DF_ValueCategory_Classifications]  DEFAULT (N'') FOR [Classifications]
GO
ALTER TABLE [Ods].[ValueCategory] ADD  CONSTRAINT [DF_ValueCategory_UnitOfMeasurement_N]  DEFAULT ((0)) FOR [UnitOfMeasurement_N]
GO
ALTER TABLE [Ods].[ValueCategory] ADD  CONSTRAINT [DF_ValueCategory_ValueTypeLocalName_N]  DEFAULT ((0)) FOR [ValueTypeLocalName_N]
GO
ALTER TABLE [Ods].[ValueCategory] ADD  CONSTRAINT [DF_ValueCategory_ValueTypeGlobalName_N]  DEFAULT ((0)) FOR [ValueTypeGlobalName_N]
GO
ALTER TABLE [Ods].[ValueCategory] ADD  CONSTRAINT [DF_ValueCategory_ScaleMinimum_N]  DEFAULT ((0)) FOR [ScaleMinimum_N]
GO
ALTER TABLE [Ods].[ValueCategory] ADD  CONSTRAINT [DF_ValueCategory_ScaleMaximum_N]  DEFAULT ((0)) FOR [ScaleMaximum_N]
GO
ALTER TABLE [Ods].[ValueCategory] ADD  CONSTRAINT [DF_ValueCategory__EnumerationLink_N]  DEFAULT ((0)) FOR [_EnumerationLink_N]
GO
ALTER TABLE [Ods].[ValueCategory] ADD  CONSTRAINT [DF_ValueCategory_ZSortOrder]  DEFAULT (N'') FOR [ZSortOrder]
GO
ALTER TABLE [Ods].[ValueCategory] ADD  CONSTRAINT [DF_ValueCategory_DecimalPlaces]  DEFAULT ((0)) FOR [DecimalPlaces]
GO
ALTER TABLE [Ods].[ValueCategory]  WITH NOCHECK ADD  CONSTRAINT [FK_ValueCategory__EnterpriseKey] FOREIGN KEY([_EnterpriseKey])
REFERENCES [Ods].[Enterprise] ([_Key])
GO
ALTER TABLE [Ods].[ValueCategory] CHECK CONSTRAINT [FK_ValueCategory__EnterpriseKey]
GO
ALTER TABLE [Ods].[ValueCategory]  WITH NOCHECK ADD  CONSTRAINT [FK_ValueCategory__EnumerationLink] FOREIGN KEY([_EnumerationLink])
REFERENCES [ydm].[Enumeration] ([_Name])
GO
ALTER TABLE [Ods].[ValueCategory] CHECK CONSTRAINT [FK_ValueCategory__EnumerationLink]
GO
ALTER TABLE [Ods].[ValueCategory]  WITH NOCHECK ADD  CONSTRAINT [CK_ValueCategory__IsDeleted] CHECK  (([_IsDeleted]=(1) OR [_IsDeleted]=(0)))
GO
ALTER TABLE [Ods].[ValueCategory] CHECK CONSTRAINT [CK_ValueCategory__IsDeleted]
GO
ALTER TABLE [Ods].[ValueCategory]  WITH NOCHECK ADD  CONSTRAINT [CK_ValueCategory__IsSourceDeleted] CHECK  (([_IsSourceDeleted]=(1) OR [_IsSourceDeleted]=(0)))
GO
ALTER TABLE [Ods].[ValueCategory] CHECK CONSTRAINT [CK_ValueCategory__IsSourceDeleted]
GO
