---
id: 535
title: Adventures in CEC
date: 2013-08-23T15:30:18+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=535
permalink: /archives/2013/08/23/adventures-in-cec
sent_to_laconica:
  - 'yes'
openid_comments:
  - 'a:1:{i:0;i:97758;}'
categories:
  - General
---
Our trusty Harmony 880 has decided to start a somewhat rapid plunge into non-usefulness, started with the light no longer coming on when picked up and buttons are taking progressively more pressure to register.  Gotten some good years from this remote and generally good experiences from the Harmony line, but with CEC becoming more prevalent I decided to see if I could forego buying another expensive remote and instead use a "standard" route.  It almost, kinda works.

First thing is that all of my hardware is at least a few years old, with the TV being a 2009 model.  LG and Onkyo have their own branded CEC implementations (Simplink and RIHD respectively), and neither of em are complete.  For XBMC, I used the <a href="http://www.amazon.com/gp/product/B005JU6LWM/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B005JU6LWM&linkCode=as2&tag=excentral-20">Pulse Eight USB-CEC adapter</a> which plugs in to both the USB port on the PC as well as inline on the HDMI output.

<strong>Hardware in play:</strong>
<ul>
	<li>TV - LG 42LH40</li>
	<li>Receiver - Onkyo TX-SR608</li>
	<li>XBMC - Acer Revo 3700</li>
	<li>Gaming/Streaming Video - PS3</li>
</ul>

<strong>The Good:</strong>
<ul>
	<li>XBMC is seen by and talks to both my TV and receiver without issue.</li>
	<li>I can control the volume on my receiver from XBMC (meaning I can use Yatse on my Android devices).</li>
	<li>Powering XBMC on and resuming from suspend (WOL FTW!) turns the receiver and TV on.  Same for the PS3.</li>
	<li>Powering off <em>the TV</em> turns everything else off.</li>
	<li>Everything can be controlled from my Onkyo remote, XBMC and PS3 via CEC commands.</li>

</ul>

<strong>The Bad:</strong>
<ul>
	<li>Powering XBMC, PS3, or Receiver down doesn't turn off the TV.  Saw some reports that LG doesn't (didn't?) implement the power off function.</li>
	<li>XBMC control via CEC is somewhat limited, the Onkyo remote implements all the basics and a few extras for a total of roughly 28 commands (including numbers).  Not really bad for a universal type remote, but the Harmony has me spoiled here.</li>
	<li>Related to above, since the Onkyo remote is universal, the button labels don't always make much sense.  Confusing setup is confusing.</li>
</ul>

<strong>The Ugly:</strong>
<ul>
	<li>Receiver can't control the TV via CEC at all.  Had to find the proper code for the remote to send IR commands instead.  Bad interop!</li>
</ul>

So the usage for controlling everything is much more of a process to be learned.  To power everything up with a single button, you have to hit the relevant device button on the Onkyo remote and then the power button.  To turn everything off, you have to hit the TV button followed by the power button.  When switching inputs, you have to remember to turn off the device you're no longer watching.  Contrast this with using the Harmony route which is a single button push to do any of the above tasks.  Adding CEC into the mix does bring some added remote XBMC control features I've been wanting, but I can't see using it as the primary way to manage these devices.

The process has been pretty frustrating to try to sort through overall.  My takeaway is that while CEC is an option, vendors tweaking or only partially implementing it can really kill the overall usefulness.  I'll certainly be taking this experience into account whenever I end up purchasing replacement kit and hopefully will find solid hardware with proper standards support.

