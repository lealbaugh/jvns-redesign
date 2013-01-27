---
header: home
layout: page
---

Hi! I'm a programmer in Montreal. I work with the people at
[Viascience](http://www.viascience.com) where I get to use Python to find
things out about cool datasets. I'm also co-organizing an event called
[Montreal All-Girl Hack Night](http://mtlallgirlhacknight.ca) which is pretty
fun. 

<div class="posts">
{% for post in site.posts  %}
    <div class="post">
        <h3> <a href="{{ post.url }}">{{ post.date | date:"%Y-%m-%d" }} -- {{ post.title }}</a> </h3>
        <div class="post-content">
            {{ post.content | more: "excerpt" }}
        </div>
    </div>
{% endfor %}
</div>
