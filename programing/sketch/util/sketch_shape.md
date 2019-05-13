# Shape
Snippets regarding shapes in sketch

## Creates a new rectangle in page
```javascript
function createRectShape(frame,color) {
	var rectangle = MSShapeGroup.shapeWithRect(frame);
	var fill = rectangle.style().addStylePartOfType(0);
	fill.color = color
    return rectangle
}
const frame = {origin:{x:00, y:00}, size:{width:100, height:100}}
const color = MSColor.colorWithRed_green_blue_alpha(1, 0, 0, 1); // red
var rectShape = createRectShape(frame, color)
context.document.currentPage().addLayer(rectShape);
```

**Alternatively**

```javascript
const sketch = context.api();
const document = sketch.selectedDocument;
const page = document.selectedPage;
var rectangle = page.newShape({frame: new sketch.Rectangle(0, 0, 300, 300)});
```

**Alternatively**

```javascript
// New way of doing things
const document = sketch.getSelectedDocument();
const page = document.selectedPage;

var rect = new Rectangle(10, 10, 100,100);

var rectangle = new Shape({
 name: "new way",
 parent: page,
 frame: rect,
 style: {
   fills: ['#4A90E2']
 }
});
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
