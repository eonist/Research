## **Implicit setters**
You cant name a method setSomeVariable if the variable it sets is named someVariable. Because swift will reserve the name setSomeVariable (must extendNSObject) , unless you make someVariable private. at which point you cant access it via someVariable from other classes. Which beats the purpose of Implicit and Explicit setters. The solution is to use a different naming scheme for your implicit setters (like apply):

```swift
var skinState:String = "abc"
func applySkinState(skinState){
   skinState = skinState + "123"/*Implicit setters usually does something more involved than an explicit setter*/
}
func getSkinState()->String{
   skinState + "xyz"/*Implicit getters usually does something more involved than an explicit setter*/
}
```

NOTE: this does not apply to getters

## **NSRange out of bound**
Asserting "out of bound" NSRanges: (NSNotFound is defined as NSIntegerMax which is: 9223372036854775807)
```
if (someNSRange.location != NSNotFound){
   //the range was not out of bound, you can now safely use it
   //this is useful when doing subString extractions
}

```

## **Finding good documentation:**
```
If you need to know about a component use google: "NSWindow class reference" or "NSButton class reference"
```

## **Pragma mark in swift:**

// MARK:
-> will be preceded by a horizontal divider

// MARK: your text goes here
-> puts 'your text goes here' in bold in the drop down list

// MARK: - your text goes here
-> puts 'your text goes here' in bold in the drop down list, preceded by a horizontal divide

## **Unit testing:**
XCTAssertEqual(2,1+1)//works

## **Unnamed params in methods (with the " _ "chars):**  
```swift
func test(a:Int, _ b:Int){

}
```

## **Required named params in methods (with the # char):**  
```swift
func test(#a:Int, #b:Int){

}
```

## **A method with no arguments can be called without parentheses**

## **Events:**
swift doesnt have events it has NSNotificationCenter, Key-Value-Observation, or delegation., there are libs for events see awesomeswift for these

## **Possibly returning nil?** 
If there is a possibility that your function could return a nil value, you need to specify the return type as optional:

```swift
func myFuncWithOptonalReturnType() -> String? {
    let someNumber = arc4random() % 100
    if someNumber > 50 {
        return "someString"
    } else {
        return nil
    }
}

myFuncWithOptonalReturnType()
``

Use variable names that are occupoed by swift:
```swift
let `class`: Int = 1
self.`class` = `class`
var (id, `class`, element) = (0, 0, 0)
`class`++
```
```swift
let `class`: Int = 1
self.`class` = `class`
var (id, `class`, element) = (0, 0, 0)
`class`++
```

## **Formating Numbers to text: (Short hand)**

```swift
var a = 14
var b = 23

var sum = a + b

var formattedSum = "\(a) + \(b) = \(sum)"
```

## **nil coalescing operator: ??**
```swift
//instead of doing:
var result = a != nil ? a : b
//you can do:
var result = a ?? b
```

## **Working with legacy objc code:**  
If an objc method complaints that it wants:  
```
expected argument type UnsafePointer...
```
Then usualy it means that it wants an inout variable so prefix your arg with & and set the variable to var not let

## Creating swift file with class:

```
https://github.com/khoogheem/SwiftXcodeFileTemplates/tree/master/Swift
```

## NaN Number values
```swift
//assert NaN
doubleValue.isNaN//true false

//set NaN
let val:Double = Double.NaN
```