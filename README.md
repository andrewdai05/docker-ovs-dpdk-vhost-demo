# docker-ovs-dpdk-vhost-demo

In this repository, I build a simple NFV platform using two Docker containers, i.e., `pktgen` and `testpmd`, which are connected using `vhost-user` provided by `OVS-DPDK`.

## Version Setting

* `DPDK`: 18.11
* `OVS`: 2.11.1
* `pktgen-dpdk`: 3.6.6
* `testpmd`: with `DPDK` 18.11

## The structure of this repository

* `ovs_reset.sh`: this file is clean the stale version of OVS.

---
**Note**

Need to change the generation of `conf.db`, if you are not using `OVS-2.11.1`.

---

* `ovs_start.h`: this file starts OVS with DPDK setting. The prerequisites are:
   * Compile `DPDK` code
   * Compile `OVS` code with `--with-dpdk=$RTE_SDK/$RTE_TARGET`

---
**Note**

`other_config:dpdk-init=true` is a must. 

`dpdk-lcore-mask=0x03` may be in another form if using a old release of `OVS`.

`other_config:pmd-cpu-mask=0x0c0c` are recommended, because this is closely related to the throughput between two containers.

---

* `port_setup.sh`: this file sets up the ports and routes.

* `docker_start.sh`: start up two docker containers.

* `pktgen_start.sh` & `testpmd_start.sh` : enter into two docker containers.

* `allinone.sh`: continuously execute `ovs_reset.sh`, `ovs_start.sh`, `port_setup.sh`, `docker_start.sh` scripts.

* folder `pktgen-docker`: container build files for `pktgen` docker.

---
**Note**

The code of `pktgen-3.6.6` has changed. So I upload the folder not zip file. If you use the original code of `pktgen-3.6.6`, you will have a strange error about the socket of lcore.

---

* folder `testpmd-docker`: container build files for `testpmd` docker.