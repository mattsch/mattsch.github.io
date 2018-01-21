---
id: 168
title: mdadm RAID 1 Migration
date: 2005-03-14T15:29:20+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2005/03/14/mdadm-raid-1-migration/
permalink: /archives/2005/03/14/mdadm-raid-1-migration
tags:
  - Linux Gentoo RAID mdadm
keywords:
  - RAID,mdadm
dsq_thread_id:
  - "6426266782"
categories:
  - Work
---
I'm migrating our work server over to a complete RAID setup (software)  and
needed to find a way to migrate the system partitions over to RAID 1 with a
minimum of hassle.  I found [this
how-to](http://www.parisc-linux.org/faq/raidboot-howto.html) and was able to
follow most of it verbatim for my test run, but I thought I'd post the actual
steps I followed here for future reference.



I had a spare drive that exactly matched the drive currently in my office
machine ([Seagate
ST3200822A](http://www.seagate.com/cda/products/discsales/marketing/detail/0,1081,597,00.html)),
so I just did a `parted /dev/hda print` and copied the exact start/end of each
partiton over to the new drive. *Edit:* Make sure you set the 'Linux Raid' flag
on your partitions being used for the arrays.  At boot (or module insertion),
the kernel will automagically setup the arrays and needed devices making the
Gentoo init patch below completely un-needed.  Doh!

I then created a degraded RAID 1 array by running `mdadm --create /dev/md0
--level 1 --raid-devices=2 missing /dev/hdb5` and verified it had been setup
using `cat /proc/mdstat`. 

I created my xfs filesystem on the new array and mounted it on /mnt/tmp so I
could copy over my data from the live partition using `cd /home && tar cf - .|
tar -C /mnt/tmp -xf -` and grabbed a smoke while I waited for that to finish.

The final step in creating the array was to add the old partition to the new
array and rebuild it using `mdadm /dev/md0 -a /dev/hda5`.  The rebuilding
process took about 15 minutes for a 38G partition and a successful mount
verified all had gone well.

*Edit: Just make sure you have your array partitions marked as above and the
kernel md drivers do the rest...*

~~I decided to reboot to test that things had indeed gone as smoothly as I
thought and had a rude awakening.  I had forgotten to edit /etc/mdadm.conf and
add my arrays, so after a quick edit I tried rebooting again and watched in
horror as md0 was activated, but 1 and 2 failed.  Did a bit of digging on the
system and discovered that udev was creating the device nodes as /dev/md/x with
a symlink from /dev/mdx at activation.  mdadm has two issues with this
currently, the first being it won't activate an array from a scan if the device
node doesn't exist and the second is that the '--auto' param pukes (instead of
assuming it's setup already) if it sees a symlink.  I started to edit the
checkfs init script to correct the issue manually, but found a patch on the
[Gentoo bugzilla](http://bugs.gentoo.org/show_bug.cgi?id=80702) that
fixed everything...~~
