---
id: 47
title: DNS-SD and GnomeVFS
date: 2004-06-21T11:00:42+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2004/06/21/dns-sd-and-gnomevfs/
permalink: /archives/2004/06/21/dns-sd-and-gnomevfs
categories:
  - Projects
---
The new (2.7.2) version of <a href="http://developer.gnome.org/doc/API/gnome-vfs/">GnomeVFS</a> has added support for <a href="http://www.dns-sd.org/">DNS Service Discovery</a> for automagical discovery of <a href="http://www.gnomedesktop.org/article.php?sid=1841&mode=thread&order=0&thold=1">WebDAV and FTP</a> servers.  I'd never heard of this before, but after playing with it for just a bit the other night I'm sold.

DNS-SD is simply a way of using current DNS zone files to publish the various network services available to clients.  It's very simple in it's approach, but quite effective and fast.  Apparently our Mac friends have been using a similar approach for some time using mDNS (multicast DNS), but now the Gnome folks are bringing it to the PC market.  I'm looking forward to seeing the important <a href="http://www.dns-sd.org/ServiceTypes.html">services</a> integrated into GnomeVFS so all printers (IPP), network shares (NFS), etc will be just click away.  Think "Network Neighborhood" done right.

The setup for my network was quite easy.  I simply added a few zone files with the needed PTR entries and voila!  Desktop utopia is really not far off.