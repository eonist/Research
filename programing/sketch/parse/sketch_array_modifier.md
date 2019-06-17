## Loop through and modify layers in an hierarchy

```javascript
/*
 * TODO: This could be done cleaner with the new forEach syntax
 */
function updateAllExistingStyles(doc, styleID, sharedStyles, index){
	var pages = doc.sketchObject.pages();	//reference the pages array in the document
	for (var i = 0; i < pages.count(); i++){
		var page = pages[i];	//reference each page
		var artboards = [page artboards];	//reference the artboards array of each page
		for (var z = 0; z < artboards.count(); z++){//loop through the artboards of each page
			var artboard = artboards[z];//reference each artboard of each page
			var layers = [artboard layers];//reference the layers array of each artboard
			for(var k = 0; k < layers.count(); k++){//loop through the layers array
				var layer = layers[k];//reference each layer of each artboard
				var objectID = layer.style().sharedObjectID();	//get the objectID of the shared style
				var style = sharedStyles.objects().objectAtIndex(index);//get the existing shared style
				if(objectID == styleID){	//check if the layer is using the older version of the shared style and refresh it with the new one
					layer.setStyle(style.newInstance());
				}
			}
		}
	}
}
```

## Functional modification:

```javascript
var onRun = function(context) {
  var sketch = context.api()
  sketch.selectedDocument.selectedLayers.iterate(layer => { // 👈 modern forEach syntax
    if (layer.isShape) {
      layer.style.fills = ["#ff0000"]
    }
  });
}
```
