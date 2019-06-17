### Get layer in artboard:

```js
var firstPage = context.document.pages().firstObject()
var artboard = firstPage.artboards().firstObject()
log(artboard)
var layer = artboard.layers().firstObject()
log(layer)

```

## Get first selected layer (✅ works)

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

## Make layer:

```js
var rect = NSMakeRect(0, 0, 100, 100)
var rectangle = MSRectangleShape.alloc().initWithFrame(rect)
```

## Remove layer:
```js
layer.parentGroup().removeLayer(layer);
```

## Remove all layers in artboard:

```js
var sketch = context.api();
sketch.selectedDocument.selectedPage.iterate(function(artboard){
  if (artboard.name == 'Artboard') {
    var layers = [];
    artboard.iterate(function(layer){
      layers.push(layer);
    });
    layers.forEach(function(layer){
        layer.remove();
    });
  }
});
```

## make rect layer
```js
let ShapePath = sketch.ShapePath
let mySquare = new ShapePath({
    parent: myArtboard,
    frame: { x: 53, y: 213, width: 122, height: 122 },
    style: { fills: ['#35E6C9']}
})
```

## make triangle shape layer:


```js
let myTraingle = new ShapePath({
    shapeType: ShapePath.ShapeType.Triangle,
    parent: myArtboard,
    frame: { x: 84, y: 62, width: 98, height: 80 },
    style: { fills: ['#00d5ffb3']}
})
```

## make polygon:

```js
let myHex = new ShapePath({
    shapeType: ShapePath.ShapeType.Polygon,
    parent: myArtboard,
    frame: { x: 218, y: 142, width: 120, height: 120 },
    style: { fills: ['#FF00B366']}
})
```

## make circle:

```js
let myCircle = new ShapePath({
    shapeType: ShapePath.ShapeType.Oval,
    parent: myArtboard,
    frame: { x: 106, y: 102, width: 172, height: 172 },
    style: { fills: ['#0006FF66']}
})
```

## Layer depth:

```js
layer.moveToFront()
layer.moveToBack()
layer.moveForward()
layer.moveBackward()
let index = layer.index
//the layers current position
layer.index = 2
// assigning the index to a particular position
```

## Remove all layers in page
```js
/**
 * Clears the document for content
 * @Param page: The page to be cleared (removes all artboards)
 * @Example: clearPage(context.document.pages().firstObject())
 * @TODO: Use reverse for loop instead of while?
 */
function clearPage(page) {
    var theLayers = page.layers()  // store the layers in a new array
	while(theLayers.length > 0) {
        var theLayer = theLayers[0]
		theLayer.removeFromParent();
	}
}
/**
 * Clears the first page in a document
 */
function clearFirstPage() {
   var page = context.document.pages().firstObject()
   log(page)
   clearPage(page)
}
clearFirstPage()

```
