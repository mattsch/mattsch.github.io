---
id: 296
title: Xen and vlans
date: 2008-07-07T13:11:41+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=296
permalink: /archives/2008/07/07/xen-and-vlans
dsq_thread_id:
  - "6426266974"
categories:
  - Work
---
During a big lab move at <a href="http://www.redhat.com">work</a> a few months ago, we decided that our utility virt server needed VLAN support.  The dhcp vm needed interfaces on three different networks and it seemed rather silly to add extra physical interface for the minimal traffic generated. 

The first issue we encountered was the rather interesting bridging script installed by default.  It does wonders for being able to bridge the primary interface and can be used to bridge multiple interface, but it fails entirely for VLAN interfaces.  Best bet is just to disable any network scripts in /etc/xen/xend-config.sxp and let the os handle it.  We're using RHEL5, so we created the VLAN interface along with the bridge using the normal configs in /etc/sysconfig/network-scripts.  Our naming scheme for the devices was ${DEVICE_TYPE}{$VLAN_NUMBER}.conf.

Example vlan123.conf:
```conf
DEVICE=vlan123
VLAN=yes
VLAN_NAME_TYPE=VLAN_PLUS_VID_NO_PAD
PHYSDEV=eth1
BOOTPROTO=static
ONBOOT=yes
BRIDGE=xenbr123
```

As you can see, eth1 is the physical interface connected to the switch port tagged with the vlans.  We added the 'VLAN_PLUS_VID_NO_PAD' param to use the vlan${NUMBER} scheme.  We aren't bringing the interface up with an ip as it's gonna be part of a bridge.

xenbr123.conf:
```conf
DEVICE=xenbr123
TYPE=Bridge
BOOTPROTO=static
ONBOOT=yes
```

This brings up our bridge without an ip address.  The dom0 doesn't need an ip on this VLAN, so no point in enabling it.  To use the bridge in your domu's, just specify the interface in the config file (or at creation time).

Example domu def file with multiple interfaces:
```conf
name = "example"
uuid = "62e4f71f-a46c-25f7-e947-f161aaad6f00"
maxmem = 512
memory = 512
vcpus = 1
bootloader = "/usr/bin/pygrub"
on_poweroff = "destroy"
on_reboot = "restart"
on_crash = "restart"
vfb = [  ]
disk = [ "phy:/dev/vm/example,xvda,w" ]
vif = [ "mac=00:16:3e:4b:a5:46,bridge=xenbr123", "mac=00:16:3e:4b:a5:4a,bridge=xenbr456", mac=00:16:3e:4b:a5:47,bridge=xenbr789"]
```

The above was pretty straightforward, but after putting it in place we ran into a very odd issue.  The vm's couldn't actually communicate via the vlan'd interfaces.  After a bit of tcpdumping we discovered the default firewall was allowing outbound traffic on the bridge, but incoming was getting rejected.  Easy fix was to add the following lines to /etc/sysconfig/iptables:

```conf
-A RH-Firewall-1-INPUT -i xenbr+ -j ACCEPT 
-A RH-Firewall-1-INPUT -o xenbr+ -j ACCEPT 
```

Note that this allows **all** traffic to pass on **all** xenbr devices.  Since the dom0 doesn't have an ip bound it's not an issue in our configuration since the only traffic on the bridges are for the domu's.  If you do use the devices in your dom0, you'll need to adjust the firewall accordingly or you'll end up with a gaping hole in your security scheme.
