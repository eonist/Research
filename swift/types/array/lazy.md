```swift


let arr = [0,1,2,3]
let result:[Int] = arr.lazy.map{  (value:Int) -> Int in
    print("👆")
    return value
    }.map{  (item:Int) -> Int in
        print("👈")
        return item
}
print(result)//lazy has no effect
//👆
//👈
//👆
//👈
//👆
//👈
//👆
//👈


```