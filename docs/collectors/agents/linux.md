# :fontawesome-brands-linux: Linux agent

Our Linux agent is a single binary which can easily be deployed on **x86** Linux systems.
_If you need to monitor a different CPU architecture please contact support._

## Installation

### Easy deployment

You can use our easy deployment script to swiftly deploy the InfraSonar agent onto your Linux systems.

Prerequisites:
- **curl**, this script is downloaded using the `curl` command and also uses this command internally to download our binary agent.
- **elevated privileges** as it installs a service.
- **systemd**, our easy deployment scrips opt to use `systemd` to install the agent as as service.


```batch
sudo /bin/bash -c "$(curl -fsSL https://deploylinuxagent.infrasonar.com)"
```

The install script prompts you for the **InfraSonar agent token** and optional asset token as shown below:

```
[INFO] Creating directory '/opt/infrasonar-agent'...
[INFO] Configuration file does not exist.
[INFO] Creating directory '/etc/infrasonar'...
Please enter your token: <<ENTER YOUR INFRASONAR AGENT TOKEN HERE>>
Add asset token, leave empty for auto creation: 
[INFO] Created config file '/etc/infrasonar/linux-agent.env'...
[INFO] Successfully downloaded infrasonar-linux-agent
[INFO] Creating systemd unit file '/etc/systemd/system/infrasonar-linux-agent.service'...
[INFO] Enabling and starting the InfraSonar Linux agent service...
Created symlink /etc/systemd/system/multi-user.target.wants/infrasonar-linux-agent.service → /etc/systemd/system/infrasonar-linux-agent.service.
[INFO] Infrasonar Linux agent service started successfully.
[INFO] InfraSonar Linux agent deployment complete.
```

By default this script installs the binary in `/opt/infrasonar-agent` and it's config file in `/etc/infrasonar` the service is installed as  `infrasonar-linux-agent`

??? note "Linux deployment script source code"
    The source code of our easy deployment script:

    ```bash title="Deplyment script source code"
    --8<-- "collectors/agents/linux.bash"
    ```


### Verify

You can verify if the agent is running correctly using the following command:

```bash
systemctl status infrasonar-linux-agent
```

It should output something similar as this:

```
● infrasonar-agent.service - InfraSonar Linux Agent
     Loaded: loaded (/etc/systemd/system/infrasonar-linux-agent.service; enabled; preset: enabled)
     Active: active (running) since Fri 2025-06-27 08:02:17 UTC; 7min ago
   Main PID: 587 (infrasonar-linu)
      Tasks: 7 (limit: 38298)
     Memory: 5.2M (peak: 7.9M)
        CPU: 40ms
     CGroup: /system.slice/infrasonar-linux-agent.service
             └─587 /opt/infrasonar-agent/infrasonar-linux-agent

Jun 27 08:02:17 linuxagent-ubuntu systemd[1]: Started infrasonar-agent.service - InfraSonar Linux Agent.
Jun 27 08:02:17 linuxagent-ubuntu infrasonar-linux-agent[587]: 2025/06/27 08:02:17 Starting InfraSonar Linux Agent Collector v0.1.1
Jun 27 08:02:18 linuxagent-ubuntu infrasonar-linux-agent[587]: 2025/06/27 08:02:18 Created asset `linuxagent-ubuntu.fritz.box` (Id: 97898)
Jun 27 08:02:18 linuxagent-ubuntu infrasonar-linux-agent[587]: 2025/06/27 08:02:18 Scheduled: CHECK_NETWORK_INTERVAL: 300 / Inital wait: 97
Jun 27 08:02:18 linuxagent-ubuntu infrasonar-linux-agent[587]: 2025/06/27 08:02:18 Scheduled: CHECK_SYSTEM_INTERVAL: 300 / Inital wait: 113
Jun 27 08:02:18 linuxagent-ubuntu infrasonar-linux-agent[587]: 2025/06/27 08:02:18 Scheduled: CHECK_DISK_INTERVAL: 300 / Inital wait: 116
Jun 27 08:02:18 linuxagent-ubuntu infrasonar-linux-agent[587]: 2025/06/27 08:02:18 Scheduled: CHECK_MEMINFO_INTERVAL: 300 / Inital wait: 74
```

## Checks

### Memory

Linux memory statistics, mostly taken from `/proc/meminfo`:

#### Overall System Memory

These metrics provide a high-level view of the total physical RAM and its immediate status.

Metric                                        | Description
----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------
Total RAM<br>`memTotal`                       | The total amount of physical RAM available on the system.   
Free RAM<br>`memFree`                         | The amount of physically unallocated memory. This doesn't account for reclaimable memory like `cached`. 
Available RAM<br>`memAvailable`               | An estimate of how much memory is available for new applications, without swapping. This is a more accurate indicator of available memory than `memFree`.   
Commit Limit<br>`commitLimit`                 | The total amount of memory that can be allocated on the system. This is `memTotal - swapTotal` by default, but can be configured.   
Committed Virtual Memory<br>`committedAS`     | The total amount of memory that the system has guaranteed to applications, even if it's not yet actually allocated (overcommit).

#### Page Cache and Buffers

These represent memory used by the kernel for optimizing disk I/O. This memory is typically reclaimable if applications need it.

Metric                                        | Description
----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------
File Cache<br>`cached`                        | Memory used to cache files from the disk (page cache). This is memory that can be reclaimed.
Disk Buffers<br>`buffers`                     | Memory used by kernel buffers, primarily for block device I/O (e.g., raw disk blocks).  
Cached Swap<br>`swapCached`                   | Memory that once was in swap, is now back in RAM, but is still also in the swap file (so it can be quickly swapped out again).  
Dirty RAM<br>`dirty`                          | Memory waiting to be written back to disk. This data is "dirty" because it has been modified in memory but not yet saved.   
Writeback RAM<br>`writeback`                  | The amount of memory that is actively being written back to disk.   
Temp. Writeback<br>`writebackTmp`             | Temporary writeback memory. This is memory that is temporarily used for writeback operations, often during high I/O load.   

