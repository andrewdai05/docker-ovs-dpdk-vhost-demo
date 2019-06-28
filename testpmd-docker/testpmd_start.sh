#!/bin/sh

testpmd -c 0x380 -n 1 --socket-mem=1024,0 --file-prefix testpmd --no-pci \
--vdev 'net_virtio_user3,mac=00:00:00:00:00:03,path=/var/run/openvswitch/vhost-user3' \
--vdev 'net_virtio_user4,mac=00:00:00:00:00:04,path=/var/run/openvswitch/vhost-user4' \
-- -i --burst=64 --txd=2048 --rxd=2048 --auto-start --coremask=0x300
