### Shared text style:

```javascript
// Font
const fontNS = NSFont.fontWithName_size_(weight, fontSize);

// Text Style
const textStyle = MSTextStyle.styleWithAttributes_({
  NSColor: color,
  NSFont: fontNS
});

// Create Style
const style = MSStyle.alloc().init();
style.setTextStyle_(textStyle);

// add the style to shared styles
const sharedTextStyles = context.document.documentData().layerTextStyles();
const s = MSSharedStyle.alloc().initWithName_firstInstance(name, style);

sharedTextStyles.addSharedObject(s);
```


### Get size of font:

```javascript
https://github.com/AdamSzakal/Sketch-Set-Font-Size-Plugin/blob/master/Sketch-Set-Font-Size.sketchplugin/Contents/Sketch/script.js
```
