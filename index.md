---
header: about me
layout: page
---

I'm a programmer in Montreal. I work with the people at
[Via Science](http://www.viascience.com) where I get to use Python to
find things out about cool datasets. I'm also co-organizing an event
called [Montreal All-Girl Hack Night](http://mtlallgirlhacknight.ca)
which is pretty fun.

<h2 class="darkorange">some recent posts</h2>

<div class="posts">
{% for post in site.posts  %}
    <div class="post">
        <h3> <a href="{{ post.url }}">{{ post.date | date:"%Y-%m-%d" }} -- {{ post.title }}</a> </h3>
        <div class="post-content">
            {{ post.content | more: "excerpt" }}
            <a href="{{ post.url }}" class="pull-right"> (see more) </a>
        </div>
    </div>
{% endfor %}
</div>
