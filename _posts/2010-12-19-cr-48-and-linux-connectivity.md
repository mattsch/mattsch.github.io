---
id: 419
title: CR-48 and Linux Connectivity
date: 2010-12-19T16:42:26+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=419
permalink: /archives/2010/12/19/cr-48-and-linux-connectivity
sent_to_laconica:
  - 'yes'
openid_comments:
  - 'a:1:{i:0;s:5:"97607";}'
dsq_thread_id:
  - "6426267012"
categories:
  - Life
---
Was one of the luck ones that got a not-so-shiny (matte black actually) ChromeOS
netbook from Google this past Friday.  The only thing I'll say here about
ChromeOS is that it's exactly what you'd expect from a browser-based
environment.

With the specs on the netbook, my second task (after playing with ChromeOS) was
to get a proper full OS installed.  Following the instructions on the [chromium
wiki] was pretty boring and worked perfectly.  My first install was Meego
which, tho very fast, didn't have nearly the application choices I wanted so I
moved on to Ubuntu Netbook Remix.

After the initial configuration I noticed a few rather crucial kernel modules
missing from the chrome kernel; namely ppp* and tun.  Without those there was no
chance at either VPN or mobile broadband usage which limits the usefulness
pretty drastically in my case.  Luckily the chromium developer docs are pretty
easy to follow and I was able to build the needed modules after determining
which board (x86-mario) I was building for.  ~~Here's~~ my working result, built
against kernel 2.6.32.23+drm33.10 (chromeos version 0.9.128.12 beta).  Dropped
those in the proper directory, ran depmod -a and now have working vpn (cisco
vpnc and openvpn) as well as the built-in verizon broadband.

Quick aside, the broadband is a bit tweaky and has a few caveats.  The module
doesn't seem to reinit proper after a suspend/resume cycle and you have to
enable within Chrome before it'll work on the Linux side.  I might get around to
tracking those down at some point, but I think my next task will be trying to
get the touchpad working with all the multi-finger goodness.

[chromium wiki]: https://sites.google.com/a/chromium.org/dev/chromium-os/developer-information-for-chrome-os-devices/cr-48-chrome-notebook-developer-information/how-to-boot-ubuntu-on-a-cr-48
