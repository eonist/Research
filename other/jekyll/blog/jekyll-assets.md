### Printing assets

static files are pdf, png svg etc. all other files that does not have frontmater

`_layouts/home.html`

```
{% for file in site.static_files %} <!––looping through static files––>
	{{ file.path }} <br>
{% endfor %}
```

### Priunts out:
```
/assets/lightstream_logo_square.png
/assets/lightstream_logo_square.svg
/assets/roadmap.pdf
/assets/minima-social-icons.svg
```

### Other:

```
file.name
file.basename / without extension
file.extname / extension name
path / path to file, can be used to filter static content etc
modified_time / time of modification
```

### Misc:
There is also the ability to add frontmater to speccific assets/img paths etc. So you can target content only inside this path etc.
See this link for more info https://www.youtube.com/watch?v=knWjmVlVpso
