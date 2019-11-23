# ensure the dependencies are installed before 

# clone the repo of mTCP
git clone https://github.com/mtcp-stack/mtcp.git

cd mtcp

git submodule init
git submodule update

./setup_mtcp_dpdk_env.sh echo $PWD/dpdk

# now 15 to compile the x86_64-native-linuxapp-gcc version of dpdk
# now 18 install the igb_uio driver
# now 21 setup the hugepages
# now 24 to bind the ethernet port to igb_uio driver
# 35 quit the tool

_
# now dpdk0 will be the new interface cerated

ip link set dpdk0 up
# server will have 10.1.0.2/24 
# cient will have 10.1.0.1/24 
ip addr add 10.1.0.2/24 dev dpdk0
 

export RTE_SDK=`echo $PWD`/dpdk
export RTE_TARGET=x86_64-native-linuxapp-gcc

./configure --with-dpdk-lib=$RTE_SDK/$RTE_TARGET

make
# if make gives error then run this
# autoreconf -ivf and then again configure and make

# now mtcp setup is done now server and client applications have to be run 

# server application 


