---
id: 244
title: Transparent proxy
date: 2006-06-04T13:01:16+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2006/06/04/transparent-proxy/
permalink: /archives/2006/06/04/transparent-proxy
categories:
  - Projects
---
I've been wanting to setup a transparent proxy on my home network, but haven't been able to because <a title="Web Proxy" href="http://www.squid-cache.org/">Squid</a> isn't running on my router.  All the hacks I'd been able to find rely on some really dark routing/firewall rules that caused all sorts of problems.

Came across <a href="http://www.balabit.com/products/oss/tproxy/">tproxy</a> the other day and it's solved all my issues.  I set it up on my <a href="http://www.openbsd.org">OpenBSD</a> router, used pf rules to route http traffic from clients to tproxy and it handles the rest.  For the record, here's the relevant lines from my pf.conf:
<samp> table &lt;internal_clients&gt; persist { INTERNAL_IP_BLOCK !SQUID_HOST }
rdr on {INTERNAL_INTERFACES} proto tcp from   &lt;internal_clients&gt; to any port www -> 127.0.0.1 port 81
</samp>

I have tproxy starting at boot using:
<samp>
if [ -x /usr/local/sbin/tproxy ]; then
echo -n ' tproxy'; /usr/local/sbin/tproxy -s 81 -b 127.0.0.1 SQUID_HOST SQUID_PORT
fi
</samp>

[tags]OpenBSD,tproxy,Squid,Transparent Proxy,pf[/tags]