## Loop through and modify layers in an hierarchy

```javascript
function updateAllExistingStyles(doc, styleID, sharedStyles, index){
	//reference the pages array in the document
	var pages = doc.sketchObject.pages();

	for (var i = 0; i < pages.count(); i++){
		//reference each page
		var page = pages[i];
		//reference the artboards array of each page
		var artboards = [page artboards];

		//loop through the artboards of each page
		for (var z = 0; z < artboards.count(); z++){
			//reference each artboard of each page
			var artboard = artboards[z];
			//reference the layers array of each artboard
			var layers = [artboard layers];

			//loop through the layers array
			for(var k = 0; k < layers.count(); k++){
				//reference each layer of each artboard
				var layer = layers[k];
				//get the objectID of the shared style
				var objectID = layer.style().sharedObjectID();
				//get the existing shared style
				var style = sharedStyles.objects().objectAtIndex(index);

				//check if the layer is using the older version of the shared style and refresh it with the new one
				if(objectID == styleID){
					layer.setStyle(style.newInstance());
				}
			}
		}
	}
}
```
