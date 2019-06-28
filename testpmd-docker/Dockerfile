FROM ubuntu:latest
RUN apt update -y
RUN apt-get install -y numactl 
WORKDIR /root
COPY dpdk-18.11 /root/dpdk/
COPY testpmd_start.sh /root
ENV PATH "$PATH:/root/dpdk/x86_64-native-linuxapp-gcc/app"
