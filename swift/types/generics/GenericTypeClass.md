//store different types in the same dataContainer instance:

### Method example: 
```swift
func anim<T:UIView>(view:T) where T : ConstraintKind{
   //  
}
```

```swift
class Tree <T> {
    // 'T' can now be used as a type
    var value : T
    var children : [Tree <T>] = []
    init(value : T) {
        self.value = value
    }
    func addChild(value : T) -> Tree <T> {
        let newChild = Tree<T>(value:value)
        children.append(newChild)
        return newChild
    }
}

// Tree of integers
let integerTree = Tree<Int>(value: 5)

// Can add children that contain Ints
integerTree.addChild(10)
integerTree.addChild(5)

// Tree of strings
let stringTree = Tree<String>(value: "Hello")

stringTree.addChild("Yes")
stringTree.addChild("Internets")”

```


## Another example:

class Whatever<T> {
    var array = [T]() // another way to init the array.
}

let we = Whatever<Int>()



## Conform to multiple generic:

You can use a where clause which lets you specify as many requirements as you want (all of which must be fulfilled) separated by commas
```swift


/*Swift 2:*/

func someFunc<T where T:SomeProtocol, T:SomeOtherProtocol>(arg: T) {
    // stuff
}
/*Swift 3:*/

func someFunc<T: SomeProtocol & SomeOtherProtocol>(arg: T) {
    // stuff
}

/*or the more powerful where clause:*/

func someFunc<T>(arg: T) where T:SomeProtocol, T:SomeOtherProtocol{
    // stuff
}

```

```swift
protocol SomeProtocol {
    /* ... */
}

protocol SomeOtherProtocol {
    /* ... */        
}
//1. Using & operator

func someFunc<T: SomeProtocol & SomeOtherProtocol>(arg: T) {
    /* ... */
}
//2. Using where clause

func someFunc<T>(arg: T) where T: SomeProtocol, T: SomeOtherProtocol {
    /* ... */
}
//3. Using where clause and & operator

func someFunc<T>(arg: T) where T: SomeProtocol & SomeOtherProtocol {
    /* ... */        
}
Also note that you can use typealias in order to shorten your function declaration.

typealias RequiredProtocols = SomeProtocol & SomeOtherProtocol

func someFunc<T: RequiredProtocols>(arg: T) {
    /* ... */   
}
```

You can of course use protocol composition (e.g., protocol<SomeProtocol, SomeOtherProtocol> ), but it's a little less flexible.

Using where let's you deal with cases where there are multiple types involved.

You may still want to compose protocols for reuse in multiple places, or just to give the composed protocol a meaningful name.


### Resources: 

[https://www.raywenderlich.com/148448/introducing-protocol-oriented-programming](https://www.raywenderlich.com/148448/introducing-protocol-oriented-programming) 


### Advance example:

```swift
import Cocoa
protocol Viewable : class {}
class Controller{  // Abstract
    var view:Viewable?
    init(_ view:Viewable){
        self.view = view
    }
}
protocol AViewable:Viewable {
    func a()
    func b()
}
class AView:AViewable{
    func a(){
        Swift.print("a")
    }
    func b(){
        Swift.print("b")
    }
}
class AController<T>{
    var view:T
    init(_ view:T){
        self.view = view
    }
}
extension AController where T:AViewable{
    func a() {
        view.a()
    }
    func b() {
        view.b()
    }
}
let view:AView = AView()
let controller:AController<AView> = AController(view)
controller.a()//a
controller.b()//b

```

MOre insights into the limitations of Generics class type and conformity to protocols: https://forums.developer.apple.com/thread/17942



### Overriding generic type classes w/didset:
class A<T>{
    /**
     *
     */
    var data:T? { didSet {
        Swift.print("a: \(String(describing: data))")
        }
    }
}

class B:A<String>{
    override var data: String? {
        didSet{
            Swift.print("b: \(String(describing: data))")
        }
    }
}

let a = A<Int>()
a.data = 2//2
let b = B()
b.data = "duper"//a:duper, b:duper