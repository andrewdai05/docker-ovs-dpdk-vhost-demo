#!/bin/sh

sudo rm -rf /usr/local/etc/openvswitch

sudo rm -rf /usr/local/var/run/openvswitch

sudo rm -rf /var/log/openvswitch

sudo mkdir -p /usr/local/etc/openvswitch

sudo mkdir -p /usr/local/var/run/openvswitch

sudo mkdir -p /var/log/openvswitch

export PATH=$PATH:/usr/local/share/openvswitch/scripts

sudo ovsdb-tool create /usr/local/etc/openvswitch/conf.db openvswitch-2.11.1/vswitchd/vswitch.ovsschema

sudo modprobe openvswitch


