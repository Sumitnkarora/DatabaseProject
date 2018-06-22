CREATE TABLE [dbo].[refContributorRoles]
(
	[RoleId] CHAR(2) NOT NULL
,	[Description] VARCHAR(MAX) NULL
,	[KoboType] varchar(30) NULL
,	[RoleCode] varchar(3) NULL

,	CONSTRAINT [PK_refContributorRoles] PRIMARY KEY CLUSTERED([RoleId])
);
GO

CREATE NONCLUSTERED INDEX [IX_refContributorRoles_KoboType] ON [dbo].[refContributorRoles] ([KoboType]) INCLUDE ([RoleCode]) WHERE [KoboType] IS NOT NULL;
GO
