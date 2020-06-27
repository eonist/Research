- I don't think you should use type alias too much, but here is a good example: (I wonder what scope type alias works under)
- Use regular variable outside classes if you want to define global variables
```swift
//TODO research more about typealias use cases



typealias returnedFunctionType = (Int) -> String

func myFuncThatReturnsAFunc() -> returnedFunctionType {//I think type aliases just makes return types more readable
    return { number in
        return "The lucky number is \(number)"
    }
}

let returnedFunction = myFuncThatReturnsAFunc()

func test(){
    returnedFunction(5) // The lucky number is 5
}

```

This example shows how you can rename a class and keep the old name. Great if you have other classes depending on the old name etc.
```swift
typealias NSViewModifier = ViewModifier
```

Class Alias example: (You can basically create Other names of known classes)

```swift
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound is now 0
```   

//type alias that adher to two Protocols. So whatever is passed in T:Flexible must adher to IPos and ISize
```swift
typealias Flexible = IPositional & ISizeable
```
