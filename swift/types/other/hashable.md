### Making a struct hashable: (aka able to be used as key in dict)

### Resources:
- https://useyourloaf.com/blog/swift-hashable/
- https://developer.apple.com/documentation/swift/hashable
- https://swiftrocks.com/how-hashable-works-in-swift
- https://www.hackingwithswift.com/articles/115/swift-4-2-improves-hashable-with-a-new-hasher-struct

```swift
struct Point2D: Hashable {
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

### Hashable:
```swift
struct IPad: Hashable {
    var serialNumber: String
    var capacity: Int
}
//Because that conforms to the Hashable protocol and both it's properties also conform to the Hashable protocol, Swift will generate a hash(into:) method automatically.

//However, in this case we can see that serialNumber is enough to identify each iPad uniquely so hashing capacity isn’t needed. So, we can write our own implementation of hash(into:) that hashes just that one property:
extension IPad
   func hash(into hasher: inout Hasher) {
       hasher.combine(serialNumber)
   }
}
```

### Another example:
```swift
struct Contact : Hashable {

 var id = UUID()
 var firstName: String
 var lastName: String
 var emailAddress: String

 func hash(into hasher: inout Hasher) {
   hasher.combine(id)
 }

 static func == (lhs: Contact, rhs: Contact) -> Bool {
   lhs.id == rhs.id
 }
}
```
