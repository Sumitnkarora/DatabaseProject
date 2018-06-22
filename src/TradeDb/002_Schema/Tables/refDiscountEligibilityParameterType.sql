CREATE TABLE [dbo].[refDiscountEligibilityParameterType](
[ParameterTypeCode] [char](1) NOT NULL,
[ParameterType] [varchar](20) NOT NULL,
CONSTRAINT [PK_refDiscountEligibilityParameterType] PRIMARY KEY CLUSTERED 
(
	[ParameterTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON [dbo].[refDiscountEligibilityParameterType] TO [TWRExporter]
GO
