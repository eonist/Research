### Map, filter, reduce (there is also other higher-functions like: flatMap)

#### map
 Map is the function we just saw, which allows you to to operate over the elements of a collection and then return a new array with the results.

#### filter
The filter function will take a function that returns a boolean. You will decide what objects should be part of the new array and which ones won’t. For example, if you have an array of numbers that go from 1 to 200 sequentially, you can filter the array to return a new one that contains only even numbers.

##### reduce
The reduce function will collapse a collection into something else. For example, suppose you have an array of numbers, and you wanted to add them up and return that result. You could achieve this using the reduce function...

## Map:

```swift
let arr = [("a",0),("b",1),("c",2)]
let numbers = arr.map{$0.1}
print(numbers)//1,2,3
let letters = arr.map{$0.0}
print(letters)//a,b,c
```

## Filter

```swift
// Filter an array of strings down to only strings that begin with the word
// "Apple"
```swift
let array = ["Orange", "Apple", "Apple Juice"]
let filteredArray = array.filter() {
    return $0.hasPrefix("Apple")//"Apple", "Apple Juice"
}

// filteredArray now contains 

//manually:
var filteredArray : [Int] = [] 

for money in moneyArray {
    if (money > 30) {
      filteredArray += [money]
    }
}
```

## FlatMap:

```swift
var fa1 = [1,2,3,4,5,6]

var fa1m = fa1.flatMap({$0 * 2})
fa1m /*[Int] with content [2, 4, 6, 8, 10, 12] */

var fao1:[Int?] = [1,2,3,4,nil,6]

var fao1m = fao1.flatMap({$0})
fao1m /*[Int] with content [1, 2, 3, 4, 6] */

var fa2 = [[1,2],[3],[4,5,6]]

var fa2m = fa2.flatMap({$0})
fa2m /*[Int] with content [1, 2, 3, 4, 6] */

var far1 = ["1","2","3","a"]
var far1m = far1.flatMap {
    Int($0)
}
far1m /* [Int] with content [1, 2, 3] */

far1m = far1.flatMap {
        Int($0)
    }
    .map {$0 * 2}
far1m /* [Int] with content [2, 4, 6] */
```


## Reduce:
```swift
let tempArray = ["a","b","c"]
let res = tempArray.reduce(""/*<-init value*/){$0 + $1}
Swift.print("res: " + "\(res)")//abc
```

## Combining filter and map
//(Functional programming)

```swift
let result = ["Orange", "Apple", "Apple Juice"].filter() {$0.hasPrefix("Apple")}.map{$0.lowercased()}
Swift.print(result)//"apple", "apple juice"
```

## Combining map and reduce: 

```swift
let tempArray = [[1,2,3],[4,5,6]]
let res = tempArray.map{$0.reduce(0/*<-init value*/){$0 + $1}}
Swift.print("res: " + "\(res)")// [6, 15] <--Basically summaries each array item
```

## Combining map and first:

```swift
let arr = [0,1,2,3]
let result = arr.lazy.map{print("💥");return $0}.first(where: {$0 == 2})
print(result)//3x 💥 then 2

/*Whats cool about this*/
/*You get access to element or i while you search. And it's functional. */ 
```

## Combining flatmap and first: 
//NOTE: This example requires an extension
```swift
let arr = [nil,nil,"a",nil,"b","c"]

func test(_ str:String?) -> String?{
    print("💥");
    return str
}
let res = arr.lazy.flatMap{return test($0)}.first

print("res: " + "\(res)")//💥💥💥"a"


```


### Combining map + flatMap + reduce:

```swift
let heightOfAllRows:CGFloat = sections.enumerated().map { arg -> [(section:Int,row:Int)] in
    return arg.element.data.indices.map{ i in
        (section:arg.offset,row:i)
    }
}.flatMap{$0}.reduce(0){
    return $0 + self.tableView(self, heightForRowAt: .init(row: $1.row, section: $1.section))
}
```