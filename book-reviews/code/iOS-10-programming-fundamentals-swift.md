<!--more--> [ios 10 fundamentals book](http://shop.oreilly.com/product/0636920055211.do) 


### Pro
- Comprehensive
### Con
- The code isn't highlighted 
- Too much obj-c (90's are calling, they want their manual back)


### Nested structures:

```swift
class Dog {
    struct Noise {
        static var noise = "Woof"
    }
	func bark() {
        print(Dog.Noise.noise)
	} 
}
//print(Dog.Noise.noise)//Woof
```

### Enums:

```swift
/*If the type is String, the implicitly assigned values are the string equivalents of the
case names. For example:*/
    enum Filter : String {
        case albums
        case playlists
        case podcasts
        case books
}
```


Even when there are only two states, an enum is often better than, say, a mere Bool, because the enum’s states have names. With a Bool, you have to know what true and false signify in a particular usage; with an enum, the name of the enum and the names of its cases tell you its significance. More‐ over, you can store extra information in an enum’s associated value or raw value; you can’t do that with a mere Bool.


### Struct:

Value Types and Reference Types
A major difference between enums and structs, on the one hand, and classes, on the other, is that enums and structs are value types, whereas classes are reference types.
A value type is not mutable in place, even though it seems to be. For example, con‐ sider a struct. A struct is a value type:

Now, Swift’s syntax of assignment would lead us to believe that changing a Digit’s number is possible:
But in reality, when you apparently mutate an instance of a value type, you are actually replacing that instance with a di erent instance. To see that this is true, add a setter observer:  
That explains why it is impossible to mutate a value type instance if the reference to that instance is declared with let:  

```swift
struct Digit {
    var number : Int
    init(_ n:Int) {
        self.number = n
    }
}

var d = Digit(123)

d.number = 42
Swift.print("d.number: " + "\(d.number)")

let d2 = Digit(123)
d2.number = 42 // compile error
```

### Class:

 Classes are not bad; they’re good! For one thing, a class instance is very efficient to pass around, because all you’re passing is a pointer. No matter how big and complicated a class instance may be, no matter how many prop‐ erties it may have containing vast amounts of data, passing the instance is incredibly fast and efficient, because no new data is generated.
 
 Even more important, there are many situations where the independent identity of a class instance, no matter how many times it is referred to, is exactly what you want. The extended lifetime of a class instance, as it is passed around, can be crucial to its functionality and integrity. In particular, only a class instance can successfully repre‐ sent an independent reality. For example, a UIView needs to be a class, not a struct, because an individual UIView instance, no matter how it gets passed around, must continue to represent the same single real and persistent view in your running app’s interface.
 
### Enums
 
 Swift is chock full of protocols already. Let’s make one of our own object types adopt one. One of the most useful Swift protocols is CustomStringConvertible. The Cus‐ tomStringConvertible protocol requires that we implement a description String property. If we do that, a wonderful thing happens: when an instance of this type is used in string interpolation or print (or the po command in the console), the description property value is used automatically to represent it.
Recall, for example, the Filter enum, from earlier in this chapter. I’ll add a description property to it:
```swift
enum Filter : String {
    case albums = "Albums"
    case playlists = "Playlists"
    case podcasts = "Podcasts"
    case books = "Audiobooks"
    var description : String { return self.rawValue }
}
```
But that isn’t enough, in and of itself, to give Filter the power of the CustomString‐ Convertible protocol; to do that, we also need to adopt the CustomStringConvertible protocol formally. There is already a colon and a type in the Filter declaration, so an adopted protocol comes after a comma:
```swift
enum Filter : String, CustomStringConvertible {
    case albums = "Albums"
    case playlists = "Playlists"
    case podcasts = "Podcasts"
    case books = "Audiobooks"
    var description : String { return self.rawValue } /*👈 now can be logged in print👌*/
}
```
We have now made Filter formally adopt the CustomStringConvertible protocol. The CustomStringConvertible protocol requires that we implement a description String property; we do implement a description String property, so our code compiles. Now we can hand a Filter to print, or interpolate it into a string, and its description will appear automatically:
```swift
let type = Filter.albums
print(type) // Albums
print("It is \(type)") // It is Albums
```

### generic

Generic protocol with Self
In a protocol, use of the keyword Self (note the capitalization) turns the proto‐ col into a generic. Self is a placeholder meaning the type of the adopter. For example, here’s a Flier protocol that declares a method that takes a Self parame‐ ter:
        protocol Flier {
            func flockTogetherWith(_ f:Self)
}

### extension

An extension can’t override an existing member (but it can overload an existing method).

### inferring value:

```swift
class Color{
    var name:String = ""
    init(_ color:String){self.name = color}
}
extension Color{
    static var orange:Color {return Color("orange")}
    static var green:Color {return Color("green")}
    static var blue:Color {return Color("blue")}
}
func test(_ a:Color){
    Swift.print("Color: \(a.name)")
}
test(.orange)//orange
test(.blue)//blue
test(.green)//green
```

### Where clause:

An interesting problem arises when you want your generic extension where clause to specify type equality (==) instead of protocol adoption or class inheritance (:). The problem is that you can’t do that with a generic struct. Suppose, for example, that I want to give Array a sum method when the elements are Ints. I can’t do it:
```swift

    extension Array where Element == Int { // compile error
        func sum() -> Int {
            return self.reduce(0, +)
        }
}

```

But you can do it with a generic protocol, so the trick is to extend a generic protocol adopted by your struct. In this case, there is already a generic protocol adopted by Array, namely Sequence; so the solution is extend that instead:

```swift

    extension Sequence where Iterator.Element == Int {
        func sum() -> Int {
            return self.reduce(0, +)
        }
}
```

### Type assertion:

```swift
 func typeTester(_ d:Dog, _ whattype:Dog.Type) {
        if type(of:d) === whattype {
// ... }
}
```

### Array tricks 

An array also has an initializer whose parameter is a sequence. This means that if a type is a sequence, you can split an instance of it into the elements of an array. For example:
• Array(1...3) generates the array of Int [1,2,3].
• Array("hey".characters) generates the array of Character ["h","e","y"].
• Array(d), where d is a Dictionary, generates an array of tuples of the key–value pairs of d.


### Array slicing

An array’s largest accessible index is one less than its count. You may find yourself calculating index values with reference to the count; for example, to refer to the last two elements of arr, you can say:
```swift
let arr = [1,2,3]
let slice = arr[arr.count-2...arr.count-1] // [2,3]
```
Swift doesn’t adopt the modern convention of letting you use negative numbers as a shorthand for that calculation. On the other hand, for the common case where you want the last n elements of an array, you can use the suffix(:) method:
```swift
let arr = [1,2,3]
let slice = arr.suffix(2) // [2,3]
```
Both suffix(:) and its companion prefix(:) yield ArraySlices, and have the remarkable feature that there is no penalty for going out of range:
```swift
let arr = [1,2,3]
let slice = arr.suffix(10) // [1,2,3] (and no crash)
```
Instead of describing the size of the suffix or prefix by its count, you can express the limit of the suffix or prefix by its index:
```swift
let arr = [1,2,3]
let slice = arr.suffix(from:1)    // [2,3]
let slice2 = arr.prefix(upTo:1)    // [1]
let slice3 = arr.prefix(through:1) // [1,2]

```
    
### Array idx

The index(of:) method reports the index of the first occurrence of an element in an array, but it is wrapped in an Optional so that nil can be returned if the element doesn’t appear in the array. If the array consists of Equatables, the comparison uses == behind the scenes to identify the element being sought:
```swift
let arr = [1,2,3]
let ix = arr.index(of:2) // Optional wrapping 1
```
Alternatively, you can call index(where:), supplying your own function that takes an element type and returns a Bool, and you’ll get back the index of the first element for which that Bool is true. In this example, my Bird struct has a name String property:
```swift
let aviary = [Bird(name:"Tweety"), Bird(name:"Flappy"), Bird(name:"Lady")]
let ix = aviary.index {$0.name.characters.count < 5} // Optional(2)
```
    
Array sequence

As a sequence, an array’s contains(:) method reports whether it contains an ele‐ ment. Again, you can rely on the == operator if the elements are Equatables, or you can supply your own function that takes an element type and returns a Bool:
```swift
let arr = [1,2,3]
let ok = arr.contains(2) // true
let ok2 = arr.contains {$0 > 3} // false
```
The starts(with:) method reports whether an array’s starting elements match the elements of a given sequence of the same type. Once more, you can rely on the == operator for Equatables, or you can supply a function that takes two values of the ele‐ ment type and returns a Bool stating whether they match:
```swift
let arr = [1,2,3]
let ok = arr.starts(with:[1,2]) // true
let ok2 = arr.starts(with:[1,-2]) {abs($0) == abs($1)} // true
```    
The elementsEqual(:) method is the sequence generalization of array comparison: the two sequences must be of the same length, and either their elements must be Equatables or you can supply a matching function


### Array joined

The joined(separator:) instance method starts with an array of arrays. It extracts their individual elements, and interposes between each sequence of extracted ele‐ ments the elements of the separator:. The result is an intermediate sequence called a JoinSequence, and might have to be coerced further to an Array if that’s what you were after. For example:
```swift
let arr = [[1,2], [3,4], [5,6]]
let joined = Array(arr.joined(separator:[10,11]))
// [1, 2, 10, 11, 3, 4, 10, 11, 5, 6]
```
Calling joined() with no separator: is a way to flatten an array of arrays. Again, it returns an intermediate sequence (or collection), so you might want to coerce to an Array:
```swift
let arr = [[1,2], [3,4], [5,6]]
let arr2 = Array(arr.flatten())
// [1, 2, 3, 4, 5, 6]
```
    
Array sort

```swift
arr.sort {$0 > $1} // [6, 5, 4, 3, 2, 1]
```

### Dictionary:

You can extract a dictionary’s entire contents at once as an array (of key–value tuples) by coercing the dictionary to an array:
```swift
var d = ["CA": "California", "NY": "New York"]
let arr = Array(d) // [("NY", "New York"), ("CA", "California")]
```


##Set


A set (Set, a struct) is an unordered collection of unique objects. Its elements must be all of one type; it has a count and an isEmpty property; it can be initialized from any sequence; you can cycle through its elements with for...in. But the order of ele‐ ments is not guaranteed, and you should make no assumptions about it.
The uniqueness of set elements is implemented by constraining their type to be Equatable and Hashable, just like the keys of a Dictionary. Thus, the hash values can be used behind the scenes for rapid access. Checking whether a set contains a given element, which you can do with the contains(:) instance method, is very efficient — far more efficient than doing the same thing with an array. Therefore, if element uniqueness is acceptable (or desirable) and you don’t need indexing or a guaranteed order, a set can be a much better choice of collection than an array.

## if let trickery:

To help avoid the indentation, successive conditional bindings can be combined into a condition list, with each condition separated by comma:
```swift
if let ui = n.userInfo, let prog = ui["progress"] as? NSNumber {
    self.progress = prog.doubleValue
}


```
and: 
```swift
if keyPath == readyForDisplay, let obj = object as? AVPlayerViewController, let ok = change?[.newKey] as? Bool,ok{
    // ... 
}
```
as guard:
```swift
guard keyPath == readyForDisplay else {return}
guard let obj = object as? AVPlayerViewController else {return}
guard let ok = change?[.newKey] as? Bool else {return}
guard ok else {return}
// ...
```

## switch trickery:

Now let’s focus on the comparison between the tag value and the case value. In the preceding example, it works like an equality comparison (==); but that isn’t the only possibility. In Swift, a case value is actually a special expression called a pattern, and the pattern is compared to the tag value using a “secret” pattern-matching operator, ~=. The more you know about the syntax for constructing a pattern, the more power‐ ful your case values and your switch statements will be.
A pattern can include an underscore (\_) to absorb all values without using them. An underscore case is thus an alternative form of “mop-up” case:
```swift

 switch i {
    case 1:
        print("You have 1 thingy!")
    case _:
        print("You have many thingies!")
    }
    
    
switch i {
    case 1?:
        print("You have 1 thingy!")
    case let n?:
        print("You have \(n) thingies!")
    case nil: break
}


 switch i {
    case let j where j < 0:/*<-- 👌*/
        print("i is negative")
    case let j where j > 0:
        print("i is positive")
    case 0:
        print("i is 0")
    default:break
}

switch d {
    case is NoisyDog:
        print("You have a noisy dog!")
    case _:
        print("You have a dog.")
    }
    
    
switch d {
    case let nd as NoisyDog:
        nd.beQuiet()
    case let d:
        d.bark() 
}

switch (d["size"], d["desc"]) {
    case let (size as Int, desc as String):
        print("You have size \(size) and it is \(desc)")
    default:break
}

```


When a tag is an enum, the cases can be cases of the enum. A switch statement is thus an excellent way to handle an enum. Here’s the

```swift
Filter enum:
    enum Filter {
        case albums
        case playlists
        case podcasts
        case books
}
```

And here’s a switch statement, where the tag, type, is a Filter; no mop-up is needed, because I’ve exhausted the cases:


```swift
switch type {
    case .albums:
        print("Albums")
    case .playlists:
        print("Playlists")
    case .podcasts:
        print("Podcasts")
    case .books:
        print("Books")  
}

enum Error {
    case number(Int)
    case message(String)
    case fatal 
}

```
To extract the error number from an Error whose case is .number, or the message string from an Error whose case is .message, I can use a switch statement. Recall that the associated value is actually a tuple. A tuple of patterns after the matched case name is applied to the associated value. If a pattern is a binding variable, it captures the associated value. The let (or var) can appear inside the parentheses or after the case keyword; this code illustrates both alternatives:
```swift
switch err {
    case .number(let theNumber):
        print("It is a number: \(theNumber)")
    case let .message(theMessage):
        print("It is a message: \(theMessage)")
    case .fatal:
        print("It is fatal")
}
    
If the let (or var) appears after the case keyword, I can add a where clause:
switch err {
case let .number(n) where n > 0: /*<--👌*/
        print("It's a positive error number \(n)")
    case let .number(n) where n < 0:
        print("It's a negative error number \(n)")
    case .number(0):
        print("It's a zero error number")
    default:break
}


switch i {
    case 1,3,5,7,9:
        print("You have a small odd number of thingies.")
    case 2,4,6,8,10:
        print("You have a small even number of thingies.")
    default:
        print("You have too many thingies for me to count.")
}


```

In this example, i is declared as an Any:
```swift
    switch i {
    case is Int, is Double:
        print("It's some kind of number.")
    default:
        print("I don't know what it is.")
    }
    
    
    New in Swift 3, a comma can even combine patterns that declare binding variables, provided they declare the same variable of the same type:
    switch err {
    case let .number(n) where n > 0, let .number(n) where n < 0:
        print("It's a nonzero error number \(n)")
    case .number(0):
        print("It's a zero error number")
    default:break
}
```

There are languages that let you talk that way, but Swift is not one of them. However, an easy workaround does exist — use a define-and-call anonymous function, as I sug‐ gested in Chapter 2:

```swift
    let title : String = {
        switch type {
        case .albums:
            return "Albums"
        case .playlists:
            return "Playlists"
        case .podcasts:
            return "Podcasts"
        case .books:
            return "Books"
} }()
```

### And the nil-coalescing operator:

```swift
let arr2 = arr.map {$0 ?? NSNull() as Any} //Expressions using ?? can be chained:
let someNumber = i1 as? Int ?? i2 as? Int ?? 0
```


### While:

```swift
while condition { statements
}
repeat {
statements
} while condition
```
The chief difference between the two forms is the timing of the test. In the second form, the condition is tested after the block has executed — meaning that the block will be executed at least once.
Usually, the code inside the block will change something that alters both the environ‐ ment and the condition, thus eventually bringing the loop to an end. Here’s a typical example from my own code (movenda is an array):
    ```swift
while self.movenda.count > 0 {
    let p = self.movenda.removeLast()
    // ...
}
```


```swift
while let p = self.movenda.popLast() {
        // ...
}
```
There is no Swift repeat...until construct; instead, negate the while condition. In my own code, for example, I commonly need to walk my way up or down a hierarchy. Here, textField is a subview, at some depth, of some table view cell, and I want to know which table view cell it is a subview of. So I keep walking up the view hierarchy, investigating each superview in turn, until either I reach a table view cell or I hit the top of the view hierarchy:
```swift
var v : UIView? = textField
repeat {v = v?.superview} while !(v is UITableViewCell || v == nil)
if let c = v as? UITableViewCell {
    // ... if we get here, c is the cell
}
```





We can extract the .message associated string values from the start of the array, like
this:

    ```swift
let arr : [Error] = [
    .message("ouch"), .message("yipes"), .number(10), .number(-1), .fatal
]

var i = 0
while case let .message(message) = arr[i]  {
    print(message) // "ouch", then "yipes"; then the loop stops
i += 1 }
```

### For-loop:
```swift
var g = (1...5).makeIterator()
    while let i = g.next() {
print(i) }
```

Like if case and while case, there’s also for case, letting us use a switch case pat‐ tern in a for loop. The tag is each successive value of the sequence, so no assignment operator is used. Return to our example of an array of Error enums:
    
Here we cycle through the whole array, extracting just the .number associated values:
```swift
    
    let arr : [Error] = [
        .message("ouch"), .message("yipes"), .number(10), .number(-1), .fatal
]
    for case let .number(i) in arr {
        print(i) // 10, -1
}
```

Similarly, here’s how to work safely with an array each of whose elements might or might not be castable to a certain type:

```swift
let arr : [Any] = ["hey", 1, "ho"]
for case let s as String in arr {
    print(s) // hey, ho
}
```
    
    
### For-loop lables:

if you wanted to abort the entire nested construct? The solution is a label:

```swift
outer: for i in 1...5 {
        for j in 1...5 {
            print("\(i), \(j);")
break outer }
}
// 1, 1;
```

### throws:

```swift
do {
statements // a throw can happen here
} catch errortype { statements
} catch {
statements
}
```
A single do block can be accompanied by multiple catch blocks. Catch blocks are like the cases of a switch statement, and will usually have the same logic: first, you might have specialized catch blocks, each of which is designed to handle some limited set of possible errors; finally, you might have a general catch block that acts as the default, mopping up any errors that were not caught by any of the specialized catch blocks.

unwrap the Optional safely at the same point where you make the call, like this:
```swift
    let f = // path to some file, maybe
    if let s = try? String(contentsOfFile: f) {
// ... }

```

### Guard:

```swift
let f = // path to some file, maybe
guard let s = try? String(contentsOfFile: f)
    else {return}
// s is now a String (not an Optional)

//howMany() is not an optional in the bellow example:

guard case let output = howMany(), output > 10 else {return}
    // now output is in scope
```

### Custom operators:

`/=-+! *%<>&|^?~`


### Privacy:

**fileprivate** (narrower than internal)
A thing declared fileprivate is visible only within its containing  le. For exam‐ ple, two object types declared in the same file can see one another’s members declared fileprivate, but code in other files cannot see those members. Why would you declare something fileprivate rather than private? One common reason has to do with extensions. By the same token, privacy is not magically violated by the existence of a special object relationship. For example, even a subclass cannot see its superclass’s private members. (This comes as a surprise to those coming from a language with a protected privacy level.) You can work around this by declaring the class and its sub‐ class in the same file and declaring those members fileprivate instead of private. fileprivate is sort of the same as protected in other languages.

**private** (even narrower than fileprivate)
A thing declared private is visible only within its containing curly braces. In effect, the visibility of an object type’s member declared private is limited to code within this class declaration. (A private declaration at the top level of a file is equivalent to fileprivate.)


**public** (wider than internal)
A thing declared public is visible even outside its containing module. Another module must first import this module before it can see anything at all. But once another module has imported this module, it still won’t be able to see anything in this module that hasn’t been explicitly declared public. If you don’t write any modules, you might never need to declare anything public. If you do write a module, you must declare something public, or your module is useless.

**open** (even wider than public)
If a class is declared open, code in another module can subclass it; it can’t do that if the class is declared merely public. If an open class member is declared open, code in another module that subclasses this class can override this member; it can’t do that without the open declaration.

### deInit:

One way to test for and observe a memory leak is to implement a class’s deinit. This method is called when the instance goes out of existence. If the instance never goes out of existence, deinit is never called. That’s a bad sign, if you were expecting that the instance should go out of existence.

```swift
func testRetainCycle() {
        class Dog {
            deinit {
                print("farewell from Dog")
} }
        class Cat {
            deinit {
                print("farewell from Cat")
            }
        }
        let d = Dog()
        let c = Cat()
    }
    testRetainCycle() // farewell from Cat, farewell from Dog
```

### Memory management
THe book has a great overview of solutions regarding weak refs unowned etc.  CA: p288


### Cleaning xcode:

**Shallow clean**
Choose Product → Clean, which removes the built app and some of the inter‐ mediate information in the build folder.

**Deeper clean**
Hold Option and choose Product → Clean Build Folder, which removes the entire build folder.

**Insanely clean**
Quit Xcode. Open your user Library/Developer/Xcode/DerivedData folder and move all its contents to the trash. This is a complete clean for every project you’ve opened recently — plus the module cache. Removing the module cache can reset Swift itself, thus causing occasional mysterious compilation, code-completion, or syntax coloring issues to go away.


### IOS simulator:

- you can hold Option to simulate use of two fingers,

### App submission instructions

- The book has an indepth walkthrough of how to get ios apps on the app store. P400 and onwards. This + medium articles + stackoverflow should cover every corner when this is needed.


### comenting
Comments really help, and I strongly advise you, as you develop any iOS app, to comment every method, quite heavily if need be, saying what that method does and under what circumstances you expect it to be called — especially if it is an entry point, where it is Cocoa itself that will do the calling.

# memory

weak
A weak reference takes advantage of a powerful ARC feature. When a reference is weak, ARC does not retain the object assigned to it. This seems dangerous, because it means that the object might go out of existence behind our backs, leav‐ ing us with a dangling pointer and leading to a potential crash later on. But ARC is very clever about this. It keeps track of all weak references and all objects assigned to them. When such an object’s retain count drops to zero and the object is about to be destroyed, ARC sneaks in and assigns nil to the reference — that’s why a weak reference in Swift must be an Optional declared with var, so that ARC can do that. Thus, provided you handle the Optional coherently, noth‐ ing bad can happen.

unowned
An unowned reference is a different kettle of fish. When you mark a reference as unowned, you’re telling ARC to take its hands off completely: it does no memory management at all when something is assigned to this reference. This really is dangerous — if the object referred to goes out of existence, you really can be left with a dangling pointer and you really can crash. That is why you must never use unowned unless you know that the object referred to will not go out of existence: unowned is safe, provided the object referred to will outlive the object that refers to it. That is why an unowned object should be some single object, assigned only once, without which the referrer cannot exist at all.