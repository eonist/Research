## Pages:
Also works for pages in the site: to make a sitemap etc. `page in site.pages` etc

```
{% for page in site.pages %}
<li> <a href="{{ page.url }}">{{ page.title }}</a></li>
{% endfor %}
```

- Ordering pages: (order they loop)
```
01_about.md
02_photos.md
03_projects.md
99_contact.md
```

### Filtering on frontmater title:
Could potentially use collection as well to filter
```
{% if page.title != null %}
	 <li> <a href="{{ page.url }}">{{ page.title }}</a></li>
{% endif %}
```

You also use: .dir .path .name etc
