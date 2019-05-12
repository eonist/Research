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
export const BlurType = {
    GaussianBlur: 0,
    MotionBlur: 1,
    ZoomBlur: 2,
    BackgroundBlur: 3
};
```

## Setting an image to a shape:

```javascript
const FillType = { Solid: 0, Gradient: 1, Pattern: 4, Noise: 5 };
const PatternFillType = { Tile: 0, Fill: 1, Stretch: 2, Fit: 3};

function loadLocalImage(filePath) {
    if(!NSFileManager.defaultManager().fileExistsAtPath(filePath)) {
        return null;
    }

    return NSImage.alloc().initWithContentsOfFile(filePath);
}

var layer = context.selection.firstObject();
if(layer && layer.style().firstEnabledFill()) {
   const fill = layer.style().firstEnabledFill()
    var image = loadLocalImage("/Applications/Sketch.app/Contents/Resources/app.icns");
    if(image) {
        fill.fillType = FillType.Pattern;
        fill.patternFillType = PatternFillType.Fill;
        fill.image = MSImageData.alloc().initWithImage(image);

    } else {
        context.document.showMessage("[erorr]: Can't load image!");
    }
} else {
    context.document.showMessage("[error]: Select a layer that has at least one fill style");
}
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

## Add a circle to group:

```javascript
var ovalShape = MSOvalShape.alloc().init();
ovalShape.frame = MSRect.rectWithRect(NSMakeRect(0,0,100,100));

var shapeGroup=MSShapeGroup.shapeWithPath(ovalShape);
var fill = shapeGroup.style().addStylePartOfType(0);
fill.color = MSColor.colorWithRGBADictionary({r: 0.8, g: 0.1, b: 0.1, a: 1});

context.document.currentPage().addLayers([shapeGroup]);
```
