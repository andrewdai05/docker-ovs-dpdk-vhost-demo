#!/bin/sh

./ovs_reset.sh

./ovs_start.sh

./port_setup.sh

./docker_start.sh

sudo docker ps -a


