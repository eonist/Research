### Basic

```js
function makeColor(SVGString) {
    return MSImmutableColor.colorWithSVGString(SVGString).newMutableCounterpart();
}

makeColor("#505050");

function makeGradient(SVGStrings) {
    var stops = [];
    var numStops = SVGStrings.length-1;
    SVGStrings.forEach(function(SVGString, index) {
        var color = makeColor(SVGString);
        var stop = MSGradientStop.stopWithPosition_color_(index/numStops, color);
        stops.push(stop);
    });

    var gradient = MSGradient.new();
    gradient.setStops(stops);
    return gradient;
}
const gradient = makeGradient(["#FF0000", "#00FF00", "#0000FF"])
log(gradient)
```

## Basic 2

```js

//
function msColor(r, g, b, a) {
    var nsColor = NSColor.colorWithDeviceRed_green_blue_alpha_(r, g, b, a)
	 log(nsColor)
    var immutable = MSImmutableColor.colorWithNSColor(nsColor);
    return MSColor.alloc().initWithImmutableObject_(immutable);
}
/**
 * Gradient
 */
function gradient(obj) {
    var msGradient = MSGradient.alloc().init();
    msGradient.setGradientType(obj.type);
    msGradient.setFrom(CGPointMake(obj.from[0], obj.from[1]));
    msGradient.setTo(CGPointMake(obj.to[0], obj.to[1]));
    for (var i = 0; i < obj.stops.length; i++) {
        var stop = MSGradientStop.stopWithPosition_color(obj.stops[i].position, (obj.stops[i].color));
        msGradient.addGradientStop(stop);
    }
    return msGradient;
}
/**
 * @Note: type can be 0 for linear, 1 for radial or 2 for angular
 * @Note: use 'from' and 'to' to create angle gradient
 */
function applyGradient(layer, msGradient) {
	var addGradient = layer.style().addStylePartOfType(0);
	addGradient.setGradient(msGradient);
	context.document.reloadInspector();
}
var layer = context.selection.firstObject();
var color1 = msColor(0, 1, 0, 1)
var color2 = msColor(1, 0, 1, 1)
var msGradient = gradient({type: 0, from: [0,0], to: [0,1], stops: [{position: 0, color: color1}, {position: 1, color: color2}]});
applyGradient(layer, msGradient)
```

### Better solution: ✅

```js
/**
 * MSColor
 */
function msColor(r, g, b, a) {
    var nsColor = NSColor.colorWithDeviceRed_green_blue_alpha_(r, g, b, a)
	 log(nsColor)
    var immutable = MSImmutableColor.colorWithNSColor(nsColor);
    return MSColor.alloc().initWithImmutableObject_(immutable);
}
/**
 * MSGradient
 */
function msGradient(colors) {
    var stops = [];
    var numStops = colors.length-1;
    colors.forEach(function(color, index) {
        //var color = makeColor(SVGString);
        var stop = MSGradientStop.stopWithPosition_color_(index/numStops, color);
        stops.push(stop);
    });

    var gradient = MSGradient.new();
    gradient.setStops(stops);
    return gradient;
}

/**
 * @Example: applyGradient(context.selection.firstObject();msGradient([msColor(0, 0, 0, 0), msColor(0, 0, 0, 1)]))
 */
function applyGradient(layer, gradient) {
	var addGradient = layer.style().addStylePartOfType(0);
	addGradient.setGradient(gradient);
	context.document.reloadInspector();
}

var layer = context.selection.firstObject();
var color1 = msColor(0, 0, 0, 0)
var color2 = msColor(0, 0, 0, 1)
const gradient = msGradient([color1,color2])
applyGradient(layer, gradient)
```


## More advance gradient code
```js
https://github.com/andrewfiorillo/sketch-palettes/blob/5b6bfa6eb25cb3244a9e6a226df259e8fb31fc2c/Sketch%20Palettes.sketchplugin/Contents/Sketch/sketchPalettes.js#L277
```
