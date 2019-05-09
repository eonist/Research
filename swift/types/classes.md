## To resolve class collision (two classes with the same name)


```swift
selector:ObjectiveC.Selector
selector:Element.Selector
```

## Storing class types in a variable:

```swift
let someClassType:Any.Type
someClassType = CGFloat.self

class A{}
let someOtherClassType:Any.Type
someOtherClassType = A.self

let windowType:NSWindow.type
windowType = CustomWindow.self//CustomWindow would extend NSWindow etc
```

## Storing class of kind:

```swift
protocol TempKind {
    var str: String { get }
    init()
}
class TempA: TempKind {
    let str: String = "a"
    required init() {

    }
}
class TempB: TempKind {
    let str: String = "b"
    required init() {

    }
}
let arr: [TempKind.Type] = [TempA.self, TempB.self]
let instances: [TempKind] = arr.map { $0.init() }
instances.forEach { Swift.print($0.str) } // a, b
```

## Asserting type:

```swift
protocol IX{}
protocol IY:IX{}
class A:IX{}
class B:IY{}

let a:A = A()
let b:B = B()
let c:IX = B()

func test(_ arg:IX?){
    Swift.print("arg: " + "\(arg)")
    if(arg is IY){
        Swift.print("is IY")
    }else if(arg == nil){
        Swift.print("is nil")
    }else{/*ix*/
        Swift.print("is IX")
    }
}


test(a)//is IX
test(b)//is IY
test(c)//is IY
```
