## looping

```javascript
var selection = context.selection;
for(var i = 0; i < selection.count(); i++){
	var layer = selection[i];
	var layerIsLocked = layer.isLocked();
	if(layerIsLocked == true){
	  layer.setIsLocked(false);
	}
}
```

## Looping class types:

```javascript
var layerClass = layer.class();
doc.showMessage(layerClass); // MSLayerGroug
//MSShapeGroup
//MSBitmapLayer
//MSTextLayer
//MSSymbolInstance
//MSSymbolMaster
//MSArtboardGroup
//MSLayerGroup
for(var i = 0; i < selection.count(); i++){
	var layer = selection[i];
	var layerClass = layer.class();
	if(layerClass == "MSShapeGroup"){}
	else if (layerClass == "MSBitmapLayer"){}
	else if (layerClass == "MSTextLayer"){}
	else if (layerClass == "MSSymbolInstance"){}
	else if (layerClass == "MSSymbolMaster"){}
	else if (layerClass == "MSArtboardGroup"){}
	else if (layerClass == "MSLayerGroup"){}
}
```
