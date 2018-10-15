## Good analysis: 
https://krakendev.io/blog/subclassing-can-suck-and-heres-why

## where Self:
You can use where Self: with protocols 

Sometimes they can be used to override default behavior even!


```swift

extension IGraphic/*👈 this can be protocol*/ where Self:IRoundedGradientRect/*👈this must be class or protocol*/{
    func drawFill() {
        Swift.print("where")
        fillPath = "SpecialRoundBox"
    }
}
```

Basically we use Where extension when we have sub classes that we want to attach different behaviour to but we only want to define the extension ones. then we expose that extension to the base class. 

SO 

```swift

protocol Shackable{}
protocol Dimmable{}

class Base{}

extension Shackable/*👈 this can be protocol*/ where Self:Base/*👈this must be class or protocol*/{
    func shack() {
        Swift.print("shacking")
    }
}
extension Dimmable/*👈 this can be protocol*/ where Self:Base/*👈this must be class or protocol*/{
    func dim() {
        Swift.print("dimming")
    }
}

class A:Base,Shackable{}
class B:Base,Dimmable{}
class C:Base,Shackable,Dimmable{}
let a = A()
a.shack()
let b = B()
b.dim()
let c = C()
extension Dimmable/*👈 this can be protocol*/ where Self:C/*👈this must be class or protocol*/{
    func dim() {
        Swift.print("dimming_2")
    }
}
c.shack()
c.dim()
```


### Another example:

```swift
//: [Previous](@previous)

import Foundation

class A{}
class B:A{}
class C:B{}
protocol X{
    //func doIt()
}
//protocol Y:X{}
extension A:X{}

/*protocol Z{
 func doIt()
 }*/
extension X{
    func doIt(){
        Swift.print("X.doIt()")
    }
}
extension X where Self:B{
    func doIt(){
        Swift.print("B:X.doIt()")
        (self as X).doIt()
    }
}
extension X where Self:C{
    func doIt(){
        Swift.print("C:x.doIt()")
        (self as B).doIt()
    }

}
let i:C = C()
i.doIt()
//let b = B()

```


#### Multiple where clauses:

Multiple Where Conditions with Self

```swift

extension GenericProtocol where type == String, Self == SomeClass {
 func introduce(){
  print("I'm Bob") 
 }
}
```

#### Overriding accoicate type:

https://blog.bobthedeveloper.io/generic-protocols-with-associated-type-7e2b6e079ee2