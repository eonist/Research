## Group

```javascript
var shapeGroup = MSShapeGroup.alloc().init();
context.document.currentPage().addLayers([shapeGroup]);
```

## Layer group

```js
var shapeGroup = MSLayerGroup.alloc().init();
log(shapeGroup);
shapeGroup.addLayers([maskLayer,bgImgLayer])
shapeGroup.setName("background-group")
```
