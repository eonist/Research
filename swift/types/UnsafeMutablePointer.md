## general

Memory addressed by UnsafeMutablePointer can be in one of three states:

```swift
/// - Memory is not allocated (for example, pointer is null, or memory has
///   been deallocated previously).
///
/// - Memory is allocated, but value has not been initialized.
///
/// - Memory is allocated and value is initialised.
```

The call

let memory = UnsafeMutablePointer<Character>(allocatingCapacity: count)
allocates memory, but does not initialize it:

```swift
/// Allocate and point at uninitialized aligned memory for `count`
/// instances of `Pointee`.
///
/// - Postcondition: The pointee is allocated, but not initialized.
public init(allocatingCapacity count: Int)
```
On the other hand, the subscripting methods require that the pointee is initialized:

```swift
/// Access the pointee at `self + i`.
///
/// - Precondition: the pointee at `self + i` is initialized.
public subscript(i: Int) -> Pointee { get nonmutating set }
```
As a consequence, your code crashes inside _swift_release_.

To initialize the allocated memory from the (character) array, you can use

memory.initializeFrom(array)
Of course you must de-initialize and deallocate the memory eventually.

A different approach is

```swift
var cArray: [Character] = ["A", "B", "C"]
cArray.withUnsafeMutableBufferPointer { bufPtr  in
    // ...
}
```
Here no new memory is allocated, but the closure is called with a pointer to the arrays contiguous storage. This buffer pointer is only valid inside the closure.


### UnsafeMutablePointer -> Array Extensions:
Solution 1
```swift
extension UnsafeMutablePointer {
    func toArray(capacity: Int) -> [Pointee] {
        return Array(UnsafeBufferPointer(start: self, count: capacity))
    }
}
// Usage of the solution 1
var array = [3.9, 7.7, 11.1, 1.11, 1.02, 3.3, 3.9, 0]
let pointer = UnsafeMutablePointer<Double>.allocate(capacity: array.count)
pointer.initialize(from: &array, count: array.count)
print(pointer.toArray(capacity: array.count))
```

Solution 2
```swift
extension Array {
    init(pointer: UnsafeMutablePointer<Element>, count: Int) {
        let bufferPointer = UnsafeBufferPointer<Element>(start: pointer, count: count)
        self = Array(bufferPointer)
    }
}
// Usage of the solution 2
var array2 = [3.9, 7.7, 11.1, 1.11, 1.02, 3.3, 3.9, 0]
let pointer2 = UnsafeMutablePointer<Double>.allocate(capacity: array.count)
pointer2.initialize(from: &array, count: array.count)
print(Array(pointer: pointer2, count: array.count))
```
