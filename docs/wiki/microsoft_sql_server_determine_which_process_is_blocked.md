# Microsoft SQL server - determine which process is blocked

There are several ways to determine which process is blocked in Microsoft SQL Server:

## Using the `sp_who` system procedure:

This procedure provides a snapshot of all active connections to the server.
To check for blocked processes, look for the blocked column. A non-zero value indicates that the process is blocked.
You can also use the `sp_who2` procedure for more detailed information.

## Using the `sys.dm_exec_requests` DMV:

This DMV provides detailed information about all running requests in the server.
To check for blocked processes, look for the **blocking_session_id** column. A non-zero value indicates that the process is blocked by another process with that session ID.

## Using the `sys.dm_os_wait_stats` DMV:

This DMV provides information about the wait statistics for different types of waits in the server.
To check for blocked processes, look for the **wait_type** column. Some wait types, such as `PAGEIOLATCH_EX` and `LCK`, often indicate blocking.

## Using the `sys.dm_tran_locks` DMV:

This DMV provides information about the locks held by different transactions in the server.
To check for blocked processes, look for the **request_session_id** and **request_mode** columns. A request_mode of `CONVERT` or `UPDATE` often indicates a blocking request.

## Using the `DBCC INPUTBUFFER` command:

This command displays the last statement executed by a specific session.
To check for blocked processes, you can use the `DBCC INPUTBUFFER` command with the session ID of the blocked process to see what statement is causing the block.

## Using SQL Server Profiler:

SQL Server Profiler can capture events that occur in the server, including blocking events.
You can configure Profiler to capture events related to blocking and analyze the trace log to identify the cause of the block.

It's important to note that these methods provide different levels of detail and may require additional analysis to determine the root cause of the blocking. It's often helpful to combine multiple methods to get a complete picture of the situation.