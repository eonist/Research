### Adding CSS
- When making Jekyll websites, CSS works exactly the same as normal, because Jekyll is just outputting straight-up HTML—so, from the CSS’s perspective, Jekyll doesn’t actually exist.
- But, it’s a good idea to link the CSS file with the `{{site.baseurl}}` for reliably.
```
<link href="{{site.baseurl}}/css/main.css" rel="stylesheet">
```

### Theme editing:
A css meta link would look like this: `"{site.baseurl}/css/common.css"`

### Target by layout:
you can target by doing `page.layout`