#### Active vs. Inactive Memory

This grouping helps understand how recently memory pages have been accessed, which dictates their reclaimability.

Metric                                        | Description
----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------
Active RAM<br>`active`                        | Memory that has been used more recently and is less eligible for reclaim. It's considered to be actively in use.
Active Anon. RAM<br>`activeAnon`              | Memory that is *active* and *anonymous* (not backed by a file). This typically includes application data.   
Active File Cache<br>`activeFile`             | Memory that is *active* and *file-backed* (e.g., memory mapped files, data cached from files).  
Inactive RAM<br>`inactive`                    | Memory that has not been used recently and is a candidate for reclaim.  
Inactive Anon. RAM<br>`inactiveAnon`          | Memory that is *inactive* and *anonymous*.  
Inactive File Cache<br>`inactiveFile`         | Memory that is *inactive* and *file-backed*.
Unevictable RAM<br>`unevictable`              | Memory that cannot be easily reclaimed or swapped out (e.g., `mlocked` memory). 
Locked RAM<br>`mlocked`                       | Memory that has been "locked" into RAM and will not be swapped out. This is often used for security-sensitive applications or real-time systems.
Anonymous RAM<br>`anonPages`                  | Total amount of anonymous memory (not backed by a file). This includes application data and dynamically allocated memory.   

#### Kernel Internal Memory

These metrics show memory used by the Linux kernel itself for various internal structures and operations.

Metric                                        | Description
----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------
Slab Cache<br>`slab`                          | Memory used by the kernel for its own internal data structures (e.g., caches for inodes, directory entries, process control blocks). It's divided into `sReclaimable` and `sUnreclaim`. 
Reclaimable Slab<br>`sReclaimable`            | Part of the `slab` cache that can be reclaimed (e.g., caches for directory entries and inodes). 
Unreclaimable Slab<br>`sUnreclaim`            | Part of the `slab` cache that cannot be reclaimed (e.g., critical kernel data structures).  
Kernel Stacks<br>`kernelStack`                | Memory used by kernel stacks for each process and kernel thread.
Page Tables<br>`pageTables`                   | The amount of memory consumed by the kernel to store page tables.   
Mapped Files/Devices<br>`mapped`              | The amount of memory mapped by devices or files (including shared libraries).   
Bounce Buffers<br>`bounce`                    | Memory used for block device bounce buffers. This is typically for older or 32-bit hardware that cannot address high memory directly.   
Corrupted Hardware RAM<br>`hardwareCorrupted` | Memory that has been identified as corrupted by hardware errors.

#### Huge Pages

Dedicated memory pages of larger sizes used for specific applications (e.g., databases) for performance reasons.

Metric                                        | Description
----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------
Total Huge Pages<br>`hugePagesTotal`          | The total number of huge pages configured on the system.
Free Huge Pages<br>`hugePagesFree`            | The number of huge pages that are free and available.   
Reserved Huge Pages<br>`hugePagesRsvd`        | The number of huge pages that are reserved for future allocations. These are not yet allocated but are not available for general use.   
Surplus Huge Pages<br>`hugePagesSurp`         | The number of huge pages that are above the `hugePagesTotal` limit. This can happen if the system dynamically allocates more huge pages than initially configured.  
Huge Page Size<br>`hugepagesize`              | The size of a huge page (e.g., 2048 kB).
Anon. Huge Pages<br>`anonHugePages`           | Anonymous memory that is backed by huge pages.  
Direct Map 1GB<br>`directMap1G`               | The amount of physical memory mapped into the kernel's virtual address space using 1GB huge pages.  
Direct Map 2MB<br>`directMap2M`               | The amount of physical memory mapped into the kernel's virtual address space using 2MB huge pages.  
Direct Map 4KB<br>`directMap4k`               | The amount of physical memory mapped into the kernel's virtual address space using 4KB pages.   

#### Swap Space

Metrics related to the virtual memory extension on disk.

Metric                                        | Description
----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------
Total Swap<br>`swapTotal`                     | The total amount of swap space available on the system. 
Free Swap<br>`swapFree`                       | The total amount of swap space that is currently free.  

#### Shared Memory

Memory regions that can be shared between multiple processes.

Metric                                        | Description
----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------
Shared Memory<br>`shmem`                      | Total memory used for shared memory (e.g., SysV shared memory, POSIX shared memory, and tmpfs). 

#### Vmalloc (Kernel Virtual Memory)

Kernel's dynamically allocated virtual address space, not necessarily physical memory.

Metric                                        | Description
----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------
Vmalloc Largest Chunk<br>`vmallocChunk`       | The largest contiguous block of `vmalloc` space available.  
Vmalloc Total<br>`vmallocTotal`               | The total size of the `vmalloc` address space. `vmalloc` is used by the kernel to allocate contiguous *virtual* memory, which may not be contiguous *physical* memory.  
Vmalloc Used<br>`vmallocUsed`                 | The amount of `vmalloc` address space that is currently in use. 

#### Network File System (NFS) Specific

A specific metric for NFS clients.

Metric                                        | Description
----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------
NFS Unstable<br>`nFSUnstable`                 | Memory used by NFS clients for unstable pages. These are pages that have been written to the NFS server but not yet committed to stable storage.

## Additional information

:material-github: [Linux agent source code](https://github.com/infrasonar/linux-agent)