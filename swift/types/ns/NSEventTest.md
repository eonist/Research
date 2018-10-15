//Lots of examples: https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/EventOverview/HandlingMouseEvents/HandlingMouseEvents.html

/*

theEvent {
    [self setFrameColor:[NSColor redColor]];
    [self setNeedsDisplay:YES];
}
 
- (void)mouseUp:(NSEvent *)theEvent {
    [self setFrameColor:[NSColor greenColor]];
    [self setNeedsDisplay:YES];
}
 
- (void)drawRect:(NSRect)rect {
    [[self frameColor] set];
    NSRectFill(rect);
}

*/
/*
NSLeftMouseUp

NSRightMouseUp

NSOtherMouseUp

NSLeftMouseDown

NSRightMouseDown

NSOtherMouseDown

NSKeyDown
*/

//code for clicking outside a popup: http://swiftrien.blogspot.no/2015/05/mouse-up-mouse-down-and-popup-menus.html



NSApplication's postEvent:atStart:

class KeyInterceptorWindow : NSWindow {


    override func sendEvent(theEvent: NSEvent) {

        if theEvent.type == .KeyDown || theEvent.type == .KeyDown {
            println(theEvent.description)
            let newEvent = NSEvent.keyEventWithType(theEvent.type, 
                location: theEvent.locationInWindow, 
                modifierFlags: theEvent.modifierFlags, 
                timestamp: theEvent.timestamp, 
                windowNumber: theEvent.windowNumber, 
                context: theEvent.context, 
                characters: "H", 
                charactersIgnoringModifiers: theEvent.charactersIgnoringModifiers!, 
                isARepeat: theEvent.ARepeat, 
                keyCode: theEvent.keyCode)
        super.sendEvent(newEvent!)
    } else {
        super.sendEvent(theEvent)
    }
}


A NSNotification is published to anyone who is interested in this state change, but a NSEvent is only send to the current top most receiver (the object with the focus). A NSEvent isn't meant to be broadcasted through the whole application, but that exactly what a NSNotification is made for.


NOTE: you can stop an NSEvent from propegating by overriding mouseDown and then not call super.mouseDown() in this override. then the event wont propegate up the NSResponder chain





Keyboard event:


```swift
override func flagsChanged(theEvent: NSEvent) {
    if theEvent.modifierFlags.contains(.CommandKeyMask) {
        Swift.print("command key down")
    }   

    if theEvent.modifierFlags.contains(.AlternateKeyMask) {
        Swift.print("option key down")
    }

    if theEvent.modifierFlags.contains([.CommandKeyMask, .AlternateKeyMask]) {
        Swift.print("command and option keys down")
    }   
}
```



```swift
NSEvent.addLocalMonitorForEventsMatchingMask(.KeyDownMask) { (aEvent) -> NSEvent! in
    self.keyDown(aEvent)
    return aEvent
}
/*this is for: cmd,alt,shift etc, you can also obtain the flag information via the KeyDown event*/
NSEvent.addLocalMonitorForEventsMatchingMask(.FlagsChangedMask) { (theEvent) -> NSEvent! in
    self.flagsChanged(theEvent)
    return theEvent
}
```