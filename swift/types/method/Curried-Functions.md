## Curried methods:

When a function returns a function that takes a parameter in this way, it is called a curried function (after the computer scientist Haskell Curry).

```swift
  func makeRoundedRectangleMaker(_ sz:CGSize) -> (CGFloat) -> UIImage {
        return {
            r in
            imageOfSize(sz) {
                let p = UIBezierPath(
                    roundedRect: CGRect(origin:CGPoint.zero, size:sz),
                    cornerRadius: r)
p.stroke() }
} }

 self.myImageView.image = makeRoundedRectangleMaker(CGSize(width:45, height:20))(8)
```
## Simple example: Computed Initializer

```swift
let timed : Bool = {
        if val == 1 {
            return true
        } else {
            return false
        }
}()
```

Sometimes, you’d like to run several lines of code in order to compute a variable’s ini‐ tial value. A simple and compact way to express this is with an anonymous function that you call immediately (see “Define-and-Call” on page 52). I’ll illustrate by rewriting an earlier example:
    ```swift
let timed : Bool = {
    if val == 1 {
        return true
    } else {
        return false
    }
}()
```


Subtle difference between lazy and computed initialiser:  “computed initialiser” is accessed at init of class. Where as lazy is not. Not until something actually calls it

 ```swift
class Temp{
    lazy var timed : Bool = {
        Swift.print("test")
        return true
    }()
}
_ = Temp()//nothing
```

```swift
class Temp{
    var timed : Bool = {
        Swift.print("test")
        return true
    }()
}
_ = Temp()//test
```

Side note: static var is always lazy
