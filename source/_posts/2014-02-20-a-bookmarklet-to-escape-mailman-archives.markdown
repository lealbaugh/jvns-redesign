---
layout: post
title: "A bookmarklet to flee from Mailman archives"
date: 2014-02-20 19:14:00 -0800
comments: true
categories: coding
---


This is about going down a rabbit hole.

Yesterday I tweeted about how I read the Architecture of Open Source
Applications [chapter on LLVM](http://www.aosabook.org/en/llvm.html),
and how it says that the reason that LLVM is successful is that it has
a well-defined IR.

People immediately replied saying "But LLVM's IR isn't well-defined at
all!" and pointed me to this super interesting
[post to LLVMdev](http://lists.cs.uiuc.edu/pipermail/llvmdev/2011-October/043719.html)
discussing that.

<!-- more -->

I read it, and then wanted to start reading some of the replies to get
a better sense of the debate around this. But reading mailman archives
is *terrible*! So I asked some people on Twitter how to fix it, and
they universally said [Gmane!](http://gmane.org).

So, since we're programmers and we like going down rabbit holes, I
started writing a bookmarklet to take me from an offending Mailman
archive page to a much prettier Gmane page. For example,
[here's the Gmane page for that LLVM discussion](http://comments.gmane.org/gmane.comp.compilers.llvm.devel/43769).

Right now it just does a Google search for `site:comments.gmane.org <first 100 characters from the article>`,
and then you have to click on the first result. I couldn't get I'm
Feeling Lucky to work for some unknown reason.

If you're interested in such a thing, you can drag this to your
bookmarks bar:

<a href="javascript:var i,s,ss=['//raw.github.com/jvns/fix-my-mailman/master/fix-my-mailman.js','//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js'];for(i=0;i!=ss.length;i++){s=document.createElement('script');s.src=ss[i];document.body.appendChild(s);}void(0);">Fix my mailman!</a>

You can test it out on
[the LLVM post that started it all](http://lists.cs.uiuc.edu/pipermail/llvmdev/2011-October/043719.html).

It is a grand total of 5 lines of code right now, and the source is
[up on GitHub](https://github.com/jvns/fix-my-mailman). If anyone
has an idea for how to make this better I'd love to hear it.

Thanks is due to [Monica](http://notwaldorf.github.io) because I stole
most the bookmarklet code from her amazing
[ransom note bookmarklet](http://notwaldorf.github.io/posts/dear-sir-or-madam/).
