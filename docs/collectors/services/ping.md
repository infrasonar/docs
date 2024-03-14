![Ping](../../images/probe_ping.png){ width="150" align=right}

# Ping

## Introduction

The ping-service is the [service](./index.md) variant of our [ping-probe](../probes/ping.md).

This service send ping requests from our InfraSonar cloud platform to the monitored asset.

## Features

* Ping roundtrip monitoring, min and max timing
* Number of successfully and/or dropped packages

## Service configuration

Property | Description
---------|------------------------
Address  | The address that the probe should ping.
Interval | Interval should be a value between 1 and 9, The default interval is 1.
Count    | Count should be a value between 1 and 9, the default count is 5
Timeout  | Timeout in seconds should be a value between 0 and 240, the default timeout is 10 seconds.

## Check specifics

Ping returns the `minimum time` and `maximum time` as this provides a better insight than just an average ping response.

The number of `successful` and `dropped` ping packages are also monitored.