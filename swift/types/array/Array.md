## Array

.count is a stored property in swift (if you look deep enough into the swift source code you will find that this is true)


```swift
//Objective-C: (NSArray maps to [AnyObject])
NSArray people = [myAVOueueP1ayer items]
//Swift: (cast as a specific array)

var a1lSongs = myAVOueuePLayer.items() as [AVPlayerltem]
```

```swift
/**
 *
 */
func testing(){
    //the following two declarations are equivalent:
    
    var someArray: Array<String> = ["Alex", "Brian", "Dave"]
    let someArray2: [String] = ["Alex", "Brian", "Dave"]
    print(someArray2)
    let someArray3: [String]//string array
    print(someArray3)
    
    var someArray4:Array = [1,2,3]//mutable
    someArray4.append(5)
    print(someArray4)//1,2,3,4,5
    let someArr5 = [String]()//<--different way of initiating an array
    let stringArray = ["a","some","this"]//immutable
    print(stringArray)
    var anotherArray:[String]
    anotherArray = ["abc","123"]
    print("your value: \(anotherArray[0])")//"abc"
    //adding items
    anotherArray.append("test")//same as push in other languages
    //plus equal mutating operator, concatinates 2 arrays,
    //non array items wont work
    //the items we concat are restricted by the same types that the oroginal array had
    anotherArray += ["test"]
    
    anotherArray.insert("hello",atIndex:2)
    //remove at index
    anotherArray.removeAtIndex(2)
    anotherArray[2] = "3"//change a value of an item in an array
    anotherArray.removeRange(1...2)//you can also use NSMakeRange(0, 9)
    anotherArray.removeAll()//clears out the array
    anotherArray.capacity//how much memory allocated to the array
    anotherArray.removeLast()
    anotherArray.removeFirst()
    //find array length
    anotherArray.count
    //.count = 0 can be written as:
    anotherArray.isEmpty//isRmpty is based on the count, not the capacity
    
    //
    for theItem in anotherArray{
        print("your value: \(theItem)")
    }
    //half closed range operator
    let tempArrayA = someArray[1..<3]//2,3
    print(tempArrayA.count)
    //
    let tempArrayB = someArray[1...2]//2,3
    print(tempArrayB.count)
    var intArray = [33,42,1,55,1,56,8,2]
    intArray.insert(4,atIndex:2)
    intArray[2] = 8//this replaces the item at index 2
    
    //extend
    intArray.removeAll(keepCapacity:true)
    intArray.capacity//3
    intArray.count//0
    intArray.appendContentsOf([4,5,6])//repopulate the array
    intArray.reserveCapacity(10)//adds more capacity
    
    //sorting
    var someColors = ["blue","red","green","yellow","browm","black"]
    let sortedColors = someColors.sort() { $0 < $1 }//returns but does not change the original array
    print(sortedColors.count)
    //sortedColors//has new order
    //someColors//remains the same order
    someColors.sortInPlace() { $0 < $1 }//changes the original array
    //someColors//has new order
    //reversing the order
    let reversedArray = someArray.reverse()//reversing the array,does not change the original array
    print(reversedArray.count)
    //filter
    let hexColors:Array<String> = ["0x333","0x123122","0x444","0x999","0x234234"]
    let longColors = hexColors.filter() { $0.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 3 }
    longColors //returns all colors longer than 3 letters                                                    I

}


## **Casting Array<Any> to Array<String>**

```swift
let arrayOfAny:Array<Any> = [1,"2",3.0,CGFloat(4)]
let stringArray:Array<String> = arrayOfAny.map {String($0)}
print(stringArray)//"1", "2", "3.0","4.0"
```

**Conclusion:**  
Sometimes it's useful to convert from one array type to another. The best approach is in most cases not to convert the array type but to either do instance checking before packing the array or instance checking before unpacking the array

### multi dim:
```swift
//You can create multidimensional arrays by nesting pairs of square brackets, where the name of the base type of the elements is contained in the innermost pair of square brackets. For example, you can create a three-dimensional array of integers using three sets of square brackets:
```