### Header and footer:
- First open your `index.html` file and look for stuff that will be common to every page, like headers, footers, DOCTYPE, etc.
- Cut that stuff and put it into a new file: default.html. It doesn’t have to be called “default”, that’s just a convention.
- Save this file into a folder named `_layouts/`

```yaml
_config.yml
_layouts/   ## ⬅︎ The layouts folder
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
    {{content}} <!-- This placeholder is where Jekyll will place the content from the index.html. -->
  </main>
  <footer>
    <p>©</p>
  </footer>
</body>
</html>
```

Then, inside your `index.md`, all you’ll have left is this:

```
---
layout: default ## <- we use the default layout as the wrapper
---

<h1>Homepage</h1> <!--  this is the content that we embed in the wrapper -->
```

If we have a folder setup like this:

```
_config.yml
_layouts/
  └ default.html
index.md
about.md
contact.md
```

Then, the **navigation** inside our layout would look like this:
```html
<nav>
  <ul>
    <li><a href="{{site.baseurl}}/">Home</a></li> <!-- index.md / index.html -->
    <li><a href="{{site.baseurl}}/contact/">Contact</a></li>
    <li><a href="{{site.baseurl}}/about/">About</a></li>
  </ul>
</nav>
```
