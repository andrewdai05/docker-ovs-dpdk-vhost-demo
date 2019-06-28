#!/bin/sh

sudo ovs-vsctl add-br ovs-br1 -- set bridge ovs-br1 datapath_type=netdev

sudo ovs-vsctl add-port ovs-br1 vhost-user1 -- set Interface vhost-user1 type=dpdkvhostuser

sudo ovs-vsctl add-port ovs-br1 vhost-user2 -- set Interface vhost-user2 type=dpdkvhostuser

sudo ovs-vsctl add-port ovs-br1 vhost-user3 -- set Interface vhost-user3 type=dpdkvhostuser

sudo ovs-vsctl add-port ovs-br1 vhost-user4 -- set Interface vhost-user4 type=dpdkvhostuser

sudo ovs-ofctl del-flows ovs-br1

sudo ovs-ofctl add-flow ovs-br1 in_port=2,dl_type=0x800,idle_timeout=0,action=output:3
sudo ovs-ofctl add-flow ovs-br1 in_port=3,dl_type=0x800,idle_timeout=0,action=output:2

sudo ovs-ofctl add-flow ovs-br1 in_port=1,dl_type=0x800,idle_timeout=0,action=output:4
sudo ovs-ofctl add-flow ovs-br1 in_port=4,dl_type=0x800,idle_timeout=0,action=output:1

sudo ovs-ofctl dump-flows ovs-br1

sudo ls -la /usr/local/var/run/openvswitch | grep vhost-user

