---
id: 251
title: Openssh pts fun
date: 2006-06-23T14:33:07+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2006/06/23/openssh-pts-fun/
permalink: /archives/2006/06/23/openssh-pts-fun
dsq_thread_id:
  - "6426266885"
categories:
  - Work
tags:
  - OpenSSH
  - RHEL
  - Kernel
---
So... Came across a whole new bug today that had me scratching my head for quite a while.  One of my servers at work started hanging during ssh logins completely out of the blue.  Attempting to login with the really verbose flags '-v -v' didn't give any clues, and I just assumed something had happened with our network auth system.

More investigation showed I could execute commands via ssh, but any login attempt (even using pub keys) would hang until I manually killed the process.  Managed to run 'tail /var/log/secure' and saw login attempts were failing with this error:
```
openpty: No such file or directory
session_pty_req: session 0 alloc failed
```

Googling for that came up with all sorts of posts from the 2.6 kernel move (which added devpts fs), broken dev file systems and other equally non-helpful suggestions.  Finally I just went ahead and ran strace and was able to see:
```
open("/dev/ptmx", O_RDWR)               = -1 EIO (Input/output error)
```

Did some more digging, and spoke with some folks around the office and discovered it was an old(-ish) <a href="https://bugzilla.redhat.com/bugzilla/long_list.cgi?buglist=128154" title="bugzilla 128154">kernel bug</a> where the ptmx device no longer returns the correct number for the next pseudo terminal, and instead simply returns '0'.  I was able to confirm by killing the process attached to pty0 and was able to login, however once I did I blocked any other logins...

The other 'fix' for the issue was to kill all sessions attached to a pty, umount devpts and mount it again.  However it seemed most prudent to just reboot into a newer kernel where the bug is (hopefully) fixed.

