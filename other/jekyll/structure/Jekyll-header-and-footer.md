
### Header and footer:
- First open you index.html file and look for stuff that will be common to every page, like headers, footers, DOCTYPE, etc.
- Cut that stuff and put it into a new file: default.html. It doesn’t have to be called “default”, that’s just a convention.
- Save this file into a folder named `_layouts.`

```yaml
_config.yml
_layouts/        ⬅︎ The layouts folder
  └ default.html
index.html
```
The file might look something like this:

```html
<!DOCTYPE html>
<html lang="en-ca">
<head>
  <meta charset="utf-8">
  <title>Website</title>
</head>
<body>
  <header>
    <h1></h1>
    <nav></nav>
  </header>
  <main>
    {{content}}
  </main>
  <footer>
    <p>©</p>
  </footer>
</body>
</html>
```


The {{content}} placeholder is where Jekyll will place the content from the index.html.

Then, inside your index.html, all you’ll have left is this:

```
---
layout: default
---

<h1>Homepage</h1>
```


If we have a folder setup like this:

```
_config.yml
_layouts/
  └ default.html
index.html
about.html
contact.html
```

Then, the navigation inside our layout would look like this:
```html

<nav>
  <ul>
    <li><a href="{{site.baseurl}}/">Home</a></li>
    <li><a href="{{site.baseurl}}/plant-eaters/">Plant eaters</a></li>
    <li><a href="{{site.baseurl}}/meat-eaters/">Meat eaters</a></li>
  </ul>
</nav>
```
