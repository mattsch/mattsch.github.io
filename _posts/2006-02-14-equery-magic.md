---
id: 239
title: Equery magic
date: 2006-02-14T09:20:21+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2006/02/14/equery-magic/
permalink: /archives/2006/02/14/equery-magic
categories:
  - Projects
---
While looking to modular-x-ify the new Metacity ebuild, I needed a way to verify the X deps and used this:

```shell
for x in $(ldd /usr/bin/metacity|cut -f2 -d =|cut -f2 -d ' '|grep ^/); do equery -q belongs $x; done
```

Enjoy!
