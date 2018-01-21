---
id: 570
title: Ansible variables
date: 2014-04-16T09:46:44+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=570
permalink: /archives/2014/04/16/ansible-variables
categories:
  - Work
---
Been doing some abstraction refactoring for work and ran into a situation where
I had a task that used the command module in a loop and I needed to be able to
use the stdout value in a template later on.  My first thought was to use
dynamic variables (e.g., `register: {{ item.foo }}_output`) but Ansible treats
the variable name as a literal string for both register and add_fact so that was
an utter failure.  After much doc trawling and searching, I used the debug
module to dump the variable registered and found it was a gnarly (and deeply
nested) dataset consisting of a dictionary of with both lists and more
dictionaries of lists.  The upside is that nearly all the data about the task is
there, including the items used in the loop as well as the results I needed.

The task (cleaned up a bit):
```yaml
- name: record git revision of repositories
  local_action:
    command git rev-parse HEAD
    chdir="{{ foo }}"
  with_items:
    - "{{ service_modules }}"
  sudo: no
  register: repo_checkouts
```


The relevant portion of the template:
```jinja
{% raw %}
{% for checkouts in repo_checkouts.results %}
Repository: {{ checkouts.item.git_location }}
Targeted Branch/Tag/Commit: {{ checkouts.item.git_reference }}
Actual Revision: {{ checkouts.stdout }}
{% endraw %}
```

Note that the repo_checkouts.results includes a dictionary in each list named
'item' that includes all the info passed via with_items, and stdout is the
output from the command.  Each list also includes a 'cmd' dict with the input to
the command module, an 'invocation' dict with the module and params details, and
various other details like return code and time stamps.
