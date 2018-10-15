### Making a struct hashable: (aka able to be used as key in dict)

```swift
struct Point2D: Hashable{
    var x : CGFloat = 0.0
    var y : CGFloat = 0.0

    var hashValue: Int {
        return "(\(x),\(y))".hashValue
    }

    static func == (lhs: Point2D, rhs: Point2D) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}
```