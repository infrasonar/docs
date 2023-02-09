# :material-upload-network-outline: Ping

## Introduction

The ping-probe utilizes the [icmp protocol](https://en.wikipedia.org/wiki/Ping_(networking_utility)) to monitor the network roundtrip between the monitoring appliance and the monitored host.

## Features

* Ping roundtrip monitoring, min and max timing
* Number of successfull and/or dropped packages

## Deployment

The ping probe can best be deployed as a docker container.

:material-docker: [ghcr.io/infrasonar/ping-probe](ghcr.io/infrasonar/ping-probe)

See our TODO

## Probe configuration

Property | Description
---------|------------------------
Address  | The address that the probe should ping.
Interval | Interval should be a value between 1 and 9, The default interval is 1.
Count    | Count should be a value between 1 and 9, the default count is 5
Timeout  | Timeout in seconds should be a value between 0 and 240, the default timeout is 10 seconds.

## Check specifics

Ping returns the `minimum time` and `maximum time` as this provides a better insight than just an average ping response.

The number of `successful` and `dropped` ping packages are also monitored.

## Additional information

:material-github: [Ping probe source code](https://github.com/infrasonar/ping-probe)