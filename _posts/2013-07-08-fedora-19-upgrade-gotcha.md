---
id: 514
title: Fedora 19 Upgrade Gotcha
date: 2013-07-08T14:52:44+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=514
permalink: /archives/2013/07/08/fedora-19-upgrade-gotcha
sent_to_laconica:
  - 'yes'
categories:
  - General
---
While updating my primary VM server at home, I ran into a problem where dracut failed to mount my partitions when it rebooted into the fedup environment.  Turns out dracut changed behavior from f18 > f19 and no longer automatically activates luks/raid/lvm devices at boot.  The <a href="https://bugzilla.redhat.com/show_bug.cgi?id=974000" title="Fedora Bug 974000">fix</a> is to edit /etc/default/grub and either add 'rd.auto=1' (no longer recommended) or the right combinations of rd.{md,dm,luks.lvm} params (what I did) and all will be well.  Hooray for changing defaults that break important stuffs!