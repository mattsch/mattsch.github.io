---
id: 264
title: Dapper and Madwifi
date: 2006-08-03T00:26:42+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2006/08/03/dapper-and-madwifi/
permalink: /archives/2006/08/03/dapper-and-madwifi
dsq_thread_id:
  - "6426266912"
categories:
  - General
---
My primary laptop's wireless card uses the Atheros chipset, so I've been
battling with the stock Madwifi drivers shipped with Dapper.  Using <a
href="http://www.gnome.org/projects/NetworkManager/">NetworkManager</a>, I get
those fscking connection lags while it scans.  Of course the newer <a
href="http://www.madwifi.org">Madwifi</a> drivers don't have those issues, and
they are shipped with Dapper.  However, wpasupplicant and NetworkManager have to
be tweaked and recompiled to make use of the new drivers.  I had been doing that
manually but it's a bit of a PITA the way I was approaching it.

I've been using the <a href="http://www.linux2go.dk/ubuntu/">linux2go repo</a>
for a while for their NetworkManager vpn plugins, but I realized tonight they
have madwifi-ng and wpasupplicant debs as well.  The really cool part is that
their setup uses some udev voodoo to load the new-ath-pci instead of ath-pci,
and adds the pci id's so new- works correctly.  All I had to do was add `'deb
http://www.linux2go.dk/ubuntu dapper main`' to /etc/apt/sources.list, run
'`apt-get update; apt-get upgrade; apt-get install madwifi-ng-default; modprobe
-r ath_pci; modprobe ath-pci'` and voila!

Kudos to linux2go!
