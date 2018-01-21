---
id: 300
title: Nokia + Hal + Banshee == Music Goodness
date: 2008-12-11T21:04:03+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=300
permalink: /archives/2008/12/11/nokia-hal-banshee-music-goodness
openid_comments:
  - 'a:1:{i:0;i:88604;}'
dsq_thread_id:
  - "6426266983"
categories:
  - General
---
Been playing with Banshee over vaction and got frustrated I couldn't use it's automagical conversion for my E71 or N810.  Started poking around with the Hal information files and discovered it wasn't nearly as difficult as I thought to make it work.  The N810 was a bit tricky since it shows both the internal and external memory cards as mountable volumes and Banshee will only use the first.  Drop the fdi files (<a href="/confs/10-E71-extras.fdi">E71</a>, <a href="/confs/10-N810-extras.fdi">N810</a>) into /etc/hal/fdi/information/ and all should Just Work.  

<em>Note: These files assume you're keeping music and playlists in the Music and Playlists directories on the memory cards.  If your setup is different, edit accordingly.</em>