# :material-upload-network-outline: Ping

The ping-probe utilizes the [icmp protocol](https://en.wikipedia.org/wiki/Ping_(networking_utility)) to monitor the network roundtrip between the monitoring appliance and the monitored host.

Next to the roundtrip time, the ping probe monitors the number of dropped and successful packets.

When the number of successful equals 0, a condition is raised.

## Configuration

Property | Description
---------|------------------------
Address  | The address that the probe should ping.
Interval | Interval should be a value between 1 and 9, The default interval is 1.
Count    | Count should be a value between 1 and 9, the default count is 5
Timeout  | Timeout in seconds should be a value between 0 and 240, the default timeout is 10 seconds.
