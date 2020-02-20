# Includes:


In `_includes/header.html`:
```
<h1 style="color: {{ include.color }}">{{ site.title }}</h1>
<hr><br>
```

In `_layouts/wrapper.html`:
```
{% include header.html color="blue" %} // styles the title blue
```
