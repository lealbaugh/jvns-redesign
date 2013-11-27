---
layout: page
title: "Projects"
hidetitle: true
comments: false
sharing: false
footer: true
---

### [Visualizing Git workflows](http://visualize-your-git.herokuapp.com) (2013)

[{%img /images/selenamarie.png%}](http://visualize-your-git.herokuapp.com/display/223/sparse)

When [Philip Guo](http://www.pgbovine.net/) was a resident at Hacker
School, we had some interesting discussions about how to automatically
learn people's programming workflows and generate information for
novices or tool-creators to use.

After that, I built a tool to visualize your Git workflow. As of Dec.
2013 about 2300 people have used it.

[Source](https://github.com/jvns/git-workflow),
[Try it out](visualize-your-git.herokuapp.com),
[Blog post](http://jvns.ca/blog/2013/11/13/day-27-magic-testing-functions/)

### [Gunzip in Julia](http://github.com/jvns/gzip.jl) (2013)

<iframe width="960" height="720" src="//www.youtube.com/embed/SWBkneyTyPU" frameborder="0" allowfullscreen></iframe>

I wanted to understand how `gzip` works, so I wrote `gunzip` from
scratch in Julia.

It then turned out that unzipping the Raven and printing out the
intermediate results made a really compelling visualization of how
LZ77 compression works. The internet liked it a lot.

[Source](http://github.com/jvns/gzip.jl),
[Blog post](http://jvns.ca/blog/2013/10/24/day-16-gzip-plus-poetry-equals-awesome/), 
[HN discussion](https://news.ycombinator.com/item?id=6609586)

### [Visualizing Unix command usage](http://jvns.ca/projects/unix-command-survey/graph.html) (2013)

[{%img /images/command-graph-small.png %}](http://jvns.ca/projects/unix-command-survey/graph.html)

A few months ago I got curious about which unix command line utilities
were the most popular, so I ran a survey on Hacker News. I ended up
getting 1,500 responses or so.

Once I had that, I wanted to know how commands are related to each
other: do people who use `gcc` use `python`? What about `scala` and
`clojure`?

Useful for fun times and discovering new tools to use. It's a bit
computationally intensive, so best viewed in Chrome. 

[Source](http://github.com/jvns/unix-command-survey)

### [Bike availability map](http://jvns.ca/bixi/map) (2011)

[{%img /images/biximap.png %}](http://jvns.ca/bixi/map)

This was my first Javascript project. I wrote it a few years ago when
I got frustrated with [Bixi](http://montreal.bixi.com)'s map. It's a
realtime app and they take the bikes out in the winter, so it's only
useful from April to mid-November.

[Source](http://github.com/jvns/biximap).

 
