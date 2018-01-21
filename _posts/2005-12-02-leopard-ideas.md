---
id: 221
title: Leopard ideas
date: 2005-12-02T01:42:30+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=221
permalink: /archives/2005/12/02/leopard-ideas
dsq_thread_id:
  - "6426266870"
categories:
  - Projects
---
<a href="http://spg-kush.blogspot.com/">Meethune</a> and I have been kicking around ideas for breathing new life into <a href="http://ossi-leopard.org/">Leopard</a>.  When I was approached to work on the project the goal was twofold; a chroot'd LAMP environment (complete with installer) and some sort of distributed data search/retrieval layer.  The former was easy enough to implement however we were never able to garner the resources to support it as it's own mini-distro.  The communication layer never got out of the planning phase for a host of reasons.

The maturity of projects like <a href="http://www.cl.cam.ac.uk/Research/SRG/netos/xen/">Xen</a> and <a href="http://fabrice.bellard.free.fr/qemu/">QEMU</a> is rapidly making the chroot approach a thing of the past, however the need for easy rollout of these virtual machines is very great.  I know Suse and Red Hat both include their own tools for this task, but they don't support installing a completely different distro.

Long story short, we are looking at revamping Leopard as a vendor-neutral set of tools for installing, cloning and managing virtual machines.  Course we gotta replace that horrid CMS currently running the site with <a href="http://www.edgewall.com/trac/">Trac</a>, come up with a real roadmap and perhaps even some code... ;)