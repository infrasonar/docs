![Time-Series](../images/application_timeseries.png){ width="150" align=right}

# Time Series

In this panel it is possible to turn time-series off or on on a container level.

Another feature in this panel is to purge dead time-series

## Turning time-series off

Turning time-series off can be useful in curtain use-cases to reduce costs.

!!! Note
    When a time-serie is turned any configured graphs will show the last measured state in a flat-line.
    
    Also important to note is than any Enodo conditions will no longer work as these require historical data to perform the analysis on.

## Turning time-series on

In some scenario's where you would like more in-depth analysis in might be beneficial to enable time-series.

A good example where this might be of using is monitoring per process information using the wmi probe. This is turned off by default as it can quickly result in massive time-series usage.

## Purge dead time-series

Dead time-series occur when an asset is removed or when an asset is modified.

*An easy example of an asset modification that leads to dead time-series is a removed volume.*

Purging dead time-series removes all time-series which not received data for the provided amount of weeks.

