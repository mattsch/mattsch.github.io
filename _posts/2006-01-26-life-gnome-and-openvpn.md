---
id: 237
title: Life, Gnome and OpenVPN
date: 2006-01-26T00:28:30+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=237
permalink: /archives/2006/01/26/life-gnome-and-openvpn
categories:
  - Life
---
It's been quite a while since I posted last, and a lot has been going on.  On the life front, I've been going through a month-long interview process for a really good job.  My first phone interview was about a week or two before Christmas, had another phone interview a few weeks later (on my birthday no less).  We scheduled an in-person interview for the following monday and they've been in decision mode since.  I should find out for sure by the end of the month but, since the job would involve moving at short notice, it's put a bit of stress on the family.

We've been shaking out the last few bugs with our new lab image at work.  We are gonna be scrapping the old dual-boot setup in favor of Linux with <a href="http://www.vmware.com/products/player/">VMPlayer</a> for other OS's.  If only there was a way to grab the $HOME variable to setup shared folders, I'd be in heaven... ;)

One of the cooler things I've done lately was to setup <a href="http://openvpn.net/">OpenVPN</a> to bridge my vpn'd clients with the wired network.  I came across an excellent <a href="http://blog.innerewut.de/articles/2005/07/04/openvpn-2-0-on-openbsd">how-to</a> and was able to follow that almost to the t, but I did have to add the tap devices to my list of trusted devices instead of the bridge.  Funny how it's the little differences in platforms can get ya...

A cool bonus to the bridging setup is multicasting.  Setting up <a href="http://www.mt-daapd.org/">mt-daapd</a> and watching all my music appear in <a href="http://www.rhythmbox.org/">Rhythmbox</a> automagically was just damn nice (<a href="/images/rb-daap.png">screenie</a>).  I'm using <a href="http://avahi.org/">Avahi</a> for my mDNS implementation and can also see my published ssh/sftp hosts in Nautilus...

<a href="http://www.gnome.org/">Gnome</a> released <a href="http://mail.gnome.org/archives/devel-announce-list/2006-January/msg00007.html">2.13.5</a> last week, and I've been working on the release for <a href="http://www.breakmygentoo.net">BMG</a> ever since it seems.  Several packages have moved to the new <a href="http://gstreamer.org/">GStreamer</a> and still others need the new <a href="http://www.freedesktop.org/Software/hal">HAL</a>.  That plus new <a href="http://www.galago-project.org/news/">notify stack</a> have kept a pretty steady stream of bugs and fixes (yay!) coming thru our bugtracker.  I've been trying to keep up, but there's been quite a bit of involvement from folks on the testing side so I'm still a bit behind.  It's been rather nice tho to have wider testing from folks willing to submit good reports and even quite a few patches.  If you're reading this on the BMG site, please keep those reports coming and I promise I'll keep plugging along on em... ;)