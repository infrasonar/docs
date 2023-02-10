![Conditions](../images/application_conditions.png){ width="150" align=right}

# :material-list-status: Conditions

Check results sent to the InfraSonar cloud platform are immediately evaluated using the conditions configured for the specific asset. 

InfraSonar comes with many predefined conditions based on years of experience and best practices.

## Managing conditions

Conditions are assigned to an asset using [labels](labels.md).

In order to manage conditions you need to have the ContainerAdmin role on the container you want to manage conditions for.

## Operational

A hit condition returns a message and a severity.

The following severity can be returned:


Severity [^1] | Description
--------------|------------------------------------------------------------------------
EMERGENCY     | System is unusable.                                                    
ALERT         | Action must be taken immediately.                                      
CRITICAL      | Critical conditions.                                                   
ERROR         | Error conditions.                                                      
WARNING       | Warning conditions.                                                    
NOTICE        | Normal but significant conditions.                                     
INFORMATIONAL | Informational.                                                         
DEBUG         | Messages that contain information normally of use only when debugging. 
OK            | This is an explicit OK which results in an alert auto closing when hit.

[^1]: Our severity levels are derived from the Syslog levels, see this [Syslog :material-wikipedia: wikipedia article](https://en.wikipedia.org/wiki/Syslog) for additional information.

When a condition is hit 



