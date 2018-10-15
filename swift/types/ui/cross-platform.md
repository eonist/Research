https://giorgiocalderolla.com/cross-platform-swift.html

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