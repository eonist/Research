
//math related to the rectangle
//Examples of good candidates for structures include:

//The size of a geometric shape, perhaps encapsulating a width property and a height property, both of type Double.
//A way to refer to ranges within a series, perhaps encapsulating a start property and a length property, both of type Int.
//A point in a 3D coordinate system, perhaps encapsulating x, y and z properties, each of type Double.

/*
struct Point {
var x = 0.0, y = 0.0
}
struct Size {
var width = 0.0, height = 0.0
}
struct Rect {
var origin = Point()
var size = Size()
var center: Point {
get {
let centerX = origin.x + (size.width / 2)
let centerY = origin.y + (size.height / 2)
return Point(x: centerX, y: centerY)
}
set(newCenter) {
origin.x = newCenter.x - (size.width / 2)
origin.y = newCenter.y - (size.height / 2)
}
}
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


*/

// prints "square.origin is now at (10.0, 10.0)"

//Shorthand Setter Declaration
//If a computed property’s setter does not define a name for the new value to be set, a default name of newValue is used. Here’s an alternative version of the Rect structure, which takes advantage of this shorthand notation:




/*
struct AlternativeRect {
var origin = Point()
var size = Size()
var center: Point {
get {
let centerX = origin.x + (size.width / 2)
let centerY = origin.y + (size.height / 2)
return Point(x: centerX, y: centerY)
}
set {
origin.x = newValue.x - (size.width / 2)
origin.y = newValue.y - (size.height / 2)
}
}
}
*/

/*
//You can simplify the declaration of a read-only computed property by removing the get keyword and its braces

struct Cuboid {
var width = 0.0, height = 0.0, depth = 0.0
var volume: Double {
return width * height * depth
}
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// prints "the volume of fourByFiveByTwo is 40.0"

*/

/*
Modifying Value Types from Within Instance Methods

Structures and enumerations are value types. By default, the properties of a value type cannot be modified from within its instance methods.

However, if you need to modify the properties of your structure or enumeration within a particular method, you can opt in to mutating behavior for that method. The method can then mutate (that is, change) its properties from within the method, and any changes that it makes are written back to the original structure when the method ends. The method can also assign a completely new instance to its implicit self property, and this new instance will replace the existing one when the method ends.

You can opt in to this behavior by placing the mutating keyword before the func keyword for that method:

*/

/*
struct Point {
var x = 0.0, y = 0.0
mutating func moveByX(deltaX: Double, y deltaY: Double) {
x += deltaX
y += deltaY
}
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveByX(2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
// prints "The point is now at (3.0, 4.0)"


//
let size = CGSize(width: 20, height: 40)
//The overlay also lets you call Foundation functions on structures in a natural way.

let rect = CGRect(x: 50, y: 50, width: 100, height: 100)
let width = rect.width    // equivalent of CGRectGetWidth(rect)
let maxX = rect.maxY      // equivalent of CGRectGetMaxY(rect)

*/
