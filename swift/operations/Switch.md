 //swift does not support fall-through switch statement

//if a case is empty then add a break in it, else don't use break
//you can use ranges in cases like: 3...8 which will evaluate a range from 3 to 8

```swift
switch someVal{
    case 1:
		printin("one")
    case 3...8:
		printin("range from 3 to 8")
    default:
		break;
}
```

//You can use the is and as operators in a switch statement’s cases to discover the specific type of a constant or variable that is known only to be of type Any or AnyObject. The example below iterates over the items in the things array and queries the type of each item with a switch statement. Several of the switch statement’s cases bind their matched value to a constant of the specified type to enable its value to be printed:

```swift

for thing in things {
    switch thing {
        case 0 as Int:
            print("zero as an Int")
        case 0 as Double:
            print("zero as a Double")
        case let someInt as Int:
            print("an integer value of \(someInt)")
        case let someDouble as Double where someDouble > 0:
            print("a positive double value of \(someDouble)")
        case is Double:
            print("some other double value that I don't want to print")
        case let someString as String:
            print("a string value of \"\(someString)\"")
        case let (x, y) as (Double, Double):
            print("an (x, y) point at \(x), \(y)")
        case let movie as Movie:
            print("a movie called '\(movie.name)', dir. \(movie.director)")
        case let stringConverter as String -> String:
            print(stringConverter("Michael"))
        default:
            print("something else")
    }
}
```

// zero as an Int
// zero as a Double
// an integer value of 42
// a positive double value of 3.14159
// a string value of "hello"
// an (x, y) point at 3.0, 5.0
// a movie called 'Ghostbusters', dir. Ivan Reitman
// Hello, Michael


or operator example in swift:

```swift
import Cocoa

var index = 10

switch index {
   case 100  :
      println( "Value of index is 100")
   case 10,15  :
      println( "Value of index is either 10 or 15")
   case 5  :
      println( "Value of index is 5")
   default :
      println( "default case")
}
```

//fallthrough example:

```swift
import Cocoa

var index = 10

switch index {
   case 100  :
      println( "Value of index is 100")
      fallthrough
   case 10,15  :
      println( "Value of index is either 10 or 15")
      fallthrough
   case 5  :
      println( "Value of index is 5")
   default :
      println( "default case")
}
```

//switch on a tuple:

The usual rules for the Fizz buzz game are to replace every multiple of 3 by "Fizz", every multiple of 5 by "Buzz", and every multiple of both 3 and 5 by "Fizz Buzz".

This can be done with a switch statement on the tuple (i % 3, i % 5). Note that _ means "any value":

for i in 1 ... 100 {
    switch (i % 3, i % 5) {
    case (0, 0):
        print("Fizz Buzz")
    case (0, _):
        print("Fizz")
    case (_, 0):
        print("Buzz")
    default:
        print(i)
    }
}



Switch statement basics
A simple switch statement follows:

```swift
let value = 10
switch value {
    case 10: println("ten")         // this is printed
    case 20: println("twenty")
    case 30: println("thirty")
    default: println("some other number")
}
```
The switch statement above looks very similar to a switch statement that one might find in C. However, there are several key differences:

The test expression, in this case value, does not need to be surrounded by parentheses.
There is a default catch-all clause. In Swift, switch statements must be exhaustive.
There is no use of the keyword break, although it exists and can be used. In Swift, only one branch is executed by default; Swift does not carry over C’s fallthrough-by-default behavior. Fallthrough behavior must be manually specified using fallthrough.
Switch branches cannot be empty; use break to indicate that nothing should be done for a given branch.

Switching on equatable values
Swift’s switch statement can match not only numbers, but any equatable type (such as strings):
```swift
let stateCode = "CA"
switch stateCode {
    case "CA": println("California")    // this is printed
    case "DE": println("Delaware")
    case "PA": println("Pennsylvania")
    case "TX": println("Texas")
    default: println("Another state...")
}
Switching on ranges
Swift can also match numeric expressions to ranges (constructed using ... or ..<):

let v = 15
switch abs(v) {
    case 0...9: println("single digit")
    case 10...99: println("double digits")
    case 100...999: println("triple digits")
    default: println("four or more digits")
}
```
Switching on tuples
When the predicate expression is a tuple type, Swift matches each part of the tuple separately:
```swift
let person = ("Helen", 25)
switch person {
    case ("Helen", let age):
        println("You are Helen, and you are \(age) years old")
    case (_, 13...19):
        println("You are a teenager, not named Helen")
    case ("Bob", _):
        println("You are not a teenager, but your name is Bob")
    case (_, _):
        println("No comment")
}
```
A few things to note:

The _ can be used as a don’t care marker. For example, the second case will ignore the first tuple element (the person’s name).
The final expression,  functions as a catch-all and is exactly equivalent to default in this example.
Binding values in cases
As seen in the previous section, the let keyword can be used in patterns to create a temporary binding for a value. For example:

```swift
let myTuple = ("abcd", 1234)
switch myTuple {
    case let (x, y):
        println("the string 'x' is \(x), the integer 'y' is \(y)")
}

```
Note that a let-binding pattern always succeeds. This is why our single case above is sufficient to make the switch statement exhaustive. As well, if we only care about binding some of the elements in the tuple, we can use _ to ignore the ones we don’t care about.

The following example is exactly equivalent, since let distributes over the patterns in the tuple:
```swift
let myTuple = ("abcd", 1234)
switch myTuple {
    case (let x, let y):
        println("the string 'x' is \(x), the integer 'y' is \(y)")
}
```
Finally, it is also possible to use var in lieu of let, allowing you to change the value of the symbol. (This is generally a bad idea, though.)

