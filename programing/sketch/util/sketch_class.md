### Differentiate class types:

```js
for(var i = 0; i < selection.count(); i++){
			var layer = selection[i];
			var layerClass = layer.class();

			if(layerClass == "MSShapeGroup"){
			  //do something
			} else if (layerClass == "MSBitmapLayer"){
			  //do something
			} else if (layerClass == "MSTextLayer"){
			  //do something
			} else if (layerClass == "MSSymbolInstance"){
			  //do something
			} else if (layerClass == "MSSymbolMaster"){
			  //do something
			} else if (layerClass == "MSArtboardGroup"){
			  //do something
			} else if (layerClass == "MSLayerGroup"){
			  //do something
			}
		}
```
