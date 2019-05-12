USE [csun8]
GO

INSERT INTO [dbo].[feature]
           ([name]
           ,[release_date]
           ,[deprecated]
           ,[department]
           ,[description]
           ,[parent_id])
     VALUES
           ('Data hash feature'
           ,'1-9-1999'
           ,1
           ,'Deployment'
           ,'feature will hash data for users'
           ,2215)
GO


