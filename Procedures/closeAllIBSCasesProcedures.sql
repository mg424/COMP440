CREATE PROCEDURE closeAllIBSCases

/** Script for SelectTopNRows command from SSMS  **/
AS

Update dbo.ticket
SET dbo.ticket.state = REPLACE(state, 'New', 'Closed')

from [dbo].[ticket]
where dbo.ticket.system_info = 'IBS'

Update dbo.ticket
SET dbo.ticket.state = REPLACE(state, 'Resolved', 'Closed')

from [dbo].[ticket]
where dbo.ticket.system_info = 'IBS'