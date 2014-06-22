---
layout: post
title: "More practical uses for strace!"
date: 2014-02-27 07:25:36 -0800
comments: true
categories: coding kernel strace
---

In yesterday's blog post on
[using strace to avoid reading Ruby code](http://jvns.ca/blog/2014/02/26/using-strace-to-avoid-reading-ruby-code/)
I asked the Internet for some more suggestions of practical uses for
strace.

There were so many excellent suggestions that I couldn't not share!

[Mike English](http://twitter.com/gazoombo) pointed me to this
*wonderful*
blog post  
[Tools for Debugging Running Ruby Processes](http://spin.atomicobject.com/2013/08/19/debug-ruby-processes/)
he wrote about using strace, lsof, and gdb to debug a running Ruby
processes. He remarks that some of the things are like open-heart
surgery -- you can go into a running Ruby process and execute code
using gdb, but you might kill the process. Super cool and definitely
worth a read.

Some more great suggestions of what to do with strace:

<!-- more -->

Look for the 'open' system call!

<blockquote class="twitter-tweet" lang="en"><p><a
href="https://twitter.com/mjdominus">@mjdominus</a> <a
href="https://twitter.com/b0rk">@b0rk</a> Also invaluable when
sandboxing programs and trying to figure out where they are loading
shared libraries from.</p>&mdash; Eiríkr Åsheim (@d6) <a
href="https://twitter.com/d6/statuses/438904114597347329">February 27,
2014</a></blockquote>

<blockquote class="twitter-tweet" data-conversation="none"
lang="en"><p><a href="https://twitter.com/b0rk">@b0rk</a> While
looking at git performance, I&#39;ve used strace -c as well as <a
href="https://twitter.com/pgbovine">@pgbovine</a>&#39;s
strace-plus.</p>&mdash; David Turner (@NovalisDMT) <a
href="https://twitter.com/NovalisDMT/statuses/438901005108133888">February
27, 2014</a></blockquote>

A suggestion to also use ltrace:

<blockquote class="twitter-tweet" data-conversation="none"
lang="en"><p><a href="https://twitter.com/b0rk">@b0rk</a> all I know
is that I usually start with strace, get annoyed with it, then
remember to use ltrace instead. :-)</p>&mdash; Brian Mastenbrook
(@bmastenbrook) <a
href="https://twitter.com/bmastenbrook/statuses/438878838257250305">February
27, 2014</a></blockquote>

<blockquote class="twitter-tweet" data-conversation="none"
lang="en"><p><a href="https://twitter.com/b0rk">@b0rk</a> check out
syscall tracing on Linux, it&#39;s like strace for the whole system,
handy if you want to know which process is doing something.</p>&mdash;
Michael Ellerman (@michaelellerman) <a
href="https://twitter.com/michaelellerman/statuses/438994429219586051">February
27, 2014</a></blockquote> <script async
src="//platform.twitter.com/widgets.js" charset="utf-8"></script> I
didn't know syscall tracing was a thing! This seems very worthy of
investigation.

<script async src="//platform.twitter.com/widgets.js"
charset="utf-8"></script>

Here are some
[slides by Greg Price](http://price.mit.edu/tracing-w2014/#12) with a
bunch of great suggestions for fixing various problems, as well as his
blog post
[Strace - The Sysadmin's Microscope](https://blogs.oracle.com/ksplice/entry/strace_the_sysadmin_s_microscope)
from the wonderful ksplice blog.

Alex Clemmer wrote a super cool post on using dtruss (strace, but for
OS X/BSD) to try to better understand concurrency primitives:
[The unfamiliar world of OS X syscalls](http://blog.nullspace.io/day-266.html).
