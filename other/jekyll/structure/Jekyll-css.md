### Adding CSS
- When making Jekyll websites, CSS works exactly the same as normal, because Jekyll is just outputting straight-up HTML—so, from the CSS’s perspective, Jekyll doesn’t actually exist.
- But it’s a good idea to link the CSS file with the `{{site.baseurl}}` for reliability.
```
<link href="{{site.baseurl}}/css/main.css" rel="stylesheet">
```

### Theme editing: ✨
A css meta link would look like this: `"{site.baseurl}/css/common.css"`

### Target by layout:
you can target by doing `page.layout` ???

### Since you want to keep divs simple, here is a way to define class selector combos
the yellow will take priority
```html
<div class="class1 class2" id="one two"></div>
```

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
