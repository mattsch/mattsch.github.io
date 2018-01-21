---
id: 261
title: Postgresql replication blows
date: 2006-07-17T19:39:28+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2006/07/17/postgresql-replication-blows/
permalink: /archives/2006/07/17/postgresql-replication-blows
dsq_thread_id:
  - "6426266921"
categories:
  - Work
---
Yup, that's right.  I said it.  <a title="Postgresql" href="http://www.postgresql.org/">Postgresql</a> replication options blow.  Hardcore.  To summarize the options:

<a title="pgreplication" href="http://gborg.postgresql.org/project/pgreplication/projdisplay.php">pgreplication</a> -  Too old, based off PostgreSQL-6.4.2, did see a rumor on a mailing list about reviving it for 8.x

<a title="pgpool" href="http://pgpool.projects.postgresql.org/">pgpool</a> -  Synchronous replication (good for data integrity, bad for performance), load balances select queries, very limited (and insecure) auth options

<a title="Slony1" href="http://gborg.postgresql.org/project/slony1/projdisplay.php">Slony-I</a> - Asynchronous replication (good performance, slight data integrity issue), no load balancing, setup with existing db a royal PITA.

I've been 'tasked' with getting failover replication setup at work for a few critical  (such as bugzilla) postgres databases.   The _only_ option I have at this point is Slony-I which, as I mentioned above, is a royal PITA to integrate into an established database.

For one thing, Slony introduces it's own syntax for control.  Not so bad, but there are some conflicting docs out there which cost me some config time.  Slony does also require all tables you create to either have a primary key, or an index marked as 'unique, not null'.  Again, this seems like it should be pretty common place but, at least in our version of bz, there were several tables without.  According to the docs, you can have Slony <a title="TABLE ADD KEY" href="http://linuxfinances.info/info/stmttableaddkey.html">create a primary key</a> if neither of the other two options are available.  What that doesn't mention is that you then have to specify 'key = SERIAL' in your table definition.

Slony has also had some stability issues in the past with their replication processes, but most of those have been worked out with the current stable version (1.1.5) and the next version (1.2.0) has gotten even more love.

I will say this for it, my initial tests are showing it being pretty damn fast with intial master -> slave sync.

In contrast, setting up MySQL replication is dead simple and requires no third-party scripts. *sigh*