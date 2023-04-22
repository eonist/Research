### ios
```swift
#if os(iOS)
#endif
```

### macos
```swift
#if os(macOS)
#endif
```

### iOS / macos
```swift
#if os(iOS)
    var image: UIImage?
#elseif os(macOS)
    var image: NSImage?
#endif
```

### Hybrid type:
```swift
#if os(iOS)
import UIKit
public typealias Color = UIColor
#elseif os(macOS)
import Cocoa
public typealias Color = NSColor
#endif
```

### TV / watch
```swift
#if os(iOS) || os(watchOS) || os(tvOS)
    let color = UIColor.redColor()
#elseif os(OSX)
    let color = NSColor.redColor()
#else
    println("OMG, it's that mythical new Apple product!!!")
#endif
```

### Simulator
```swift
#if targetEnvironment(simulator)
   return true
#else
   return false
#endif
```

### Not simulator
```swift
#if !targetEnvironment(simulator) // ⚠️️ Will only work on real device
#endif
```

### Debug
```swift
#if DEBUG
  performAdditionalChecks()
#endif

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

### Resources:
https://docs.swift.org/swift-book/ReferenceManual/Statements.html#ID539
```
macOS, iOS, watchOS, tvOS, Linux, Windows
```

### Import based clause:

```swift
#if canImport(CryptoKit)
import CryptoKit
#endif
```


## Combining clauses:

```swift
#if canImport(XCTest) && os(iOS)
#endif
```
