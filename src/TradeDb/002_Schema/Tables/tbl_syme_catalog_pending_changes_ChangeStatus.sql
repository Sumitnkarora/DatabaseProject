CREATE TABLE [syme].[tbl_syme_catalog_pending_changes_ChangeStatus](
	[ChangeStatusID] [INT] NOT NULL,
	[Description] [VARCHAR](100) NOT NULL,
 CONSTRAINT [PK_tbl_syme_catalog_pending_changes_ChangeStatus] PRIMARY KEY CLUSTERED 
(
	[ChangeStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
