### Wrapper layout:
- This is a way to reuse boilerplate code in each layout html file

- Make a `_layouts/wrapper.html` :
```html
<html>
	<head>
	  <meta charset="utf-8">
	  <title>Document</title>
	</head>
	<body>
		wrapper<br>
		{{ content }}
		<br>wrapper
	</body>
</html>
```
- Link your wrapper.html in your custom.html frontmater to your `_layouts/custom.html` with:
```
---
layout: wrapper
---
```
- See the live result in safari
