CREATE TABLE [dbo].[refDiscountEligibilityParameterGroup](
[ParameterGroupCode] [CHAR](1) NOT NULL,
[ParameterGroup] [VARCHAR](20) NOT NULL,
CONSTRAINT [PK_refDiscountEligibilityParameterGroup] PRIMARY KEY CLUSTERED 
(
	[ParameterGroupCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON [dbo].[refDiscountEligibilityParameterGroup] TO [TWRExporter]
GO