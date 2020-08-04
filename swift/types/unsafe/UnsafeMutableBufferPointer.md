
## Init

```swift
let count = 50
let ptr = UnsafeMutablePointer<Int>.alloc(count)
let buffer = UnsafeMutableBufferPointer(start: ptr, count: count)
for (i, _) in buffer.enumerate() {
    buffer[i] = Int(arc4random())
}

// Do stuff...

ptr.dealloc(count)   // Don't forget to dealloc!
```


## Convert array to unsafeBufferpointer


```swift
let data: Data = pixels.withUnsafeBufferPointer {
     return Data(buffer: $0)
  }
```
