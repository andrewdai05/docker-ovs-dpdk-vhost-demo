#!/bin/sh

cd ~/pktgen

./app/x86_64-native-linuxapp-gcc/pktgen -c 0x70 --master-lcore 4 -n 1 --file-prefix pktgen --no-pci \
--vdev 'net_virtio_user1,mac=00:00:00:00:00:01,path=/var/run/openvswitch/vhost-user1' \
--vdev 'net_virtio_user2,mac=00:00:00:00:00:02,path=/var/run/openvswitch/vhost-user2' \
-- -T -P -m "5.0,6.1"

