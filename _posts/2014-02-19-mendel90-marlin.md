---
id: 563
title: Mendel90 Marlin
date: 2014-02-19T11:46:33+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=563
permalink: /archives/2014/02/19/mendel90-marlin
categories:
  - Projects
---
For those looking to run a recent version of Marlin on a Mendel90 from nophead, I track upstream in my own branches on GitHub.  There are two versions; <a href="https://github.com/mattsch/Marlin/tree/mendel90_lcd">one</a> for running with the <a href="http://www.think3dprint3d.com/Panelolu2" title="Panelolu2">Panelolu2</a> LCD and the <a href="https://github.com/mattsch/Marlin/tree/mendel90">other</a> without.

A few gotchas to be aware of:
<ul>
	<li>The Melzi drivers are included from nophead, they're in ArduinoAddons/Arduino_1.x.x/Melzi and <strong>must</strong> be copied into your sketchbook/hardware/ folder or you will have issues with carriage movement.</li>
	<li>If you're using the LCD branch you must have the Panelolu2 attached or it will hang at start.  There's some patches floating around that might fix this but I haven't tested yet.  If you remove the LCD make sure you disable the panel in Configuration.h.</li>
	<li>The LCD requires a recent checkout of the <a href="https://github.com/lincomatic/LiquidTWI2">LiquidTWI2</a> libraries in your sketchbook/libraries/ directory.</li>
</ul>

The README for each of my branches details other changes/features and I'll keep em updated as I make changes.