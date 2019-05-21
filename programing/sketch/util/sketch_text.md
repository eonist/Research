- more api calls: https://sketchplugins.com/d/925-mstextstyle-available-attributes/8

## Basic text (works ✅)

```javascript
var layer = MSTextLayer.alloc().init();
layer.stringValue = 'Black text\nAnother line';
var color = NSColor.colorWithRed_green_blue_alpha(0,0,0,1);
layer.changeTextColorTo(color);
layer.setFont(NSFont.fontWithName_size('Helvetica',32));
layer.textAlignment = NSTextAlignmentCenter;
//layer.lineHeight = 49;
//layer.setKerning(0.3);
var paragraphStyle = layer.paragraphStyle();
//paragraphStyle.setParagraphSpacing(32);
layer.addAttribute_value(NSParagraphStyleAttributeName, paragraphStyle);
context.document.currentPage().addLayer(layer)
```


## Text (works ✅)

```javascript

function createTextShape(textString){
	var sketch = context.api();
	var document = sketch.selectedDocument;
	var selection = document.selectedLayers;
	var page = document.selectedPage;
	var text = page.newText({
	    text: textString,
	    frame: new sketch.Rectangle(0, 0, 00, 00)// doesn't matter aperantly
	});
	var textStyle = text.sketchObject.style().textStyle(); // access the underlying sketch object and get its textstyle
	var mutableAttributes = NSMutableDictionary.dictionaryWithDictionary(textStyle.attributes());// textstyle consists of a dictionary of attributes, take a mutable copy of that dictionary
	mutableAttributes.setObject_forKey(NSColor.colorWithRed_green_blue_alpha(0,0,0,1),'NSColor'); // set the NSColor key for the attributes dictionary, set color to black
	textStyle.setValue_forKey_(mutableAttributes,'attributes');// write the attributes dictionary back onto the textstyle (and we're done)
	return text
}

createTextShape("Black text\nAnother line")
```


## Edit text:

```javascript
// Hex to Color - helper function
// Example: var color = hexToColor('4A90E2')
var hexToColor = function(hex, alpha) {
    var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex),
        red = parseInt(result[1], 16) / 255,
        green = parseInt(result[2], 16) / 255,
        blue = parseInt(result[3], 16) / 255,
        alpha = (typeof alpha !== 'undefined') ? alpha : 1;
    return NSColor.colorWithCalibratedRed_green_blue_alpha(red, green, blue, alpha)
}

// Select a Text Layer with at least 4 characters
var selection = context.selection,
    textLayer = selection.firstObject();

var range = NSMakeRange(1,3) // only edit text chars from 1 to 3
var color = hexToColor('4A90E2')
textLayer.setIsEditingText(true)
textLayer.addAttribute_value_forRange(NSForegroundColorAttributeName, color, range)
textLayer.setIsEditingText(false)
```

## Set attributes: (🚫 not working)

```javascript
var oLabel = label.sketchObject;   // label is Text object of new API

oLabel.setFontPostscriptName (name);
oLabel.setFontSize (size);
oLabel.setTextColor (color);
oLabel.setTextAlignment(align); // center
```


### Advance

```javascript
var sketch = context.api();
	var document = sketch.selectedDocument;
	var selection = document.selectedLayers;
	var page = document.selectedPage;
	var text = page.newText({
	    text: "textString",
	    frame: new sketch.Rectangle(0, 0, 00, 00)// doesn't matter aperantly
	});  


// Define attributes
  var attributes = {
      'NSColor': NSColor.blackColor(),
      'NSFont' : NSFont.fontWithName_size_("Helvetica", 32),
  };

  // Create text style
  var style = MSStyle.alloc().init();
  var textStyle = MSTextStyle.styleWithAttributes_(attributes);

  style.setTextStyle_(textStyle);

text.sketchObject.style = style
```
