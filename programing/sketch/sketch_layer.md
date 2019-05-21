## Get first layer (✅ works)

```javascript
var selectedLayers = context.selection;
log("Count: " + selectedLayers.count());
var firstSelectedLayer = selectedLayers.firstObject();
```

## Layer data

```javascript
/**
 * If the selected layer is a group, get its first child, and return a single layer
 * @param  {NSLayer} selectedLayer The layer selected at run time
 * @return {NSLayer}               The layer selected, or the first child if a group
 */
function getSelectedLayer(selectedLayer) {
	var selectedLayerType = selectedLayer.class();

	if (selectedLayerType == MSLayerGroup) {
		return getSelectedLayer(selectedLayer.layers().firstObject());
	} else {
		return selectedLayer;
	}
}
var sketch     = context.document; //doc ref
var selection  = context.selection; //grabs the selected item
var selectedLayer     = getSelectedLayer(selection.firstObject());
var originalFill      = selectedLayer.style().fills().firstObject();
var originalBorder    = selectedLayer.style().borders().firstObject();
var originalShadow    = selectedLayer.style().shadows().firstObject();
```

## Get layers:

```javascript
log('This is an example Sketch script.');

var documentName = context.document.displayName();
log('The current document is named: ' + documentName);

var selectedLayers = context.selection;
var selectedCount = selectedLayers.count();

if (selectedCount == 0) {
  log('No layers are selected.');
} else {
  log('Selected layers:');
  for (var i = 0; i < selectedCount; i++) {
    var layer = selectedLayers[i];
    log((i+1) + '. ' + layer.name());
  }
};
```
