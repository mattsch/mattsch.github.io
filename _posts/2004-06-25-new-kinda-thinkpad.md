---
id: 48
title: New (kinda) ThinkPad
date: 2004-06-25T09:56:53+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2004/06/25/new-kinda-thinkpad/
permalink: /archives/2004/06/25/new-kinda-thinkpad
dsq_thread_id:
  - "6426266681"
categories:
  - Work
---
Finally replaced that old, overheating Dell Latitude C600 with a slightly faster and smaller <a href="http://www-1.ibm.com/support/docview.wss?rs=260&context=HWM48&q1=t21&uid=psg1MIGR-4PEJ5Q&loc=en_US&cs=utf-8&lang=en en">IBM ThinkPad T21</a>.  The Linux support this laptop has is pretty sweet overall and it seems to be a very solid little machine.

I made the mistake of using kernel ACPI for power managment from the start, but after a bit of <a href="http://www.google.com/search?hl=en&lr=&ie=UTF-8&q=thinkpad+t21+linux&btnG=Search">Googling</a> I ended up switching over to APM and everything worked with a minimum of further configuration.  Now the Hibernation mode on here did require a Fat32 partition with a special file created using the <a href="ftp://ftp.software.ibm.com/pc/pccbbs/mobiles/stndalhd.exe">utility</a> from IBM, but even that was as easy as booting from the floppy...

The sound does work, as do the multimedia buttons on the top of the keyboard.  The network card (e100 module) has worked with no problems including recovering from hibernation.  I haven't tried the modem yet, but I have a feeling it's gonna be pretty close to impossible get working.

The graphics chipset is some sort of mobile Savage4 that quite simply blows.  There's a 'savage' X.org driver, but the 2d performance is pretty horrible.  I switched over to the 'vesa' driver and gained a quite noticable speed improvement at the expense of the xv extensions... 
