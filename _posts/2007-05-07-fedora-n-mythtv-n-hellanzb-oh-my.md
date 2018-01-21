---
id: 285
title: Fedora n Mythtv n Hellanzb oh my!
date: 2007-05-07T20:50:35+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2007/05/07/fedora-n-mythtv-n-hellanzb-oh-my/
permalink: /archives/2007/05/07/fedora-n-mythtv-n-hellanzb-oh-my
categories:
  - Projects
---
I've been running <a href="http://www.gentoo.org">Gentoo</a> on it for forever, but lately I've grown tired of dealing with the weekly tree breakage and hassles.  I also wanted to attempt a 64 bit OS in the hopes it would gain me enough to play h264-encoded files w/o glitches.

My first attempt was using <a href="http://www.ubuntu.com">Ubuntu</a>, but performance wasn't much better and I was seeing some video tearing.  My second attempt was <a href="http://fedoraproject.org">Fedora Core 6</a>.  Performance was amazing.  <a href="http://www.mythtv.org">MythTV</a> was more responsive and video files played glitch-free.  However, ndiswrapper was causing the machine to lockup randomly.  This seems to be an issue with the rt73 driver as I saw it on both my installations.  My next step was to do a 32 bit install of FC6 and I was shocked to see the same MythTV performance as before.  I dunno what magic is being done there, but I likes a whole lot.  H264 file seem to be playing a bit better, tho not as smoothly as I'd like.

Getting the rest of my required stack (<a href="http://www.hellanzb.com">Hellanzb</a>, <a href="http://hellanzb.com/trac/hellanzb/wiki/HellaHella">Hellahella</a>, etc.) was a snap.  There's no packages for the Hella* stuff, but most of the deps are in extras so installing was a snap.  I ended up getting MythWeb installed as part of the 'Mythtv-Suite' metapackage so I attempted to run Hellahella behind an apache proxy.  Failure was complete there due to hardcoded paths.  A bit of Googling later and I found some very <a href="http://blog.timc3.com/2006/07/16/hellahella-on-apache-2/">helpful instructions</a> on setting it up via mod_python.  Those instructions assume you are running apache for Hellahella exclusively (or as a NameVirtualHost).  I'm not, so here's my config:
```apache
<location /hella>
SetHandler mod_python
PythonHandler mod_python.wsgi
PythonPath "['/var/www/hellahella/'] + sys.path"
PythonOption wsgi.application startup::app
PythonOption SCRIPT_NAME /hella
</Location>
Alias /stylesheets/ "/var/www/hellahellaMedia/stylesheets/"
Alias /javascripts/ "/var/www/hellahellaMedia/javascripts/"
Alias /images/ "/var/www/hellahellaMedia/images/"
```

