---
id: 282
title: virt-install
date: 2007-04-07T11:56:51+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2007/04/07/virt-install/
permalink: /archives/2007/04/07/virt-install
openid_comments:
  - 'a:1:{i:0;i:88461;}'
dsq_thread_id:
  - "6426266962"
categories:
  - Work
---
My favorite RHEL5 feature by far is the new 'virt-install' utility.  Being able to do a VM install by running:

```shell
virt-install -p --location=nfs:SOMESERVER:/PATH/TO/INSTALL/TREE --noautoconsole --file=/dev/LVM/VOLUME --name=FOO --ram=512 --vnc -x "ks=http://KSSERVER/KICKSTART.ks ip=IP netmask=NETMASK dns=DNS gateway=GW"
```

absolutely rocks.
