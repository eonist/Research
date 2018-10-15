**Undefined num of params in a method:**

```
func test(numbers: Double...)->Int{
    return numbers.count
}
Swift.print(test(2,4,1,4))//Output: 4
```
**Another example:**
```swift
func average(numbers: Double...) -> Double {// calculate average
    let total = numbers.reduce(0.0, combine: {$0 + $1})
    return total / Double(numbers.count)
}
```