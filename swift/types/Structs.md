https://developer.apple.com/swift/blog/?id=10

**Value and Reference Types:**

### Use a value type when (struct):

- Comparing instance data with == makes sense
- You want copies to have independent state
- The data will be used in code across multiple threads

### Use a reference type (e.g. use a class) when:

-  instance identity with === makes sense
- You want to create shared, mutable state

### IMPORTANT:
- For some large values these copies could be time consuming and hurt the performance of the program. see "ios 10 funda...book" p.150
- ☝️ IMPORTANT: if you use a `struct` and wan't to manipulate it in a`func`. Then you have to use inout. If you want to do the same with a class. then you don't have to use inout. 

http://faq.sealedabstract.com/structs_or_classes/
If overloading == to compare two things elementwise sounds like a great idea, use a struct. If you hesitate, use a class.

// CGSize struct
import Foundation


// access struct members
```swift
func test(){
    let size : CGSize = CGSizeMake(100, 100)
    print(size.height)
    print(size.width)
    
    // CGPoint struct
    let screenLocation : CGPoint = CGPointMake(45,100)
    screenLocation.x
    screenLocation.y
    // CGRect struct
    let rectangle:CGRect = CGRectMake(10, 10, 400, 400)
    print(rectangle.width)
    print(rectangle.height)
    //
    struct Size {
        var width = 0.0, height = 0.0
    }
    
    let twoByTwo:Size = Size(width: 2.0, height: 2.0)
    print(twoByTwo.width)

}
```



```swift

func alter(_ data:String, _ newData:String)->String{
    var d:String = data
    d += newData
    return d
}
let r = "old"
let p = alter(r," new")
Swift.print("r: " + "\(r)")//old, 👈still old data
Swift.print("p: " + "\(p)")//old new, 👈 ahh nice new data

```

## Decorating struct

Inspired by: https://talk.objc.io/episodes/S01E29-protocols-class-hierarchies

As you use a value type struct as a wrapper. This gives you super abilities. 🏆 , because now you can supplement with awesome protocol extension i thought you the other day. You can then parse the data in in reusable code. Like you make a protocol named HumanReadable. Which parses the data to a human readable form. or RobotReadable, which humans cant read. Thn here is the cool part. You can use these Modular protocols on totally new Loggers as long as they obey common protocols. Like DataParsable. Now you can use these modular protocols as sort of plugins with any system. ok getting a bit abstract here. but the point is. write code only once. If you feel like you have to copy the same code everywhere then you are doing it wrong. With protocols you write code only 1 time. And its very modular. very reusable. very mixable.

Your first feeling will be: hmm feels redundant to copy data. When you can just change the original. Changing the orginal feels more efficient. And don't you have 2 refs now in the system?. Answer: value types are cheap for the computer and don't require you to dispose of them. Also copies are only copied at the moment they are changed, not in the actual copy phase. in the copy phase they are still “refs” under the hood. The is an if though. If the data being copied is very big. then it would be more efficient to alter the original.

```swift
struct A:X{
    var data:String = "A"
}
protocol X{
    var data:String{get set}
}
extension X{
    mutating func setData(_ newData:String){data = data + newData}
}
struct B{
    var item:X
    init(_ item:X){
        self.item = item
        self.item.setData(" B")
    }
}
protocol Y:X{}
extension Y{
    //func doIt()
}
var a:X = A()
let z:X = B(a).item
Swift.print("a: " + "\(a.data)")//A, <---original ref preserved
Swift.print("z.data: " + "\(z.data)")//A,B <----New instance, with new data. but has data from old instance

```

If your item is say 10k lines of data. Then you can speed test to see if you should use value type or ref type. by using Date() and altering the date as ref and value type to see which is faster. if there isnt much difference then you go with value type. Else you have to alter the ref.




## Modify/parse method call:

 Alters internal state. ✅. Returns new result ✅
 Thread safe ✅
 no inout  ✅
 parsing method can be in a different file ✅
 parsing method can be used in other loggers ✅
 swifty solution ✅
 
 

```swift

struct A{
    var data:String = "A"
}
extension A:X{}
extension X {
    mutating func setData(_ newData:String)-> String{
        self.data = self.data + newData
        return ">" + "\(newData)" + " <"
    }
}
protocol X{
    var data:String{get set}
}
var a:A = A()
let newResult = a.setData(" B")
Swift.print("newResult: " + "\(newResult)")//newResult: > B <
Swift.print("a: " + "\(a.data)")//a: A B


```

### NOTE:
(Value types do not require the sort of complex memory management that reference types do, so no memory management issues can arise for them.)


### Init trickery:

```swift
struct Something{
    var color:CGFloat = 0
}
class Testing{
    func test(){
        let animState:Something = .init(color: 0)
        _ = animState
    }
}
```

### Lazy var in struct: 

```swift
    struct Test{
    private lazy var generateConst:String = {
        Swift.print("only querried once")
        return "data"
    }()
    
    var const: String? {
        mutating get {
            return generateConst
        }
    }
}


var test = Test()//<---must be var, cant be let ⚠️️
test.const
test.const
```