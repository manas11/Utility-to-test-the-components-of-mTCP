

# Setup instructions for running epserver and epwget applications on 2 VMs

#### Before following the steps make sure the following dependencies are installed : 

 - git, build-essentials
 - libnuma-dev
 - iproute2
 - libpthread-stubs0-dev
 - libdpdk-dev
 -  libgmp-dev
 
#### Compiling OpenNetVM driver requires kernel headers.
-   For Debian/Ubuntu, try  `apt-get install linux-headers-$(uname -r)`
#### Also make sure the in the VM settings that the network adapter is in this list of supported NICs by DPDK  [supported devices](https://core.dpdk.org/supported/).
#### The subsequent steps have to be followed on both of the VMs.

 ## Installation guide
1. clone repo of mTCP
    ```
    git clone https://github.com/mtcp-stack/mtcp.git
    ```
2. enter the mTCP directory
    ```
    cd mtcp
    ```
3. Now get the dpdk submodule
    ```
    git submodule init
    git submodule update 
    ```

4. Setup dpdk by running this predefined script.
    ```
    ./setup_mtcp_dpdk_env.sh `echo $PWD`/dpdk
    ```

    Follow these steps now.
    - [15] to compile the x86_64-native-linuxapp-gcc version of dpdk
    - [18] to install the igb_uio driver
    - [21] to set up the hugepages, 2048 2MB hugepages are enough
    - [24] to bind the ethernet port that supported by dpdk to igb_uio driver. Enter the PCI address of that device after selecting this option.
    - [35] Quit the tool now.

5.  the script will create interfaces for the corresponding devices that were bounded to the igb_uio driver. The interfaces are created as dpdk0, dpdk1, etc. for intel NICs.
6.  Now bring these interfaces up and assign ip address to them.
     Note : For our setup we had given client(epwget) IP address as 10.1.0.1/24 and server(epserver) as 10.1.0.2/24
    For client VM,
    ``` 
    ip link set dpdk0 up
    ip addr add 10.1.0.1/24 dev dpdk0
    ```
    
    For server VM,
    
    ``` 
    ip link set dpdk0 up
    ip addr add 10.1.0.2/24 dev dpdk0
    ```
7. Set the environment variables RTE_SDK and RTE_TARGET for dpdk. You can specify your dpdk directory path if the dpdk directory is not to be used.
    ```
    export RTE_SDK=`echo $PWD`/dpdk
    export RTE_TARGET=x86_64-native-linuxapp-gcc
    ```        
8.  Setup the mTCP library using these commands. 
    ```
    ./configure --with-dpdk-lib=$RTE_SDK/$RTE_TARGET
    make
    ```
    Note: If the above two commands prompt an error, then run this command and then repeat step 8 again.
    ```
    autoreconf -ivf
    ```
9.  Now the mTCP setup is completed, follow the subsequent steps to run the applications.

## 1. epserver Server VM steps 
Follow these steps: 
1. Enter the apps/example directory to find the epserver application.
    ``` 
    cd apps/example
    ```
2. Now edit the configurations of epserver by editing the epserver.conf file. The configuration file has the following parameters that can be changed
    - io - dpdk, this will be dpdk as we are using dpdk submodule 
    - num_cores, this specifies the number of cores.
    - port, dpdk0 as the port to run the application on.
    - cc, for determining the congestion control algorithm, this could be reno, cubic
    - max_concurrency, Maximum concurrency per core 
    - rcvbuf, for specifying the receiver buffer size of sockets, 8192 default
    - sndbuf, for determining the sender buffer size of sockets, 8192 default 

 Take a look at this README for these examples from the mTCP GitHub repository [README](https://github.com/mtcp-stack/mtcp/blob/master/apps/example/README) for more details. 

3. Create a directory that is to be hosted on the mTCP epoll based server. Inside this directory put file, which is to be requested by the client. 
4. Run the epserver application. 
    ```
    ./epserver -p www -f epserver.conf -N 2

    ```



## 2. epwget Client VM steps

Follow these steps: 
1. Enter the apps/example directory to find the epwget application.
    ``` 
    cd apps/example
    ```
2. Now edit the configurations of epwget by editing the epwget.conf file. The configuration file has the following parameters that can be changed
    - io - dpdk , this will be dpdk as we are using dpdk submodule 
    - num_cores, this specifes the number of cores.
    - port, dpdk0 as the port to run application on.
    - cc, for specifying the congestion control algorithm, this could be reno, cubic
    - max_concurrency, Maximum concurrency per core 
    - rcvbuf, for specifying the receiver buffer size of sockets, 8192 default
    - sndbuf, for specifying the sender buffer size of sockets, 8192 default 

 Take a look at this README for these examples from the mTCP GitHub repository [README](https://github.com/mtcp-stack/mtcp/blob/master/apps/example/README) for more details. 


3. Run the epserver application. 
    ```
    ./epwget 10.1.0.2/q.html 100  -N 1 -c 10  -f epwget.conf

    ```
