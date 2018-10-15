### removing constraints:

```swift
let cons = signInButton.constraints.filter {
    $0.firstAttribute == NSLayoutAttribute.width || $0.firstAttribute == NSLayoutAttribute.height /// or other from `NSLayoutAttribute`
}
// do something with the constraints array, e.g.
NSLayoutConstraint.deactivate(cons)
```