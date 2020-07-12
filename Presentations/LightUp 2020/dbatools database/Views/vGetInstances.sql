SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vGetInstances]

AS
	SELECT HOSTNAME + '.' + DOMAIN +
			CASE
				WHEN [INSTANCE] = 'MSSQLSERVER' OR [INSTANCE] IS NULL THEN ''
				ELSE '\' + ISNULL([INSTANCE], '')
			 END +
			 CASE
				WHEN PORT = 1433 OR PORT IS NULL THEN ''
				ELSE ',' + CAST(PORT AS VARCHAR(10))
			END AS ConnString
			, HOSTNAME + '.' + DOMAIN AS [FQDN]
			, *

	FROM dbo.Instances

GO