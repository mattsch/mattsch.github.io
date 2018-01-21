---
id: 39
title: Compile Cluster
date: 2004-05-22T15:39:21+00:00
author: Matthew Schick
excerpt: |
  Now that I'm back in the blogging mode, I figured a quick rundown of how we (Jake and I) got this compile cluster up and running.
  
  We started with <a href="http://www.gentoo.org">Gentoo Linux</a> as our base and five 400 MHz celeron machines to power this beast...  One became the master node (Mutha) leaving four machines dedicated to compiling.  I looked at using livecd's for this but, because it's only real use at this point is for running <a href="http://distcc.samba.org/">distccd</a> and memory is a premium, an nfsroot setup seemed to be the best option.
layout: single
guid: http://www.excentral.org/archives/2004/05/22/compile-cluster/
permalink: /archives/2004/05/22/compile-cluster
categories:
  - Work
---
Now that I'm back in the blogging mode, I figured a quick rundown of how we
(Jake and I) got this compile cluster up and running is in order.

We started with <a href="http://www.gentoo.org">Gentoo Linux</a> as our base and
five 400 MHz celeron machines to power this beast...  One became the master node
(Mutha) leaving four machines dedicated to compiling.  I looked at using
livecd's for this but, because it's only real use at this point is for running
<a href="http://distcc.samba.org/">distccd</a> and memory is a premium, an
nfsroot setup seemed to be the best option.  Now there are plenty of <a
href="http://www.google.com/search?hl=en&lr=&ie=UTF-8&q=nfsroot+howto&btnG=Search">online
docs</a> that have a wealth of information, but their setup methods seem
outdated and/or a little odd IMHO.

In addition to a pretty normal base install on the master node (Mutha) we also
emerged dhcp, hpa-tftpd, ntpd and used <a
href="http://www.campin.net/syslog-ng/faq.html">syslog-ng</a> for our logger due
to it's network logging capabilities.  I've put all our config files <a
href="http://schick.mine.nu/portage/confs/">here</a> and will be referring to
specific files through out this post.

Our network cards don't have any kind of PXE boot option, so we got a cd ISO for
em from the <a href="http://www.etherboot.org">Etherboot</a> folks.  This
allowed us to setup the needed combination of dhcp (<a
href="http://schick.mine.nu/portage/confs/dhcp">/etc/conf.d/dhcp</a>,<a
href="http://schick.mine.nu/portage/confs/dhcpd.conf">/chroot/dhcp/etc/dhcp/dhcpd.conf</a>)
and tftp (<a
href="http://schick.mine.nu/portage/confs/in.tftpd">/etc/conf.d/in.tftpd</a>)
for the remote monolithic kernel download.  The only thing of note here is the
use of `use-host-decl-names on;` in dhcpd.conf to "push" the
client's host name at lease time since our writeable directories are mounted on
a per-host basis.

For our filesystem layout, we went with common root directory exported from
Mutha read-only.  Each node got it's own directory with an etc, var and tmp
subdirectory exported read/write (<a
href="http://schick.mine.nu/portage/confs/exports">/etc/exports</a>).  Now the
default Gentoo init scripts (v 1.9.0) will fail since the nfsmount script is
called so late in the boot sequence, so we had to massage things a bit to get
everything mounted in it's proper order and places.

First of all, we added a `RC_NFSROOT` variable to <a
href="http://schick.mine.nu/portage/confs/rc">/base/etc/conf.d/rc</a>,  then we
edited <a
href="http://schick.mine.nu/portage/confs/checkroot">/base/etc/init.d/checkroot</a>
to  bypass the root filesystem check and mount our machine-specific directories
if our variable is set.

Our syslog-ng setup was also pretty straightforward.  The master node also
serves as the logging machine (<a
href="http://schick.mine.nu/portage/confs/syslog-ng.conf">/etc/syslog-ng/syslog-ng.conf</a>)
and logs each of the client machines (<a
href="http://schick.mine.nu/portage/confs/syslog-ng.conf.clients">/nodes/pig_**/etc/syslog-ng.conf</a>)
into it's own file.

Before copying over our node directories, we did a chroot into our base
directory and made sure distccd, ntpd and syslog-ng were all set to start in the
default runlevel as well as setting up eth0 to use dhcp.

That's pretty much it in a nutshell...  Most packages compile on here slightly
faster than on my p4 1.8ghz work machine, so performance seems to be right on
target.  When <a href="http://www.oss-institute.org">OSSI</a> gets moved into
the new office space, we will be moving this cluster into their facilities and
hopfully adding between 10-15 more 500-600mhz machines.
