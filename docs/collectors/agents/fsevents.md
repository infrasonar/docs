# :material-folder-file: fsevents

The FS-Events agent is a specialized agent used to measure how long a restore from tape takes.

If you feel you need an agent like FS-Events please contact [support](../../support/index.md) to discuss your specific needs.


## FS Events stats explained

- **average**: average load duration all time, tape and cached
- **averageTape**: average load duration all time, tape only
- **avgLatest**: average load duration latest files, tape and cache
- **avgLatestTape**: average load duration latest, tape only
- **bytesPerSecLatestTape**: transfer speed latest files from tape
- **bytesPerSecTape**:transfer speed all time from tape
- **counter**: Total number of restores
- **counterTape**: Total number of tape restores
- **numLatest**: Latest number of restores
- **numLatestTape**: Latest number of tape restores

> Note: By _'latest'_, we refer to the files currently held in the queue. When the queue reaches its capacity, the oldest file is removed, which is why the remaining files are considered the _'latest'_.

## Additional information

:material-github: [QStar agent source code](https://github.com/infrasonar/qstar-agent)