```swift
let p = UnsafeMutableRawPointer.allocate(byteCount: 1000, alignment: MemoryLayout<UInt8>.alignment)
p.initializeMemory(as: UInt8.self, repeating: 0, count: 1000)

// Do stuff ...

p.deallocate()


or

let uint8ptr = p.initializeMemory(as: UInt8.self, repeating: 0, count: 1000)
// UnsafeMutablePointer<UInt8>
```
