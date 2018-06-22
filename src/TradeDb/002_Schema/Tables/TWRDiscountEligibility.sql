CREATE TABLE [dbo].[TWRDiscountEligibility](
[Id] [int] IDENTITY(1,1) NOT NULL,
[DiscountId] [int] NOT NULL,
[ParameterType] [char](1) NOT NULL,
[ParameterGroup] [char](1) NOT NULL,
[ParameterValue] [varchar](64) NULL,
CONSTRAINT [PK_TWRDiscountEligibility] PRIMARY KEY CLUSTERED 
(
[Id] ASC,
[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON [dbo].[TWRDiscountEligibility] TO [TWRExporter]
GO
