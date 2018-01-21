---
id: 167
title: RAID in Linux
date: 2005-03-14T13:50:34+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2005/03/14/raid-in-linux/
permalink: /archives/2005/03/14/raid-in-linux
tags:
  - Linux RAID
keywords:
  - RAID
dsq_thread_id:
  - "6426266749"
categories:
  - Projects
---
I've had a few different folks asking me about the various approaches  for setting up software <a href="http://www.webopedia.com/TERM/R/RAID.html">RAID arrays</a> in Linux, so I figured it would be a good time to post the differing methods I'm familiar along with their pros and cons.


<a href="http://evms.sourceforge.net">Enterprise Volume Management (EVMS)</a>: More of an all-in-one approach to disk management in Linux.  It's got some killer features like <a href="http://evms.sourceforge.net/user_guide/#evmscreatedrivelinking">Drivelinking</a>, and if you are building a RAID system from scratch it's one of the easier approaches.  However, the user interface is quite counter-intuitive IMHO and the official documentation is a bit confusing.  I use EVMS on my home server for my data storage drives and have built arrays (1 and 5) from scratch using it, but was unable to create degraded RAID 1 arrays and add a partition.

<a href="http://cgi.cse.unsw.edu.au/~neilb/mdadm">mdadm</a>: Nifty command line tool for working with RAID arrays.  I have only built a few RAID 1 arrays with this tool, but was able to create degraded arrays and add partitions without issue making migration from a non-RAID system a breeze.  There were a few minor gotchas with this on my 2.6 kernel system using udev, but those I'll detail in another post.  In contrast to EVMS, mdadm only concerns it's self with building, maintaining and monitoring sofware RAID arrays and it does it quite well.  Two bits up! ;)

<a href="http://people.redhat.com/mingo/raidtools/">raidtools</a>: The venerable granddaddy of software RAID.  I've only tried this approach out once or twice and was able to get a working array, but I've found the mdadm approach to be a bit more intuitive.