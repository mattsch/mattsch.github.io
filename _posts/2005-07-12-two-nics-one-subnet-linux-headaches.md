---
id: 197
title: Two NICS + One subnet + Linux = Headaches
date: 2005-07-12T00:47:23+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=197
permalink: /archives/2005/07/12/two-nics-one-subnet-linux-headaches
keywords:
  - ARP,Xen
categories:
  - Work
---
<a href="http://spg-kush.blogspot.com/">Meethune</a> (mostly) and I have been trying to wrap up the final bits of our new <a href="http://www.cl.cam.ac.uk/Research/SRG/netos/xen/">Xen</a> toy at the office, and had run into a roadblock on the networking end of things. We finally got it all figured out today and, seeing as he's beaten me to the punch,<a href="http://spg-kush.blogspot.com/2005/07/one-machine-two-nics-one-subnet.html">here's his writeup</a> 

Edit - More details:

Our goal for the server was twofold; familiarize ourselves with Xen and use Xen to allow us to more effectively test various software, servers, etc.  To this end, we did a fresh <a href="http://www.gentoo.org">Gentoo</a> install (sans nptl) and attempted to use a dual-NIC setup to segregate Xen/system net traffic.  We discovered very quickly that Linux (2.6.{11-12}) does not allow for two NICs on the same subnet out of the box.

Our first attempt(s) were complete failures resulting in no DHCP address and no pings for eth1 (second NIC) while eth0 functioned perfectly.  After a bit of digging using tcpdump, we found that the packets from eth1 simply weren't getting routed directly since the kernel was trying to push them all thru eth0.  Meethune did a bit of digging and re-discovered the <a href="http://developer.osdl.org/dev/iproute2/">iproute2</a> utility and more specifically the <a href="http://lartc.org/howto/lartc.rpdb.multiple-links.html#AEN268">Split Access</a> section of their How-To.

We were able to get eth1 to communicate with any of the machines on our LAN by using:
```shell
ip route add default via gateway.ip.address dev eth1 table XEN
ip rule add from eth1.ip.address table XEN
```

but every time we tried to get outside our net via eth1, tcpdump would show the machine completely bypassing our router and doing ARP requests directly.

I did a bit of digging into the kernel network parameters and found 'arp_filter'.  Basically, the kernel allows any interface on the system to reply to an ARP request for any interface on the system.  The logic (as stated in Documentation/networking/ip-sysctl.txt) is that since IP addresses are "owned by the complete host", this behaviour "increases the chance of successful communication".  I'm not sure I really agree with this, but I can't say I'm up on all the arguments and it doesn't matter here anyway.

In short, we added `net.ipv4.conf.default.arp_filter = 1` to /etc/sysctl.conf and we now have (hopefully) a fully functioning setup...
