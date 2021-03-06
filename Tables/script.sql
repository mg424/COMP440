USE [csun8]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 5/11/2019 4:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ticket_id] [int] NOT NULL,
	[comment] [varchar](250) NULL,
 CONSTRAINT [PK_comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 5/11/2019 4:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[team_id] [int] NULL,
	[name] [varchar](75) NOT NULL,
	[email] [varchar](75) NOT NULL,
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feature]    Script Date: 5/11/2019 4:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feature](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[release_date] [date] NULL,
	[deprecated] [bit] NULL,
	[department] [varchar](100) NULL,
	[description] [varchar](250) NULL,
	[parent_id] [int] NULL,
 CONSTRAINT [PK_features] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_ticket]    Script Date: 5/11/2019 4:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_ticket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_manager_id] [int] NOT NULL,
	[ticket_id] [int] NOT NULL,
 CONSTRAINT [PK_pm_tickets] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pms]    Script Date: 5/11/2019 4:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[product_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 5/11/2019 4:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_version] [varchar](max) NULL,
	[release_date] [varchar](max) NULL,
	[approved] [bit] NULL,
	[product_manager_id] [int] NULL,
	[release_num] [varchar](max) NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_log]    Script Date: 5/11/2019 4:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ticket_id] [int] NOT NULL,
	[accepted_by] [varchar](50) NOT NULL,
	[accepted_date] [date] NOT NULL,
 CONSTRAINT [PK_product_logs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_manager]    Script Date: 5/11/2019 4:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_manager](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[team_id] [int] NULL,
	[name] [varchar](75) NOT NULL,
	[email] [varchar](75) NOT NULL,
 CONSTRAINT [PK_product_managers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[release_scope]    Script Date: 5/11/2019 4:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[release_scope](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[release_version] [varchar](max) NULL,
	[feature_id] [int] NULL,
	[release_date] [varchar](max) NULL,
 CONSTRAINT [PK_release_scopes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[team]    Script Date: 5/11/2019 4:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[team](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_teams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 5/11/2019 4:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](max) NULL,
	[product_manager_id] [int] NULL,
	[priority] [int] NULL,
	[approved] [bit] NULL,
	[description] [varchar](max) NULL,
	[state] [varchar](max) NULL,
	[date_time_reported] [varchar](max) NULL,
	[parent_id] [int] NULL,
	[feature_id] [int] NULL,
	[title] [varchar](max) NULL,
	[area_path] [varchar](max) NULL,
	[accepted_by] [varchar](max) NULL,
	[activity] [varchar](max) NULL,
	[system_info] [varchar](max) NULL,
 CONSTRAINT [PK_tickets] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_tickets] FOREIGN KEY([ticket_id])
REFERENCES [dbo].[ticket] ([id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_tickets]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_teams] FOREIGN KEY([team_id])
REFERENCES [dbo].[team] ([id])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_teams]
GO
ALTER TABLE [dbo].[pm_ticket]  WITH CHECK ADD  CONSTRAINT [FK_pm_ticket_product_managers] FOREIGN KEY([product_manager_id])
REFERENCES [dbo].[product_manager] ([id])
GO
ALTER TABLE [dbo].[pm_ticket] CHECK CONSTRAINT [FK_pm_ticket_product_managers]
GO
ALTER TABLE [dbo].[pm_ticket]  WITH CHECK ADD  CONSTRAINT [FK_pm_ticket_tickets] FOREIGN KEY([ticket_id])
REFERENCES [dbo].[ticket] ([id])
GO
ALTER TABLE [dbo].[pm_ticket] CHECK CONSTRAINT [FK_pm_ticket_tickets]
GO
ALTER TABLE [dbo].[pms]  WITH CHECK ADD  CONSTRAINT [FK_pms_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[pms] CHECK CONSTRAINT [FK_pms_products]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_product_managers] FOREIGN KEY([product_manager_id])
REFERENCES [dbo].[product_manager] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_product_managers]
GO
ALTER TABLE [dbo].[product_log]  WITH CHECK ADD  CONSTRAINT [FK_product_log_tickets] FOREIGN KEY([ticket_id])
REFERENCES [dbo].[ticket] ([id])
GO
ALTER TABLE [dbo].[product_log] CHECK CONSTRAINT [FK_product_log_tickets]
GO
ALTER TABLE [dbo].[product_manager]  WITH CHECK ADD  CONSTRAINT [FK_product_manager_teams] FOREIGN KEY([team_id])
REFERENCES [dbo].[team] ([id])
GO
ALTER TABLE [dbo].[product_manager] CHECK CONSTRAINT [FK_product_manager_teams]
GO
ALTER TABLE [dbo].[release_scope]  WITH CHECK ADD  CONSTRAINT [FK_release_scope_features] FOREIGN KEY([feature_id])
REFERENCES [dbo].[feature] ([id])
GO
ALTER TABLE [dbo].[release_scope] CHECK CONSTRAINT [FK_release_scope_features]
GO
ALTER TABLE [dbo].[release_scope]  WITH CHECK ADD  CONSTRAINT [FK_release_scope_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[release_scope] CHECK CONSTRAINT [FK_release_scope_products]
GO
ALTER TABLE [dbo].[team]  WITH CHECK ADD  CONSTRAINT [FK_team_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[team] CHECK CONSTRAINT [FK_team_products]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_ticket_features] FOREIGN KEY([feature_id])
REFERENCES [dbo].[feature] ([id])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_ticket_features]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_ticket_product_manager_id] FOREIGN KEY([product_manager_id])
REFERENCES [dbo].[product_manager] ([id])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_ticket_product_manager_id]
GO
/****** Object:  StoredProcedure [dbo].[closeAllIBSCases]    Script Date: 5/11/2019 4:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[closeAllIBSCases]

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
GO
/****** Object:  StoredProcedure [dbo].[getReleaseDateAndName]    Script Date: 5/11/2019 4:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getReleaseDateAndName]
/** Script for SelectTopNRows command from SSMS  **/

AS
SELECT TOP (1000) [id]
      ,[product_version]
      ,[release_date]
      ,[approved]
      ,[product_manager_id]
  FROM [csun8].[dbo].[product]
  WHERE [csun8].[dbo].[product].release_date = 'Apr 30 2018 12:00AM' AND [csun8].[dbo].[product].product_version = 'Feeds Implementation'
GO
