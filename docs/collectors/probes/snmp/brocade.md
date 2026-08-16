![Eaton-Probe](../../../images/probe_brocade.png){ width="150" align=right}

# Brocade

## Introduction

The Brocade probe uses the [snmp](index.md) protocol to perform its queries.

## Features

InfraSonar collects the following metrics from the Brocade Fibre Channel (FC) storage switches:

- System Information & Health
-	Device Details: A Brocade switch named "brocade" (Serial: BRCEZL1913T01E) running firmware v8.2.3.
-	Network & Fabric Role
-	Resource Usage
-	Hardware Health
- Port Status & Traffic

## Conditions

### Invalid ordered sets

Invalid Ordered Sets (IOS) occur when a Fibre Channel (FC) port receives physical layer bit patterns that fail transmission protocol rules or standard FC frame structures.

When the condition is hit this indicates an elevated error rate on that specific port, almost always pointing to a physical layer degradation issue.

#### Primary Causes

- **Dirty Optics/Connectors**: Dust or contamination on the SFP optical transceiver interface or fiber patch cable end-faces (most common).
- **Faulty Cable**: Damaged, micro-bent, or degraded fiber patch cable.
- **Failing SFP Transceiver**: Failing laser or receiver on the local switch port or the connected SFP on the remote HBA/storage array.
- **Marginal Link Integrity**: Signal loss, poor seating of the SFP, or cable distance exceeding the optic's transceiver limits.

####  Troubleshooting Steps

1. Check Physical Signal Levels Run the command to check optical power (Tx/Rx levels): `sfpshow <slot/port>`  Look at the RX Power value. If it is significantly low (e.g., below -10 dBm depending on the optic type) or marked as LOW_ALARM / LOW_WARNING, the signal arriving at the port is degraded.
2. Clean the Fiber and SFP Reseat the fiber cable and clean both the fiber ends and the SFP transceiver optics using a fiber cleaning pen or clicker.
3. Replace the Cable Swap out the fiber patch cable connecting the switch port to the host/storage port.
4. Swap or Replace the SFP If the errors persist after cleaning and replacing the cable, move the connection to a known-good port or replace the SFP transceiver.
5. Clear Stat Counters to Monitor Clear the error counters on the port to see if the issue is ongoing: `statsclear <slot/port>`  Monitor the port over the next few hours with `porterrshow <slot/port>` to confirm if the `enc_out` or `crc / bad_os` counters continue incrementing.

## Additional information

:material-github: [APC UPS probe source code](https://github.com/infrasonar/brocade-probe)
