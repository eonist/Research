## Log selected layers

```javascript
var selectedLayers = context.selection;
log(selectedLayers.count());
for(var i = 0; i < selection.count(); i++){
	var layer = selection[i];
	context.document.showMessage("layer.name: " + layer.name());
}
```

## Layer info:

```javascript
var layerClass = layer.class();
doc.showMessage(layerClass); // MSLayerGroug
log(layerFrame.width()) // 80
log(layerFrame.height()) // 80
log(layerFrame.x()) // 80
log(layerFrame.y()) // 80
var layerFills = layer.style().fills();
var styleID = layer.style().objectID();// if the layer has a style applied
log("LayerFill: " + layerFills) // MSStyleFill
log("fillColor: " + layerFills[0].color();) // (r:1.000000 g:0.000000 b:0.000000 a:1.000000)
var fillColor = layerFills[0].color();
var hexColor = fillColor.immutableModelObject().hexValue()
log("hexColor: " + hexColor) // FF0000

var originalBorder    = layer.style().borders().firstObject();
log("originalBorder: " + originalBorder.color().immutableModelObject().hexValue()) // 00FF57
log("layerIsVisible: " + layer.isVisible()) //1, 0

log("layer.isFlippedHorizontal: " + layer.isFlippedHorizontal()) // 0
log("layer.isFlippedVertical: " + layer.isFlippedVertical()) // 0
log("layer.rotation()" + layer.rotation())
log("layer.isSelected()" + layer.isSelected()) // 1
log("layer  " + layer.absoluteRect() ) // rect based on absolute doc metrics
log("layer  " + layer.CSSAttributeString() ) // css attribs


// Gets parent layer:
log("layer.parentGroup() " + layer.parentGroup().name() ) // group 2
```

#### Get color of selected shape:
```swift
var selectedLayers = context.selection;
log("Count: " + selectedLayers.count());
var layer = selectedLayers[0];
var layerFills = layer.style().fills();
log("layerFills.count" + layerFills.count())
var fillColor = layerFills[0].color();
var hexColor = fillColor.immutableModelObject().hexValue()
log("hexColor: " + hexColor) // FF0000
```

## TextLayer info:
```javascript
layer.stringValue()
```

## Access artboard:

```javascript
var artboard = context.selection[0];
log("artboardWidth: " + artboard.frame().width()) // 200
log("artboardHeight: " + artboard.frame().height()) // 200
```
