Prety nice gradient UI tutorial: [raywenderlich](http://www.raywenderlich.com/90693/modern-core-graphics-with-swift-part-2) 
nice [her](http://code.tutsplus.com/tutorials/an-introduction-to-quartz-2d--cms-24267)   

**CGContextDrawLinearGradient**
on a graphics context. This procedure takes five parameters:

**Graphics context**
Specifies the graphics context on which the axial gradient will be drawn.

**Axial gradient**
The handle to the axial gradient object. We created this gradient object using the CGGradientCreateWithColorComponents function.

**Start point**
A point on the graphics context, specified by a CGPoint, that indicates the start point of the gradient.

**End point**
A point on the graphics context, specified by a CGPoint, that indicates the end point of the gradient.

**Gradient drawing options**
Specifies what happens if your start or end point isn’t at the edge of the graphical context. You can use your start or end color to fill the space that lies outside the gradient. Specify one of the following values for this parameter:
- kCGGradientDrawsAfterEndLocation (Extends the gradient to all points after the ending point of the gradient.)
- kCGGradientDrawsBeforeStartLocation (Extends the gradient to all points before the starting point of the gradient.)
- 0 (Does not extend the gradient in any way)
To extend colors on both sides, specify both the “after” and “before” parameters as a
logical OR (using the | operator). We’ll see an example later:

Drawing a gradient (note how the gradient is composed pretty cool)
```objc
- (void)drawRect:(CGRect)rect{ // Drawing code
	CGContextRef currentContext = UIGraphicsGetCurrentContext();
	CGContextSaveGState(currentContext);
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	UIColor *startColor = [UIColor orangeColor]; CGFloat *startColorComponents =
	(CGFloat *)CGColorGetComponents([startColor CGColor]);
	UIColor *endColor = [UIColor blueColor]; CGFloat *endColorComponents =
	(CGFloat *)CGColorGetComponents([endColor CGColor]); CGFloat colorComponents[8] = {
	/* Four components of the orange color (RGBA) */ startColorComponents[0],
	startColorComponents[1],
	startColorComponents[2],
	startColorComponents[3], /* First color = orange */
	/* Four components of the blue color (RGBA) */ endColorComponents[0],
	endColorComponents[1],
	endColorComponents[2],
	endColorComponents[3], /* Second color = blue */ };
	CGFloat colorIndices[2] = {
	0.0f, /* Color 0 in the colorComponents array */ 1.0f, /* Color 1 in the colorComponents array */
	};
	CGGradientRef gradient = CGGradientCreateWithColorComponents (colorSpace,
	(const CGFloat *)&colorComponents, (const CGFloat *)&colorIndices, 2);
	CGColorSpaceRelease(colorSpace); CGPoint startPoint, endPoint; startPoint = CGPointMake(120,
	260);
	endPoint = CGPointMake(200.0f, 220);
	CGContextDrawLinearGradient (currentContext,
	gradient, startPoint, endPoint,
	kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
	CGGradientRelease(gradient);
	CGContextRestoreGState(currentContext); 
}
```
