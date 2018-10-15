## For loops:

Important: no need to use temp variables for .count:   

```swift
let arr = [1,2,3]
let len = arr.count//<--Don't do this
for i in 0..<len{//<--Instead use arr.count directly, the .count is cached in swift for get 
    print(i)
}
```

```swift
let primeNumbers = [2, 3, 5, 7]

for number in primeNumbers{//can also work with strings printing out single chars, like in applescript
    print("\(number)")
}

for var i = 0; i < 3; ++i{
    print(i)
}

for var i = self.subviews.count-1; i > -1; --i{
    Swift.print(i)
}

//loop with range
//CAUTION: this doesnt work with tiny ranges such as 0 to 1 or 0 to 0 or 1 to 1 etc. For safty use regular for i
for index in 1...9 {//0...someVal will also work, or 0...<5 will do 0-4
    //do something with index
    print(index)
}

//reapeat 5 times:
for _ in 0...5 {//avoids creating the i variable if your not going to use it, but need to repate something 5 times
    print("go")
}

//for loop with a break:
//break statement exiting a for..in statement
for count in 1...10 { //I supposed to loop 10 times
    if (count == 5) {
        break //I terminates Loop if count is 5
    }
    print("\(count)  ")
}

//for loop with continue:
//continue statement exiting a for...in statement
for count in 1...10 { // supposed to loop 10 times
    if (count == 5) {
        continue // move to next iteration of the loop
    }
    print("\(count)  ")
}
// for...in loop with enumerate global function

/*
let integers = [21,2,13,5,223]
for (index, element) in enumerate(integers) {//enumerate returns tuple
    print(String(format:"%5d%7d", index, element))
}
*/

//Enumeration example: (this is good!!)

let array = ["Apples", "Peaches", "Plums"]

for (index, item) in array.enumerate() {
    print("Found \(item) at position \(index)")
}


//reverse
var listOfNumbers = [1, 2, 3, 10, 100]

  for var i = listOfNumbers.count - 1; i >= 0; --i {
      println(listOfNumbers[i])
  }
```


### Reverse:

```swift
for i in (1...10).reverse() {
    print(i)
}
```

### Reverse example 2:

```swift
var stringArray = ["a","b","c","d","e","f","g","h","i","j"]
stringArray.count//10
for i in (0..<stringArray.count).reverse() {
    print(i)//9,8,7,6,5,4,3,2,1,0
}

```

### Reverse example 3: 

```swift
//this example is relevant in cases where you cant use a range, for instance if end is negative
let start:Int = 0
let end:Int = 5

var i:Int = end

while(i >= start){
    print(i)//5,4,3,2,1,0
    i--
}
```


## skip every other:
```swift

c-style for looping: for (var i:Int = 0; i < parameters.count; i+=2){}

var stringArray = ["a","b","c","d","e","f","g","h","i","j"]
var result:[String] = []
for i in 0.stride(to: stringArray.count, by: 2) {/*replace 0 with 1 and you start at 1*/
    result.append(stringArray[i])
}
print(result)//a,c,e,g,i
```