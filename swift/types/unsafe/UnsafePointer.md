UnsafePointer(self.bytes) is only a pointer conversion from UnsafePointer<Void> to UnsafePointer<UInt8> (like a "cast" in C). It does not allocate memory.

The memory is managed by the NSData object. You did not alloc() the memory and therefore must not call dealloc() on the pointer. You also did not initialize() the memory and therefore must not destroy() it.

https://www.raywenderlich.com/7181017-unsafe-swift-using-pointers-and-interacting-with-c
https://medium.com/@shoheiyokoyama/manual-memory-management-in-swift-c31eb20ea8f
https://www.xspdf.com/resolution/51682704.html
https://swiftdoc.org/v5.1/type/unsafemutablepointer/

### copy to array
```swift
let bytesArray: [UInt8] = UnsafeBufferPointer(start: bts, count: bytes.count).map{$0}
```

<img width="620" alt="img" src="https://github.com/stylekit/img/blob/master/pointers.png?raw=true">

### to byte array from generic array
```swift
public static func toByteArray<T>(_ value: T) -> [UInt8] where T: FixedWidthInteger {
        var value = value
        return withUnsafePointer(to: &value) {
            $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout<T>.size) {
                Array(UnsafeBufferPointer(start: $0, count: MemoryLayout<T>.size))
            }
        }
    }
```
