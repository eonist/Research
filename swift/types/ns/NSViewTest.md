**Great overview:**   https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CocoaViewsGuide/Introduction/Introduction.html

**Translucent window**   http://stackoverflow.com/questions/24023183/how-can-i-create-yosemite-style-view-with-translucent-blurry-background

**NSView has three different modes**  
In which it handles it’s content. Compared to UIView from the Cocoa Touch Frameworks, which already has a CALayer ready to use.
Here are the different modes of an instance of the NSView Class:

1. **Classic view:** DrawRect:dirtyRect is called to draw the screen. There is one draw back in this. All drawing takes place in the main thread. Which if performance is getting an issue can become an issue.

2. **Layer Backed view:** The NSView now has a CALayer which is managed by the NSView. This actually takes up more memory space, but since the NSView knows of every CALayer that is underneath it. It’s system managed. View updates are called through the updatesLayer() method. The layers are drawn multithreaded by OS X.

3. **Layer Hosted view:** In this mode the NSView has no knowledge about the CALayer or any of it’s sublayers it contains and it won’t care about it either. As a programmer you have to manage it. The NSView just shows it, but it will use drawRect:dirtyRect to draw the CALayer.

**Discussion 1:** The order that  setWantsLayer: and setLayer: are called is important, it makes the distinction between a layer-backed view, and a layer-hosting view.

**Discussion 2:**  Layer-backed views always *appear* above non-layer-backed views. Effectively, all non-layer-backed views get rendered into a single layer that makes up the entire window.

**A layer-backed view** is a view that is backed by a Core Animation layer. Any drawing done by the view is the cached in the backing layer. You configured a layer-backed view by simply invoking  setWantsLayer: with a value of YES. The view class will automatically create the a backing layer for you, and you use the view class’s drawing mechanisms. When using layer-backed views you should never interact directly with the layer.

A layer-hosting view is a view that contains a Core Animation layer that you intend to manipulate directly. You create a layer-hosting view by instantiating an instance of a Core Animation layer class and setting that layer using the view’s setLayer: method. After doing so, you then invoke setWantsLayer: with a value of YES. When using a layer-hosting view you should not rely on the view for drawing, nor should you add subviews to the layer-hosting view.

**Sizes in views and windows**:
 
```swift
Swift.print("NSScreen.mainScreen()!.frame.width: " + "\(NSScreen.mainScreen()!.frame.width)")
Swift.print("NSScreen.mainScreen()!.frame.height: " + "\(NSScreen.mainScreen()!.frame.height)")

Swift.print("self.frame.size.width: " + "\(self.frame.size.width)")
Swift.print("self.frame.size.height : " + "\(self.frame.size.height)")//returns the height - the topBar height
Swift.print("view.frame.size.width: " + "\(view.frame.size.width)")
Swift.print("view.frame.size.height: " + "\(view.frame.size.height)")
```


**Setting a bg color of an NSView can be done via drityrect and layers**


**MouseEvents in NSView:** (good)   
[here](http://stackoverflow.com/questions/7504917/getting-mouse-down-event-on-superview?rq=1) 

**Fill a view with color (dirtyRect method)**  
```swift
override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        fillColor.setFill()
         NSRectFill(dirtyRect)
}
```
**Draw a rect with fill and stroke:**  

```swift
/*
* Draws the background
*/
override func drawRect(dirtyRect: NSRect) {
    
     let pathRect = NSInsetRect(self.bounds, 1, 1);
     let path = NSBezierPath(roundedRect:pathRect, xRadius:0, yRadius:0);
     path.lineWidth = 1
     NSColor.whiteColor().setFill();
     NSColor.grayColor().setStroke();
     path.fill()
     path.stroke()
    
     
}
```

**Vibrancy:**  

//maybe try this:
   
```swift
 /** 
  * AllowsVibrancy is queried when a vibrant appearance is used on a view hierarchy. When allowsVibrancy returns YES, the view will have an appropriate measure taken to ensure it is vibrant on top of its given material.
  * Specific subclasses, such as NSControl, will answer this question based on the artwork they draw for a given appearance.
  * @available(OSX 10.10, *)
  */
public var allowsVibrancy: Bool { get }
```   
     
     
**focusRingType**

```swift
public var focusRingType: NSFocusRingType
public class func defaultFocusRingType() -> NSFocusRingType
```

**To rotate a shape:** (from orielly book)
```objc
- (void) drawRect:(NSRect)dirtyRect
￼￼132 |
 NSRect pathRect = NSInsetRect(self.bounds, 125, 125);
// Create a transform that rotates the drawing by a // small amount around the origin point. CGAffineTransform rotationTransform =
     CGAffineTransformMakeRotation(M_PI / 8.0);
 CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
 NSBezierPath* path = [NSBezierPath bezierPathWithRoundedRect:pathRect
         xRadius:10 yRadius:10];
 // Save the context before we start drawing
[NSGraphicsContext saveGraphicsState]; // Rotate
 CGContextConcatCTM(context, rotationTransform);
 [[NSColor greenColor] setFill];
[[NSColor blackColor] setStroke]; Chapter 7: Drawing Graphics in Views
[path fill];
        [path stroke];
        // Restore the context.
        [NSGraphicsContext restoreGraphicsState];
    }
```


**drag and drop tutorial:**  
https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CocoaViewsGuide/SubclassingNSView/SubclassingNSView.html#//apple_ref/doc/uid/TP40002978-CH7-SW22

https://developer.apple.com/library/mac/samplecode/DragItemAround/Introduction/Intro.html#//apple_ref/doc/uid/DTS10003900