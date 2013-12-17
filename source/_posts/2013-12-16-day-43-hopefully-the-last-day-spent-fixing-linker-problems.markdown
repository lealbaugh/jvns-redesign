---
layout: post
title: "Day 43: SOMETHING IS ERASING MY PROGRAM WHILE IT'S RUNNING"
date: 2013-12-16 23:28
comments: true
categories: hackerschool kernel coding
---

alternate title: "Hopefully the last day I spend all day trying to
compile my code properly"

Today I went through the following:

1. Decide to try to write some code
1. Upgrade Rust, since my version is 8 days old
1. Oh no, the new Rust breaks my oldish version of [rust-core](http://github.com/thestinger/rust-core)
1. Upgrade rust-core
1. Oh no, the new rust-core requires me to compile in a different way
1. Spend a bunch of time messing with `clang` and friends to get
   everything to compile again
1. Everything compiles. Yay!
1. Try to run code
1. Encounter mystery bug again, where my array mysteriously contains
   0s instead of its actual contents
1. Make sad faces
1. Go talk to [Allison](http://akaptur.github.io). Allison is the best.
1. Allison asks: "What linker debugging strategies do you have?"
   1. Change the linker script randomly (actual thing that has worked)
   1. Change variable attributes from 'private' to 'public' at random
      (actual other thing that has worked)
   1. Look at the linker map or symbol table (not helpful, so far)
   1. Attach gdb to qemu and inspect the contents of memory (!!!)

gdb is great. It let me

* search my memory for "QWERTY" (not there! why not?)
* look at the memory at a given address (lots of zeros! huh!)
* Do a core dump, and compare it to the original file. Lots of zeros!
  Why is half my program gone?

SURPRISE MY CODE IS NOT WORKING BECAUSE SOMETHING IS ERASING IT.

Can we talk about this?

1. I have code
1. I can compile my code
1. Half of my binary gets overwritten with 0s at runtime. Why. What
   did I do to deserve this?
1. No wonder the order I put the binary in matters.

It is a wonder that this code even runs, man. Man.
