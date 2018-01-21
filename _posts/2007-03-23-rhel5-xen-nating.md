---
id: 276
title: "RHEL5 XEN nat'ing"
date: 2007-03-23T13:13:35+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2007/03/23/rhel5-xen-nating/
permalink: /archives/2007/03/23/rhel5-xen-nating
categories:
  - Work
---
Been playing with the new virt layer in RHEL5 and having a blast.  I did have to make some changes to get NAT to work with guest domains.  Nothing huge, just created a dummy network device and bridged to that instead of the normal eth0 as such -

/etc/sysconfig/network-scripts/ifcfg-dummy0:
```conf
# Dummy interface for Xen
DEVICE=dummy0
BOOTPROTO=none
ONBOOT=yes
USERCTL=no
IPV6INIT=no
PEERDNS=yes
TYPE=Ethernet
NETMASK=255.255.255.0
IPADDR=x.x.x.x
ARP=yes
```

/etc/xen/xend-config.sxp - changed `(network-script network-bridge)` to `(network-script 'network-bridge netdev=dummy0')`

I then enabled NAT for the interfaces -

/etc/sysctl.conf - changed `net.ipv4.ip_forward = 1` to `net.ipv4.ip_forward = 1` and ran `sysctl -p` to make the change live

Last step was doing the needful iptables setup.  Running `iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE` will setup the basics, you may also have to add a rule to allow the traffic on the dummy interface `iptables -I INPUT -i dummy+ -j ACCEPT`.  The '-I' is important with the default RHEL firewall as it is evaluated before the other rules.
