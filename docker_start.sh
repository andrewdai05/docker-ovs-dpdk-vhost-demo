#!/bin/sh

export PKTGEN_VER=v3.4.9

sudo docker run -itd --privileged --name=pktgen-docker -v /mnt/huge_pktgen:/mnt/huge \
-v /usr/local/var/run/openvswitch:/var/run/openvswitch pktgen-docker:3.6.6

sudo docker run -itd --privileged --name=dpdk-docker -v /mnt/huge_dpdk:/mnt/huge \
-v /usr/local/var/run/openvswitch:/var/run/openvswitch dpdk-docker:18.11
