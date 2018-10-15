[apple docs](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Button/Button.html#//apple_ref/doc/uid/10000019i) 

//changing the osx close minimize and max buttons: [here](http://fredandrandall.com/blog/2011/09/22/how-to-make-your-app-window-look-like-the-mac-app-store-twitter-and-chrome/) 

**Position and size**

```swift
//you set pos:
(buttons[0] as NSButton).setFrameOrigin(newPos)

//you set size: 
(buttons[0] as NSButton).setFrameSize(newSize)
```





**Removing a button:**
```swift
removeFromSuperView
```

**to get button size:**

```swift
Swift.print("button.frame.width: " + "\(button.frame.width)")
Swift.print("button.frame.height: " + "\(button.frame.height)")
```

**Add button to titlebar:**  
[here](http://fredandrandall.com/blog/2011/09/14/adding-a-button-or-view-to-the-nswindow-title-bar/) 


**Button with callback**
```swift
import Cocoa

class NSButtonTest {
    let button = NSButton()
    func test(){
        button.target = self
        button.action =  #selector(myAction)
    }
    //The above specifies callback on 'self' to be the function
    @objc func myAction(obj:AnyObject?){//dropping the obj arg also works
        print("press")
        if let btn = obj as? NSButton{
            print(btn.title)
        }
    }
}
```

**Button BackgroundColor with button cell**
```swift
//Supports fill not stroke
(button.cell as! NSButtonCell).bordered = false//The background color is used only when drawing borderless buttons.
(button.cell as! NSButtonCell).backgroundColor = NSColor.redColor()

```

**Setting button style:**

```swift
let button = NSButton(frame: NSRect(x: 0, y: 0, width: width, height: height))
//button.highlight(true)
let buttonCell:NSButtonCell = button.cell! as! NSButtonCell
buttonCell.bezelStyle = bezelStyle//NSBezelStyle.SmallSquareBezelStyle//NSBezelStyle.RoundedBezelStyle  
```
**Add cursor to buttons:**
```objc
- (void)resetCursorRects{
    if (self.cursor) {
        [self addCursorRect:[self bounds] cursor: self.cursor];
    } else {
        [super resetCursorRects];
    }
}
```

**Changing text color of NSButton:**  
[here](https://www.youtube.com/watch?v=zgBG6IemE8M) 
```swift
button.title = "Test"
button.font = NSFont(name: "Century Gothic Bold", size: 26)
```
