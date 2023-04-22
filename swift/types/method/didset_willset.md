### Example:

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
