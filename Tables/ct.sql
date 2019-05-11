-----------------------TEAM TABLE--------------------------------------------------------

DROP TABLE IF EXISTS [dbo].[team]

GO 
CREATE TABLE [dbo].[team] (
    [id]					INT IDENTITY (1, 1) 		NOT NULL,
    [product_id]			INT							NOT NULL
);

ALTER TABLE
	[dbo].[team]
ADD
	CONSTRAINT [PK_teams] PRIMARY KEY CLUSTERED ([id] ASC);
------------------------------------------------------------------------------------------

-----------------------EMPLOYEE TABLE-----------------------------------------------------

DROP TABLE IF EXISTS [dbo].[employee]

GO 

--EMPLOYEE TABLE
CREATE TABLE [dbo].[employee] (
    [id]				INT IDENTITY (1, 1) 			NOT NULL,
    [team_id]			INT								NULL,
    [name]				VARCHAR (75)					NOT NULL,
	[email]				VARCHAR (75)					NOT NULL
);

ALTER TABLE
	[dbo].[employee]
ADD
	CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED ([id] ASC);
-----------------------------------------------------------------------------------------

-----------------------PRODUCT_MANAGER TABLE---------------------------------------------
DROP TABLE IF EXISTS [dbo].[product_manager]

GO 

CREATE TABLE [dbo].[product_manager] (
    [id]				INT IDENTITY (1, 1) 			NOT NULL,
    [team_id]			INT								NOT NULL,
    [name]				VARCHAR (75)					NOT NULL,
	[email]				VARCHAR (75)					NOT NULL
);

ALTER TABLE
	[dbo].[product_manager]
ADD
	CONSTRAINT [PK_product_managers] PRIMARY KEY CLUSTERED ([id] ASC);
-----------------------------------------------------------------------------------------
-----------------------FEATURE TABLE---------------------------------------------

DROP TABLE IF EXISTS [dbo].[feature]

GO 

CREATE TABLE [dbo].[feature] (
    [id]				INT IDENTITY (1, 1) 						NOT NULL,
    [name]				VARCHAR (100)								NULL,
    [release_date]		DATE										NULL,
    [deprecated]		BIT											NULL,
    [department]		VARCHAR (100)								NULL,
	[description]		VARCHAR (250)								NULL,
	[parent_id]			INT											NULL
);

ALTER TABLE
	[dbo].[feature]
ADD
	CONSTRAINT [PK_features] PRIMARY KEY CLUSTERED ([id] ASC);
------------------------------------------------------------------------------------------

--------------------------------PRODUCT TABLE---------------------------------------------
DROP TABLE IF EXISTS [dbo].[product]

GO 

CREATE TABLE [dbo].[product] (
    [id]					INT IDENTITY (1, 1) 			NOT NULL,
    [product_version]				INT						NOT	NULL,
    [release_date]			DATE							NULL,
	[approved]				BIT								NOT NULL,
	[product_manager_id]	INT 							NOT NULL
);

ALTER TABLE
	[dbo].[product]
ADD
	CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED ([id] ASC);
------------------------------------------------------------------------------------------

--------------------------------RELEASE_SCOPE TABLE---------------------------------------------
DROP TABLE IF EXISTS [dbo].[release_scope]

GO 

CREATE TABLE [dbo].[release_scope] (
	[id]						INT IDENTITY (1, 1) 			NOT NULL,
    [product_id]				INT  							NOT NULL,
    [release_version]					INT						NOT	NULL,
    [feature_id]				INT								NOT NULL
);

ALTER TABLE
	[dbo].[release_scope]
ADD
	CONSTRAINT [PK_release_scopes] PRIMARY KEY CLUSTERED ([id] ASC);
------------------------------------------------------------------------------------------

--------------------------------PRODUCT_LOG TABLE---------------------------------------------
DROP TABLE IF EXISTS [dbo].[product_log]

GO 

CREATE TABLE [dbo].[product_log] (
	[id]						INT IDENTITY (1, 1) 			NOT NULL,
    [ticket_id]					INT  							NOT NULL,
    [accepted_by]				VARCHAR (50)					NOT	NULL,
    [accepted_date]				DATE							NOT NULL
);
ALTER TABLE
	[dbo].[product_log]
ADD
	CONSTRAINT [PK_product_logs] PRIMARY KEY CLUSTERED ([id] ASC);
------------------------------------------------------------------------------------------

--------------------------------PMS TABLE---------------------------------------------
DROP TABLE IF EXISTS [dbo].[pms]

GO 

CREATE TABLE [dbo].[pms] (
	[id]						INT IDENTITY (1, 1) 			NOT NULL,
    [product_id]				INT  							NOT NULL,
    [product_name]				VARCHAR (50)					NOT	NULL
);

ALTER TABLE
	[dbo].[pms]
ADD
	CONSTRAINT [PK_pms] PRIMARY KEY CLUSTERED ([id] ASC);
