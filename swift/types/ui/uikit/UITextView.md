
### UITextView
```swift
var textview = UITextView(frame:CGRectMake(10,100,200,100))
textview.layer.borderWidth = 1
textview.layer.borderColor = UIColor.grayColor().CGColor
self.view.addSubview(textview)
//textview.editable = false
```

## Autolayout:
https://stackoverflow.com/a/36184850/5389500

more info:
https://medium.com/@adrian.creteanu/auto-resizing-uitextview-with-auto-layout-4a7981c39059

```swift
The key to make text view height follow it's content is by NOT SET HEIGHT CONSTRAINT and DISABLE THE SCROLL.

theTextView.isScrollEnabled = false
theTextView.text = "some text"
theTextView.sizeToFit()
But, if you already set the height constraint, then make it inactive

theTextViewHeightConstraint.isActive = false

theTextView.isScrollEnabled = false
theTextView.text = "some text"
theTextView.sizeToFit()
```
