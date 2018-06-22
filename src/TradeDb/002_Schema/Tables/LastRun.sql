CREATE TABLE dbo.LastRun
(
	Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED
,	ProcessName VARCHAR(255) NOT NULL
,	LastRunTime DATETIME2(3) NOT NULL DEFAULT(SYSDATETIME())
);
GO

CREATE UNIQUE INDEX UX_LastRun_ProcessName ON dbo.LastRun(ProcessName);
GO

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON dbo.LastRun TO [TWRExporter];
GO