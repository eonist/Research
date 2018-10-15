## Downstream "override" with protocols
This is sort of like calling super in OOP

```swift
protocol X{}
protocol Y{}
protocol Z{}
extension X{func render(print("x")){}}
extension Y{func render(print("y")){}}
extension Z{func render(print("z")){}}
class A:X,Y,Z{
    func render(){//can be called from a Super class
        (self as X).render()
        (self as Y).render()
        (self as Z).render()
    }
}
let a = A()
a.render()//z,x,y
```


## Multi level "override" with protocols:

```swift
//: [Previous](@previous)

import Foundation

class A{}
class B:A{}
class C:B{}
protocol X{}
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
extension X where Self:B{/*Constrain to B Class*/
    func doIt(){
        Swift.print("B:X.doIt()")
        (self as X).doIt()
    }
}
extension X where Self:C{/*Constrain to C Class*/
    func doIt(){
        Swift.print("C:x.doIt()")
        (self as B).doIt()
    }

}
let i:C = C()
i.doIt()
//let b = B()

//you can also make a new protocol that works for all classes that implement it. 
```

### override upstream is also possible. 
This is sort of like overriding in OOP
Use `extension X where Self:BaseClass{/*..render implementation.*/}` then you could call render from base class and this would override

Important BaseClass can be a struct, class or even protocol!

