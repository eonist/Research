Todos: 
- [ ] Skim the second Quartz book to see if you missed something in the first
- [ ] Go through apples Quartz book and online website to add stuff that are new etc. 
- [ ] Add more imagery
- [ ] Read Saving and Restoring a Coordinate System page  01

**Goals of this research paper:**     
This research paper should result in a comprehensive Graphics Util lib, so that you can work efficiently with quartz

**Things this research paper covers:**  
- Drawing paths
- Stroking and filling paths
- Transformations of Paths
- Applying Shadows to paths
- Applying stroke and fill Gradients 
- An overview of all the convenience methods quartz offer. (**So that you know what it doesn't offer**)
- Working with text

**Things this research paper does not cover:**    
- Quartz ColorSpace
- Images (although basic imagery techniques should be covered in the future)
- BlendModes
- PDF support
- Using the quartz pattern function
- Working with Colorspaces
- CGDataProider and CGDataConsumer


# Misc
**CGContextClosePath** prior to calling CGContextStrokePath to stroke the path, it is closed by calling  
**Important** Changes to the current transformation matrix (CTM) do not affect the coordinates of path segments already added to the current path.


# Context Path Construction Primitives:   
All paths in Quartz can be constructed using one or more of the following five basic path construction primitive functions, regardless of the complexity of the path.
- **CGContextMoveToPoint** begins a new subpath in the current path.
- **CGContextAddLineToPoint** adds a straight line segment to the current path.
- **CGContextAddCurveToPoint** adds a cubic Bézier curve segment to the current path.
- **CGContextAddQuadCurveToPoint** adds a quadratic Bézier curve segment to the current path.
- **CGContextClosePath** ends the current path.

**Creating paths within the context**:
1. The first step when constructing a new path, whether constructing it with the path primitive functions or convenience functions, is to discard any existing path with the function **CGContextBeginPath**.
2. the next step is to call **CGContextMoveToPoint** to establish the initial point of the first subpath; this also establishes a current point. You then add segments to the path using the other path construction primitives
3. you can begin a new subpath in the cur- rent path that you are constructing by calling **CGContextMoveToPoint**.
4. **CGContextAddLineToPoint** adds a straight-line segment from the current point to a new point in user space


**CGContextAddCurveToPoint** Adds a cubic Bézier curve segment to a Quartz path. This function takes the following parameters:
1. **context**, the graphics context to add the path to.
2. **cp1x**,**cp1y**, the x and y coordinates for the first control point.
3. **cp2x**,**cp2y**, the x and y coordinates for the second control point. I p1x,p1y, the x and y coordinates for the endpoint of the curve.

**CGContextAddQuadCurveToPoint** adds a quadratic Bézier curve seg- ment to a Quartz path. This function takes the following parameters:
1. **context**, the graphics context to add the path to.
2. **cpx**,**cpy**, the x and y coordinates for the control point.
3. **p1x**,**p1y**, the x and y coordinates for the endpoint of the curve.

# Context Path Construction Convenience Functions  
- **CGContextAddRect** Adds a closed rectangular subpath to the current path
- **CGContextAddLines** To add a number of connected line segments at once, you can use the function . You supply an array of points and Quartz constructs a new subpath using these points. The first point in the array is the initial point on the subpath. The first line segment is constructed from the initial point to the second point in the array. Each subsequent line segment is constructed from the trailing endpoint of the previous line segment to the next point in the array. The final result is a series of connected line segments. When CGContextAddLines returns, the current point is the last point in the array of points passed to the function. The resulting subpath is open; you must call CGContextClosePath if you want to close it.
- **CGContextAddArc** All angles in Quartz are specified in radians. The zero angle is along the positive x axis in Quartz coordinates and positive angles increase counterclockwise. The convenience function CGContextAddArc adds an arc segment to the current path. The starting point of the arc is defined by the values of centerX, centerY, radius, and startAngle. The ending point of the arc is defined by centerX, cen- terY, radius, and endAngle. The direction of the arc depends on the value of the clockwise parameter passed to the function. After this function returns, the cur- rent point of the current path is the ending point of the arc segment. The result- ing subpath is open; you must call CGContextClosePath if you want to close it.If a current point exists in the path prior to calling CGContextAddArc, Quartz first adds to the path a line segment from the current point to the starting point of the arc, then adds the arc segment. If there is no current point defined in the cur- rent path, this function adds only the arc segment to the path. takes the following parameters:

**CGContextAddArc** takes these arguments:  
1. **context** the graphics context to add the path to.
2. **centerX** **centerY** the x and y coordinates for the center of the circle thatdefines the arc.
3. **radius** the radius of the circle that defines the arc.
4. **startAngle** the starting angle for the arc.
5. **endAngle** the ending angle for the arc.

**CGContextAddArcToPoint**  
Provides another way to add an arc seg- ment to a path. The arc segment created by CGContextAddArcToPoint is defined by a radius and two tangent lines. Figure 6.8 shows the geometry involved; the arc segment added by CGContextAddArcToPoint is shown as a solid line. The function CGContextAddArcToPoint takes five parameters—the x and y coordi- nates of a point p1, the x and y coordinates of a second point p2, and the radius of the arc r. The starting point for constructing the segment added to the path is the point p0, the current point prior to calling CGContextAddArcToPoint. The line from the point p0 to the point p1 and the line from the point p1 to p2 are the two lines tangent to the arc. These lines plus the arc radius r define the arc. The starting point for the arc segment is the point p1t; at that point the arc is tangent to the line from p0 to p1. The ending point of the arc is the point p2t— the point where the arc is tangent to the line from p1 to p2. If the point p0 is not the same point as the tangent point p1t, the function CGContextAddArcToPoint first adds a line segment to the current path to connect the initial current point to the starting point of the arc segment, then adds the arc segment to the path.  
<img width="320" alt="example" src="https://raw.githubusercontent.com/stylekit/img/master/Screen%20Shot%202015-10-31%20at%2016.07.50.png">  
<img width="320" alt="CGContextAddArcToPoint example" src="https://raw.githubusercontent.com/stylekit/img/master/Screen%20Shot%202015-10-31%20at%2015.54.35.png">

# Path construction:

- **CGPathCreateMutable**, which replacesCGContextBeginPath
- **CGPathMoveToPoint**, which replaces CGContextMoveToPoint
- **CGPathAddLineToPoint**, which replaces CGContextAddLineToPoint
- **CGPathAddCurveToPoint**, which replaces CGContextAddCurveToPoint
- **CGPathAddEllipseInRect**, which replaces CGContextAddEllipseInRect
- **CGPathAddArc**, which replaces CGContextAddArc
- **CGPathAddRect**, which replaces CGContextAddRect
- **CGPathCloseSubpath**, which replaces CGContextClosePath



# Stroking paths
**CGContextStrokePath** & **CGContextDrawPath** with the painting mode kCGPathStroke This usage of these two functions is identical, so use the one that suits your taste. Stroking a path can be combined with filling of that path by using the function CGContextDraw- Path with the painting modes kCGPathFillStroke or kCGPathEOFillStroke. These painting modes first fill and then stroke the path.

**CGContextStrokeRect** & **CGContextStrokeRectWithWidth**  
Stroked rectangles don’t require any path construction when you use the conve- nience functions CGContextStrokeRect and CGContextStrokeRectWithWidth

**CGContextSetLineWidth**.  
The default line width is 1 unit. Because the line width is specified in Quartz user space units, it is affected by changes to the CTM

# Mitter:
**kCGLineJoinMiter** 
For this type of join, Quartz extends the outer edges of the stroke until they meet at an angle, similar to the corner on a picture frame.

**kCGLineJoinRound**   
Quartz draws a circular arc around the point where the segments meet. The diameter of this circle is the line width, resulting in a rounded corner.

**kCGLineJoinBevel**   
Quartz finishes the segments with butt line caps, leaving a notch at the corner. (See the next section “Line Caps” for more discussion of butt line caps.) The resulting notch beyond the segments is filled in with a triangle, resulting in a beveled corner.

**Note:**   
When the join style is a miter join, Quartz replaces a miter join with a bevel join if the angle between two connected path segments is too small; this avoids sharp spikes. The miter limit determines the angle when a miter join is replaced by a bevel join; it only applies when the Quartz line join is kCGLineJoinMiter. The miter limit is based on the miter length. The miter length is the distance between the point where the inner edges of the stroke intersect and the point where the outer edges of the stroke intersect. Figure 6.13 illustrates the miter length. If the ratio of the miter length and the line width exceeds the miter limit, Quartz replaces a miter join with a bevel join.
The ratio between the miter length and the line width is expressed in terms of the angle θ between the two segments:
 miterlimit =  miterlength /linewidth = 1 / (sin*(θ/2))

**Note:**   
The default Quartz miter limit is 10. This value causes miter joins to be replaced by beveled joins when the angle between the segments is less than about 11 degrees. A larger miter limit allows the miter length to be larger, that is, allows larger spikes. Figure 6.14 shows the results of the miter limit. In the lower por- tion of the figure, the miter limit is the default value of 10. As the angle between the two connected path segments gets smaller, the miter join is replaced by a beveled join. The upper portion of the figure shows a large miter limit with a small angle between the two connected path segments; the sharp spike is the

## Caps
**kCGLineCapButt**   
is the default. Quartz stops the stroke at the endpoint of the open path segment and squares off the end. There is no projec- tion beyond the end of the path.

**kCGLineCapSquare**   
The square line cap () is sometimes called a projected line cap. Quartz projects the stroke beyond the endpoint by one-half the line width and squares off the end of the stroke.

**kCGLineCapRound**   
When the line cap is a round line cap (), Quartz paints a semi- circular arc at each endpoint. The diameter of the arc is the line width.


## Line Dash
CGContextSetLineDash


## Filling Paths
**The nonzero winding number rule**   
takes into account the direction of the path segments that make up the path. To determine whether a point is in the interior of a path, Quartz conceptually constructs a ray from that point out to infinity. It counts the number of times the ray intersects the path where the path travels from right to left and subtracts that count from the number of times the ray intersects the path where the path goes left to right.The resulting number is the winding number
Note: fill that path using the nonzero winding number rule by using the function CGContextFillPath or the function CGContext- DrawPath with the painting mode kCGPathFill
Note: Stroking a path can be combined with filling by using the function CGContext- DrawPath with the painting mode kCGPathFillStroke to use the nonzero winding number fill rule

**The second fill rule available in Quartz is the even-odd fill rule.**   
For this rule, the direction of the path segments is unimportant. To determine whether a point is in the interior of a path using the even-odd fill rule, Quartz conceptually con- structs a ray from that point out to infinity. It counts the number of times the ray intersects the path. If the number of intersections is odd, the point is inside the path. If the number of intersections is even, the point is outside the path. The even-odd fill rule is rarely used. Its use is typically confined to emulating another graphics model such as QuickDraw
**Note:** To fill the current path using the even-odd fill rule, you can use the function CGContextEOFillPath or the function CGContextDrawPath with the painting mode kCGPathEOFill.
**Note:** kCGPathEOFillStroke to use the even-odd fill rule. These painting modes first fill, then stroke the path.

**Closing a fill:**    
Regardless of the fill rule applied, to fill an open subpath, Quartz must implicitly close it prior to filling. Operations that fill a path implicitly close all open sub- paths prior to filling. Operations that both fill and stroke only implicitly close the path for the filling portion of the operation; the stroke portion of the operation is applied without closing any open subpaths that exist. If you want the path to be closed prior to stroking, you must explicitly close it with CGContextClosePath.

<img width="300" alt="fill & stroke" src="https://raw.githubusercontent.com/stylekit/img/master/Screen%20Shot%202015-11-01%20at%2007.35.49.png">

**Note:** Convenience fill methods for rects: Quartz has convenience functions for filling rectangles. The function CGContext- FillRect allows you to fill a specified rectangle without performing any explicit path construction. The function CGContextFillRects allows you to fill a specified array of rectangles without any explicit path construction. These functions ignore any current path in the context and, after they return, the current path in the context is empty. Quartz uses the nonzero winding number fill rule when filling rectangles with these convenience functions.

**Clearing context:**    
CGContextClearRect, which should not be confused with an erasing operation. Information about the function CGContextClearRect is in “Erasing and Clearing a Context” (page 351 of the programing with quartz book).

## Clipping
Every Quartz context has a current clipping area—the area into which Quartz can draw. Any drawing that lies outside this clipping area does not appear; only those portions inside the clipping area are painted. Drawing is clipped to the clipping area in the context.
Quartz provides two ways to perform clipping. The first is based on paths. In Tiger and later versions, Quartz also allows clipping to image masks.

Quartz offers two convenience functions that clip to a rectangular area. The function CGContextClipToRect intersects a rectangle with the existing clipping area. Quartz intersects the supplied rectangle with the existing clipping area to create the new clipping area on the context. The function CGContextClipToRectsconstructs a clipping area that consists of the interior of a sequence of rectangles. Quartz intersects the interior of these rectangles with the existing clipping area to create a new clipping area. The function CGContextClipToRects uses the non- zero winding number rule to determine the interior of the rectangles. Both these functions ignore any existing path in the context; after they return, the current path in the context is empty.

- **CGContextClip:** Uses the nonzero winding number rule to calculate the intersection of the current path with the current clipping path.
- **CGContextEOClip** Uses the even-odd rule to calculate the intersection of the current path with the current clipping path.
- **CGContextClipToRect:** Sets the clipping area to the area that intersects both the current clipping path and the specified rectangle.
- **CGContextClipToRects:** Sets the clipping area to the area that intersects both the current clipping path and region within the specified rectangles.
- **CGContextClipToMask:** Maps a mask into the specified rectangle and intersects it with the current clipping area of the graphics context. Any subsequent path drawing you perform to the graphics context is clipped. (See “Masking an Image by Clipping the Context” (page 149).)

**Setting up a circular clip area:**
```objc
CGContextBeginPath (context);
CGContextAddArc (context, w/2, h/2, ((w>h) ? h : w)/2, 0, 2*PI, 0);
CGContextClosePath (context);
CGContextClip (context);
```

## CGPath 
**CGPathRef** cannot be modified or added to but a  
**CGMutablePathRef** can be modified.  
**CGContextAddPath** add a CGPathRef or CGMutablePathRef to the current path in the context.  
**CGPathAddArc** takes:  
1. x,y coordinates for the center of the circle that defines the arc path seg- ment.  
2. Radius of the circle that defines the arc path segment.  
3. arc angle for the arc path segment.  
4. ending arc angle for the arc path segment.  
5. isClockwise Boolean value. If true, the arc segment is added clockwise; otherwise it is added counterclockwise.  
6. CGMutablePathRef of the CGPath object to add the arc path segment to.  
7. CGAffineTranform ( If this pointer is NULL, Quartz applies no transformation to the arc path coordinates prior to adding them to the CGPath.)  

**CGPath Construction Primitives**   
- CGPathMoveToPoint 

**Note:** These parameters closely parallel the parameters to the function CGContextAdd- Arc, which adds an arc path segment to the current path in the context. Instead of passing the context as the first parameter, you pass the mutable CGPath

## Transforming
There are 2 ways to trasnform vector:  
**A.** is to transform the path object it self or  
**B.** Transform the entire context like this:  
1. Save the Quartz coordinate system with CGContextSaveGState.
2. Apply the affine transform to the context using CGContextConcatCTM.
3. Add the untransformed path with CGContextAddPath.
4. Restore the Quartz coordinate system with CGContextRestoreGState.

- **CGAffineTransformMakeTranslation**: To construct a new translation matrix from x and y values that specify how much to move the origin.
- **CGAffineTransformTranslate**: To apply a translation operation to an existing affine transform.
- **CGAffineTransformMakeRotation**: To construct a new rotation matrix from a value that specifies in radians how much to rotate the coordinate system.
- **CGAffineTransformRotate**: To apply a rotation operation to an existing affine transform.
- **CGAffineTransformMakeScale**: To construct a new scaling matrix from x and y values that specify how much to stretch or shrink coordinates.
- **CGAffineTransformScale**: To apply a scaling operation to an existing affine transform.
- **CGAffineTransformInvert**: Inversion is generally used to provide reverse transformation of points within transformed objects. Inversion can be useful when you need to recover a value that has been transformed by a matrix: Invert the matrix, and multiply the value by the inverted matrix, and the result is the original value. You usually don’t need to invert transforms because you can reverse the effects of transforming the CTM by saving and restoring the graphics state.
- **CGAffineTransformMake**: but unlike the other functions that make new affine transforms, this one requires you to supply matrix entries. To effectively use this function, you need to have an understanding of matrix math
- **CGPointApplyAffineTransform** You operate on a CGPoint structure by calling the function CGPointApplyAffineTransform.
- **CGSizeApplyAffineTransform** You can operate on a CGRect structure by calling the function CGRectApplyAffineTransform. This function returns the smallest rectangle that contains the transformed corner points of the rectangle passed to it. If the affine transform that operates on the rectangle performs only scaling and translation operations, the returned rectangle coincides with the rectangle constructed from the four transformed corners.
- **CGAffineTransformIdentity** 

**Concatenating transformations:** (and applying it to a CGPath instance)
```objc
CGAffineTransform affineTransform = CGAffineTransformIdentity; 
affineTransform = CGAffineTransformConcat(affineTransform,CGAffineTransformMakeTranslation(-100, -100)); 
affineTransform = CGAffineTransformConcat(affineTransform,CGAffineTransformMakeRotation(pi / 6)); 
affineTransform = CGAffineTransformConcat(affineTransform, CGAffineTransformMakeTranslation(100, 100));
CGPathRef transformedPath = CopyPathWithTransformation( umbrellaPath, affineTransform);//replace CopyPathWi.. with CGPathCreateMutableCopyByTransformingPath or CGPathCreateCopyByTransformingPath
```
**Transforming the context:**
```swift
// Create a new transform consisting of a 45-degree rotation
let theTransform:CGAffineTransform  = CGAffineTransformMakeRotation(M_PI/4);//45deg
// Apply a scaling transformation to the transform just created. 
theTransform = CGAffineTransformScale(theTransform, 1, 2);
//moves entire context
CGContextTranslateCTM(context, 100., 100.);
// Release the path when done with it. 
CGPathRelease(path);
```


- **CGContextGetPathBoundingBox**  Returns a CGRect that corresponds to the bounding box of the current path  
- **CGRectNull** If the current path in the context is empty, CGContextGetPathBoundingBox returns the special rectangle CGRectNull
- **CGRectEqualToRect** The Quartz utility function **CGRectEqualToRect** allows comparison of two CGRect structures for equality, making it straightforward to determine if the CGRect returned by CGContextGetPathBoundingBox is CGRectNull.
- **CGContextIsPathEmpty** Returns a Boolean value indicating whether the current path in the context is empty. An empty path contains no current point or path segments.
- **CGContextGetPathCurrentPoint** Returns a CGPoint that corresponds to the current point of the path in the context. The coordinate values of the point are expressed in the user space coordinate system in effect at the time you call CGContextGetPathCurrentPoint. 
- **CGPointZero** If the current path in the context is empty, CGContextGetPathCurrentPoint returns the value CGPointZero.
- **CGContextGetClipBoundingBox** Returns a CGRect that corresponds to the bounding box of the clipping area. The coordinate values of the returned rectangle are expressed in the user space coordinate system in effect at the time you call CGContextGetClipBoundingBox.
- **CGContextReplacePathWithStrokedPath**  Replaces the current path with a stroked version of that path, using the parame- ters of the context to determine the new path. The same context parameters that would be used to stroke a path are consulted when creating the stroked version of the path. The new path, if filled, produces the same result as would have been obtained from stroking the original path. One use of this function is to create a clipping path that corresponds to a stroked version of a path. You’d follow a call to CGContextReplacePathWithStrokedPath with a call to CGContextClip. There is also an equivalent method for doing this via a path: ==CGPathCreateCopyByStrokingPath==
1. context, the CGContextRef whose path you want to examine.  
2. point, a CGPoint you want to test with the current path.  
3. mode, the CGPathDrawingMode of the operation you want to hit test. 
- **CGContextPathContainsPoint** allows you to perform simple hit detection with Quartz paths. This function takes the fol- lowing parameters:  
- **CGContextPathContainsPoint** returns true if point is inside the cur- rent path in context. If point is not inside the current path, the function returns false  
- **CGPathContainsPoint** can be used to determine whether a CGPoint is inside a CGPath object.

## Color
- **CGColorCreateCopyWithAlpha**  To make a new CGColor object with the same color space and component color values
- **CGContextSetFillColor** &  **CGContextSetStrokeColorWithColor**  Each of these functions simultaneously sets the corresponding color space and color, using the CGColor object passed to it. the latter takes context and CGColor as a param

Changing colors after the fact:  
- **CGContextSetFillColor**   
- **CGContextSetStrokeColor**
- **CGContextSetStrokeColorWithColor** Takes context and CGColor  
- **CGContextSetFillColorSpace** or **CGContextSet**: StrokeColorSpace if the current fill or stroke color space is not already the color space you require.


## Graphics State Parameters  
*Param* - *Default value* - *Description*
- **CTM** - Context dependent - The current transformation matrix. Determines the mapping of coordinates from user space to device space.
- **Clipping area** - Context dependent - The clipping area is the only portion of the drawing canvas into which Quartz renders.
- **Fill color** - DeviceGray opaque black- The color space and the component values, plus an alpha value, used by Quartz when performing fill operations and the painting of image masks. 
- **Stroke color** - DeviceGray opaque black - The color space and the component values, plus an alpha value, used by Quartz when performing stroking operations.
- **Line width** - 1.0 - The thickness, in user space units, that Quartz uses when stroking paths.
- **Line cap** - kCGLineCapButt - The style Quartz uses to paint open endpoints on a subpath when stroking.
- **Line join** - kCGLineJoinMiter - The style Quartz uses to paint the join of connected path segments when stroking.
- **Miter limit** - 10.0 - Determines the angle between connected path segments where Quartz replaces a miter join with a bevel join when str
- **Line dash** - A solid line - The dash pattern Quartz uses when stroking paths.
- **Alpha** - 1.0 - A global alpha value that applies an additional alpha value to all drawing in the context.
- **Rendering intent** - kCGRenderingIntentDefault - The rendering intent applied when painting paths, text, or image masks.
- **Interpolation quality** - kCGInterpolationDefault  - The interpolation quality to apply when rendering sampled images.
- **Should anti-alias** - true, for those contexts that support anti-aliasing -  A Boolean value that determines whether Quartz anti-aliases when rendering.
- **Shadow** - No shadow - Determines the shadow applied when rendering. Panther and later versions only.
- **Pattern phase** - CGSizeZero - The offset to the starting point of a pattern.
- **Should smooth fonts** - true, for those contexts that support font smoothing - A Boolean value that determines whether Quartz should smooth fonts when drawing text. Jaguar and later versions only.
- **Text drawing mode** - kCGTextFill - The painting mode Quartz uses when drawing text.
- **Font** - None - The font Quartz uses when drawing text.
- **Font size** - The point size Quartz uses when drawing text.
- **Character** spacing - An additional spacing that Quartz adds after each text character when drawing text.
- **Blend mode** - Determines how Quartz composites source drawing to the destination. Available in Tiger and later versions only.- 

**Note:** If you obtain a context from a framework or another source, you should not assume the context parameters are set to the values you need. You need to set the graphics state parameters to those appropriate for your drawing task.

## Setting CGContext strokes:  
- **CGContextSetLineWidth** - Line width
- **CGContextSetLineJoin** - Line join
- **CGContextSetLineCap** - Line cap
- **CGContextSetMiterLimit** - Miter limit
- **CGContextSetLineDash** - Line dash pattern
- **CGContextSetStrokeColorSpace** - Stroke color space
- **CGContextSetStrokeColor** uses color components
- **CGContextSetStrokeColorWithColor** - Stroke color CGColor
- **CGContextSetStrokePattern** - Stroke pattern


**CGContextSaveGState**  
makes a copy of the current graphics state in the context and pushes that copy onto the top of the graphics state stack. The exe- cution of CGContextSaveGState does not modify any of the values in the current graphics state.
**CGContextRestoreGState**  
pops off (or removes) the topmost graphics state on the graphics state stack and it becomes the current graphics state in the context.

**Note:** You save and restore these GStates when you need to change them.  
**Note:** you can save the GState to a variable (code needed) or just roll with it and resore many times until you reach the first GState in the stack. (This process needs a little practice to understand) (remeber the save and restore pushes and pops items on an array)  
**Note:** I think you are better served doing transforming on the path before you add it to the context  
**Note:** I think its better to clear the CGContext and just recreate everything again than messing with saving and restoring GStates. It seems very un-intitive. Unless performance is an issue not using them that is.  

**IMPORTANT:** Saving and restoring the graphics state is a relatively cheap operation. You should use CGContextSaveGState and CGContextRestoreGState to manage the graphics state as needed rather than working hard to avoid their use.  
**IMPORTANT:** Every call you make to CGContextSaveGState must be balanced with a subsequent call to CGContextRestoreGState. Failing to do so produces 

**Functions that modify the GState:**  
- CGContextSetLineWidth(context:CGContext?,lindeWidth:CGFloat)  
- CGContextScaleCTM
- CGContextTranslateCTM
- CGContextRotateCTM
- CGContextClip
- CGContextTranslateCTM
- CGContextSetFillColorWithColor
- CGContextFillPath
- CGContextScaleCTM
- CGContextSetLineDash
- CGContextStrokePath

Context clipping example: (code example does exist)  
<img width="370" alt="context clipping example" src="https://raw.githubusercontent.com/stylekit/img/master/Screen%20Shot%202015-11-01%20at%2010.55.53.png">

## Text

- **GContextSetFont** sets only the font
- **CGContextSelectFont** sets both the font and the font size
- **CGContextSetFontSize** sets the font size parameter in the graphics state.
- **CGContextSetTextPosition** As a convenience, you can set the text position with the function 
- **CGContextGetTextPosition** you can retrieve the current text position with .
- **CGContextSetTextMatrix** You explicitly set the text matrix in its entirety (including the text position) by using . 
- **CGContextGetTextMatrix** You can obtain the current text matrix in the context  
- **CGContextSetTextDrawingMode** You set the text drawing mode by calling the function
- **CGTextDrawingMode.kCGTextFill**: draws text characters as you expect—it fills the outlines of the paths that make up the glyphs, using the current fill color. (Note that the fill algorithms for painting text characters are significantly different than those for line art graphics. To achieve good results, Quartz uses different render- ing techniques for painting text characters than it does for painting line art.
- **CGTextDrawingMode.kCGTextStroke**: mode strokes the outlines of the characters, using the current line width in the graphics state. The glyphs are painted with the current stroke color. The other parameters of the graphics state that affect stroking, such as the line dash, line cap, and line join, also affect the stroking of text.
- **CGTextDrawingMode.kCGTextFillStroke**: mode both fills and strokes the text. The effect is that of first filling, then stroking the text. Note that if you want to draw shadowed text  that is both stroked and filled, you may need to use transparency layers to achieve the effect you most likely will want. See “Drawing with Transparency Layers (Pan- ther)” (page 522) for a discussion of transparency layers and shadows.
- **CGTextDrawingMode.kCGTextInvisible**: mode performs no painting of the characters, but it updates the text matrix as if it had painted them. This is potentially useful for measuring text before drawing it or positioning pieces of text as if other text were drawn first.
- **CGTextDrawingMode.kCGTextClip** : mode intersects the current clipping area with the area described by the interior of the paths making up the text characters. Note that this is an atomic operation; that is, when making a single Quartz drawing call, the interiors of the glyphs being drawn are treated as a single object when clip- ping. Subsequent calls to text drawing functions with the text drawing mode kCGTextClip most likely will produce an empty clipping area unless the addi- tional text drawing is placed so that it intersects the previous clipping area.
- **CGTextDrawingMode.kCGTextFillClip** mode first paints the text as if the drawing mode is kCGTextFill; then it intersects the out- lines with the current clipping area. The adjustment of the text position is done only after the text is painted and the clip is applied.
- **CGTextDrawingMode.kCGTextStrokeClip** mode first paints the text as if the drawing mode is kCG- TextStroke; then it intersects the outlines with the current clipping area. The adjustment of the text position is done only after the text is painted and the clip is applied.
- **CGTextDrawingMode.kCGTextFillStrokeClip** mode first paints the text as if the drawing mode is kCGTextFillStroke; then it intersects the outlines with the current clipping area. The adjustment of the text position is done only after the text is painted and the clip is applied.

<img width="450" alt="example of text clipping" src="https://www.dropbox.com/s/gxnyhzj9jkxbvmb/Screen%20Shot%202015-11-02%20at%2007.37.08.png?raw=1">

**Important:** The text matrix and, therefore, the text position are not part of the Quartz graphics state and are not affected by CGContextSaveGState and CGContextRestoreGState. Because the text matrix is not part of the graphics state, you cannot use CGContextSaveGState and CGContextRestore- GState to save and restore it. If you do need to save and restore the text matrix, you call the function CGContextGetTextMatrix to obtain the current text matrix and later restore to that matrix by calling CGContextSetTextMatrix.

**Text & Flipped views:**  
One typical use is to draw text upright in a coordinate system that has its y axis oriented with positive y values going down the drawing canvas (a “flipped” coordinate system). Using a text matrix that is scaled by -1 in the y coordinate allows you to flip the text you draw without modifying the CTM prior to text drawing. 

**Note:** To achieve the effect of clipping to all the text characters in a sequence of multiple runs, each containing a different font and/or size, the best approach is to (1) clip to a single run at a time, (2) draw the graphics you want clipped to the multiple run of text, (3) restore to a saved graphics state without the clip, and (4) repeat the process for the next run of characters.
**Note:** Quartz has no notions of synthetic bold, italic, or outline styles as available in some graphics systems such as QuickDraw. Many fonts themselves have the intrinsic styles corresponding to the bold, italic, and bold-italic styles and you should use the intrinsic font faces to obtain these text styles.

**CGContextSelectFont** Before you can use Quartz functions to draw text using characters, you need to call the function CGContextSelectFont to set the font face, font size, and text encoding. The font selected becomes the new font in the graphics state and the size becomes the new font size. This function takes four parameters::  
- **context**, the graphics context in which to set the font.
- **name**, the PostScript name of the font.
- **size**, the size of the font in text space units.
- **textEncoding**, a value of type CGTextEncoding. The possible values are kCG- EncodingMacRoman or kCGEncodingFontSpecific.


**CGContextShowText** draw the glyphs that correspond to the charac- ter codes in the string either at the current text position 
**CGContextShowTextAtPoint** or at the point passed to CGContextShowTextAtPoint. The character advances that these routines use are the natural advances of the glyphs (scaled by the font size and text matrix), plus any extra character spacing for each glyph. The extra character spacing is a text space value added to each glyph width.

AroutinethatdrawsRomantextusingCGContextShowTextandCGContextShowTextAtPoint:

```objc
void drawQuartzRomanText(CGContextRef context) {
  int i;
  static const char *text = "Quartz"; 
  size_t textlen = strlen(text); 
  float fontSize = 60;
  float opaqueBlack[] = { 0., 0., 0., 1. }; 
  float opaqueRed[] = { 0.663, 0., 0.031, 1. };
  // Set the fill color space. This sets the
  // fill painting color to opaque black. 
  CGContextSetFillColorSpace(context, getTheRGBColorSpace());
  // Set the text matrix this code requires. 
  CGContextSetTextMatrix(context, CGAffineTransformIdentity);
  // Choose the font with the PostScript name "Times-Roman", at 
  // fontSize points, with the MacRoman encoding. 
  CGContextSelectFont(context, "Times-Roman", fontSize,kCGEncodingMacRoman);
  // The default text drawing mode is fill. Draw the text at (70, 400). 
  CGContextShowTextAtPoint(context, 70, 400, text, textlen);
  // Set the fill color to red. 
  CGContextSetFillColor(context, opaqueRed);
  // Draw the next piece of text where the previous one left off.
  CGContextShowText(context, text, textlen);
  for(i = 0 ; i < 3 ; i++){
    // Get the current text pen position.
    CGPoint p = CGContextGetTextPosition(context); // Translate to the current text pen position. CGContextTranslateCTM(context, p.x, p.y);
    // Rotate clockwise by 90 degrees for the next
    // piece of text.
    CGContextRotateCTM(context, DEGREES_TO_RADIANS(-90)); // Draw the next piece of text at the origin in black. CGContextSetFillColor(context, opaqueBlack); CGContextShowTextAtPoint(context, 0, 0, text, textlen); // Draw the next piece of text where the previous piece // left off and paint it with red. CGContextSetFillColor(context, opaqueRed); CGContextShowText(context, text, textlen);
  } 
}
```

<img width="270" alt="output from the above code" src="https://www.dropbox.com/s/7tnb1vokx0ecsp0/Screen%20Shot%202015-11-02%20at%2009.02.00.png?raw=1">

#Text Matrix 
The text matrix is a matrix that you can use with Quartz text drawing to apply additional transformations in addition to those of the CTM. The text matrix can be used to apply scaling or other coordinate transfor- mations to text, in addition to those that the CTM applies to all graphics.    

This demonstrates how the text matrix affects Quartz text drawing by using the text matrix to apply text scaling, flipping, and positioning of text. The code consists of the routine drawQuartzTextWithTextMatrix and the supporting routine showFlippedTextAtPoint. Executing the code produces the output shown:  
```obj
void showFlippedTextAtPoint(CGContextRef c, float x, float y, const char *text, const size_t textLen) {
   CGAffineTransform s;
   CGAffineTransform t = {1., 0., 0., -1., 0., 0.};
   CGPoint p;
   // Get the existing text matrix.
   s = CGContextGetTextMatrix(c);
   // Set the text matrix to the one that flips in y. CGContextSetTextMatrix(c, t);
   // Draw the text at the point. CGContextShowTextAtPoint(c, x, y, text, textLen);
   // Get the updated text position.
   p = CGContextGetTextPosition(c);
   // Update the saved text matrix to reflect the updated
   // text position.
   s.tx = p.x ; s.ty = p.y;
   // Reset to the text matrix in effect when this
   // routine was called but with the text position updated. CGContextSetTextMatrix(c, s);
}


void drawQuartzTextWithTextMatrix(CGContextRef context) {
   float fontSize = 60, extraLeading = 10; static const char *text = "Quartz "; size_t textlen = strlen(text);
   CGPoint textPosition;
   CGAffineTransform t;
   // Set the initial text matrix to the identity transform. 
   CGContextSetTextMatrix(context, CGAffineTransformIdentity);
   // Use the Times-Roman font at 60 points. 
   CGContextSelectFont(context, "Times-Roman", fontSize,kCGEncodingMacRoman); 
   // ***** Text Line 1 *****
   // Draw the text at (10, 600). CGContextShowTextAtPoint(context, 10, 600, text, textlen);
   
   // Get the current text position. The text pen is at the trailing 
   // point from the text just drawn.
   textPosition = CGContextGetTextPosition(context);

   
   // Set the text matrix to one that flips text in y and sets 
   // the text position to the user space coordinate (0,0).
   t = CGAffineTransformMake(1, 0, 0, -1, 0, 0); 
   CGContextSetTextMatrix(context, t);
   // Set the text position to the point where the previous text ended. 
   CGContextSetTextPosition(context, textPosition.x, textPosition.y);
   // Draw the text at the current text position. It will be drawn 
   // flipped in y, relative to the text drawn previously. 
   CGContextShowText(context, text, textlen);
   // ***** Text Line 2 *****
   // Translate down for the next piece of text. 
   CGContextTranslateCTM(context, 0, -(3*fontSize + extraLeading));
   CGContextSaveGState(context);
   // Make a transform that scales by a factor of 1 in x and 3 in y. 
   t = CGAffineTransformMake(1, 0, 0, 3, 0, 0); 
   CGContextSetTextMatrix(context, t);
   // This text is scaled relative to the previous text
   // because of the text matrix scaling. 
   CGContextShowTextAtPoint(context, 10, 600, text, textlen);
   // Restore the graphics state to what it was at the time 
   // of the last CGContextSaveGState. 
   CGContextRestoreGState(context);
   // The text matrix isn't affected by CGContextSaveGState and 
   // CGContextRestoreGState.
   CGContextShowText(context, text, textlen);
   // ***** Text Line 3 *****
   // Translate down for the next piece of text. 
   CGContextTranslateCTM(context, 0, -(fontSize + extraLeading));
   // Reset the text matrix to the identity matrix. 
   CGContextSetTextMatrix(context, CGAffineTransformIdentity);
   
   // Now draw text in a flipped coordinate system. 
   CGContextSaveGState(context);
   // Scale the coordinate system to mimic text drawing into 
   // a flipped coordinate system. CGContextConcatCTM(context,
   CGAffineTransformMake(1, 0, 0, -1, 0, 600)); 
   // This text will be flipped along with the CTM.
   CGContextShowTextAtPoint(context, 10, 10, text, textlen); 
   // Obtain the user space coordinates of the current
   // text position.
   textPosition = CGContextGetTextPosition(context);
   // Draw the text at that point but flipped in y. 
   showFlippedTextAtPoint(context, textPosition.x, textPosition.y, text, textlen); 
   CGContextRestoreGState(context);
}
```

<img width="320" alt="output of the above" src="https://www.dropbox.com/s/je4xa229xjzou0p/Screen%20Shot%202015-11-02%20at%2009.27.24.png?raw=1">

**Note:**  The custom method showFlippedTextAtPoint is one way of drawing upright text with Quartz in a flipped coordinate system. It preserves the existing text matrix across calls to showFlippedTextAtPoint but updates the text position to reflect the text drawing. Note that this code ignores any existing text matrix and estab- lishes a new one. As such, this routine is not appropriate for use when you are also using the text matrix to achieve other effects. If all the text you draw is flipped, it isn’t necessary to use a routine like showFlippedTextAtPoint that sets the text matrix each time you call it. Instead you could simply call CGContext- SetTextMatrix once to set up the text flipping each time your drawing code is called.  


- **CGFontCreateWithPlatformFont** You cre- ate a CGFont object by calling the function passing a pointer to an ATSFontRef  
- **ATSFontRef** You obtain an ATSFontRef from the Apple Type Services (ATS) framework. ATS provides a number of ways to obtain an ATSFontRef.
- **CGContextSetFont** Set the CGFont object for the font you want to draw with,  to set the font in the graphics state. Recall that the default font size is zero in a graphics context; a font size of zero produces no text rendering. To set the font size to a nonzero size, you call CGContextSetFont- Size.
- **CGContextShowGlyphs and CGContextShowGlyphsAtPoint** draw glyphs from the font you’ve set, passing in an array of glyph identifiers specifying the glyphs to draw. The first glyph in the array of glyphs is drawn at the current text position if you call CGContextShowGlyphs or at the point passed to CGContext- ShowGlyphsAtPoint. The character advances are the natural advances of the glyphs (scaled by the font size and transformed by the text matrix), plus any extra character spacing for each glyph. The extra character spacing graphics state parameter is a text space value that is added to each glyph width in text space.  
- **CGContextShowGlyphsWithAdvances** is also available. You pass in the same data, plus an array of advances that specifies the advance to use for each glyph in the array of glyphs. (Advances are specified as an array of CGSize structures, therefore they have an x and y value.) These advances are the absolute advance for each glyph in user space.  

**CAUTION:** As a general rule, Apple recommends the Unicode text drawing APIs that are part of the application frameworks built on top of Quartz. One example of when you might work directly with glyph identifiers is if you perform custom Cocoa text drawing


# Cocoa text drawing:
**NSTextView** & **NSText** classes are intended for working with text documents and the TextEdit application is built on top of these classes. Cocoa has a rich set of classes that make it easy to work with large amounts of text as well as rich text docu- ments (both RTF and RTFD).

drawing individual pieces of text.
There are three basic ways to draw strings of text programmatically in Cocoa:

**NSString** or **NSAttributedString** classes provide the simplest way of drawing small pieces of text. Prior to Panther, this was the slowest way to draw the same string repeatedly in most cases because Cocoa performed no caching of intermediate data used to draw the string.  
**NSCell** class provides primitives for displaying (and editing) text. Prior to Panther, using NSCell was more efficient than NSString but less efficient than using NSLayoutManager.  
**NSLayoutManager** class, together with other supporting classes, is the most efficient and flexible means of drawing strings of text with Cocoa.  

**Note:** Cocoa text drawing does respect the CTM and the context clipping area. This allows you to apply coordinate transformations and clipping to Cocoa text in the same ways you can apply them to any Quartz drawing.  
**Flipped view:**  isFlipped method that returns YES. Cocoa uses this to determine whether to flip text you draw to a view. You can use the CTM to apply other coordinate trans- formation effects, but the Cocoa text system doesn’t require you to do so in order to get properly oriented text in a flipped view  

# Using NSString to draw text:  

```objc
static NSString *getTextString() {
   static NSString *textString = nil; 
   if(textString == nil){
      // These Unicode values are the glyphs: Q, u, a, r, t, z,
      // eighth-note, floral heart, chess queen, and 2 CJK glyphs. 
      const unichar chars[] = {0x0051, 0x0075, 0x0061, 0x0072, 0x0074, 0x007A, 0x266A, 0x2766, 0x265B, 0x3042, 0x304E }; textString = [NSString stringWithCharacters:chars
      length: sizeof(chars)/sizeof(unichar)];
      [textString retain];
   }
   return textString;
}

**CodethatusesNSStringmethodstodrawtext:** 
 
void drawNSStringWithAttributes(void) {
   NSString *textString = getTextString(); NSPoint p;
   NSFont *font;
   NSColor *redColor;
   NSMutableDictionary *stringAttributes;
   p = NSMakePoint(20., 400.);
   // Text Line 1 
   // Draw the text with the default text attributes. [ textString drawAtPoint:p withAttributes:nil];
   //  Text Line 2 
   // Draw with a specific font and color.
   // Position the text 50 units below the previous text.
   p.y -= 50;
   // Set attributes to use when drawing the string.
   stringAttributes = [NSMutableDictionary dictionaryWithCapacity:4];
   // Use the font with the PostScript name "Times-Roman" at 40 point. font = [ NSFont fontWithName:@"Times-Roman" size: 40]; [stringAttributes setObject:font forKey:NSFontAttributeName];
   // Set the color attribute to an opaque red. 
   redColor = [NSColor colorWithCalibratedRed:1 green:0 blue:0 alpha:1.0];
   [stringAttributes setObject:redColor forKey:NSForegroundColorAttributeName];
   [textString drawAtPoint:p withAttributes:stringAttributes];
   //  Text Line 3  // Draw stroked text.
   // Position the text 50 units below the previous text. p.y -= 50;
   // Set the stroke text mode by using a positive stroke value. 
   [stringAttributes setObject:[NSNumber numberWithFloat:3.0] forKey:NSStrokeWidthAttributeName];
   
   [ textString drawAtPoint:p withAttributes:stringAttributes];
   //  Text Line 4 
   // Draw with fill and stroke.
   // Position the text 50 units below the previous text. p.y -= 50;
   // Set the fill-stroke text mode by using a negative stroke value. [stringAttributes setObject:
  [NSNumber numberWithFloat:-3.0] forKey:NSStrokeWidthAttributeName];
  // Set the stroke color attribute to black. [stringAttributes setObject:
  [NSColor colorWithCalibratedRed:0 green:0 blue:0 alpha:1.0] forKey:NSStrokeColorAttributeName];
  [textString drawAtPoint:p withAttributes:stringAttributes];
   // Text Line 5 
   // Draw at the text baseline. NSRect rect;
   p.y -= 50;
   rect.origin = p;
   rect.size = NSMakeSize(0,0);
   [textString drawWithRect:rect options:NSStringDrawingDisableScreenFontSubstitution attributes:stringAttributes];
}
```

<img width="400" alt="output of the above" src="https://www.dropbox.com/s/3t229gkpwmphccw/Screen%20Shot%202015-11-02%20at%2010.25.56.png?raw=1">  

# Using NSLayoutManager

**Note:** Simple example of drawing the same string with similar attributes as that of the previous example but instead uses an NSLayoutManager  

```objc
void drawWithNSLayout(void) {
   static NSLayoutManager *myLayout = nil; static NSTextStorage *textStorage = nil; static NSRange myTextRange;
   NSPoint p;
   if(myLayout == nil){
      NSTextContainer *textContainer; NSMutableDictionary *stringAttributes; NSFont *font;
      NSColor *redColor;
      // Initialize the text storage with the string to draw. textStorage = [ [NSTextStorage alloc]
      initWithString: getTextString()];
      // Initialize the layout manager to use with the text storage. myLayout = [[NSLayoutManager alloc] init];
      // Allocate and initialize a text container object.
      textContainer = [[NSTextContainer alloc] init];
      // Add the text container to the layout.
      [myLayout addTextContainer:textContainer];
      // The layout retains the text container; now release it. [textContainer release];
      // Add the layout to the text storage.
      [textStorage addLayoutManager:myLayout];
      // The text storage retains the layout so this code can release it. [myLayout release];
      // Set attributes to use when drawing the string.
      stringAttributes = [NSMutableDictionary dictionaryWithCapacity:2];
      // Use the font with the PostScript name "Times-Roman" at 40 point. font = [ NSFont fontWithName:@"Times-Roman" size: 40]; [stringAttributes setObject:font forKey:NSFontAttributeName];
      // Set the text color attribute to an opaque red. redColor = [NSColor colorWithCalibratedRed:0.663
      green:0 blue:0.031 alpha:1.0]; [stringAttributes setObject:redColor
        forKey:NSForegroundColorAttributeName];
      // Create the range of text for the entire length of text
      // in the textStorage object.
      myTextRange = NSMakeRange(0, [textStorage length]);
      // Set the attributes on the entire range of text.
      [textStorage setAttributes:stringAttributes range:myTextRange];
   }
   // Set the point for drawing the layout. p = NSMakePoint(20., 400.);
   // Draw the text range at the point.
   [myLayout drawGlyphsForGlyphRange:myTextRange atPoint:p];
}
```

<img width="480" alt="example output of the above" src="https://www.dropbox.com/s/ljf3innxdjwmmbx/Screen%20Shot%202015-11-02%20at%2010.38.43.png?raw=1">

**Note:** The NSLayoutManager class works best when drawing into a flipped view, that is, a view where y coordinate values increase as you move down the drawing can- vas.

If you subclass the NSLayoutManager and add the code example from the chapter about Cocoa text drawing you are able to produce this:  

<img width="723" alt="img" src="https://raw.githubusercontent.com/stylekit/img/master/Screen%20Shot%202015-11-02%20at%2013.09.30.png">


# Graphics Context in Cocoa

```objc
- (void)drawRect:(NSRect)rect {
   NSGraphicsContext *nsctx = [NSGraphicsContext currentContext]; 
   CGContextRef context = (CGContextRef)[nsctx graphicsPort];
   CGContextSetLineWidth(context, 5.0);
   // Draw the coordinate axes. 
   CGContextBeginPath(context);
   // First draw the x axis. 
   CGContextMoveToPoint(context, -2000., 0.0); 
   CGContextAddLineToPoint(context, 2000., 0.0); 
   CGContextDrawPath(context, kCGPathStroke);
   // Next draw the y axis. 
   CGContextMoveToPoint(context, 0.0, -2000.0); 
   CGContextAddLineToPoint(context, 0.0, 2000.0); 
   CGContextDrawPath(context, kCGPathStroke);
   doAlphaRects(context);
}

//Paintingwithtransparentrectangles

void doAlphaRects(CGContextRef context) {
   // Part 1
   CGRect ourRect = {{0.0, 0.0}, {130.0, 100.0}}; 
   int i, numRects = 6;
   float rotateAngle = 2*M_PI/numRects;
   float tint, tintAdjust = 1.0/numRects;
   //  Part 2 
   CGContextTranslateCTM (context, 2*ourRect.size.width, 2*ourRect.size.height);
   //  Part 3 
   for(i = 0, tint = 1.0; i < numRects ; i++, tint -= tintAdjust){
      CGContextSetRGBFillColor (context, tint, 0.0, 0.0, tint); 
      CGContextFillRect(context, ourRect); 
      CGContextRotateCTM(context, rotateAngle); // cumulative
   } 
}
```
**In the example above:** The first line in the drawRect: method sends a currentContext message to the class NSGraphicsContext and stores the result in the nsctx variable. Prior to call- ing the drawRect: method, Cocoa sets the current Cocoa graphics context to that of the view. After obtaining the current Cocoa graphics context, the code sends the graphicsPort message to the NSGraphicsContext stored in nsctx. This returns the Quartz CGContextRef that corresponds to the view.  
<img width="350" alt="img" src="https://raw.githubusercontent.com/stylekit/img/master/Screen%20Shot%202015-11-02%20at%2013.40.17.png">  


# Gradient

There is Axial gradient  and radial gradient  
Use CGContextDrawLinearGradient for Axial or Linear Gradient  
Use CGContextDrawRadialGradient for radial gradient  


# Honorable mentions:  
**Transparency layers:** 
A way to group graphics together and apply effects to it as a group:  (see picture bellow:)  

<img width="320" alt="img" src="https://raw.githubusercontent.com/stylekit/img/master/Screen%20Shot%202015-11-04%20at%2016.11.39.png">  
<img width="320" alt="img" src="https://raw.githubusercontent.com/stylekit/img/master/Screen Shot 2015-11-04 at 16.11.34.png">

Examples are in the books. (for the sake of brevity)  

This may still be valid:  
You might expect that painting a path with the kCGPathFillStroke painting mode is an atomic painting operation. However, as of this writing (correspond- ing to Tiger and earlier versions), Quartz treats this as two separate painting operations, first a fill, then a stroke. This behavior is a bug; it is not part of the Quartz imaging model. Unfortunately, the fact that using kCGPathFillStroke results in two painting operations affects shadows and alpha compositing.


