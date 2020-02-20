## Layout:
In the dir: (you can define custom layouts)
`_layouts/custom.html`

### In the custom.html:
```html
<h1>This is a post </h1>
<hr>
{{ content }}
```

### In the frontmater of the about.md

```
---
layout: custom
title: About
permalink: /about/
---
```
### Then you will see in safari:
This is a post
then whatever is in your markdown here

### Other expands

```
<h3>{{ layout.author }}</h3> # for layout author
<h1>{{ page.title }}</h1> # for page title
<title>{{ site.title }}</title> # Edits the html title
```

more expands: [https://jekyllrb.com/docs/variables/](https://jekyllrb.com/docs/variables/) 
