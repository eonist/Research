
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


## Setting image to rect

```javascript
const sketch = context.api();
const document = sketch.selectedDocument;
const page = document.selectedPage;
const imageurl = "https://www.billboard.com/files/styles/900_wide/public/media/Fleetwood-Mac-Rumours-album-covers-billboard-1000x1000.jpg";
const imageURL = NSURL.alloc().initWithString(imageurl);//NSURL.fileURLWithPath(imageurl);
const image = NSImage.alloc().initByReferencingURL(imageURL);
//log("image: " + image)
const imageWidth = image.size().width
log("imageWidth: " + imageWidth)
const imageHeight = image.size().height
log("imageHeight: " + imageHeight)
const imageData = MSImageData.alloc().initWithImage(image);
//log("imageData" + imageData)
var rectangle = page.newShape();
var layer = rectangle.sketchObject;
var layerStyle = layer.style().fills().firstObject();
//log("layerStyle: " + layerStyle)
layerStyle.isEnabled = true;
layerStyle.patternFillType = 1;
layerStyle.setFillType(4);
layerStyle.image = imageData////layerStyle.setImage(imageData)

```
