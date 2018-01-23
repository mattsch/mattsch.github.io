---
id: 500
title: Wi-Fi 3D Printer Prep
date: 2013-07-05T01:31:49+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=500
permalink: /archives/2013/07/05/wi-fi-3d-printer-prep
sent_to_laconica:
  - 'yes'
categories:
  - Projects
---
With the successful completion of the 3D printer build and the upcoming delivery
of our new [3D printer kit], I wanted to find a way to be able to print without
having to keep a full pc connected for the full print.  After some research I
found that while Printrun does have a [printrun web ui][web ui], it's pretty rough still
and a much better option (on the surface) seems to be <a
href="http://octoprint.org/">OctoPrint</a>.  It's not just an addon, but rather
a proper full web ui with gcode estimations, camera integration, and pretty
custom command support.  It also targets the always excellent <a
href="http://www.raspberrypi.org/">Raspberry Pi</a> which makes it pretty much
perfect for our needs.

I tried both <a href="http://pidora.ca/" title="Pidora">Pidora</a> and <a
href="http://www.raspbian.org/" title="Raspbian">Raspbian</a> and found the
latter much more to my liking.  Unfortunately Pidora insists on including all
the new "helpful" bits from the Fedora desktop builds (firewalld, network
manager, etc.) which make console setup more difficult and waste precious system
memory.

I did the initial setup steps without issue and edited the interfaces file
before popping the sdcard into the Pi and doing the initial boot.  Both wifi and
the serial console came up without issue and the official <a
href="https://github.com/foosel/OctoPrint/wiki/Setup-on-a-Raspberry-Pi-running-Raspbian"
title="OctoPrint Setup">OctoPrint how-to</a> is pretty straightforward.  The
only change I made was to install libyaml-dev so the python yaml library would
build against it instead of using it's python parser.  Not really sure if it
makes much difference, but seemed logical that using the library would be more
efficient. Since I had an old Logitech C310 camera, I also set up mjpg-streamer
and enabled integration with OctoPrint without issue. 

Added a few init scripts to start OctoPrint and mjpg-streamer, created and
mounted an nfs volume for logs and uploaded gcode, everything looks to be
working as expected.  Of course none of this matters if it doesn't actually
function with a real 3D printer, I'll be able to do some testing this weekend
with the Wake Robotics printers and hopefully it will all work as it should...

*Parts List*

* <a href="http://www.amazon.com/gp/product/B009SQQF9C/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B009SQQF9C&linkCode=as2&tag=excentral-20">Raspberry Pi Model B Revision 2.0 (512MB)</a>
* <a href="http://www.amazon.com/gp/product/B008AGDTA4/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B008AGDTA4&linkCode=as2&tag=excentral-20">PL2303HX USB to TTL to UART RS232 COM Cable module Converter</a>
* <a href="http://www.amazon.com/gp/product/B005P2BY5I/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B005P2BY5I&linkCode=as2&tag=excentral-20">Plugable USB 2.0 4 Port Hub and BC 1.1 Fast Charger with 2.5 Amp Power Adapter, charges Samsung Galaxy S4, iPhone 5, iPad 4, iPad Mini, Nexus 7</a>
* <a href="http://www.amazon.com/gp/product/B003VNKNEG/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B003VNKNEG&linkCode=as2&tag=excentral-20">Transcend 8 GB Class 10 SDHC Flash Memory Card (TS8GSDHC10E)</a>
* <a href="http://www.amazon.com/gp/product/B003LVZO8S/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B003LVZO8S&linkCode=as2&tag=excentral-20">Logitech HD Webcam C310</a>

[3D printer kit]: http://www.makerfarm.com/index.php/3d-printer-kits/prusa-i3-kit.html "Prusa I3 Kit"
[printrun web ui]: https://github.com/kliment/Printrun
