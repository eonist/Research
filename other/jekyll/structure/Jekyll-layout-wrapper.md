### Wrapper layout:

- make a `_layouts/wrapper.html` :
```
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
- link your wrapper.html in your custom.html frontmater to your `_layouts/custom.html` with:
```
---
layout: wrapper
---
```
- see the live result in safari
