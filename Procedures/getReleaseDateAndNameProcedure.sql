CREATE PROCEDURE getReleaseDateAndName
/** Script for SelectTopNRows command from SSMS  **/

AS
SELECT TOP (1000) [id]
      ,[product_version]
      ,[release_date]
      ,[approved]
      ,[product_manager_id]
  FROM [csun8].[dbo].[product]
  WHERE [csun8].[dbo].[product].release_date = 'Apr 30 2018 12:00AM' AND [csun8].[dbo].[product].product_version = 'Feeds Implementation'