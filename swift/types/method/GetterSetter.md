
NOTE: consider using structs 


```swift
var x:Int

var xTimesTwo:Int {
    set {
       x = newValue / 2
    }
    get {
        return x * 2
    }
}


var diameter: Double {
  return radius * 2
}

//also:

var diameter: Double {
  get {
    return radius * 2
  }
}
```


**Overriding variables**

```swift
class A{
    var x:CGFloat = 0
}
class B:A{
    override var x:CGFloat {get{return super.x}set{super.x = newValue}}
}


let b:B = B()
b.x = 5
b.x//outputs 5
```
## Setter Observers:
Swift has another feature, which lets you inject functionality into the setter of a stored variable — setter observers. These are functions that are called just before and just after other code sets a stored variable.
The syntax for declaring a variable with a setter observer is very similar to the syntax for declaring a computed variable; you can write a willSet function, a didSet function, or both:

```swift
 var s = "whatever" {
        willSet {
            print(newValue)
        }
didSet {
     print(oldValue)
            // self.s = "something else"
        }
}
```