```swift
func binarytotype <T> (_ value: [UInt8], _: T.Type) -> T {
    return value.withUnsafeBufferPointer {
        UnsafeRawPointer($0.baseAddress!).load(as: T.self)
    }
}

func typetobinary<T>(_ value: T) -> [UInt8] {
    var data = [UInt8](repeating: 0, count: MemoryLayout<T>.size)
    data.withUnsafeMutableBufferPointer {
        UnsafeMutableRawPointer($0.baseAddress!).storeBytes(of: value, as: T.self)
    }
    return data
}
Example:

let d = typetobinary(UInt16(1000))
print(d) // [232, 3]
let i = binarytotype(d, UInt16.self)
print(i) // 1000
```

### convert any type to bytes: 

```swift
func toByteArray<T>(_ value: T) -> Any {
    var value = value

    let pointerToT = withUnsafePointer(to: &value) { UnsafeRawPointer($0) }
    let sizeOfT = MemoryLayout<T>.size

    let pointerToBytes = pointerToT.bindMemory(to: UInt8.self, capacity: sizeOfT)
    let bytes = Array(UnsafeBufferPointer(start: bytePointer, count: sizeOfT))

    return bytes
}
```
