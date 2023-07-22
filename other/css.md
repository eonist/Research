# Centre stuff in css:
https://www.w3schools.com/css/css_align.asp

### Center Align Text
```css
.center {
  margin: auto;
  width: 50%;
  border: 3px solid green;
  padding: 10px;
}
```

### Center Align Text
- Only works for text, not div
```css
.center {
  text-align: center;
  border: 3px solid green;
}
```

### Center an Image
```css
img {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 40%;
}
```

### Center Vertically - Using padding
Drawback is that you have dont have controll over final height of the element
```css
.center {
  padding: 70px 0;
  border: 3px solid green;
  text-align: center;
}
```

### Center Vertically - Using line-height

```css
.center {
  line-height: 200px;
  height: 200px;
  border: 3px solid green;
  text-align: center;
}

/* If the text has multiple lines, add the following: */
.center p {
  line-height: 1.5;
  display: inline-block;
  vertical-align: middle;
}
```

### Center Vertically - Using position & transform
```css
.center {
  height: 200px;
  position: relative;
  border: 3px solid green;
}

.center p {
  margin: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
```

### Center Vertically - Using Flexbox
✨ This one is good. ✨ also works for multiline text
```css
.center {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 200px;
  /*display: inline-block; add this sometimes helps*/
}
```

### Using grid:
https://codepen.io/ahmadajmi/pen/XXzXVW

https://www.w3schools.com/howto/howto_css_responsive_header.asp



### Some tips:

**Centering things vertically:** 😅

```
outer div:
display: flex;

inner div:
margin: auto;
```
Alt 1:
```
outer:
justify-content: center;
display: flex;

inner:
align-self: center;
```
Alt 2:
```
outer:
display: flex;
justify-content: center;
align-items: center;
```

# Centre stuff in css:
https://www.w3schools.com/css/css_align.asp

### Center Align Text
```css
.center {
  margin: auto;
  width: 50%;
  border: 3px solid green;
  padding: 10px;
}
```

### Center Align Text
```css
.center {
  text-align: center;
  border: 3px solid green;
}
```

### Center an Image
```css
img {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 40%;
}
```

### Center Vertically - Using padding
Drawback is that you have don't have control over final height of the element
```css
.center {
  padding: 70px 0;
  border: 3px solid green;
  text-align: center;
}
```

### Center Vertically - Using line-height

```css
.center {
  line-height: 200px;
  height: 200px;
  border: 3px solid green;
  text-align: center;
}

/* If the text has multiple lines, add the following: */
.center p {
  line-height: 1.5;
  display: inline-block;
  vertical-align: middle;
}
```

### Center Vertically - Using position & transform
```css
.center {
  height: 200px;
  position: relative;
  border: 3px solid green;
}

.center p {
  margin: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
```

### Center Vertically - Using Flexbox
**This one is good**. also works for multiline text
```css
.center {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 200px;
}
```

### target nth:
```css
header nav ul li:nth-of-type(1) {
	background-color: cyan;
}
header nav ul li:nth-of-type(2) {
	background-color: yellow;
}
header nav ul li:nth-of-type(3) {
	background-color: magenta;
}
```


<img width="300" alt="img" src="https://github.com/stylekit/img/blob/master/one-pager-sections.gif?raw=true">

### The html
This html code can serve as your primer when fleshing out your website
```html
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="stylesheets/section.css">
<html>
    <body>
		 <div class="outer" id="one">
			 <div class="inner">
				 test
			 </div>
		 </div>
		 <div class="outer" id="two">
			 test
		 </div>
		 <div class="outer" id="three">test</div>
		 <div class="outer" id="four">test</div>
    </body>
</html>
```

### The CSS:
This html code can serve as your primer when fleshing out your website
```css
body {
  background-color: white;
}
html, body {
  height: 100%; /*This is the key to making each page fit your screen*/
  margin: 0px;
}
.outer {
   height: 100%; /*This is the key to making each page fit your screen*/
}
#one  {
  background: purple;
}
#two  {
  background: green;
}
#three  {
  background: red;
}
#four  {
  background: blue;
}
```

### Adding support for smaller screens:
use media querries

```css
@media screen and (max-width: 600px) {/*add styles for this size here*/}
```

Hide elements that doesnt fit on a smaller screen:
```css
display: none;
```
