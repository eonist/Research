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

## Set attributes:

```javascript
var oLabel = label.sketchObject;   // label is Text object of new API

oLabel.setFontPostscriptName (name);
oLabel.setFontSize (size);
oLabel.setTextColor (color);
oLabel.setTextAlignment(align); // center
```
