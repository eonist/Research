An UnsafeRawBufferPointer lets you access memory as if it were a collection of bytes. This means you can iterate over the bytes and access them using subscripting. You can also use cool methods like filter, map and reduce. You initialize the buffer pointer using the raw pointer.

```swift
// 1
let count = 2
let stride = MemoryLayout<Int>.stride
let alignment = MemoryLayout<Int>.alignment
let byteCount = stride * count
// 2
do {
  print("Raw pointers")
  // 3
  let pointer = UnsafeMutableRawPointer.allocate(
    byteCount: byteCount,
    alignment: alignment)
  // 4
  defer {
    pointer.deallocate()
  }
  // 5
  pointer.storeBytes(of: 42, as: Int.self)
  pointer.advanced(by: stride).storeBytes(of: 6, as: Int.self)
  pointer.load(as: Int.self)
  pointer.advanced(by: stride).load(as: Int.self)
  // 6
  let bufferPointer = UnsafeRawBufferPointer(start: pointer, count: byteCount)
  for (index, byte) in bufferPointer.enumerated() {
    print("byte \(index): \(byte)")
  }
}
```

### Converting Raw Pointers to Typed Pointers
You don’t always need to initialize typed pointers directly. You can derive them from raw pointers as well.

Add the following code to your playground:
```swift

do {
  print("Converting raw pointers to typed pointers")

  let rawPointer = UnsafeMutableRawPointer.allocate(
    byteCount: byteCount,
    alignment: alignment)
  defer {
    rawPointer.deallocate()
  }

  let typedPointer = rawPointer.bindMemory(to: Int.self, capacity: count)
  typedPointer.initialize(repeating: 0, count: count)
  defer {
    typedPointer.deinitialize(count: count)
  }

  typedPointer.pointee = 42
  typedPointer.advanced(by: 1).pointee = 6
  typedPointer.pointee
  typedPointer.advanced(by: 1).pointee

  let bufferPointer = UnsafeBufferPointer(start: typedPointer, count: count)
  for (index, value) in bufferPointer.enumerated() {
    print("value \(index): \(value)")
  }
}
```
