#!/bin/sh

sudo /usr/local/share/openvswitch/scripts/ovs-ctl stop

sudo rm /var/log/openvswitch/vhost-ovs-vswitchd.log*

export PATH=$PATH:/usr/local/share/openvswitch/scripts

export DB_SOCK=/usr/local/var/run/openvswitch/db.sock

sudo ovsdb-server --remote=punix:/usr/local/var/run/openvswitch/db.sock \
                     --remote=db:Open_vSwitch,Open_vSwitch,manager_options \
                     --private-key=db:Open_vSwitch,SSL,private_key \
                     --certificate=db:Open_vSwitch,SSL,certificate \
                     --bootstrap-ca-cert=db:Open_vSwitch,SSL,ca_cert \
                     --pidfile --detach

sudo ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-init=true

sudo ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-lcore-mask=0x03

sudo ovs-vsctl --no-wait set Open_vSwitch . other_config:pmd-cpu-mask=0x0c0c

# sudo ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-socker-mem="1024,0"

sudo ovs-vswitchd --pidfile --detach --log-file=/var/log/openvswitch/vhost-ovs-vswitchd.log

sudo /usr/local/share/openvswitch/scripts/ovs-ctl --no-ovsdb-server --db-sock="$DB_SOCK" start
