---
id: 488
title: Playing with the Odroid-U2
date: 2013-05-11T20:50:38+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=488
permalink: /archives/2013/05/11/playing-with-the-odroid-u2
sent_to_laconica:
  - 'yes'
dsq_thread_id:
  - "6426262533"
categories:
  - Projects
---
Picked up one of Hardkernel's <a href="http://www.hardkernel.com/renewal_2011/products/prdt_info.php" title="Odroid-U2" target="_blank">Odroid-U2</a> dev boxes, figured a quad-core arm box for less than $100 shipped was worth kicking around a bit.  After a week-ish of playing with it I thought it worth posting my findings with various OS variants.  For reference, I am using <a href="http://www.amazon.com/gp/product/B0058GH4U0/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B0058GH4U0&linkCode=as2&tag=excentral-20" target="_blank">Class 10 microSDHC</a> cards (anything less is painfully slow) and a wired connection while I wait on my USB wifi dongle to show up.

I don't really have a specific use case for the box, but the main categories I'm poking at are media playback (using <a href="http://forum.xbmc.org/showthread.php?tid=152005" title="XBMC libstagefright builds">XBMC</a>, Plex, Netflix), gaming, and general web/app usage.  One big downside for general usage across all the Android builds is that the user interface is only moderately okay if you're not using a touch screen.  Swiping through pages is great using fingers, not so much via a normal mouse...

<strong>Stock Android</strong>
The first thing I tried was the latest official Android build (dated 25th April, 2013).  It's using version 4.1.2_r1 as it's base with some custom bits as follows:
<ul>
	<li>Right mouse click as the back button</li>
	<li>Power button on the navigation bar</li>
	<li>No status bar</li>
	<li>Mounts SD card as internal storage</li>
	<li>Working(-ish) USB bluetooth support</li>
</ul>
Overall it's a very solid build, however trying to use Netflix or Plex to view videos resulted in a black screen with audio.  According to the official forums, it's a known issue with their 4.1 builds and their advice is to revert back to the 4.0.* based builds instead.  I didn't try going that route since I already had my eye on the CM nightlies.  Running XBMC was generally okay here but the UI lagged and there were some visual glitches during playback (mostly menu overlays).  Although my cheap BT dongle was seen and I was able to pair my phone with the Odroid, I couldn't ever get my Moga gaming controller to pair properly so I couldn't do any real game testing.  I'm assuming this was more to do with the dongle and not the build since I saw folks on the forums able to use BT controllers without issues.

<strong>CyanogenMod</strong>
My next try with Android was <a href="http://www.cyanogenmod.org/" title="CyanogenMod">CyanogenMod</a> <a href="http://get.cm/?device=odroidu2" title="Latest Builds">nightlies</a>.  It's based on version 4.2.2 and is overall a better option (IMO) than stock.  Media playback Just Works, had no issues with Netflix, Plex was able to do playback of some high bitrate 1080p h264 streams without any glitches.  XBMC here has been almost flawless with only minor hiccups during playback.  This is certainly the faster of the two Android builds, and the kernel allows overclocking to 2Ghz to give it a boost if you're so inclined (I wasn't).  However, there are a few gotchas involved through the install and usage.

First, the procedures outlined on the <a href="http://wiki.cyanogenmod.org/w/Install_CM_for_odroidu2">CM wiki</a> to install weren't entirely complete.  After installing the initial image as directed I was unable to reboot into recovery mode.  Took a bit of digging, but I grabbed the odroidu2-recovery.zip file they list for the windows install instructions and unzip'd to the root of the vfat partition before rebooting.  This seems to only be needed for the initial install, subsequent reboot-to-recovery attempts from an installed CM nightly worked just like it should.

The next big gotcha was with the way CM mounts the sd card.  It's fstab file is setup to treat the eMMC card as the internal sd and the micro sd as external which is great if you're using eMMC, not so much if you aren't.  Fixing it requires editing /system/etc/vold.fstab and swapping the entries, I've got a copy <a href="http://www.excentral.org/files/vold.fstab">here</a> you can just copy over to fix things. You'll have to do that after each update since the file is replaced during the flash.

The last thing worth mentioning isn't really a problem but, since the CM build treats this as a tablet and stays close to ASOP, you get the normal tablet interface.  So you'll need to grab your own power widgets (I use secure settings) and deal with the normal status navigation bar.  For the latter I just set up a tasker profile to enable the "Expanded Desktop" option (via secure settings) when XBMC is running to get true full screen.

<strong>Linux</strong>
For this I used the <a href="http://forum.odroid.com/viewtopic.php?f=8&t=1102" title="Ubuntu Fully Loaded">Ubuntu 12.11 Fully Loaded</a> community image from the odroid forums.  It's a great image with several full desktop environments to chose from, very fast and usable.  Using it out of the box on a TV screen requires tweaking DPI or font sizes to be able to read anything, but once that's done it's pretty straightforward.  The only thing really worth mentioning as a downside is viewing YouTube videos in the Chromium browser is painful since there's no hardware acceleration of the webm codec.  Using Firefox with the provided greasemonkey scripts will allow you to chose the h264 versions of the videos which do work at up to 1080p res without issue.

I think you could use this as a desktop replacement as long as you kept your home directory on either a secondary device (USB drive?) or NFS volume, but flashing wipes EVERYTHING so you wouldn't want to keep a local home directory.  The image also includes various emulators and games, but I haven't had a chance to try those so I can't speak to how those worked.

In summary, this little beast draws almost no power and has enough horsepower to do quite a bit.  I'm looking forward to support maturing in Android and Linux to take full advantage of the hw, but the potential for usage here is huge.