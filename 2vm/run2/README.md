this run was done with the following parameters : 
number of flows = 10000
concurrency = 100
number of cores = 1
send and receiver buffer size : 8192


Outputs : 


Server side : 


Configurations:
Number of CPU cores available: 1
Number of CPU cores to use: 1
Maximum number of concurrency per core: 10000
Maximum number of preallocated buffers per core: 10000
Receive buffer size: 8192
Send buffer size: 8192
TCP timeout seconds: 30
TCP timewait seconds: 0

Interfaces:
name: dpdk0, ifindex: 0, hwaddr: 08:00:27:7E:D0:8A, ipaddr: 10.1.0.2, netmask: 255.255.255.0
Number of NIC queues: 1

Port 0 Link Up - speed 1000 Mbps - full-duplex
CPU 0: initialization finished.

----------------------------------------------------------------------------
```

[CPU 0] dpdk0 flows:    100, RX:    9748(pps) (err:     0),  0.01(Gbps), TX:   25191(pps),  0.29(Gbps)
[ ALL ] dpdk0 flows:    100, RX:    9748(pps) (err:     0),  0.01(Gbps), TX:   25191(pps),  0.29(Gbps)
[CPU 0] dpdk0 flows:    100, RX:   52734(pps) (err:     0),  0.04(Gbps), TX:  146816(pps),  1.71(Gbps)
[CPU 0] dpdk0 flows:    100, RX:   49558(pps) (err:     0),  0.04(Gbps), TX:  140545(pps),  1.64(Gbps)
[CPU 0] dpdk0 flows:    107, RX:   52245(pps) (err:     0),  0.04(Gbps), TX:  146927(pps),  1.71(Gbps)
[CPU 0] dpdk0 flows:    100, RX:   54114(pps) (err:     0),  0.04(Gbps), TX:  148100(pps),  1.72(Gbps)
[CPU 0] dpdk0 flows:    100, RX:   53089(pps) (err:     0),  0.04(Gbps), TX:  151651(pps),  1.77(Gbps)
```

Client side : 



Response size set to 109240
```
[ ALL ] connect:    1849, read:  186 MB, write:    0 MB, completes:    1749 (resp_time avg: 54169, max:  94715 us)
[CPU 0] dpdk0 flows:    100, RX:  146877(pps) (err:     0),  1.69(Gbps), TX:   52783(pps),  0.04(Gbps)
[ ALL ] dpdk0 flows:    100, RX:  146877(pps) (err:     0),  1.69(Gbps), TX:   52783(pps),  0.04(Gbps)

[ ALL ] connect:    1750, read:  181 MB, write:    0 MB, completes:    1750 (resp_time avg: 55506, max: 558936 us)
[CPU 0] dpdk0 flows:    100, RX:  139559(pps) (err:     0),  1.62(Gbps), TX:   49227(pps),  0.04(Gbps)
[ ALL ] dpdk0 flows:    100, RX:  139559(pps) (err:     0),  1.62(Gbps), TX:   49227(pps),  0.04(Gbps)
[ ALL ] connect:    1824, read:  190 MB, write:    0 MB, completes:    1824 (resp_time avg: 55221, max: 1060423 us)
[CPU 0] dpdk0 flows:    100, RX:  146232(pps) (err:     0),  1.70(Gbps), TX:   51750(pps),  0.04(Gbps)
[ ALL ] dpdk0 flows:    100, RX:  146232(pps) (err:     0),  1.70(Gbps), TX:   51750(pps),  0.04(Gbps)
[ ALL ] connect:    1869, read:  195 MB, write:    0 MB, completes:    1869 (resp_time avg: 53721, max: 555864 us)
[CPU 0] dpdk0 flows:    100, RX:  150565(pps) (err:     0),  1.75(Gbps), TX:   54439(pps),  0.04(Gbps)
[ ALL ] dpdk0 flows:    100, RX:  150565(pps) (err:     0),  1.75(Gbps), TX:   54439(pps),  0.04(Gbps)
[ ALL ] connect:    1889, read:  196 MB, write:    0 MB, completes:    1889 (resp_time avg: 52483, max: 555658 us)
[CPU 0] dpdk0 flows:    100, RX:  150944(pps) (err:     0),  1.75(Gbps), TX:   52643(pps),  0.04(Gbps)
[ ALL ] dpdk0 flows:    100, RX:  150944(pps) (err:     0),  1.75(Gbps), TX:   52643(pps),  0.04(Gbps)
[CPU 0] Completed 10000 connections, errors: 0 incompletes: 0
```



