---
id: 233
title: OpenSSH Multiplexed
date: 2005-12-23T14:24:46+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=233
permalink: /archives/2005/12/23/openssh-multiplexed
categories:
  - General
---
Meethune showed me a really cool new feature in<a href="http://www.openssh.com/">OpenSSH</a> 4.2 called multiplexing.  In short, it allows you to connect once to a remote host, then simply uses a socket to reuse that connection for new login shells.  To use add:
```conf
Host *
ControlPath ~/.ssh/ctl-%r-%h-%p
ControlMaster auto
```

to the beginning of your ~/.ssh/config and enjoy!

To check the status of the connections run:
```shell
ssh -O check remotehost
```
and to kill the master connection run:
```shell
ssh -O exit remotehost
```

Now this won't allow for adding forwarded ports to the multiplexed connection, but that feature is in the works.

<a href="http://www.debian-administration.org/articles/290">More info...</a>
