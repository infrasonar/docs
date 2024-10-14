# Auto-Shrink Enabled or Job has Shrink Steps

Running out of disk space sucks.  SQL Server can help: it can automatically shrink databases to remove unused space.  However, this option has way more drawbacks than positives.  We check `sys.databases` to see if `is_auto_shrink_on = 1` for any of the databases.

We can also create our own Agent jobs with `DBCC SHRINKDATABASE` or `SHRINKFILE` commands, too.  `sp_Blitz` also checks for jobs with those key words in the job steps.  It’s not perfect – for example, it doesn’t catch maintenance plans set up to shrink databases.

Shrinking databases is the fastest way to achieve fragmentation.  SQL Server goes to the last page in the database, moves it to the first free available space, and then repeats the process again.  This shuffles the deck, putting your pages out of order.

To make things worse, this is often combined with a nightly index rebuild process that puts indexes back in order again – but leaves free space behind.  The very next time shrink runs, it re-fragments everything, and your storage is stuck on the Hamster Wheel of Death.

(That’s a technical term.)

## Why Shrinking Causes Problems: Data Files and Log Files

### Data file pain

- **CPU**, there’s no such thing as a free shrink; they’re usually expensive
- **Disk I/O**, heavy read and write churn to find highest allocated page and shove it as far forward as it can
- **Log file**, this is a fully logged operation. If your log file is on the same drive, you’re going nowhere fast.
- **Blocking**, shrinks can block and be blocked
  
### Log files are a slightly different animal

- No pages

- Data segments called virtual log files (VLFs)

No Instant File Initialization

- Every growth causes I/O waits while SQL zeroes out the space

Truncating for size reasons only

- They will likely grow to that size again
- Can be a long and painful process.

## To Fix the Problem

If we’re dealing with auto-shrink, in SQL Server Management Studio, you can right-click on each database and go into its properties to turn off auto-shrink.  This takes effect immediately. You can also change this setting with an `ALTER DATABASE` script setting `AUTO_SHRINK OFF`.

```sql
/*This will script out the command for you, check it and execute the output */
 
    SELECT  'ALTER DATABASE ' + QUOTENAME(name) + ' SET AUTO_SHRINK OFF WITH NO_WAIT;' AS [To Execute]
    FROM    sys.databases
    WHERE   is_auto_shrink_on = 1;
GO
```

This script only creates the T-SQL for your change: you still need to copy it and execute it.

If we’re dealing with an Agent job that does a shrink, comment out that line of the job step.

After the change, you should see faster runtimes for index reorg/rebuild jobs and faster storage response times.