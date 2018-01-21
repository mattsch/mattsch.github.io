---
id: 435
title: Android Repo Mirroring
date: 2011-02-24T20:25:16+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=435
permalink: /archives/2011/02/24/android-repo-mirroring
sent_to_laconica:
  - 'yes'
openid_comments:
  - 'a:1:{i:0;i:98628;}'
categories:
  - Projects
---
Been playing with the <a href="http://www.cyanogenmod.com/">CyanogenMod</a> port
during pto this week (yummy gingerbread goodness!) and got a crash course in
building Android from scratch.  Due to the rapid development, I ran into a huge
issue pretty quickly when having to nuke/resync the various repos for building.
The total space required for a full source build is roughly 14 gigs and requires
pulling from a massive number of git repos.  Android has a tool named 'repo' (<a
href="http://source.android.com/source/git-repo.html">info</a>) which makes
checking em all out in a cohesive manner very easy, however it's still a
prohibitive time sync to have to pull multiple times.  Bit of digging and poking
at repo gave me the '--mirror' and '--reference' params.  Basically this allows
you to initialize a local mirror of an android repo and then point subsequent
repo pulls to that local copy.

My example (my tld here is ~/android/):
```shell
# make the local mirror directory for upstream android
mkdir ~/android/mirror; cd ~/android/mirror
# initialize the repo mirror and sync
repo init -u git://android.git.kernel.org/platform/manifest.git --mirror
repo sync -j40
```

That will take a while, once it's done it's time to create the mirror of
CyanogenMod sources:
```shell
# make local cyanogenmod mirror directory
mkdir ~/android/cyanogen/; cd ~/android/cyanogen/
# since I'm building for gingerbread, grab that branch
repo init -u git://github.com/CyanogenMod/android.git -b gingerbread --mirror --reference=/path/to/home/android/mirror/
repo sync -j40
```

This will also take quite some time, note the use of the '--reference' param.
This uses my local mirror of the android sources instead of pulling across the
network again.

Now I can pull one of the various Captivate repos, using that same '--reference'
param (pointed at my local cyanogen mirror) and profit:
```shell
# using atinm's repo for Captivate build, just an example at the moment
mkdir ~/android/atinm; cd ~/android/atinm
repo init -u http://github.com/atinm/android.git --reference=/path/to/home/android/cyanogen/
```

Success!
