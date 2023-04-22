## Generics
Lots of good info on generics: https://www.kodeco.com/books/expert-swift/v1.0/chapters/4-generics
```swift
//NOTE: generics are better than using any or anyobject in that they keep the type that was passed to them
//great example: http://www.thomashanning.com/swift-generics/
//really good on advance generics: http://austinzheng.com/2015/09/29/swift-generics-pt-2/
//also good: http://oleb.net/blog/2015/09/swift-ranges-and-intervals/  (talks about limitation with max int values etc)


```
### Simple generics:
```swift
// constrain T to type:
func add<T: UIView>(view: T) -> T {
    view.parent.addSubview(view)
    return view
}
```
### Generics (subclassing)

```swift
// A
class A<T> {
   /**
    *
    */
   var data: T? { didSet {
       Swift.print("a: \(String(describing: data))")
       }
   }
}
// B
class B: A<String> {
   override var data: String? {
       didSet{
           Swift.print("b: \(String(describing: data))")
       }
   }
}
// C
class C: B {}

let a = A<Int>()
a.data = 2//2
let b = B()
b.data = "duper"//a:duper, b:duper
```


### Generics with Where

```swift
func setCenterConstraints<T: UIView>(_ page:T) where T: ConstraintKind/*<--must be protocol*/ {
	Swift.print(page.frame.width)
	Swift.print(page.anchor)
}
```

```swift

class TestClass {
	var singleProperty : String = "A string"
}
let myInts  = [123, 456, 789, 345, 678, 234]
let myStrings = ["red", "green", "blue"]
let myobjects = [TestClass(), TestClass(), TestClass()]
func displayArray<T>(theArray: [T]) -> T {
	print("Printing the array:")
	for eachitem in theArray {
		print(eachitem)
		print("  :  ")
	}
	print("")
	let finalElement : T = theArray[theArray.count - 1]
	return finalElement
}

var finalInt = displayArray(myInts)
//print(finalInt)
var finalString = displayArray(myStrings)
//print(finalString.uppercaseString)


```



You may have noticed that the bodies of the swapTwoInts(_:_:), swapTwoStrings(_:_:), and swapTwoDoubles(_:_:) functions are identical. The only difference is the type of the values that they accept (Int, String, and Double).
It would be much more useful, and considerably more flexible, to write a single function that could swap two values of any type. Generic code enables you to write such a function. (A generic version of these functions is defined below.)

## NOTE

In all three functions, it is important that the types of a and b are defined to be the same as each other. If a and b were not of the same type, it would not be possible to swap their values. Swift is a type-safe language, and does not allow (for example) a variable of type String and a variable of type Double to swap values with each other. Attempting to do so would be reported as a compile-time error.

Generic Functions

Generic functions can work with any type. Here’s a generic version of the swapTwoInts(_:_:) function from above, called swapTwoValues(_:_:):

```swift

func swapTwoStrings(inout a: String, inout _ b: String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(inout a: Double, inout _ b: Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoValues<T>(inout a: T, inout _ b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
```



### Checking type generically 👌:

```swift
struct Asserter<T>{
    func generic(_ val:Any) -> Bool{
        let type = type(of: val)
        return T.self == type
    }
}
_ = Asserter<String>().generic(2) // false
_ = Asserter<String>().generic("") // true
```


### Generic trickery:

```swift
class A: X {}
class B: Y {}

protocol Q {}
protocol X: Q {}
protocol Y: Q {}
struct Base<T: Q> {}
extension Base where T: X{
    func test(){
        Swift.print("test x")
    }
}
extension Base where T: Y {
    func test(){
        Swift.print("test y")
    }
}
Base<A>().test()//test x
Base<B>().test()//test y
```


### Generic trickery part 2:

```swift
enum Dir {
    case hor, ver
}
struct Ver {}
struct Hor {}

struct Scroller<T> {
    var dir: Dir = T.self == Hor.self ? .hor : .ver
    func scroll() {
        switch dir{
            case .hor:
                Swift.print("Scrolling vertically")
            case .ver:
                Swift.print("Scrolling horizontally")
        }
    }
}
_ = Scroller<Ver>().scroll() // scrolling horizontally
_ = Scroller<Hor>().scroll() // scrolling vertically
```
