### UIView
```swift
var DynamicView=UIView(frame: CGRectMake(100, 200, 100, 100))
DynamicView.backgroundColor=UIColor.greenColor()
DynamicView.layer.cornerRadius=25
DynamicView.layer.borderWidth=2
self.view.addSubview(DynamicView)
```



### ButtonView

```swift

/**
 * View that can be pressed like a button
 */

import UIKit

class ButtonView : UIView {

    /* Called when the view goes to normal state (set desired appearance) */
    var onNormal = {}
    /* Called when the view goes to pressed state (set desired appearance) */
    var onPressed = {}
    /* Called when the view is released (perform desired action) */
    var onReleased = {}

    override init(frame: CGRect)  {
        super.init(frame: frame)

        let recognizer = UILongPressGestureRecognizer(target: self, action: Selector("touched:"))
        recognizer.delegate = self
        recognizer.minimumPressDuration = 0.0
        addGestureRecognizer(recognizer)
        userInteractionEnabled = true

        onNormal()
    }

    func touched(sender: UILongPressGestureRecognizer) {
        if sender.state == .Began {
            onPressed(self)
        } else if sender.state == .Ended {
            onNormal(self)
            onReleased()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Usage:

```swift
let btn = ButtonView()
btn.onNormal = { btn.backgroundColor = .clearColor() }
btn.onPressed = { btn.backgroundColor = .blueColor() }
btn.onReleased = yourAction // Function to be called
```
