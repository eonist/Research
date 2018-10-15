### Lazy in local scope:

```swift
let someCondition = true
var _color:NSColor?
var color:NSColor {if _color == nil {_color = .blue;print("only created once")};return _color!}
if someCondition {
    color
}
color

```

### Lazy in global static scope:
```swift
//this isnt called until its referenced! And its not regenerated when called later
static var prefs:String = {
    Swift.print("wow")
    return "prefsData"
}()
```