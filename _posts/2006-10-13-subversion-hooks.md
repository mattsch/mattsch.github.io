---
id: 267
title: Subversion hooks
date: 2006-10-13T17:15:17+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/archives/2006/10/13/subversion-hooks/
permalink: /archives/2006/10/13/subversion-hooks
categories:
  - Projects
---
Spent some time working with <a title="Subversion Book" href="http://svnbook.red-bean.com/nightly/en/svn.reposadmin.create.html#svn.reposadmin.create.hooks">Subversion hooks</a> last night to test svnsync and discovered something.  If you wanna run sudo in a hook (don't ask), make sure you call bash with the login param or it will be unable to decide what your uid is.