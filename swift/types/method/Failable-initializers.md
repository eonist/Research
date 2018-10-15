## Simple example:

An initializer can return an Optional wrapping the new instance. In this way, nil can be returned to signal failure. An initializer that behaves this way is a failable initial‐ izer. To mark an initializer as failable when declaring it, put a question mark after the keyword init. If your failable initializer needs to return nil, explicitly write return nil. It is up to the caller to test the resulting Optional for equivalence with nil, unwrap it, and so forth, as with any Optional.

```swift
 class Dog {
        let name : String
        let license : Int
        init?(name:String, license:Int) {
            if name.isEmpty {
                return nil
            }
            if license <= 0 {
				return nil 
			}
            self.name = name
            self.license = license
        }
}
```

The resulting value is typed as an Optional wrapping a Dog, and the caller will need to unwrap that Optional (if isn’t nil) before sending any messages to it.
Cocoa and Objective-C conventionally return nil from initializers to signal failure; the API for such initializers has been hand-tweaked as a Swift failable initializer if ini‐ tialization really might fail. For example, the UIImage initializer init?(named:) is a failable initializer, because there might be no image with the given name. It is not implicitly unwrapped, so the resulting value is a UIImage?, and will typically have to be unwrapped before using it. (Most Objective-C initializers, however, are not bridged as failable initializers, even though in theory any Objective-C initializer might return nil.)