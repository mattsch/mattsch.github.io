---
id: 18
title: 'The Saga of the tg3 Module that Killed a Server (or The Monday that Wouldn&#8217;t End)'
date: 2003-11-04T12:00:55+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2003/11/04/the-saga-of-the-tg3-module-that-killed-a-server-or-the-monday-that-wouldnt-end/
categories:
  - Work
---
Our story begins in the early evening of an unassuming Monday evening, November
3rd to be exact.

After scheduling some downtime for a routine hard drive installation, our hero
headed home for some much deserved time at home.  Or so he thought
(dum-dum-duuuum!).

The first crash was noticed at approx. 6:30 pm CST at which time our hero rushed
up to find and fix the problem.  All indications pointed to one of two students
working on multithreading/multiprocessing programs for class, and their
usernames were duly noted.

The second crash was a most unpleasant revelation at about 8:30 pm.  Our hero
noticed that only one of the two suspicious students was on at the time of the
crash and consequently heaped all responsibility upon their unforunate head.
After a quick reboot this user logged back in and out hero was able to observe
their program at work.  After about two hours of close monitoring and log
combing our hero left for a few precious minutes of respite before his foray
into the hard drive upgrade jungle.

The hard drive upgrade effort was a complete failure.  The case manufacturers,
in their infinite wisdom, decided to use a non-standard mounting scheme that
requires hardware our hero just didn't have.  However, the server had stayed up
reinforcing our admin's belief that poor code had killed it.

Oh, but he couldn't have been more wrong.

Upon finally returning to his house after 1 a.m., our hero attempted to salvage
something of the evening by planning roadmaps for a few projects.  At approx.
2:30 a.m. he happened to try to check his email from the newly unreliable server
only to discover it's recent demise.  There was much cursing and grinding of
teeth.

Our poor hero returned to his hell (common name: server room) only to find the
network card installed in the server had joined it's kind in the great network
in the sky.  After much more cursing, tho not quite as much grinding, and
replacing the newly decesed card the server was brought to life for the fourth
time that night.  It was then that the current theory of student involvment was
proven false.

Careful log perusal showed a metric ton of errors spewing from the network
card's driver for more than thirty minutes before the final crash.  As the
offending NIC  had already been replaced, there was nothing for our hero to do
but sit, wait and watch.  By 4:30 am, the server had been back up for a little
more than an hour with no problems so the dedicated admin was able to sneak a
little sleep.

Arriving at work at 8:00 am, our hero was delighted to find all was well.  The
server was serving data quite efficently and, by lunchtime, the admin was able
to return home for some much deserved sleep.
