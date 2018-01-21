---
id: 116
title: SNMP, MRTG and Squid
date: 2004-12-13T21:32:08+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2004/12/13/snmp-mrtg-and-squid/
permalink: /archives/2004/12/13/snmp-mrtg-and-squid
categories:
  - Work
---
Meethune got me on a <a
href="http://people.ee.ethz.ch/~oetiker/webtools/mrtg/">MRTG</a> kick this past
week, which lead me on a <a href="http://net-snmp.sourceforge.net">SNMP</a>
frenzy. 

The setup was pretty easy (read: the docs for both MRTG and SNMP are excellent),
so I was able to get the NIC monitoring on my router up in virtually no time.
The <a href="http://www.squid-cache.org">Squid</a> docs are god-awful however,
so here's my mini-mini-how-to on a Gentoo box:

<strong>Versions:</strong> MRTG: 2.11.0 Squid: 2.5.7 Net-SNMP: 5.1.1

Enable snmp support in /etc/squid/squid.conf:
```
acl snmpYourCommunityName snmp_community YourCommunityName
snmp_port 3401
snmp_access allow snmpYourCommunityName localhost
snmp_access deny all
```

Add <a href="http://www.excentral.org/confs/SQUID-MIB.txt">this mib file</a> to
your /usr/share/snmp/mibs/ and add

`mibs +SQUID-MIB`

to /etc/snmp/snmp.conf.  This will let you see the symbolic names instead of
those !*($&! numbers.

Now, you will need <a href="http://www.excentral.org/confs/squid.cfg">this mrtg
config file</a> to generate those sexy mrtg pages.  You will need to replace all
the "COMMUNITY" entries in this with your Squid community and modify the doc
root, but it should work otherwise.

More info: <a href="http://net-snmp.sourceforge.net/FAQ.html">Net-SNMP FAQ</a>
<a href="http://squid.visolve.com/squid/monitoringsquid.htm">ViSolve.com -
Squid</a> <a
href="http://people.ee.ethz.ch/~oetiker/webtools/mrtg/mrtg-squid.html">MRTG
Squid page</a>
