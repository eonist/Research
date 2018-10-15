## Intro:

**private setter public getter variable swift**

```swift
private(set) public var readonlyProperty: Int
```

**for none framework code:**
```swift
private(set) internal var readonlyProperty: Int
```

**This also works:**

```swift
private(set) static var recentlyOpenedFiles:Array<String> = []
```


## Simple example: 
A computed variable can sit in front of one or more stored variables, acting as a gatekeeper on how those stored variables are set and fetched.

```swift
private var _p : String = ""
var p : String {
    get {
        return self._p
	} set {
        self._p = newValue
    }
}
```

## Cache example:

```swift
private var _myBigData : Data! = nil
var myBigData : Data! {
    set (newdata) {
        self._myBigData = newdata
    } get {
        if _myBigData == nil {
            // ... get a reference to file on disk, f ...
            if let d = try? Data(contentsOf:f) {
                self._myBigData = d
                // ... erase the file ...
            }
        }
        return self._myBigData
    }
}
```