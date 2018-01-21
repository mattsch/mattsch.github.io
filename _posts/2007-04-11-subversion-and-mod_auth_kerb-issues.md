---
id: 283
title: Subversion and mod_auth_kerb issues
date: 2007-04-11T20:25:40+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2007/04/11/subversion-and-mod_auth_kerb-issues/
permalink: /archives/2007/04/11/subversion-and-mod_auth_kerb-issues
categories:
  - Work
---
Been trying to track down some issues with the new <a href="http://subversion.tigris.org/">Subversion</a> servers at work.  They are setup to be accessed via https only, authentication provided by <a href="http://modauthkerb.sourceforge.net/">mod_auth_kerb</a>.  This works beautifully for doing Negotiate auth, however I'd been seeing some odd errors when it would fall back to Basic.  I was seeing a bunch of replay errors logged:
```
krb5_verify_init_creds() failed: Request is a replay
```

Along with the more cryptic:
```
The locks could not be queried for verification against a possible "If:" header.  [500, #0]
```

It was pretty obvious that the errors were related, however the replay message were spewing much more frequently.  I enlisted the help of jorton (resident Apache guru) and we managed to fix a few other small annoyances, but got nowhere on the errors.  Till yesterday.  Joe forwarded me an email from the m_a_k mailing list that said to set `kdc_timesync = 0`.  The <a href="http://sourceforge.net/mailarchive/forum.php?thread_name=87irc8urzs.fsf%40kosh.bigo.ensc.de&forum_name=modauthkerb-help">thread</a> has a good explanation of why this needs to be set, so go read it. :)