Switching on enums
Switch statements are an easy way to work with basic and raw-valued enums, and the only real way to work with enums with associated values. Switching on enums is quite straightforward:
```swift
enum Direction {
    case North, South, West, East
}
let myDir = Direction.West
switch myDir {
    case .North: println("you're going north")
    case .South: println("you're going south")
    case .West: println("you're going west")
    case .East: println("you're going east")
}
```
Notice that we didn’t need to fully qualify each case (e.g. case Direction.North). Swift’s type inference knows that the predicate expression is of type Direction, so we can use the abbreviated syntax for specifying each case.

If we have enums with associated values, we can use let-binding to get at the values:
```swift
enum ParseResult {
    case Coordinates(Int, Int)
    case Error(String)
}
let result = ParseResult.Coordinates(12, 15)
switch result {
    case let .Coordinates(x, y):
        println("Successful parse. Coords are (\(x), \(y)).")
    case .Error(let err):
        println("Failed parse. Error is \(err)")
}
```
Note again the two ways the let-binding can be set up.

Switching on subtypes
If the switch predicate’s type is a class, it’s possible to use is and as to switch on subtypes. For example:
```swift
let view : UIView = getView() // get a view...
switch view {
    case is UIImageView:
        println("It's an image view")
    case let label as UILabel:
        println("It's a label")
    case let tblv as UITableView:
        let sectionCount = tblv.numberOfSections()
        println("It's a table view with \(sectionCount) sections")
    default:
        println("It's some other UIView or subclass")
}
```
is just checks the type, while as is used along with let to downcast the predicate. For example, even though view is a UIView, tblv is a UITableView, so we can call methods and properties specific to that subclass on tblv.

Note that the cases must describe subclasses of the predicate’s type. For example, the compiler is smart enough to reject a case like case is UIView, since that case will always match.

where guards
Any case can be further qualified with a guard clause. The guard clause follows the case’s pattern, and is comprised of the keyword where followed by an expression that evaluates to true or false. Here is an example of a switch statement where all matching logic is carried out through guard clauses:
```swift
let view : UIView = getView() // get a view...
switch view {
    case _ where view.frame.size.height < 50:
        println("This view is shorter than 50 units")
    case _ where view.frame.size.width > 20:
        println("This view is at least 50 units tall, and more than 20 units wide")
    case _ where view.backgroundColor == UIColor.greenColor():
        println("This view is at least 50 units tall, at most 20 units wide, and green")
    default:
        println("This view can't be described by this example")
}
```
Unfortunately, guard clauses tend to force you to include a default case, since the exhaustiveness checker cannot really reason about the logic within the guard clauses.

Switch expressions
Unlike similar switch constructs in languages such as Rust or Scala, Swift’s switch statement can’t be used as an expression.

This is inconvenient, especially when you wish to use a switch statement to initialize a constant to one of several values. Normally, you would have to declare a var instead, give it a default value, and then set it to the correct value using the switch statement. This is ugly and can obscure your intent.

However, there exists a workaround. You can wrap a switch statement in a closure and call that closure, simulating a proper switch expression. An example follows:
```swift
let name = "blue"
let color : UIColor = {
    switch name {
        case "red": return UIColor.redColor()
        case "green": return UIColor.greenColor()
        case "blue": return UIColor.blueColor()
        case "yellow": return UIColor.yellowColor()
        default: return UIColor.clearColor()
    }
    // color is now UIColor.blueColor()
}()
```
We declare the constant color of type UIColor. We then initialize it to the result of running an anonymous closure ( = { ... }()). Finally, we write code in the closure to return one of several colors depending on the value of name. This closure’s type is inferred to be () -> UIColor, so running it produces a UIColor value.

Thank you for reading this rather long post about Swift’s pattern-matching switch statement! The next blog post in this series will discuss customizing the pattern-matching system.

### Tuple switching:

```swift
let prev:Int = 1
let cur:Int = 0

switch (cur,prev){
    case (0,1):
        print("cur is 0, prev is 1")
    case (1,0):
        print("cur is 1, prev is 0")
    default:
        print("uh-ho")
        break;
}

//cur is 0, prev is 1
```

```swift
let elements = ("aa", "bb", 2)

// Match complete tuple values.
switch (elements) {
case (_, _, 1): print("Third value is 1")
case (_, _, 2): print("Third value is 2")
default: print("Error")
}

```

```swift
enum Letters:String {
    case a = "a"
    case b = "b"
}

switch Letters.init(rawValue:toMatch) {
    case .some(.a) : print("a")
    case .some(.b) : print("b")
    case .none: fatalError("type not supported \(toMatch)")
}
```

```swift
enum Letters:String {
    case a = "a"
    case b = "b"
}

func == (left: String, right: Letters) -> Bool {
    return left == right.rawValue
}

let toMatch:String = "b"

switch true{
    case toMatch == Letters.a : print("a")
    case toMatch == Letters.b : print("b")
    default: print("no match found")
}

```

### If case:

```swift
if case Nav.ViewType.dialog( _) = viewType{
    Swift.print("🏀")
}else if case Nav.ViewType.main( _ ) = viewType{
    Swift.print("🍏")
}
```

### Switch example (using type):

```swift
switch data {
case is PrimaryCellData: Swift.print("someValue")
case is SecondaryCellData: Swift.print("someValue")
case is TertiaryCellData: Swift.print("someValue")
default: UITableViewCell.init()
}
```
