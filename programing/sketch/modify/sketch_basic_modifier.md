## Basics

```javascript

var layer = context.selection.firstObject()
layer.setName("New name");// Sets a new name to item
layer.setIsVisible(!layer.isVisible()); // set the visibility of the layer
layer.setIsLocked(!layer.isLocked()); // locks the layer
var newLayerRotation = 180;
layer.setRotation(newLayerRotation);// rotates the layer
layer.setIsFlippedHorizontal(!layer.isFlippedHorizontal());
layer.setIsFlippedVertical(!layer.isFlippedVertical());
layer.setIsSelected(!layer.isSelected()); //selects the layer

log(layer.frame) // frame
log(layer.origin) // point
layer.origin = {x:20,y:20} // sets position of shape
var layer = context.selection[0]
layer.frame().setWidth(100);
layer.frame().setHeight(100);
layer.frame().setX(0)
layer.frame().setY(0)

layer.duplicate(); // duplicates a layer

if (layer) { layer.multiplyBy(2.0); }
var layerFills = layer.style().fills();

var artboard = context.selection[0];
//get the artboard frame for dimensions
var artboardFrame = artboard.frame();
artboardFrame.setWidth(300); // sets the width of the artboard with
artboardFrame.setHeight(300); // sets the height of the artboard with
```

## Blur
```javascript
const BlurType = {
    GaussianBlur: 0,
    MotionBlur: 1,
    ZoomBlur: 2,
    BackgroundBlur: 3
};
```


## Adding a shape to group:

```javascript
var shape = MSShapeGroup.layerWithPath(MSPath.pathWithBezierPath(path));
var fill = shape.style().addStylePartOfType(0); // `0` constant indicates that we need a `fill` part to be created
fill.color = MSColor.colorWithRGBADictionary({r: 0.8, g: 0.1, b: 0.1, a: 1});

var documentData = context.document.documentData();
var currentParentGroup = documentData.currentPage().currentArtboard() || documentData.currentPage()
currentParentGroup.addLayers([shape]);
```
