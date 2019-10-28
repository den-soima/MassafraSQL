﻿﻿﻿USE [master]
GO

/****** Object:  LinkedServer [BERGAMO-SV201\PLANTIT]    Script Date: 23.09.2019 14:09:37 ******/
EXEC master.dbo.sp_addlinkedserver @server = N'BERGAMO-SV201\PLANTIT', @srvproduct=N'SQL Server'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'BERGAMO-SV201\PLANTIT',@useself=N'False',@locallogin=NULL,@rmtuser=N'sa',@rmtpassword='ProAdmin777'

GO

EXEC master.dbo.sp_serveroption @server=N'BERGAMO-SV201\PLANTIT', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'BERGAMO-SV201\PLANTIT', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'BERGAMO-SV201\PLANTIT', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'BERGAMO-SV201\PLANTIT', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'BERGAMO-SV201\PLANTIT', @optname=N'rpc', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'BERGAMO-SV201\PLANTIT', @optname=N'rpc out', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'BERGAMO-SV201\PLANTIT', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'BERGAMO-SV201\PLANTIT', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'BERGAMO-SV201\PLANTIT', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'BERGAMO-SV201\PLANTIT', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'BERGAMO-SV201\PLANTIT', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'BERGAMO-SV201\PLANTIT', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'BERGAMO-SV201\PLANTIT', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO


