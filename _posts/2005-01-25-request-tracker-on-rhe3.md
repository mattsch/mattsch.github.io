---
id: 122
title: Request Tracker on RHES3
date: 2005-01-25T11:51:22+00:00
author: Matthew Schick
excerpt: |
  Here's my notes from an install of <a href="http://www.bestpractical.com/rt/">Request Tracker</a> on a Redhat Enterprise 3 boxen.  The owner of the box got in touch with me after his admin(s) had tried every which way to install...
layout: single
guid: http://www.excentral.org/archives/2005/01/25/request-tracker-on-rhe3/
permalink: /archives/2005/01/25/request-tracker-on-rhe3
dsq_thread_id:
  - "6426266733"
categories:
  - Work
---
Here's my notes from an install of <a href="http://www.bestpractical.com/rt/">Request Tracker</a> on a Redhat Enterprise Server 3 box.  The owner of the box got in touch with me after his admin(s) had tried every which way to install...

Upon inspection of <em>hostname removed</em> I found an inoperable apache/mod_perl installation due to a missing request tracker configuration file (byproduct of rt installation attempts) and seriously crufted perl install.  Perl issues stemmed from an updated minor version (2.8.6) being installed from Java Desktop sources when mod_perl and most extension modules were compiled against the current Red Hat Enterprise 3 version (5.8.0-88.9).  Symptoms included Apache segfaults and various Perl errors (modules not found, unresolved symbols, etc.).

I was able to find a <a href="http://pclabftp.cc.kuleuven.ac.be/linsam/errata-rhes3/">site</a> with the latest ES3 errata packages and used the Perl rpm from there (perl-5.8.0-88.9.i386.rpm).  I then removed the old Perl lib directories and replaced a few of the non-standard modules with the stock versions and was able to restore Apache stability (verified by enabling the /perl-status feature).

Request Tracker needs specific versions of some Perl modules that Redhat has included in it's stock rpm, so I was forced to use CPAN to install to preserve package database validity.  Most of these modules installed without issue, but I did have to manually tweak a few.  After verifying the Perl install (using 'rt-test-dependencies') I was able to move on to installing Request Tracker.

Again, I installed directly from the tarball instead of from the rpm but I broke out the stability and bug fix patches.  Installation from there was, aside from a few tweaks, fairly straightforward and painless.

These I was able to recompile (rpmbuild --rebuild) and install:

<em>perl-CGI-3.05-2.i386.rpm
perl-Cache-Cache-1.01-1.noarch.rpm
perl-DBIx-SearchBuilder-0.99-2.noarch.rpm</em>

These decided to be a PITA and had to be installed via CPAN:

<em>perl-Storable-2.12-2.i386.rpm conflicts with perl
perl(Storable) >= 2.08 is needed by perl-HTML-Mason-1.26-2
perl-Locale-Maketext-1.08-2.noarch.rpm conflicts with perl
perl-Digest-1.00-2.noarch.rpm conflicts with perl
perl(Digest::base) is needed by perl-Digest-MD5-2.33-2</em>

Storable failed during 'make test', Googled a bit, tested and just bypassed 'make test':
<em>Storable .12 & .13:
t/malice..............ok 1/401#     Failed test (t/malice.t at line 95)
#          got: '8'
#     expected: '8'</em>

HTML-Mason needed a few Apache modules, Apache-Filter bombed on 'make test' due to changes in httpd.conf, no other issues:
<em>---- Unsatisfied dependencies detected during [D/DR/DROLSKY/HTML-Mason-1.28.tar.gz] -----
Apache::Request
Apache::Filter</em>

<em>*** Apache-Filter - bypassed 'make test'
Syntax error on line 2 of /root/.cpan/build/Apache-Filter-1.022/t/httpd.conf:
Port was replaced with Listen in Apache 2.0</em>

Went with Locale-Maketext-1.08 due to code movement in the module with 1.09 release, no other issues.

Installed Digest 1.10 and Digest-MD5 2.33 to get some bugfixes, MD5 doesn't like the default LANG env setting in RHES9, used 'unset LANG' to move past:

<em>Makefile:85: *** missing separator.  Stop.</em>