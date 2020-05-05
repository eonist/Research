### compactmap

```swift
var nilArr:[String?] = [nil,nil,nil]
let newArr:[String] = nilArr.compactMap { $0 }
Swift.print("newArr.count:  \(newArr.count)")//9
```
