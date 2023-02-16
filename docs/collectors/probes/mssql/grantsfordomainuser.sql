USE master;
GO

IF NOT EXISTS (SELECT name FROM [sys].[server_principals] WHERE name = N'domainnamehere\usernamehere')
BEGIN
	create login [domainnamehere\usernamehere] from windows;
END

GRANT VIEW SERVER STATE TO [domainnamehere\usernamehere];
GO
GRANT VIEW ANY DEFINITION TO [domainnamehere\usernamehere];
GO
GRANT EXECUTE ON xp_readerrorlog TO [domainnamehere\usernamehere]; -- need some special godmode or this fails, let it fail.
GO

----------------------SECTION------------------------
--    RUN THIS ALSO WHEN NEW DATABASES APPEAR    ----
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
    IF NOT EXISTS (SELECT name FROM ['+@dbname +'].[sys].[database_principals] WHERE name = N''domainnamehere\usernamehere'')
    BEGIN
        CREATE USER [domainnamehere\usernamehere] FOR LOGIN [domainnamehere\usernamehere];
    END
    EXEC sp_addrolemember N''db_datareader'', [domainnamehere\usernamehere];
    GRANT CONNECT TO [domainnamehere\usernamehere];
    '
    
    exec sp_executesql @statement
    
    FETCH NEXT FROM db_cursor INTO @dbname
END

CLOSE db_cursor
DEALLOCATE db_cursor

---------------------END SECTION----------------------

USE msdb;
GO
GRANT SELECT ON sysalerts TO [domainnamehere\usernamehere];
GO
GRANT SELECT ON sysjobschedules TO [domainnamehere\usernamehere];
GO
GRANT SELECT ON sysjobs TO [domainnamehere\usernamehere];
GO
GRANT SELECT ON sysjobhistory TO [domainnamehere\usernamehere];
GO
GRANT SELECT ON sysjobactivity TO [domainnamehere\usernamehere];
GO
GRANT SELECT ON syscategories TO [domainnamehere\usernamehere];
GO
EXEC sp_addrolemember N'SQLAgentReaderRole', N'domainnamehere\usernamehere';
GO