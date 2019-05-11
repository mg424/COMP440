USE csun8

SET IDENTITY_INSERT dbo.ticket ON

insert into dbo.ticket(type, id, title, state, date_time_reported, priority, description, parent_id)

select dbo.[CSUN File for Load$].[Work Item Type], 
    dbo.[CSUN File for Load$].ID,
    dbo.[CSUN File for Load$].Title,
    dbo.[CSUN File for Load$].State,
    dbo.[CSUN File for Load$].[Created Date],
    dbo.[CSUN File for Load$].Priority,
    dbo.[CSUN File for Load$].Description,
    dbo.[CSUN File for Load$].ChildOf
from dbo.[CSUN File for Load$]

SET IDENTITY_INSERT dbo.ticket OFF