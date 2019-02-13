https://giorgiocalderolla.com/cross-platform-swift.html

```swift
#if os(iOS)
  import UIKit
  public typealias Responder = UIResponder
  public typealias Image = UIImage
  public typealias Color = UIColor
#elseif os(OSX)
  import AppKit
  public typealias Responder = NSResponder
  public typealias Image = NSImage
  public typealias Color = NSColor
#endif
```



also you can do


```swift
#if canImport(CoreGraphics)
import CoreGraphics

#if canImport(UIKit)
import UIKit
#endif

#if canImport(Cocoa)
import Cocoa
#endif

// MARK: - Properties
public extension CGColor {

    #if canImport(UIKit)
    /// SwifterSwift: UIColor.
    public var uiColor: UIColor? {
        return UIColor(cgColor: self)
    }
    #endif

    #if canImport(Cocoa)
    /// SwifterSwift: NSColor.
    public var nsColor: NSColor? {
        return NSColor(cgColor: self)
    }
    #endif

}
#endif
```
