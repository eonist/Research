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
### classasserter
```swift
import Foundation
/**
 * NOTE: If you write this in xcode: object_isClass and then cmd click it, you will find alot more methods like it
 */
class ClassAsserter{
    /**
     * Returns true if any of PARAM: instances is of class PARAM: classType
     */
    static func hasInstanceOfClassType<T>(_ instances:[Any?],_ classType:T.Type) -> Bool {
        return ClassParser.instanceByClassType(instances, classType) != nil
    }
    /**
     * EXAMPLE: Classes: print(ofType(a,A.self))//true or false
     * EXAMPLE: Protocols: print(ofType(a,IDescribable.self))//true or false
     * NOTE: you can also do: type(of: "") == type(of: "a")//true
     */
    static func ofType<T>(_ instance:Any?,_ type:T.Type) -> Bool{/*<--we use the ? char so that it can also return a nil*/
        return instance as? T != nil
    }
	/**
	 * NOTE: You may try this aswell instance.isKindOfClass(classType)//seems not to work
     * NOTE: beware of isKindOfClass vs isMemberOfClass
     * NOTE: this works: layer.isKindOfClass(CALayer.self)//true /*Remeber that the instance must extend NSObject*/
     * CAUTION: ⚠️️ doesn't work well with Double,String etc
     * IMPORTANT: ⚠️️ doesn't work with protocols yet, do protocols as the example bellow:
     * EXAMPLE:
     * protocol Decoratable{}
     * class A:Decoratable{}
     * class B:Decoratable{}
     * let object:AnyObject = A()
     * object.dynamicType is A.Type//true
     * object.dynamicType is B.Type//false
     * object.dynamicType is Decoratable.Type//true
	 */
    static func isOfClassType(_ obj:AnyObject,_ classType:AnyClass)->Bool{
        return obj.isMember!(of: classType)//swift 3 update, may not work
    }
    /**
     * Alternative to the above
     */
    static func isOfClassType2(_ obj:AnyObject, _ classType:AnyClass?, _ protocolType:AnyObject? = nil/**/)->Bool? {
        return object_getClass(obj) == classType!
    }
    /**
     * NOTE: this method supports checking if an instance is of the same ClassType as the other
     * NOTE: it also supports checking core classes like String and Double etc
     * NOTE: it also supports checking a class agains another
     * EXAMPLE: isOfSame("","")//true
     * EXAMPLE: isOfSame("".dynamicType,"".dynamicType)//true
     * EXAMPLE: isOfSame(SomeClass.self,SomeClass())//true
     * CAUTION: ⚠️️ currently checking against protocols isnt supported
     */
    static func isOfSame(_ a: AnyObject, _ b: AnyObject) -> Bool {
        return object_getClassName(a) == object_getClassName(b)
    }
    /**
     * NOTE: you can also check if a class or instance is of a Protocol type: object.dynamicType is Decoratable.Type//true (this does not work if you add that line of text inside a method)
     * NOTE: protocol_conformsToProtocol(a,b) also exist
     * NOTE: // Works, but seems hackish as it reverts to string comparison NSStringFromProtocol(proto) == NSStringFromProtocol(Foo)
     * TODO: ⚠️️ needs example, cant get this to work easily
     */
    static func isOfSameProtocol(_ a:Protocol,_ b:Protocol) -> Bool {
        return protocol_isEqual(a, b)
    }
    /**
     * Asserts if type is a class
     * EXAMPLE:
     * class A{}
     * protocol I{}
     * ClassAsserter(A.self)//true
     * ClassAsserter(I.self)//false
     */
    static func isClass<T>(_ classType:T.Type)->Bool{
        return classType is AnyClass
    }
}

```

### class modifier:

```swift
import Foundation

/**
 * Convenience function for initializing an object and modifying it's properties
 * - PARAMETERS:
 *     - item: the init closure
 *     - update: trailing closure that gives you access to the object instance
 *     - RETURNS:
 *     - Void and optionally throws if there is a try call in the trailing closure?!?
 * - EXAMPLE:
 *     ```
 *     let rectangle = with(CGRect.init(x: 0, y: 0, width: 100, height: 100)) {
 *        $0 = $0.offsetBy(dx: 20, dy: 20)
 *        $0 = $0.insetBy(dx: 10, dy: 10)
 *     }
 *     Swift.print(rectangle)// X:30.0, y:30.0, width:80.0, height:80.0
 *     ```
 * - EXAMPLE:
 *     ```
 *     let color = with(UIColor.init(red: 50, green: 100, blue: 0, alpha: 0.9)) { ( col:inout UIColor) -> Void  in
 *        col = col.withAlphaComponent(0.2)
 *     }
 *     Swift.print(color.cgColor.alpha)//0.2
 *     ```
 */
@discardableResult/*👈 Avoids xcode compiler warnings if result is not used*/
func with<T>(_ item: T, update: (inout T) throws -> Void) rethrows -> T {
    var item = item
    try update(&item)
    return item
}

```



