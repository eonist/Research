### Example:

```swift

var a : Int = 0 {
	willSet(newValue){//before
	    print("willSet called: \(a)")
	}
	didSet{//after
	    print("didSet called: \(a)")
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