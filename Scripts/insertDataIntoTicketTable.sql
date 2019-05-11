USE [csun8]
GO

INSERT INTO [dbo].[ticket]
           ([type]
           ,[product_manager_id]
           ,[prority]
           ,[approved]
           ,[description]
           ,[state]
           ,[date_time_reported]
           ,[parent_id]
           ,[feature_id])
     VALUES
           ('bug'
           ,2
           ,1
           ,1
           ,'create user creates duplicates'
           ,'pending'
           ,'11-9-2019'
           ,1
           ,NULL)
GO
