# Overview

The InfraSonar API is used for accessing and manipulating data within InfraSonar.

InfraSonar [agents](../collectors/agents/index.md) use the API to bring data into the platform while automation solutions such as [Ansible](https://www.ansible.com/) and [Salt](https://saltproject.io/) can be used to query data but also change [modes](../application/modes.md) to avoid getting notified while automation tasks are performing maintenance.

    
The API is also used by InfraSonar ready to run [integrations](../integrations/index.md)