### class parser:

```swift
/**
 * NOTE: instance.className returns the class name of an instance like this:"NameOfApp.NameOfClass"
 * NOTE: if you use instance.dynamicType you get only the class name
 * NOTE: the bellow is from: class A{}
 * String(A.self.dynamicType)//A.Type
 * String(A.self)//A
 * String(A)//A
 * String(describing: type(of: object))  // to get name of class via instance
 * String(describing: SomeClass.self) or "\(SomeClass.self)" // to get name of swift class
 */
class ClassParser {
   /**
    * NOTE: works with protocols and classes
    * EXAMPLE: Swift.print(ofType(a,A.self)!.text)//I am a
    * EXAMPLE: Swift.print(ofType(a,IDescribable.self)!.text)//I am a
    * EXAMPLE: Swift.print(ofType(b,B.self)!.text)//I am b
    * EXAMPLE: Swift.print(ofType(c,C.self))//instance of c
    */
   static func ofType<T>(_ instance:Any?,_ type:T.Type) -> T?{/*<--we use the ? char so that it can also return a nil*/
      return instance as? T
   }
   /**
    * Returns a usable class
    * NOTE: This works: (obj as! NSObject).className
    * NOTE: also works: String(obj)
    * NOTE: also works: classNameAsString(obj)
    * NOTE: This also works: print(NSStringFromClass(someInstance.dynamicType))
    * Example: let someObj : typeof(anotheraObj) = typeof(anotheraObj)(arguments here)//this creates an instance from the class of another instance
    */
   static func getClass(_ instance:Any!)->String{
      return String(describing:Swift.type(of: self)).components(separatedBy:".").last!//swift 3 update, could work!?!?
      //return _stdlib_getDemangledTypeName(instance).componentsSeparatedByString(".").last!//This call is subjected to change in future versions of swift
      //return typeOf(instance)
   }
   /**
    * ⚠️️ Not tested ⚠️️
    * NOTE: there is a good example of this in LayoutUtils.swift
    * EXAMPLE:
    * protocol ILayout{ init(_ a:String)}
    * class A:ILayout{required init(_ a:String)}
    * class B:ILayout{required init(_ a:String)}
    * var instance:ILayout
    * var classType:ILayout.Type
    * classType = A.self
    * instance = classType.init("abc")
    * classType = B.self
    * instance = classType.init("abc")
    */
   static func type(_ instance:Any)->Any.Type{//was: -> any
      return Swift.type(of: instance)
   }
   /**
    * EXAMPLE:
    * In: a .frameWork named NetworkLib
    * You have: class Demo{}
    * Swift.print(ClassParser.module(Demo.self))//Output: Demo
    */
   static func module(_ type:AnyClass) -> String?{
      return (NSStringFromClass(type) as NSString).components(separatedBy: ".").first
   }
   /**
    * ⚠️️ Untested ⚠️️
    */
   static func instanceByClassType<T>(_ instances:[Any?],_ classType:T.Type)->Any? {
      return instances.first(where: {$0 as? T != nil}) ?? nil
   }

}
extension ClassParser{
   static func stringType(_ instance:Any) -> String{/*Convenience*/
      return String(describing: ClassParser.classType(instance))
   }
}
/**
 * DEPRECATED:
 */
extension ClassParser{
   //DEPRECATED:
   static func classType(_ instance:Any) -> Any.Type{return ClassParser.type(instance)}
}


/*
 print("press")
 print(String(obj))
 print(classNameAsString(obj))
 print("My class is \((obj as! NSObject).className)")

 func classNameAsString(obj: Any) -> String {
 print(String(obj))
 return _stdlib_getDemangledTypeName(obj).componentsSeparatedByString(".").last!
 }
 */


```
