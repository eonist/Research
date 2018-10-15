
```swift
//IMPORTANT: It is available only when your class is subclass of NSObject
//from here: http://stackoverflow.com/questions/24245262/call-a-method-from-a-string-in-swift
class TestClass: NSObject {
    func test() -> Void {
        print("Hello");
    }
}

let test = TestClass()
let aSel : Selector = NSSelectorFromString("test")
test.performSelector(aSel)
```

```swift
let selectorName = "name"
perform(Selector(selectorName))
```