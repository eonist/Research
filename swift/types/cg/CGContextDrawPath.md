**From this post:**
[here](http://stackoverflow.com/questions/12467779/iphone-separate-stroke-and-fill-not-working) 

You call CGContextDrawPath, CoreGraphics draw (fill or stroke) the CGPathRef that you previously added to the context, and then remove the CGPathRef from that context has it has been used.

So if you have called CGContextDrawPath in your first "if" condition, you simply need to re-add your CGPathRef to your context before you can draw it again.

Besides, it would be more effective to add your path to your context only if you need to either fill or stroke it (or both) and don't add it if neither fillColor nor strokeColor is nil (ne need to build/add your path if you won't fill nor stroke it).

As you pointed out yourself, anyway, there is a constant to both fill and stroke at the same time, called kCGPathFillStroke. So your code may look like this:
```swift
// Don't draw anything if both colors are nil
if (self.graphic.fillColor || self.graphic.strokeColor) {
  // Build and add your CGPathRef here
  CGPathRef path = ...
  CGContextAddPath(context, path);

  // Then either fill, stroke, or fillstroke the path.
  CGPathDrawingMode mode;
  if (self.graphic.fillColor){
    CGContextSetFillColorWithColor(context, self.graphic.fillColor);
    mode = kCGPathFill;
  }
  if (self.graphic.strokeColor){
    CGContextSetStrokeColorWithColor(context, self.graphic.strokeColor);
    CGContextSetLineWidth(context, self.graphic.strokeWidth);
    // if we also have a fillcolor, use fillstroke mode. Else just use stroke.
    mode = (self.graphic.fillColor) ? kCGPathFillStroke : kCGPathStroke;
  }
  CGContextDrawPath(context, mode);
}

```
**That way:**

if you only have fillColor and no strokeColor, you will only set the fill color and use kCGPathFill.
if you only have strokeColor and no fillColor, you will only set stroke color and line with, and use kCGPathStroke
if you have both colors assigned, you will set both fill color, stroke color and line with, and use kCGPathFillStroke.