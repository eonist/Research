# Looping posts:

Syntax for `_layouts/home.html`:

```
{% for post in site.posts %}
<li> <a href="{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
```

Then in the index.md set the layout to home

# output:
Will list:
post 1
post 2
post 3

## Pages:
Also works for pages in the site: to make a sitemap etc. `page in site.pages` etc
