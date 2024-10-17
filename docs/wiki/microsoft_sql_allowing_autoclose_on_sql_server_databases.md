# Microsoft SQL - Allowing AutoClose on SQL Server Databases

[source](https://www.itprotoday.com/sql-server/worst-practice-allowing-autoclose-on-sql-server-databases)
Original author: [Michael K. Campbell](https://www.itprotoday.com/author/michael-k-campbell)

Simply stated, allowing or enabling AutoClose on production SQL Server databases is a worst practice.

## What is AutoClose & Why is It Bad?
AutoClose is a database option or setting – set on a database by database basis (meaning that it can’t be controlled at the server level).

According to [Books Online](https://msdn.microsoft.com/en-us/library/ms190249.aspx):

> When set to ON, the database is shut down cleanly and its resources are freed after the last user exits. The database automatically reopens when a user tries to use the database again.
> 
> When set to OFF, the database remains open after the last user exits.

Since most Sys Admins and DBAs I know (or work with) tend to be wired for optimization, the prospect of cleanly tearing down a database after users are no longer in it seems to make all sorts of logical sense.

The problem, however, is that there is minimal cost and overhead associated with not only tearing down existing connections, file-handles, and buffer allocations in order to ‘shut down’ a database when it auto-closes, but there can also be significant overhead involved in spinning a database back up when it’s accessed by subsequent applications or users.

In fact, if you think about the benefits of how SQL Server connection pooling works from within .NET applications – the entire purpose of connection pooling is designed to amortize the COST of making expensive, initial, connections to SQL Server databases over multiple requests.

As such, it makes no sense to allow production databases to automatically turn themselves off when active connections stop – especially if a new connection might spin up within just a few seconds (or even milliseconds) after the AutoClose procedure terminates.

Accordingly, while AutoClose may seem like it makes a lot of sense, it can actually cause performance problems – to the point where it’s among the first-things I’ll check when troubleshooting performance for clients.

Likewise, I’m also not a fan of the fact that when AutoClose is on you’ll start to see potentially gobs of SQL Server log entries to the tune of “Starting up database ”. (My rule of thumb is to try and keep Log File entries as ‘clutter free’ as possible to enable higher signal-to-noise ratios when the logs are being scanned for potential problems.)

That, and since many SQL Server DMVs that are useful in troubleshooting, tuning, and [validating the removal of potentially non-used objects](https://www.itprotoday.com/latest-news), have their data/values ‘reset’ each time a database is taken offline, there are other, ugly, side-effects that come with routinely allowing SQL Server to take databases offline.

## But Doesn’t SQL Server 2005+ REMOVE Performance Overhead of AutoClose?

According to [Books Online](https://msdn.microsoft.com/en-us/library/bb522682.aspx):

> In earlier versions of SQL Server, AUTO_CLOSE is a synchronous process that can degrade performance when the database is accessed by an application that repeatedly makes and breaks connections to the Database Engine. Starting in SQL Server 2005, the AUTO_CLOSE process is asynchronous; repeatedly opening and closing the database no longer reduces performance.

While that may appear to contradict most of what I just said, it’s sadly misleading. Yes, SOME of the performance costs I mentioned above are now gone by means of the fact that SQL Server can more adeptly shut-down a database.

But the overhead/cost of establishing new connections still remains, AND the bigger problem is that SQL Server now has to load data back into the buffer to satisfy queries, and any queries fired against the database itself have to be re-compiled as well.

**Translation**: The SQL Server 2005+ ENGINE might not block/choke when doing the ‘AutoClose Shuffle’, but ALL of the performance penalties and negatives of allowing/enabling AutoClose still remain – making it a worst practice.

## How Do Databases Get Set to AutoClose?

By default, databases created by SQL Server aren’t set to AutoClose by default (unless your model database has been explicitly set to enable AutoClose). But, databases that may have been ‘upsized’ from SQL Server 2000 MSDE instances and databases created on SQL Server Express are set to AutoClose by DEFAULT.

And, in the case of databases that were designed to be deployed on mobile laptops without full-blown ‘server’ capabilities, I think you COULD argue that it sort of makes sense that AutoClose might be beneficial. Only, if you’re THAT worried about reclaiming resources, you’re better off just shutting down SQL Server when it’s not in use because it already does a fantastic job of yielding resources on a heavily used box when a given database is NOT being used. (SQL Server itself is very ‘friendly’ in this same fashion and I think that with modern, non 8086 processors and RAM, SQL Server is just fine being ‘left’ running on most boxes anyhow.)

Another scenario, however, where databases may be set to AutoClose is when non-SQL Server-savvy sysadmins or DBAs are in poking around with database properties and settings, see the ‘Auto Close’ option, read about how it ‘returns resources to the server’ in Books Online, and think that turning this option on makes tons of sense. And, frankly, who could blame them – Books Online does NOT do a good enough job of warning readers that turning AutoClose on is a BAD idea on production servers.

## Cases Where AutoClose Might Make Sense

As with all things SQL Server, it’s almost impossible to lay down blanket statements or truisms that will work for every use-case or scenario. Consequently, the point of this blog post was to point out why AutoClose for those who are inclined to think that allowing SQL Server to reclaim resources would make sense (without fully understanding the cost of what that means in practice).

Accordingly, allowing production databases to run with AutoClose on is a worst practice – it can cause all sorts of performance problems and other issues/side-effects that you don’t want in play on production databases.

However, on dev or testing servers where there may be limited resources and multiple databases or test-cases that need to be addressed, setting databases to AutoClose can make sense in some cases – as long as it’s possible to effectively define discrete periods of time where one database won’t be used while another will. That said, I regularly beat up my own test/dev databases on a VMware host and NEVER bother with setting any of my databases to AutoClose – simply because the amount of resources that will be returned to SQL Server by shutting off a single database just doesn’t merit the effort nor is it worth the risk that one of these databases might somehow make it into production with AutoClose turned on.

Similarly, I think it could be (theoretically) argued that in some very rare and very well-thought-out edge cases that turning on AutoClose on a production server/database might make sense. But for 99.99% of production databases out there, this shouldn’t even be a consideration. And, in the .01% of databases where this might even make sense to consider, I’m guessing that in 99% of those cases, AutoClose will STILL be the wrong choice. So, only in the most theoretical and perfectly considered environment would AutoClose even begin to make sense on a production database – meaning that you really don’t want to go there.