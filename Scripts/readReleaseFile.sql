USE csun8

SET IDENTITY_INSERT dbo.product ON

insert into dbo.product(release_num, product_version, release_date, id)

select dbo.[Release$].[Release Num], 
    dbo.[Release$].[Release Name],
    dbo.[Release$].[Release Date],
    dbo.[Release$].[Associated Features]
from dbo.[Release$]

SET IDENTITY_INSERT dbo.product OFF