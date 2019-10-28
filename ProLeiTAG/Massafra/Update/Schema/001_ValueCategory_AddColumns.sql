USE [dbOds]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON

GO
-- ALTER TABLE [Ods].[ValueCategory] DROP CONSTRAINT DF_ValueCategory_ZSortOrder
-- ALTER TABLE [Ods].[ValueCategory] DROP COLUMN ZSortOrder
-- 
-- ALTER TABLE [Ods].[ValueCategory] DROP CONSTRAINT DF_ValueCategory_DecimalPlaces
-- ALTER TABLE [Ods].[ValueCategory] DROP COLUMN DecimalPlaces
GO

ALTER TABLE [Ods].[ValueCategory] ADD 
    ZSortOrder NVARCHAR(200) NOT NULL CONSTRAINT [DF_ValueCategory_ZSortOrder] DEFAULT (N'')

ALTER TABLE [Ods].[ValueCategory] ADD
    DecimalPlaces BIGINT NULL CONSTRAINT [DF_ValueCategory_DecimalPlaces] DEFAULT ((0))

