### Example:

```swift
// Property Observers
/*
 Property observers observe and respond to changes in a property’s
 value. Property observers are called every time a property’s value is
 set, even if the new value is the same as the property’s current value.
 */
struct MyAwesomeClass {
    var awesomeProperty: String {
        willSet {
            // This will be called just before the property is set.
            print("value is \(self.awesomeProperty)")
            print("value will be \(newValue)")
        }

        didSet {
            // This will be called just after the property is set.
            print("value is \(self.awesomeProperty)")
            print("value was \(oldValue)")
        }
    }
}

let example = MyAwesomeClass(awesomeProperty: "iPhone7")
example.awesomeProperty = "iPhoneX"
// value is iPhone7
// value will be iPhoneX
// value is iPhoneX
// value was iPhone7
```

```swift

var a : Int = 0 {
	willSet(newValue){//before
	    print("willSet called: \(newValue)")
	}
	didSet(oldValue){//after
	    print("didSet called: \(oldValue)")
	}
}

a = 2

```

### same as:

```swift
class Foo {
    var myPropertyValue: Int = 0
    var myProperty: Int {
        get { return myPropertyValue }
        set {
            myPropertyValue = value
            print("The value of myProperty changed from \(oldValue) to \(myProperty)")
        }
    }
}
```

### DidSet does not fire if its set on init:
Use defer or closure to get around this

```swift
class Tester{
   var temp:String = "yo"{
      didSet{
         Swift.print("temp:  \(temp)")
      }
   }
   init(temp:String){
      self.temp = temp
   }
}
let tester = Tester.init(temp: "work")
Swift.print("tester.temp:  \(tester.temp)")
tester.temp = "new"

// tester.temp:  work
// temp:  new
```
