### Adding CSS
- When making Jekyll websites, **CSS works exactly the same as normal**, because Jekyll is just outputting straight-up HTML—so, from the CSS’s perspective, Jekyll **doesn’t actually exist**.
- But it’s a good idea to link the CSS file with the `{{site.baseurl}}` for reliability.

```html
<link href="{{site.baseurl}}/css/main.css" rel="stylesheet">
```

Seems like this is the way we do it now:
```html
<link rel="stylesheet" href="{{ "/css/site.css" | prepend: site.baseurl }}"><!--  we prepend base url so we have a common root -->
```

### Theme editing: ✨
A css meta link would look like this: `"{site.baseurl}/css/common.css"`

### Target by layout:
You can target by doing `styles/{{page.layout}}.css` ???

### Since you want to keep divs simple, here is a way to define class selector combos
the yellow will take priority
**html**
```html
<div class="class1 class2" id="one two"></div>
```
**css**
```css
div{
    padding: 5px;
    border: 1px solid #f00
}
.class1.class2 {
    background-color: yellow;
}
.class1 {
    background-color: red;
}
.class2 {
    background-color: blue;
}
```
