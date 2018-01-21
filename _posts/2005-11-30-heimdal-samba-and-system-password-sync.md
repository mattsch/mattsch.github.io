---
id: 204
title: Heimdal, Samba and system password sync
date: 2005-11-30T23:34:43+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=204
permalink: /archives/2005/11/30/heimdal-samba-and-system-password-sync
dsq_thread_id:
  - "6426266811"
categories:
  - Work
---
I've been looking for ways to keep passwords stored in <abbr title="Lightweight Directory Access Protocol">LDAP</abbr> in sync, and I came across the smbk5pwd module/overlay for <a href="http://www.openldap.org">OpenLDAP</a>.  It only works with OpenLDAP 2.2 or later, but it takes a lot of the headache out of administration if you are storing any combination of system/<a href="http://www.cmf.nrl.navy.mil/CCS/people/kenh/kerberos-faq.html">Kerberos</a>/<a href="http://www.samba.org">Samba</a> passwords in <abbr title="Lightweight Directory Access Protocol">LDAP</abbr> and you wanna keep em in sync.

It works using the "LDAP Password Modify Extended Operation" (<a href="http://www.faqs.org/rfcs/rfc3062.html"><abbr title="Requests for Comments">RFC</abbr> 3062</a>) and just makes sure than a password change happening from one source (smbpasswd, passwd, kpasswd) gets propagated to all relevant entries.  You can also replace the normal data in userPassword with {K5KEY} and any simple bind password requests will automagically get looked up directly in krb5Key instead of doing the <abbr title="Simple Authentication and Security Layer">SASL</abbr> two-step (<a href="http://www.mail-archive.com/openldap-software@openldap.org/msg00280.html">more info</a>).

You must have OpenLDAP >= 2.2 to use smbk5pwd, and you can either <a href="http://www.openldap.org/software/download/">download</a> the latest 2.3 tarball, do a <a href="http://www.openldap.org/devel/cvsweb.cgi/contrib/slapd-modules/smbk5pwd/?hideattic=1&sortbydate=0"><abbr title="Concurrent Versions System">CVS</abbr> checkout</a> or apply <a href="/files/openldap-smbk5pwd.patch">this patch</a>.  You will still have to
compile the module by hand (at least on Gentoo) and manually copy the libs over to /usr/lib/openldap/openldap.

<a href="http://student.physik.uni-mainz.de/~reiffert/smbk5pwd.html">This site</a> has some good config file examples, but I did have to change permissions on /var/heimdal/m-key to make it readable by the ldap user or slapd complained.
