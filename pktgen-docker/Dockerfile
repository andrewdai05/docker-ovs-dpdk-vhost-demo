FROM ubuntu:latest
RUN apt update -y
RUN apt-get install -y numactl libpcap-dev vim 
WORKDIR /root/pktgen
COPY pktgen-3.6.6 /root/pktgen
COPY dpdk-18.11 /root/dpdk
COPY pktgen_start.sh /root/pktgen
RUN ln -s /root/pktgen/app/x86_64-native-linuxapp-gcc/pktgen /usr/bin/pktgen
RUN ln -s /usr/lib/x86_64-linux-gnu/libpcap.so /usr/lib/x86_64-linux-gnu/libpcap.so.1
