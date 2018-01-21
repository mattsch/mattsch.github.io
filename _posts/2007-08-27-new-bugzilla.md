---
id: 290
title: New Bugzilla!
date: 2007-08-27T01:36:06+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2007/08/27/new-bugzilla/
permalink: /archives/2007/08/27/new-bugzilla
categories:
  - Work
---
So we finally wrapped up the big migration of <a href="https://bugzilla.redhat.com">bugzilla.redhat.com</a> yesterday morning.  We moved from an internal system (1 web, 1 db w hot spare) to one in the datacenter (multiple web and db) plus some basic code fixes.  It was an epic effort with large amounts of data having to be copied over relatively slow links and being converted from Postgresql to MySQL.  We made the decision to move to MySQL for a handful of reasons, primary being real replication.  <a href="http://slony.info/">Slony</a> is a mostly adequate option for Postgresql, however it's performance isn't great and it's got some pretty large limitations since it's all triggers and stored procedures.  Now we have a system that's much more scalable and should have a noticeable improvement in performance.

We had a few minor issues during the migration, but data is intact and it was a largely uneventful process.  It took a total of ~15 hrs to complete which completely sucked, but was pretty much unavoidable.  Apparently rsync got confused with some of our converted dump files and decided they had to be copied whole.  Best guess was that it didn't care for the format of some of the converted dump files, but oh well.... 

If you notice any issues with the new system, please drop an email to <a href="mailto:bugzilla-owner@redhat.com">bugzilla-owner</a>.

Hurrah for proper infra!