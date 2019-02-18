### Examples:

```swift
//THis is like do while in other languages

var someOptionalInt: Int?

repeat{
    println("Trying to get an integer")
    someOptionalInt = functionThatMayReturnAnInteger()
    //change condition
    //always executed once

} while (someOptionalInt != nil)

println("Got a nil instead")


while i < 5{
    println("\(i)")
    i++
    //change condition
}
```


### For loop:

```swift
let start:Int = 0
let end:Int = 5

var i:Int = end

while(i >= start){//to skip end int use: >
    print(i)//5,4,3,2,1,0
    i--
}
```


## For loop alternative for swift3 (using while):
```swift
//Continue won't work with the bellow:
var i = 0
while i < N {
  if predicate(i) break
  i += 1
}
if(i < N)
/* loop terminated early */
else
/* loop completed */
```

//enumerate:
for (index, value) in shoppingList.enumerate() {
    print("Item \(index + 1): \(value)")
}

//repeat while:

```swift
var size = 10
repeat {
    // Increment.
    size++

    // Print the value.
    print(size)
} while size < 16
```

### While loop over nth: 👌

```swift
//while loop over nth

var i = 0//string index

while i < 25 {
    if (i % 5) == 0 {//every...nth page
        print("nth: \(i)")//0,10,15,20
    }else{
        print("\(i)")
    }
    i += 1
}

```
