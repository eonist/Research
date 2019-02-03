```swift
#if os(iOS)
    var image: UIImage?
#elseif os(macOS)
    var image: NSImage?
#endif
```

```swift
#if os(iOS) || os(watchOS) || os(tvOS)
    let color = UIColor.redColor()
#elseif os(OSX)
    let color = NSColor.redColor()
#else
    println("OMG, it's that mythical new Apple product!!!")
#endif
```


```swift
var device = UIDevice.currentDevice().model

func textFieldShouldBeginEditing(textField: UITextField) -> Bool{

    print(device)

    if (textField.tag  == 1 && (device == "iPhone" || device == "iPhone Simulator" )){
        var scrollPoint:CGPoint = CGPointMake(0,passwordTF.frame.origin.y/2);
        LoginScroll!.setContentOffset(scrollPoint, animated: true);
    }
    else if (textField.tag  == 2 && (device == "iPhone" || device == "iPhone Simulator")){
        var scrollPoint:CGPoint = CGPointMake(0,passwordTF.frame.origin.y/1.3);
        LoginScroll!.setContentOffset(scrollPoint, animated: true);
    }

    return true

}
```
