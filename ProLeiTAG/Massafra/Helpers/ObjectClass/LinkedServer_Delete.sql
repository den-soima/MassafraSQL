﻿﻿﻿USE [master]
GO

/****** Object:  LinkedServer [BERGAMO-SV201\PLANTIT]    Script Date: 23.09.2019 14:10:06 ******/
EXEC master.dbo.sp_dropserver @server=N'BERGAMO-SV201\PLANTIT', @droplogins='droplogins'
GO


