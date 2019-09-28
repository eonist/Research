# Swift 3.0.1:

```swift
/*Range*/
let a:Range<Int> = 1..<3 // you can also do: ..<3 which is equivalent to: 0..<3
print(type(of:a))//Range<Int>
a.upperBound//3

/*ClosedRange*/
let b:ClosedRange<Int> = 1...3 // you can also do: ...3 which is equivalent to: 0...3
print(type(of:b))//ClosedRange<Int>
b.upperBound//3

/*CountableRange*/
let c:CountableRange = 1..<3
print(type(of:c))//CountableRange<Int>
c.startIndex//1
c.endIndex//3
c.upperBound//3
c.last//2

/*CountableClosedRange*/
let d/*:CountableClosedRange*/ = 1...3
print(type(of:d))//CountableClosedRange<Int>
print(d.startIndex)//1
print(d.last!)//3
print(d.endIndex)//past end
d.upperBound//3

```

### Example:

```swift
func doSomething<T>(for range: T) where T: Sequence, T.Iterator.Element == Int {
    for number in range {
        print(number)
    }
}

let a:Range<Int> = 1..<3//half-open ComparableRange
let b:ClosedRange<Int> = 1...3//closed ComparableRange
let c:CountableRange = 1..<3//half-open Countable​Range
let d/*:CountableClosedRange*/ = 1...3//Countable​Closed​Range

doSomething(for: c)//1,2
doSomething(for: d)//1,2,3
```

# Swift 2.2:

## Simple example:

```swift
let newRange = Range<Int>(start:4,end:12)
newRange

```

## Range example with string:

```swift
import Foundation
//NSRange does not support unicode like emojis etc
//Swift has ranges
func test(){
    let someText = "hello world"
    let range = someText.startIndex.advancedBy(3)..<someText.endIndex.advancedBy(-3)//create a range
    let result = someText.substringWithRange(range)
    print(result)//"lo wo"
}

```

## Range example 2:

```swift
let nsRange = NSMakeRange(4, 12)
nsRange.length//12
nsRange.location//4
let range:Range<Int> = nsRange.toRange()!/*convert NSRange to Range<Int>*/

range.first//4 /*the first index*/
range.last//15 /*IMPORTANT: .endIndex and .last return different values*/
range.startIndex//4  /*the first index*/
range.endIndex//16 /*the last index */

range.underestimateCount()//12 /*the length of the range*/
range.count//12/*the length of the range*/
range.contains(15)//true /*assert if a value is within the range: true*/

let newRange = Range<Int>(start:4,end:12)
newRange.last//11
newRange.endIndex//12

let anotherRange = (4..<12)


func equals<T:Comparable>(a:Range<T>,_ b:Range<T>)->Bool {
    return a.startIndex == b.startIndex && a.endIndex == b.endIndex;
}

equals(newRange, anotherRange)
```
