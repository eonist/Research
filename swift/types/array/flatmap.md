This is now compactmap

```swift
var nilArr:[String?] = [nil,nil,nil]
let newArr:[String] = nilArr.flatMap { $0 }
Swift.print("newArr.count:  \(newArr.count)")//9
```
