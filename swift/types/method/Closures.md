   closure as a variable [link](http://stackoverflow.com/questions/24603559/store-a-closure-as-a-variable-in-swift) and more complex examples: [link](http://fuckingclosuresyntax.com) 

   
   #### Closure trick by regex

   ```swift
   let closure = { (text:String, bgColor:UIColor, y:CGFloat, action:String) in
      let btn:UIButton = UIButton(type: .system)
      btn.backgroundColor = bgColor
      btn.setTitle(text, for: .normal)
      btn.titleLabel?.font =  .systemFont(ofSize: 12)
      btn.frame = CGRect(x:00, y:y, width:100, height:50)
      btn.addTarget(self, action: Selector(action), for: .touchUpInside)
      self.addSubview(btn)
  }
  /*btn1*/
  closure(
      "Forward",
      .gray,
      250,
      "onForwardButtonClick"
  )
  /*btn2*/
  closure(
      "Back",
      .lightGray,
      250,
      "onbackButtonClick"
  )
   ```


   #### If a closure is escaping then a weak self is a good habit to use: 

   ```swift
   myFunctionWithEscapingClosure() { [weak self] (error) -> Void in
       // you can do this

       self?.doSomething()

       // or you can do this

       guard let strongSelf = self else {
           return
       }

       strongSelf.doSomething()
   }
   ```

```swift
//“ this is what closures look like:”

let aClosure : Void -> Int = { return 1 }

aClosure() // returns 1

//“In Objective-C, closures are known as blocks. For this reason, several methods that belong to Cocoa and Cocoa Touch contain the word block, where you should provide a closure”

// In this code, aViewController and anotherViewController
// are both UIViewControllers.

// Slide up a view controller, and then when the slide animation is
// finished, change its view's background color to yellow.

aViewController.presentViewController(anotherViewController, animated: true) {
    // This closure is run after the animation is finished
    anotherViewController.view.backgroundColor = UIColor.yellowColor()
}
```


### Blocks/Closures
Basically this involves passing in a function/method/message to the child, whilst maintaining the focus of the parent. So it would be a method that the child can call, and local variables within the closure are based on local variables where the closure is defined.

```swift
var parent:Parent=Parent()
parent.go()  //Note that this outputs I am Parent
class Parent {
    var string="I am Parent"
    var child = Child()
    func parentMethod()->NSString {
        return string
    }
    func go()->NSString {
        return child.runThis(parentMethod)
    }
}
class Child {
    var string="I am Child"
    func runThis(closure: () -> NSString)->NSString {
        return closure()
    }
}
```


From the apple docs:

```swift
//Closure Expression Syntax

//Closure expression syntax has the following general form:

    { (parameters) -> return type in

        statements

    }

```



```swift
var completionHandler:(Float)->Void = {
    (arg:Float) -> Void in
}

and this can be shortened to

var completionHandler:(Float)->Void = { arg in }
```

**unowned self]**
by including the [unowned self] you create a ref inside the closure. [weak self] is probably more appropriate.

The general rule is:

If self could be nil in the closure use [weak self].
If self will never be nil in the closure use [unowned self].

More info on this here: http://blog.xebia.com/swift-self-reference-in-inner-closure/

/*Shortening closures*/

let someClosure:(Brick)->Bool = {
    (arg:Brick) -> Bool in
    return arg.isActive()
}

to this: 

let someClosure:(Brick)->Bool = {$0.isActive()}/*<--Note that the argument becomes $0 and the return is omitted because its declared in the var signature*/


## Closures and generics:

```swift
func runThis<T>(first:T, _ closure: (T) -> T)->T {
    return closure(first)
}

func someMethod<T>(someVar:T)->T {
    return someVar
}

runThis("works",someMethod)//works
```

## Regular Closure:
```swift
// Declare our closure
let myClosure = {
    print("Hello from myClosure!")
}

// Call it
myClosure()
			
```

## Closures with arguments

```swift
// Declare a closure with 2 integer arguments
// returning an Integer
let multiply = {(x:Int,y:Int)->Int in
    return x*y
}

// Call it
let result = multiply(2,5)
print(result)
				
```

## Closure as a parameter:

// Declare a function
// that takes a closure (with 2 integer parameters)
// as an argument

func doSth(action:(Int,Int)->()) {
    // Run the passed 'action'
    // with the parameters: 2, 5
    action(2,5)
}

let myClosure = {(x:Int, y:Int)->() in
    print("x * y = \( x * y )")
}

// Call it
doSth(myClosure)


