---
layout: post
title: "Sketches for a graph layout engine"
date: 2013-12-31 14:23
comments: true
categories: coding
---

I'm working on a graph layout engine for the
[500 lines](https://github.com/aosabook/500lines) project, in Python.
In the spirit of
"[README-driven-development](http://tom.preston-werner.com/2010/08/23/readme-driven-development.html)",
I'm going to try to describe the library here before writing any code.

I'm going to start with writing to SVG, because it's easy to generate
SVGs without any libraries.

Here's the interface I'm starting with:

```
import graph_layout
graph = {
   "vertices": [1,2,3],
   "edges": [[1,2], [3,2]]
}
graph_layout.draw(graph, "test.svg")

# You can also draw a graph with a fixed width and height:

graph_layout.draw(graph, "test.svg", width=500, height=400, directed=False)
```

### Some design

I'd like to have an intermediate layout structure, to make it easy to
write layouts to different backends. One possible way to do this is to
just store the coordinates of each vertex.

```
layout = {
    1: (100, 200), 
    2: (200, 300), 
    3: (150, 150)
}
```

Then we can use the vertex locations and original graph together to
draw the graph.

And here are some code sketches:

```python
class SVG(object):
    """ etc etc ""
    def add_vertex(start, end):
        pass
    def add_edge(start, end):
        pass
    def write(filename):
        pas

def draw(graph, filename, width=None, height=None, directed=False):
    layout = _create_layout(graph, width, height)
    _draw_svg(layout, graph, filename, directed)

def _draw_svg(layout, graph, filename, directed):
    svg = SVG(width, height, directed)
    for vertex in graph["vertices"]:
        svg.add_vertex(layout[vertex])
    for v_from, v_to in graph["edges"]:
        svg.add_edge(layout[v_from], layout[v_to])
    svg.write(filename)

def _create_layout(graph, width=None, height=None):
    vertices = graph["vertices"]
    edges = graph["edges"]
    if width is None:
        width = 400
    if height is None:
        height = 400
```

We could factor the contents of `_draw_svg` into a more general
function, so that it could write to any kind of output. If/when we
need to do that, that'll be easy to change, though.

### The actual layout drawing

To start out, I'm thinking of using a force-directed layout, because
it's something I've seen a lot. There's a wikipedia article on
[force-directed graph drawing](https://en.wikipedia.org/wiki/Force-directed_graph_drawing),
and
[the d3 source](https://github.com/mbostock/d3/blob/master/src/layout/force.js?source=cc).
There's also the
[graphviz source](http://www.graphviz.org/Download_source.php). I
didn't find any of these really that helpful, though.

The D3 documentation links to this
[nice visual description of the Barnes-Hut algorithm](http://arborjs.org/docs/barnes-hut).
This doesn't actually explain how a force-directed layout works --
it's actually describing an optimization technique using quad trees.
So it's great, but not what I need to start with.

Some more Googling yielded this chapter on
[Force-Directed Drawing Algorithms](http://cs.brown.edu/~rt/gdhandbook/chapters/force-directed.pdf)
from the
[Handbook of Graph Drawing and Visualization](http://cs.brown.edu/~rt/gdhandbook/).

Here's the algorithm from the chapter:

```
algorithm SPRING(G:graph);
place vertices of G in random locations;
repeat M times
    calculate the force on each vertex;
    move the vertex some_constant ∗ (force on vertex)
    draw graph on CRT or plotter
```

It has suggestions for good constants to use, too.

This seems pretty great! Overall the book seems pretty authoritative
-- the chapter on circular graph drawing is by Janet Six & Ioannis
Tollis, who in my short research are the main people I've seen cited
on circular graph drawing.

### Making it pretty

I'm not a designer, but I'd like it to not be too ugly. One nice thing
about SVG as an output format is that you can style it using CSS. I'll
probably do that.
