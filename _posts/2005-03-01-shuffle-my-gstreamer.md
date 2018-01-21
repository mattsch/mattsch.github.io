---
id: 157
title: Shuffle my GStreamer
date: 2005-03-01T01:05:58+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2005/03/01/shuffle-my-gstreamer/
permalink: /archives/2005/03/01/shuffle-my-gstreamer
tags:
  - GStreamer iPod Shuffle
keywords:
  - GStreamer,iPod,Shuffle
categories:
  - Life
---
I bought Tiff an [Ipod Shuffle](http://www.apple.com/ipodshuffle/) for her
birthday (which she absolutely loves) and have had to figure out what to do
about my ogg collection.  I found
[info](http://www.neilturner.me.uk/2003/Oct/19/ogg_vorbis_in_itunes.html) on
adding ogg support to [iTunes](http://www.apple.com/itunes/) and had no problems
getting it mostly working.  Tho iTunes will recognize most of my oggs (as
quicktime movies!) and convert to aac on the fly, it won't read all the info
from the tags so my track numbers don't show up.  I also had an issue with it
importing my [Zeppelin How The West Was
Won](http://www.musictap.net/Reviews/LedZeppelinHowTheWestWasWonDVDA.html) set
that required finding a quick n dirty conversion option.

I tried using [SoX](http://sox.sourceforge.net/), but it didn't retain the tags
so I looked at some of the ogg2mp3 scripts floating around and was sorely
dissapointed.  They either didn't keep tags, or were too old to be of any real
use.  Enter [GStreamer](http://www.gstreamer.net/) and it's beautiful pipeline
system.  I was able to run the simple bash script below and convert an entire
directory to 128k mp3's while keeping the metadata intact.

```shell
#!/bin/bash

file="$@"
mp3name=${file/ogg/mp3}

gst-launch-0.8 filesrc location="$file" ! oggdemux ! vorbisdec ! audioconvert ! lame ! filesink location="$mp3name"
```
