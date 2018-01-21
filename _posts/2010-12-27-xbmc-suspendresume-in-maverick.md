---
id: 427
title: XBMC suspend/resume in Maverick
date: 2010-12-27T18:39:57+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=427
permalink: /archives/2010/12/27/xbmc-suspendresume-in-maverick
sent_to_laconica:
  - 'yes'
categories:
  - General
---
Few updates to my <a href="/archives/2009/11/08/enabling-suspendresume-with-xbmc-in-ubuntu-9-10">previous post</a>:
<ol>
	<li>The format for the proc interface changed slightly (but significantly) from "disabled" to "*disabled", scripts must be updated accordingly.</li>
	<li>One more step is required, details are in <a href="http://forum.xbmc.org/showpost.php?p=658293&postcount=168">this post</a>, but the short version is that you'll need to enable wakup for the device at the sysfs level <em>in addition to</em> proc.  I used the simple udev rule posted there and all works.</li>
</ol>

