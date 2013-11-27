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

### [Fun with kernel modules](https://github.com/jvns/kernel-module-fun) (2013)

[{%img /images/rootkit.png %}](https://github.com/jvns/kernel-module-fun)

When I arrived at Hacker School I had *no idea* about what the Linux
kernel did or how to make it do anything. So my first action was to
find out. I wrote a couple of blog posts about
[what the Linux kernel does](http://jvns.ca/blog/2013/10/02/day-3-what-does-the-linux-kernel-even-do/)
and
[processes vs threads](http://jvns.ca/blog/2013/10/04/day-4-processes-vs-threads/)
before deciding to learn by writing a kernel module.

It turns out that writing silly kernel modules is not too hard! I
wrote a module that writes to the log every time a packet arrives and
a small rootkit (via a lot of copying and and pasting).

This is more of a "fun exploration" than a "serious project".

[Source](https://github.com/jvns/kernel-module-fun)

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

### Master's thesis (2011)

[{%img /images/thesis-picture.png %}](http://github.com/jvns/masters-thesis)

This is certainly the project I've spent the *longest* on. I wrote my
master's thesis on the algebra of topological quantum computing.

The idea is that in order to understand the algebra behind topological
quantum computing, one needs to understand

* quantum groups, in particular quantum groups at roots of unity
* how to get from the category of representations of those quantum groups to modular tensor categories, 
* How topological quantum computing happens in these modular tensor categories

My advisor [Prakash Panangaden](http://www.cs.mcgill.ca/~prakash/) and
I found it hard to find a good reference which tied all these things
together, so I wrote my thesis about it.

[PDF](https://github.com/jvns/masters-thesis/raw/master/thesis.pdf)
