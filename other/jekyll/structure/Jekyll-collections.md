# Collections
Collections are a mechanism in Jekyll that allow us to have a grouping of documents. The grouping can either act like datafiles or can act like pages and posts. In fact, posts are just built-in collections.

§Set up a collection in `_config.yml`
The first thing we need to do is create a collection in `_config.yml`, telling Jekyll how to handle it.

```
collection:
  comets:
    output: true
    permalink: /comets/:path/
```
The collection entry tells Jekyll we’re including new collections.
The comets entry is the name of our collection—we completely make it up.
The output entry is optional, here we’re telling Jekyll to turn the collection files into pages we can navigate to.
Without output the collection wouldn’t be navigable but could be pulled onto other pages like datafiles.
The permalink entry tells Jekyll how to generate the URL for the collection pages.
§Outputting collection documents
In a page on our website we can loop through all the documents of a collection to generate some HTML.

```
{% for comet in site.comets %}
  <h2>{{comet.title}}</h2>
  {{comet.content | markdownify}}
{% endfor %}
```

### Collection pages
If the collection is set to output we can add layouts and everything else we’re used to doing with regular pages.
