## Pages:
Also works for pages in the site: to make a sitemap etc write: `page in site.pages` etc

**html**
```
{% for page in site.pages %}
<li> <a href="{{ page.url }}">{{ page.title }}</a></li>
{% endfor %}
```

### Ordering pages hack: (order they loop)
```
pages/01_about.md
pages/02_photos.md
pages/03_projects.md
pages/99_contact.md
```

### Filtering on front-mater title:
Could potentially use collection as well to filter
```
{% if page.title != null %}
	 <li> <a href="{{ page.url }}">{{ page.title }}</a></li>
{% endif %}
```

You also use: `.dir` `.path` `.name` etc