------------------------------------------------------------------------------------------

--------------------------------TICKETS TABLE---------------------------------------------
DROP TABLE IF EXISTS [dbo].[ticket]

GO 

CREATE TABLE [dbo].[ticket] (
	[id]								INT IDENTITY (1, 1) 					NOT NULL,
    [type]								VARCHAR (50) 							NOT NULL,
    [product_manager_id]				INT										NOT	NULL,
    [prority]							INT										NULL,
    [approved]							BIT										NOT NULL,
    [description]						VARCHAR (250)							NULL,
    [state]								VARCHAR (50)							NULL,
    [date_time_reported]				DATE									NOT NULL,
    [parent_id]							INT 									NULL,
    [feature_id]						INT 									NOT NULL
);

ALTER TABLE
	[dbo].[ticket]
ADD
	CONSTRAINT [PK_tickets] PRIMARY KEY CLUSTERED ([id] ASC);

------------------------------------------------------------------------------------------

--------------------------------COMMENTS TABLE---------------------------------------------

DROP TABLE IF EXISTS [dbo].[comment]

GO 

CREATE TABLE [dbo].[comment] (
	[id]						INT IDENTITY (1, 1) 			NOT NULL,
    [ticket_id]					INT  							NOT NULL,
    [comment]					VARCHAR (250)					NULL
);

ALTER TABLE
	[dbo].[comment]
ADD
	CONSTRAINT [PK_comments] PRIMARY KEY CLUSTERED ([id] ASC);
------------------------------------------------------------------------------------------

--------------------------------PM_TICKET TABLE---------------------------------------------
DROP TABLE IF EXISTS [dbo].[pm_ticket]

GO 

CREATE TABLE [dbo].[pm_ticket] (
	[id]						INT IDENTITY (1, 1) 						NOT NULL,
    [product_manager_id]		INT 			  							NOT NULL,
    [ticket_id]					INT											NOT	NULL
);
ALTER TABLE
	[dbo].[pm_ticket]
ADD
	CONSTRAINT [PK_pm_tickets] PRIMARY KEY CLUSTERED ([id] ASC);
------------------------------------------------------------------------------------------


--add FKs to TEAM table
ALTER TABLE
	[dbo].[team]
ADD
	CONSTRAINT [FK_team_products] FOREIGN KEY ([product_id]) REFERENCES [dbo].[product]([id]);

--add FKs to EMPLOYEE table
ALTER TABLE
	[dbo].[employee]
ADD
	CONSTRAINT [FK_employee_teams] FOREIGN KEY ([team_id]) REFERENCES [dbo].[team]([id]);

ALTER TABLE
	[dbo].[product_manager]
ADD
	CONSTRAINT [FK_product_manager_teams] FOREIGN KEY ([team_id]) REFERENCES [dbo].[team]([id]);

ALTER TABLE
	[dbo].[product]
ADD
	CONSTRAINT [FK_product_product_managers] FOREIGN KEY ([product_manager_id]) REFERENCES [dbo].[product_manager]([id]);

ALTER TABLE
	[dbo].[release_scope]
ADD
	CONSTRAINT [FK_release_scope_products] FOREIGN KEY ([product_id]) REFERENCES [dbo].[product]([id]);
ALTER TABLE
	[dbo].[release_scope]
ADD	
	CONSTRAINT [FK_release_scope_features] FOREIGN KEY ([feature_id]) REFERENCES [dbo].[feature]([id]);

ALTER TABLE
	[dbo].[product_log]
ADD
	CONSTRAINT [FK_product_log_tickets] FOREIGN KEY ([ticket_id]) REFERENCES [dbo].[ticket]([id]);

ALTER TABLE
	[dbo].[pms]
ADD
	CONSTRAINT [FK_pms_products] FOREIGN KEY ([product_id]) REFERENCES [dbo].[product]([id]);

ALTER TABLE
	[dbo].[ticket]
ADD
	CONSTRAINT [FK_ticket_features] FOREIGN KEY ([feature_id]) REFERENCES [dbo].[feature]([id]);
ALTER TABLE
	[dbo].[ticket]
ADD
	CONSTRAINT [FK_ticket_product_manager_id] FOREIGN KEY ([product_manager_id]) REFERENCES [dbo].[product_manager]([id]);
ALTER TABLE
	[dbo].[comment]
ADD
	CONSTRAINT [FK_comment_tickets] FOREIGN KEY ([ticket_id]) REFERENCES [dbo].[ticket]([id]);

ALTER TABLE
	[dbo].[pm_ticket]
ADD
	CONSTRAINT [FK_pm_ticket_product_managers] FOREIGN KEY ([product_manager_id]) REFERENCES [dbo].[product_manager]([id]);
ALTER TABLE
	[dbo].[pm_ticket]
ADD
	CONSTRAINT [FK_pm_ticket_tickets] FOREIGN KEY ([ticket_id]) REFERENCES [dbo].[ticket]([id])