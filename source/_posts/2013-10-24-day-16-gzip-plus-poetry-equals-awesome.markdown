---
layout: post
title: "Day 16: gzip + poetry = awesome"
date: 2013-10-24 21:16
comments: true
categories: 
---

Gzip compresses by replacing text with pointers to earlier parts of the text.
Here's a visualization of what actually happens when you decompress "The
Raven". It highlights the bits of text that are copied from previously in the
poem.

I showed this as a Thursday talk at Hacker School today :) I really like how
you can see the rhyming inside the poem like (rapping... tapping) come out in
the compression algorithm.

No sound, just gzip.

You can try it out if you want by cloning
[https://github.com/jvns/gzip.jl](https://github.com/jvns/gzip.jl) and
checking out the 'visualization' branch.

<iframe width="960" height="720" src="//www.youtube.com/embed/D2JWSNDgkoE" frameborder="0" allowfullscreen></iframe>