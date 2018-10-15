//Custom Operators

//You can declare and implement your own custom operators in addition to the standard operators provided by Swift. For a list of characters that can be used to define custom operators, see Operators.

//New operators are declared at a global level using the operator keyword, and are marked with the prefix, infix or postfix modifiers:

prefix operator +++ {}
//The example above defines a new prefix operator called +++. This operator does not have an existing meaning in Swift, and so it is given its own custom meaning below in the specific context of working with Vector2D instances. For the purposes of this example, +++ is treated as a new “prefix doubling incrementer” operator. It doubles the x and y values of a Vector2D instance, by adding the vector to itself with the addition assignment operator defined earlier:

prefix func +++ (inout vector: Vector2D) -> Vector2D {
    vector += vector
    return vector
}
//This implementation of +++ is very similar to the implementation of ++ for Vector2D, except that this operator function adds the vector to itself, rather than adding Vector2D(1.0, 1.0):

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
// toBeDoubled now has values of (2.0, 8.0)
// afterDoubling also has values of (2.0, 8.0)


or this one from here: (http://www.raywenderlich.com/80818/operator-overloading-in-swift-tutorial)

infix operator ⊕ { associativity left precedence 140 } // 1
func ⊕(left: [Int], right: [Int]) -> [Int] { // 2
    var sum = [Int](count: left.count, repeatedValue: 0)
    assert(left.count == right.count, "vector of same length only")
    for (key, v) in enumerate(left) {
        sum[key] = left[key] + right[key]
    }
    return sum
}

This one works:

infix operator ⊕ { associativity left precedence 140 }
func ⊕<T>(left: [T], right: [T]) -> [T] { // 1
    var minus = [T]()
    assert(left.count == right.count, "vector of same length only")
    for (key, v) in enumerate(left) {
        minus.append(left[key] + right[key]) // 2
    }
    return minus
}


extending with protocol:

protocol Number {  // 1
    func +(l: Self, r: Self) -> Self // 2
}
 
extension Double : Number {} // 3
extension Float  : Number {}
extension Int    : Number {}
 
infix operator ⊕ { associativity left precedence 140 }
func ⊕<T: Number>(left: [T], right: [T]) -> [T] { // 4
    var minus = [T]()
    assert(left.count == right.count, "vector of same length only")
    for (key, v) in enumerate(left) {
        minus.append(left[key] + right[key])
    }
    return minus
}