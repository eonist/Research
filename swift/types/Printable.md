```swift
func printValues<T:CustomStringConvertible>(array:Array<T>){
    for item in array {
        print(item)
    }
}
```


```swift
class A:CustomStringConvertible{
    var someNumber:Int
    var description: String { get{return String(someNumber)} }
    init(_ someNumber:Int){
        self.someNumber = someNumber
    }
}
print([A(2),A(6),A(-4)])//Output: 2,6,-4
```