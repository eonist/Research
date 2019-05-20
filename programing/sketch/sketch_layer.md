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
