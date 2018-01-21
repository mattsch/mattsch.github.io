---
id: 560
title: 3D Printing Tips
date: 2014-02-07T18:58:00+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=560
permalink: /archives/2014/02/07/3d-printing-tips
categories:
  - Projects
---
Just a few things I've learned over the past few weeks:
<ol>
	<li>Travel rate matters - On both my Prusa I3 and Mendel90 I had the non-print travel rate ratched up to 250mm/s and thought I was okay since it didn't miss steps.  However, it made for odd artifacting and layers not properly lining up due to the momentum of the extruder body (especially bad on the mendel, it's a heavy beast).  Shaving it back to 150mm/s on the Mendel90 and 175mm/s on the Prusa made for a HUGE improvement in finish quality.</li>
	<li>Firmware retraction is nice - Newer versions of Marlin allow controlling retraction/recovery via firmware (using G10/G11 g-codes) and Slic3r has an option to use it over it's normal g-code generation.  Just started playing with it so we'll see how it does quality-wise, but being able to control via M207/M208 during a print makes for much better fine tuning than the old slice/print/repeat route.</li>
	<li>Ambient temp matters a LOT - At least for first layer adhesion with PLA.  The two most important factors in my experience for proper first layer adhesion are proper Z height calibration (most critical) and temperature.  It's gotta be hot enough for the first layer to stick and then drop below PLA glass transition temp so it hardens and holds properly.  The trick is that with higher ambient temperatures the time for that drop takes a bit longer, it can stay pliable a bit too long.  I've found printing the first layer at 75C and then dropping to 60C seems to work well, but I'll be interested to see if that holds as the weather warms.</li>
</ol>

