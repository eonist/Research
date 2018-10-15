Notes on associated type 


```swift
protocol Thing {
    associatedtype argType
    func doit(val:argType) -> argType
}

class IntThing : Thing {
    func doit(val: Int) -> Int {
        return val + 1
    }
}

func doThing<A:Thing>(thing:A, val:A.argType) -> A.argType {
    return thing.doit(val)
}

doThing(IntThing(), 2)//3
```

See the mosby example for a more advance example: [here](http://eon.codes/blog/2017/03/22/mosby-swift/)  

http://www.russbishop.net/swift-associated-types


https://www.youtube.com/watch?v=XWoNjiSPqI8


### Associated Type Constraints
You can now constrain associated types using the where clause [SE-0142]:
```swift
protocol MyProtocol {
  associatedtype Element
  associatedtype SubSequence : Sequence where SubSequence.Iterator.Element == Iterator.Element
}
```



### Class and Protocol Existential

```swift
A feature that has finally made it to Swift from Objective-C is the ability to define a type that conforms to a class as well as a set of protocols [SE-0156]:
protocol MyProtocol { }
class View { }
class ViewSubclass: View, MyProtocol { }

class MyClass {
  var delegate: (View & MyProtocol)?
}

let myClass = MyClass()
//myClass.delegate = View() // error: cannot assign value of type 'View' to type '(View & MyProtocol)?'
myClass.delegate = ViewSubclass()
```