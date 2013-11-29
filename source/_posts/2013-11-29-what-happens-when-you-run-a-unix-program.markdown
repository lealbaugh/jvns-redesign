---
layout: post
title: "What happens when you run 'Hello, world'"
date: 2013-11-29 00:32
comments: true
categories: hackerschool coding
---

So today I experimented with a new way of learning -- I wanted to
understand what happens when I run a "hello world" program, but I
wasn't at Hacker School. So I wrote down my current understanding and
a bunch of questions and asked Twitter!

<blockquote class="twitter-tweet" lang="en"><p>if anyone has too much time and operating system knowledge, I&#39;d love comments and &quot;well, actually&quot;s on <a href="https://t.co/YqSyV5ap4Q">https://t.co/YqSyV5ap4Q</a></p>&mdash; Julia Evans (@b0rk) <a href="https://twitter.com/b0rk/statuses/406082448288522240">November 28, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

People left me tons of helpful comments in
[the gist](https://gist.github.com/jvns/7688286/), which made me
really happy.

I'm not going to reprise all of the discussion here, but here's an
incomplete summary of what needs to happen when a kernel runs an
executable. If you're interested, definitely check out
[the gist](https://gist.github.com/jvns/7688286/).

## The question: If I were an OS, what would I need to do to run "Hello, world?"

The original program was

```c
#include <stdio.h>
int main() {
    printf("Hello!\n");
}
```

and I statically compiled it by running `gcc -static -o hello hello.c`.
So we don't have to worry about dynamic linking or anything. (I very
much enjoyed
[this guide to linkers](http://www.lurklurk.org/linkers/linkers.html),
tangentially)

### Step 0: Simplify the program a bit

The first suggestion I got was to make it a bit easier by using
`write()` instead of `printf()`.

Running `strace ./hello` tells me all the system calls that happen,
including the `write()` system call:

```c
write(1, "Hello world!\n", 13)
```

So we can simplify this program down to

```c
int main() {
  write(1, "Hello world!\n", 13);
}
```

which removes the `#include` and some of the system calls. `printf()`
is a pretty complicated function, so it's better to not use it.

Now we can get down to the actual business of describing what happens
when the program executes! These are not in any particular order.

### Load the [code ("text")](http://en.wikipedia.org/wiki/Code_segment) into memory

In the binary there are a bunch of assembler instructions. These need
to be loaded into memory.

### Load the [data segment](http://en.wikipedia.org/wiki/Data_segment) into memory

A program might also have initialized and uninitialized global
variables. These need a place in memory.

I'd need to zero out the [BSS](http://en.wikipedia.org/wiki/.bss) out
here for sure.

### Set up the heap and stack

Programs need a heap and a stack.

Once these three things are done, we have the program's "address
space" in memory. This looks something like this (thanks to
[@danellis](http://github.com/danellis) for the diagram!)

<pre>
+---------------+
|    Stack      |
|      |        |
|      v        |
+---------------+
:               :
+---------------+
|      ^        |
|      |        |
|     Heap      |
+---------------+
|     Data      |
+---------------+
|     Code      |
+---------------+
</pre>

I'm still really not sure about the details of what this set up looks
like -- people talk a lot about virtual memory and I don't know how I
would implement that at all or if I would have to implement it.

### Handle system calls

User space programs interact with the kernel through "system calls".

If I run `strace -o hello.out ./hello`, I get this list of all the
system calls that happen when running `./hello`:

```
execve("./hello2", ["./hello2"], [/* 59 vars */]) = 0
uname({sys="Linux", node="kiwi", ...})  = 0
brk(0)                                  = 0xca9000
brk(0xcaa1c0)                           = 0xcaa1c0
arch_prctl(ARCH_SET_FS, 0xca9880)       = 0
brk(0xccb1c0)                           = 0xccb1c0
brk(0xccc000)                           = 0xccc000
write(1, "Hello world!\n", 13)          = 13
exit_group(13)                          = ?
```

I don't think I have to worry about the first two system calls, since
the first one is definitely called by my shell.

The `brk` system call is about moving the "program break" to allocate
memory. I'm not totally sure why it needs to allocate memory, but it
does.

The `write` system call I definitely feel like I could handle -- I
found an [example on the OSDev wiki](http://wiki.osdev.org/Bare_Bones)
of how to write to a VGA buffer, so that could work.

I'm guessing `exit_group` is about quitting the program, so I'd have
to do some cleanup or something. I have no idea what `arch_prctl` is.

I'm hoping to actually do some of this in the coming week at Hacker
School. I've been pointed to the
[OSDev wiki](http://wiki.osdev.org/Main_Page) which has all kinds of
fantastic explanations and tutorials.
