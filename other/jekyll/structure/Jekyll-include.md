# Includes
- Includes are reusable pieces of HTML, akin to symbols in Illustrator. We can create one file with some HTML in it, then use that file in multiple locations. If we update the single file all uses will automatically get updated.
- To create an include we first need to make the specialized folder: `_includes`. Put it in the root folder, the same place as `_layouts` and index.html.

```
_config.yml
_includes/    ⬅︎ The includes folder
_layouts/
index.html
```

- Then inside that folder make your HTML file, named with the .html extension. Here’s an example:

button.html

```
<a class="btn" href="/go/">Go!</a>
```
In any of our Jekyll pages, we can use the include file to output whatever HTML is inside it:

index.html

```
---
layout: default
---
{% include button.html %}
{% include button.html %}
```

Notice that we’re using the include tag to bring in the HTML twice into the file.

§Include parameters
With the above (very simple) example, there’s a small issue: both buttons would say “Go!” and point to the same page. We can overcome this limitation by using include parameters.

First, we change our include to have place holders in it, like this:

button.html

```
<a class="btn" href="{{include.url}}">{{include.text}}</a>
```
Notice that we changed the variable sections to place holders {{include.url}} and {{include.text}}. The include. part indicates the information is coming from an include. The part that comes after the dot is just made up.

Now, in our HTML we can adjust the includes to have the variable information:

index.html

```
---
layout: default
---
{% include button.html url="/prev/" title="Previous" %}
{% include button.html url="/next/" title="Next" %}
```
My example above is extremely simple, and probably doesn’t make sense to do for a button (because the include code is practically the same length as the original HTML), but hopefully it communicates the powerful idea behind includes.

## Relative includes
We don’t have to put our includes into the `_includes` folder if we use the include_relative function instead. This function will look inside the same folder as the current file for the include to insert. It works really great for concatenating CSS files together.

```
---
---
{% include_relative header.css %}
{% include_relative footer.css %}
{% include_relative nav.css %}
{% include_relative cards.css %}
```

This could be a main.css file that includes all the other smaller files to make our website more performant.

### Other example:

In `_includes/header.html`:
```
<h1 style="color: {{ include.color }}">{{ site.title }}</h1>
<hr><br>
```

In `_layouts/wrapper.html`:
```
{% include header.html color="blue" %} // styles the title blue
```
