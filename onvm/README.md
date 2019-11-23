#make sure the dependencies are installed before 

# first setup onvm by following these steps

git clone https://github.com/sdnfv/openNetVM.git

cd openNetVM


# go back to the previous commit when because of the parameter conflict

git reset --hard a003a406fca043388205f9c45f86895be81f798d
20941c625a27f9ececf38832138d33c50cc32152

#this is the correct commit id
c022e8246fd2ae7ee1108d993e99f6c805f1c4ef


git submodule sync

git submodule update --init

echo export ONVM_HOME=$(pwd) >> ~/.bashrc


cd dpdk


echo export RTE_SDK=$(pwd) >> ~/.bashrc


echo export RTE_TARGET=x86_64-native-linuxapp-gcc  >> ~/.bashrc

cd ..

	echo export ONVM_NUM_HUGEPAGES=1024 >> ~/.bashrc

	export ONVM_NIC_PCI="00:08.0 00:09.0"

source ~/.bashrc

 sudo sh -c "echo 0 > /proc/sys/kernel/randomize_va_space"

	./scripts/install.sh

cd onvm 

make
cd ..

# now run the network manager of openNetVM before running any mtcp application 
./onvm/go.sh 1,2,3 1 -s stdout



# install the dependencies of the mtcp before
# start with the mtcp installation 
git clone https://github.com/mtcp-stack/mtcp.git

cd mtcp

git submodule init
git submodule update

#Set up the dpdk interfaces
```
./setup_mtcp_onvm_env.sh

```

# this will create dpdk0 and dpdk1 interface 


# interface for server
ip link set dpdk0 up
ip addr add 10.3.1.1/24 dev dpdk0

#interface for client
ip link set dpdk0 up
ip addr add 10.3.1.2/24 dev dpdk1


# now configure mtcp
./configure --with-dpdk-lib=$RTE_SDK/$RTE_TARGET --with-onvm-lib=`echo $ONVM_HOME`/onvm
make

# if make gives error use autoreconf -ivf then configure and make again
# here error of parameter 


