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
	else if (layerClass == "MSBitmapLayer") {}
	else if (layerClass == "MSTextLayer") {}
	else if (layerClass == "MSSymbolInstance") {}
	else if (layerClass == "MSSymbolMaster") {}
	else if (layerClass == "MSArtboardGroup") {}
	else if (layerClass == "MSLayerGroup") {}
}
```

### Finding things

```javascript
/**
 * iterate over a list and match the name of the item with the input key
 * @param  {NSArray} list input list to be iterated on
 * @param  {String} key  string value to be matched with the name of elements
 */
function findByIterating(list, key){
  for (var i =0; i < list.count(); i++) {
      var elementKey = list.objectAtIndex(i).name();
      if (elementKey && elementKey.isEqualToString(key)) {
          return list.objectAtIndex(i);
      }
  }
  return nil;
}

/* Layer */
function findLayerByName(artboard, name) {
  return findByIterating(artboard.layers(), name);
}

/* Page */
function findPageByName(pages, name) {
    return findByIterating(pages, name);
}

/* Symbol */
function findSymbolByName(doc, name){
  return findSymbolByName(getSymbols(doc), name)
}

function findSymbolByName(symbols, name) {
    return findByIterating(symbols, name);
}
```
