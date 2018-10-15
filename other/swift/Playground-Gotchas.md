**Live preview in playground**:  
NOTE: the "holder" is a subclass of NSView   
NOTE: click the overlapping circle icon in the top right corner of the gui to find the live panel  
NOTE: Sometimes you have to click the arrows under the circles to find the correct live view.  
NOTE: You also have to flip the view and set the frame in the init  
```swift
import XCPlayground
import XCTest
XCPlaygroundPage.currentPage.liveView = holder
```