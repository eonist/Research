```swift
let array = ["Apples", "Peaches", "Plums"]

for (index, item) in array.enumerated() {/*you can also do (index,_) if you only need the index, or the other way around if you only need the element*/
    print("Found \(item) at position \(index)")// "Found Apples at position 0", "Found Peaches at position 1", and "Found Plums at position 2".
}

```

## Another example:

```swift
let numbers = [7, 8, 9, 10]
let indexAndNum: [String] = numbers.enumerate().map { (index, element) in
    return "\(index): \(element)"
}
print(indexAndNum)
// ["0: 7", "1: 8", "2: 9", "3: 10"]
```

### You can change the list while iterating over it:

```swift
var arr = [1,2,3]

for (_,elmnt) in arr.enumerate(){
    arr.removeLast()
    print(arr.last)//3,2,1
}

arr//[]
```