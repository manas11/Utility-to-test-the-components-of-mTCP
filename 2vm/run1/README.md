this run was done with the following parameters : 
number of flows = 100
concurrency = 10
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



---------------------------------------------------------------------------------





Client side : 

Interfaces:
name: dpdk0, ifindex: 0, hwaddr: 08:00:27:4C:9D:37, ipaddr: 10.1.0.1, netmask: 255.255.255.0
Number of NIC queues: 1

Port 0 Link Up - speed 1000 Mbps - full-duplex


Thread 0 handles 100 flows. connecting to 10.1.0.2:80

[CPU 0] dpdk0 flows:     10, RX:      64(pps) (err:     0),  0.00(Gbps), TX:       1(pps),  0.00(Gbps)

[CPU 0] Completed 100 connections, errors: 0 incompletes: 0


