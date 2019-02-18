### Reduce into a tuple:
```swift
let res:(String,String) = [("a","1"),("b","2"),("c","3")].reduce(("","")){($0.0 + $1.0, $0.1 + $1.1)}
Swift.print("res: " + "\(res)")//("abc","123")
```

### Reduce to different type:
```swift
let s:String = [1,2,3].reduce(""){"\($0)" + "\($1)"}
Swift.print("s: " + "\(s)")
//alternative:
let str = ["1", "2", "3"].joined(separator:"")
```

### shorter version

```swift
[0,1,1,0].map{"\($0)"}.reduce("",+)//"0110"

//or combining data

let d:Data = [Data(),Data()].compactMap{$0}.reduce(Data(),+)//Data()
```

### Reduce into tuple w/ two arrays
```swift
typealias Acc = (l: [Int], r: [Int])
func partition(lst: [Int], criteria: (Int) -> Bool) -> Acc {
   return lst.reduce((l: [Int](), r: [Int]()), combine: { (ac: Acc, o: Int) -> Acc in
      if criteria(o) {
	return (l: ac.l + [o], r: ac.r)
      } else {
	return (r: ac.r + [o], l: ac.l)
      }
   })
}
partition([1, 2, 3, 4, 5, 6, 7, 8, 9], criteria: { $0 % 2 == 0 })
//: ([2, 4, 6, 8], [1, 3, 5, 7, 9])
```

### Reduce into Dict

```swift
let dict:[String:String] = [(key:"",val:""),(key:"",val:"")].reduce([:]) {
    var dict:[String:String] = $0
    dict[$1.key] = $1.val
    return dict
}
```

### Reduce array into bool tuple:

```swift
//instead of someAre, you can also do: let (checked,unChecked) if you want two values instead of a tuple
typealias Acc = (checked:Bool,unChecked:Bool)
let someAre:Acc = descendants.reduce((false,false)) { (ac: Acc, tree: Tree) -> Acc in
    var ac = ac
    if let prop = tree.props?["active"]  {
        Swift.print("prop: " + "\(prop)")
        if prop == "true"{
            ac.checked = true
        }else if prop == "false" {
            ac.unChecked = true
        }
    }
    return ac
}
```

### Reduce into array:
//This snippet removes duplicates from an array
```swift
let arr:[Int] = [1,2,2,2,3,3,1].reduce([]) { (a:[Int],b:Int) in
    var acc:[Int] = a
    if acc.first(where:{$0 == b}) == nil { acc.append(b) }
    return acc
}
arr//1,2,3
```

### Reducing an array of Tuples to array
```swift
let arr:[Int] = [(0,""),(1,"")].reduce([]) { $0 + [$1.0] }//[0, 1]
```


### Reducing a Dictionary into a String:
```swift
let dict = ["John":"🔵","Donna":"🔴"]

let str = dict.reduce("") {
    return $0 + "\($1.key) likes the color: \($1.value) "
}   
Swift.print(str)//Donna likes the color: 🔴 John likes the color: 🔵
```
