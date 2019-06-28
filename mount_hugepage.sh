#!/bin/sh

#sudo mkdir -p /dev/hugepages
#sudo mount -t hugetlbfs none /dev/hugepages
sudo mkdir -p /mnt/huge_dpdk
sudo mount -t hugetlbfs -o pagesize=1G none /mnt/huge_dpdk
sudo mkdir -p /mnt/huge_pktgen
sudo mount -t hugetlbfs -o pagesize=1G none /mnt/huge_pktgen
