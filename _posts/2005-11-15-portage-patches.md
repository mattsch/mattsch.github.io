---
id: 217
title: Portage Patches
date: 2005-11-15T10:39:15+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=217
permalink: /archives/2005/11/15/portage-patches
categories:
  - Projects
---
Brian Harring (ferringb) has some really slick patches posted on his <a href="http://dev.gentoo.org/~ferringb/blog/index.html">blog</a> for some serious speedups in Portage.

The <a href="http://dev.gentoo.org/~ferringb/blog/archives/2005-11.html#e2005-11-14T19_05_12.txt">first</a> uses confcache to cache those pesky (and redundant) tests during ./configure.  Nothing quite like watching the test fly by at warp speed... ;)

The <a href="http://dev.gentoo.org/~ferringb/blog/archives/2005-11.html#e2005-11-15T02_19_28.txt">second</a> implements background fetching of source tarballs during an emerge.  Need I say more?

The instructions for using both patches are included with his posts, and I'm using both now with great success.  Rock on ferringb!