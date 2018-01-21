---
id: 257
title: New py_shoutcast, Freevo plugin
date: 2006-07-03T00:47:26+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2006/07/03/new-py_shoutcast-freevo-plugin/
permalink: /archives/2006/07/03/new-py_shoutcast-freevo-plugin
dsq_thread_id:
  - "6426266910"
categories:
  - Projects
---
Finally got around to updating py_shoutcast to the new <a title="Streaming
Radio" href="http://www.shoutcast.com/">Shoutcast</a> XML format/layout.  This
was actually reported to me back at the end of May by Mats Joensson (along with
a patch), just haven't had the time to look at it before now.  I would have much
preferred to use his patch, but the upstream changes pretty much required a
complete rewrite in the parsing code.

If anyone is actually using the python module for anything other than the <a
title="Freevo" href="http://freevo.sourceforge.net/">Freevo</a> plugin, you'll
notice calling `ShoutcastFeed.parse_stations()` no longer does it
all.  This is because Shoutcast now requires a fetch of the genre list, then
fetching a list of of the stations in that genre. Now you have to use
`GenreFeed.parse_genres()` to grab the list genres, then call
`ShoutFeed.parse_stations()` for each genre.

The parameters have also changed for `parse_stations()`, most notably the
`no_compress` and `feed_max` have been removed.  They simply don't exist anymore
upstream.  One nicety is that I was able to remove the genre regex kludge, and
the genre/station list split had resulted in things feeling much faster in the
Freevo plugin.

I've setup a <a title="Trac" href="http://www.edgewall.com/trac/">Trac</a>
install, so you'll be able to find the newest releases on the <a title="Python
Shoutcast Download"
href="https://www.excentral.org/trac/pyshout/downloads">download page</a> <a
title="Python Shoutcast Trac"
href="https://www.excentral.org/trac/pyshout">there</a>.  Please submit any
bugs, patches (my favorite) or feature requests on the <a title="New Ticket"
href="https://www.excentral.org/trac/pyshout/newticket">ticket tracker</a>.
