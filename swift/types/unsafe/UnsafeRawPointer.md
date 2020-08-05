https://swift.org/migration-guide-swift3/se-0107-migrate.html
http://atrick.github.io/proposal/voidpointer.html


```swift
do {
  print("Getting the bytes of an instance")

  var sampleStruct = SampleStruct(number: 25, flag: true)

  withUnsafeBytes(of: &sampleStruct) { bytes in
    for byte in bytes {
      print(byte)
    }
  }
}
```
