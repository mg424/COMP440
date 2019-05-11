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
           ('create user meshing diagram',
            '2008-11-11',
             0,
           'optimization',
           'meshes users into single diagram',
           1111)
GO


