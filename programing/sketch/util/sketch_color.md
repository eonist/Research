## Make color (from hex)

```swift
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

// colorFromString(ff00ff) // sketch color
function colorFromString(value) {
    var immutable = MSImmutableColor.colorWithSVGString_(value);
    return MSColor.alloc().initWithImmutableObject_(immutable);
}

// rgbToHex (255,0,0) // FF0000
function rgbToHex(r, g, b) {
    return "#" + ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1);
}
```

### RGB
```js

/**
* Create NSColor
* @param r
* @param g
* @param b
* @returns {*}
*/
function colorFromRGB(r, g, b) {
   return NSColor.colorWithDeviceRed_green_blue_alpha_(r / 255.0, g / 255.0, b / 255.0, 1);

```
