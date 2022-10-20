-- noinspection SqlNoDataSourceInspectionForFile
DECLARE @AuthenticationMode INT
EXEC master.dbo.xp_instance_regread N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'LoginMode', @AuthenticationMode OUTPUT

IF @AuthenticationMode != 2 BEGIN
	print 'This script requires SQL Server authentication to be enabled'
END

IF NOT EXISTS (SELECT name FROM [sys].[server_principals] WHERE name = N'svc_infrasonar')
BEGIN
	CREATE LOGIN [svc_infrasonar] WITH PASSWORD = 'someSuperSecurePasswordHereOfCourse'
END

USE Master;
GO
GRANT VIEW SERVER STATE TO svc_infrasonar;
GO
GRANT VIEW ANY DEFINITION TO svc_infrasonar;
GO
GRANT EXECUTE ON xp_readerrorlog TO svc_infrasonar; -- need some special godmode or this fails, let it fail.
GO

----------------------SECTION------------------------
--   RUN THIS ALSO WHEN NEW DATABASES APPEAR     ----
-----------------------------------------------------
USE master;
GO
DECLARE @dbname SYSNAME
DECLARE @statement NVARCHAR(max)

DECLARE db_cursor CURSOR LOCAL FAST_FORWARD FOR
    SELECT name
    FROM sys.databases
	WHERE is_read_only = 0 AND state = 0 -- ON

OPEN db_cursor
FETCH NEXT FROM db_cursor INTO @dbname WHILE @@FETCH_STATUS = 0
BEGIN

    SELECT @statement = N'use ['+@dbname +'];
    IF NOT EXISTS (SELECT name FROM ['+@dbname +'].[sys].[database_principals] WHERE name = N''svc_infrasonar'')
    BEGIN
        CREATE USER svc_infrasonar FOR LOGIN svc_infrasonar;
    END
    EXEC sp_addrolemember N''db_datareader'', [svc_infrasonar];
    GRANT CONNECT TO [svc_infrasonar];
    '

    exec sp_executesql @statement

    FETCH NEXT FROM db_cursor INTO @dbname
END

CLOSE db_cursor
DEALLOCATE db_cursor

---------------------END SECTION----------------------

USE msdb;
GO
GRANT SELECT ON sysalerts TO svc_infrasonar;
GO
GRANT SELECT ON sysjobschedules TO svc_infrasonar;
GO
GRANT SELECT ON sysjobs TO svc_infrasonar;
GO
GRANT SELECT ON sysjobhistory TO svc_infrasonar;
GO
GRANT SELECT ON sysjobactivity TO svc_infrasonar;
GO
GRANT SELECT ON syscategories TO svc_infrasonar;
GO
EXEC sp_addrolemember N'SQLAgentReaderRole', N'svc_infrasonar';
GO