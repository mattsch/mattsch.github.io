---
id: 173
title: RAID 5 via mdadm
date: 2005-03-23T12:16:08+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2005/03/23/raid-5-via-mdadm/
permalink: /archives/2005/03/23/raid-5-via-mdadm
keywords:
  - RAID,mdadm
categories:
  - Work
---
Finally got the SATA PCI cards (SIIG SC-SA4011) in at work today so I was able
to go ahead and build the new RAID array.

The first hurdle was to figure out what chipset the SATA cards use, but after
removing the SIIG sticker I found a nice
[SiI 3114](http://www.siliconimage.com/products/product.aspx?id=28) chip
which is well supported via the sata_sil 2.6x kernel module.  After enabling it
in the kernel (CONFIG_SCSI_SATA_SIL) along with SCSI disk support and rebooting
I got a nice trio of disc devices (/dev/sd[abc]) and was able to move on to
partitioning.

As I noted in my previous [Raid 1 post]({{ site.baseurl }}{% post_url
2005-03-14-mdadm-raid-1-migration %}), it's pretty essential to type the RAID
partitions as Linux raid autodetect ([cfdisk screenie](/images/cfdisk.png),
[cfdisk type screenie](/images/cfdisk_type.png)) so udev sets up the device
nodes correctly.  Other than that, just make sure you have at least three disks
with partitions of approx. the same size and you should be ok.  In my case I
just created one big partition on each of my three drives since this is their
only purpose in life...

All that needs to be done to create the array is run `mdadm --create /dev/md3 -l
5 -a --raid-devices=3 /dev/sd[abc]1` and you should see a new array being
reconstructed in /proc/mdstat...

