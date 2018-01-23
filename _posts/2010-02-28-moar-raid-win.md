---
id: 368
title: Moar RAID Win
date: 2010-02-28T21:31:22+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=368
permalink: /archives/2010/02/28/moar-raid-win
sent_to_laconica:
  - 'yes'
categories:
  - General
---
Had to upgrade my storage over the past week and decided to see just how good
Linux software raid (mdadm) and SATA hot plugging were these days.  The current
setup was a five disk array with two 1TB and three 750GB drives attached to an
ASUS M3A76-CM motherboard in AHCI mode.  My first issue was that all five drives
were attached internally so access would require mucking about in the case to
replace the three disks so I dug around and ended up purchasing a <a
href="http://www.amazon.com/gp/product/B00009ILU1?ie=UTF8&tag=excentral-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=B00009ILU1">Supermicro
CSE-M35T-1B</a> so I would be able to swap the disks out easily.

After getting the original drives shifted into the new rack, it was as easy as 1-2-3(ish) to replace the drives (with the filesystem live):

1. `mdadm /dev/md1 --fail $PARTITION --remove $PARTITION`
1. Replace disk, create partition
1. `mdadm /dev/md1 --add $PARTITION`, resync

Each resync after the replacement took 3-4 hrs and the fan in the rack kept the
disks no warmer than 32C.  After the final disk was done and synced, I expanded
the array to include the new space:

`mdadm --grow /dev/md1 --size=max`

Then let lvm know the new space was usable:

`pvresize /dev/md1`

And ran `vgdisplay` to see my extra ~940GB.

Gawd it's nice when stuff Just Works.
