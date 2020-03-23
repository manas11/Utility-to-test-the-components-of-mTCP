
# Testing the components of mTCP
This project aims at making a utility to test the components of mTCP, such as TCP congestion control algorithms, ECN, etc. using network namespaces and VMs.

## Description about the included directories 
The directories contain the steps to setup mTCP and run epserver and epwget, mTCP-epoll based applications. Along with this, the screenshots of the output are also included.

### Contents : 

 - 2vm: Applications run on two different VMs, with epserver on one VM and epwget on the other VM.
 - onvm: Using **OpenNetVM**, an **NFV**( Network Function Virtualization), the two applications were run on the same VM using the ports generated by the ONVM. 

Inside these directories, there is a README file that contains the steps to be followed to set up and run the applications. The test runs mentioned as run1, run2, etc . are included in subsequent directories.
## References 

 - [mTCP GitHub Repository](https://github.com/mtcp-stack/mtcp)
 - [mTCP paper](https://www.usenix.org/system/files/conference/nsdi14/nsdi14-paper-jeong.pdf)
 - [OpenNetVM GitHub repository](https://github.com/sdnfv/openNetVM)
 - [OpenNetVM paper](https://faculty.cs.gwu.edu/timwood/papers/16-HotMiddlebox-onvm.pdf)
 - [More details about working of OpenNetVM](http://sdnfv.github.io/onvm/)

