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

## Associate type and closure (completion block)

```swift
import Foundation

protocol Processable {
   associatedtype ArgType // useful when testing CIImage / CVBuffer etc
   typealias Payload = Result<ArgType, Error>
   typealias Complete = (Payload) -> Void
   @discardableResult
   func process() -> Bool // Returns true if payload was able to be processed etc
   func doHeavyCalc(onComplete: @escaping  Complete)
}
extension Processable {
   func process() -> Bool {
      let semaphore = DispatchSemaphore(value: 0)
      var retVal: Bool = false
      doHeavyCalc { result in
         semaphore.signal()
         if case .success(let value) = result { print("\(value)"); retVal = true }
         else { retVal = false }
      }
      semaphore.wait()
      return retVal
   }
}
struct StringItem {}
extension StringItem: Processable {
   typealias ArgType = String
   func doHeavyCalc(onComplete: @escaping (Self.Payload) -> Void) {
      DispatchQueue.global().async { // Do task on the background thread
         usleep(useconds_t(0.002 * 1_000_000)) // 0.002 second task
         let wasProcessedSuccssfully: Bool = .random() // random true / false returns to mimic how it works in reality
         if wasProcessedSuccssfully { onComplete(.success("✅")) } // All done
         else { onComplete(.failure(NSError.init(domain: "uhoh", code: 1))) }
      }
   }
}
struct IntItem {}
extension IntItem: Processable {
   typealias ArgType = Int
   func doHeavyCalc(onComplete: @escaping (Self.Payload) -> Void) {
      DispatchQueue.global().async { // Do task on the background thread
         usleep(useconds_t(0.002 * 1_000_000)) // 0.002 second task
         let wasProcessedSuccssfully: Bool = .random() // random true / false returns to mimic how it works in reality
         if wasProcessedSuccssfully { onComplete(.success(4)) } // All done
         else { onComplete(.failure(NSError.init(domain: "uhoh", code: 1))) }
      }
   }
}

print(IntItem().process()) // can be false, true
print(StringItem().process()) // can be false, true
```
