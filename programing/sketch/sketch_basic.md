## Log selected layers

```javascript
var selectedLayers = context.selection;
log(selectedLayers.count());
for(var i = 0; i < selection.count(); i++){
	var layer = selection[i];
	context.document.showMessage("layer.name: " + layer.name());
}
```

## Show message:

```javascript
var doc = context.document;
doc.showMessage(layer.name());
```

## Layer info:

```javascript
var layerClass = layer.class();
doc.showMessage(layerClass);//MSLayerGroug
log(layerFrame.width()) // 80
log(layerFrame.height()) // 80
log(layerFrame.x()) // 80
log(layerFrame.y()) // 80
var layerFills = layer.style().fills();
log("LayerFill: " + layerFills) // MSStyleFill
```
