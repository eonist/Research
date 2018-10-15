
##Regular override

```swift

//use where Self:IQ to constrain to specific classes, it also overrides
protocol X{}
protocol Y:X{}
extension X{
    func doSomething(){print("doSomething.X")}
}
extension Y{
    func doSomething(){print("doSomething.Y")}//sort of overrides X
}
class A:X{}
class B:Y{}

let a = A()
a.doSomething()//doSomething.X
let b = B()
b.doSomething()//doSomething.y
```

## Real override
⚠️️IMPORTANT⚠️️: You can only override methods that are in class extensions. Doesn't work with protocol extensions
```swift
import Cocoa
protocol X{
    func f() -> A
}
extension X{
    func f() -> A {
        Swift.print("X.f()")
        return A()
    }
}
class A:NSView{
    func test(){
        Swift.print("A.test()")
        self.f()
        y
    }
}

class B:A{}

extension A{
    var y:String {
        return "YinA"
    }
    func f() -> A {
        Swift.print("A.f()")
        return A()
    }
}

extension B{
    override var  y:String {
        Swift.print("B.y")
        return "YinB"
    }
    override func f() -> A {
        Swift.print("B.f()")
        return A()
    }
    
}

let b = B()
b.test()//A.Test(), B.f(),B.y
```

if you need to override a method in a protocol then:

```swift
@objc protocol P: class {
  optional func f()
}
```

### Possible solution for overriding w/o NSObject

```swift
There is a way to achieve a clean separation of class signature and implementation (in extensions) while maintaining the ability to have overrides in subclasses. The trick is to use variables in place of the functions

If you make sure to define each subclass in a separate swift source file, you can use computed variables for the overrides while keeping the corresponding implementation cleanly organized in extensions. This will circumvent Swift's "rules" and will make your class's API/signature neatly organized in one place:

 // ---------- BaseClass.swift -------------

 public class BaseClass{
     public var method1:(Int) -> String { return doMethod1 }
     public init() {}
 }

 // the extension could also be in a separate file  
 extension BaseClass{    
     private func doMethod1(param:Int) -> String { return "BaseClass \(param)" }
 }
...

 // ---------- ClassA.swift ----------

 public class A:BaseClass{
    override public var method1:(Int) -> String { return doMethod1 }
 }

 // this extension can be in a separate file but not in the same
 // file as the BaseClass extension that defines its doMethod1 implementation
 extension A{
    private func doMethod1(param:Int) -> String { 
       return "A \(param) added to \(super.method1(param))" 
    }
 }
...

 // ---------- ClassB.swift ----------
 public class B:A{
    override public var method1:(Int) -> String { return doMethod1 }
 }

 extension B{
    private func doMethod1(param:Int) -> String { 
       return "B \(param) added to \(super.method1(param))" 
    }
 }
Each class's extension are able to use the same method names for the implementation because they are private and not visible to each other (as long as they are in separate files).

As you can see inheritance (using the variable name) works properly using super.variablename

 BaseClass().method1(123)         --> "BaseClass 123"
 A().method1(123)                 --> "A 123 added to BaseClass 123"
 B().method1(123)                 --> "B 123 added to A 123 added to BaseClass 123"
 (B() as A).method1(123)          --> "B 123 added to A 123 added to BaseClass 123"
 (B() as BaseClass).method1(123)  --> "B 123 added to A 123 added to BaseClass 123"
```