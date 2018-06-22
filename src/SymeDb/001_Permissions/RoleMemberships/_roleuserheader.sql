DECLARE @createLogins BIT = $(CreateLogins);
DECLARE @printOnly BIT = 0;
DECLARE @ignoreRoleDoesntExist BIT = 0;

IF OBJECT_ID('tempdb..#Users', 'U') IS NOT NULL DROP TABLE #Users;
CREATE TABLE #Users
(
	ID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED
,	IsWindows BIT NOT NULL DEFAULT(0)
,	LoginName sysname NULL
,	SID VARBINARY(85) NULL
,	Password NVARCHAR(32) NULL
,	UserName sysname NULL
);

IF OBJECT_ID('tempdb..#RoleAssignments', 'U') IS NOT NULL DROP TABLE #RoleAssignments;
CREATE TABLE #RoleAssignments
(
	UserName sysname NOT NULL
,	RoleName sysname NOT NULL
);

SET NOCOUNT ON