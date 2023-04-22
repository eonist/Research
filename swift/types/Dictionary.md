### Short hand:
```swift
let longHandDictionary = Dictionary<String,String>()
let shortHandDictionary = [String:String]()
let shorterHandDictionary = [:]
```

// Creates a new dictonary
```swift
var dict: Dictionary<String, String> = Dictionary<String, String>()
```

**If you ever need deep copy of a Dictionary:** Drawkit- NSDictionary+DeepCopy.m

// dictionaries are like associative arrays
// the following two declarations are equivalent:


```swift
func testing(){
    let newDict = Dictionary<String, Int> // long hand
    let anotherDict = [String:Int]() // <-shorthand

    let someDictionary: [String: Int] = ["Alex": 31, "Paul": 39]
    let someDictionary2: Dictionary<String, Int> = ["Alex": 31, "Paul": 39]


    var theDict=["color":"blue","type":"car"]
    print("your value:"+theDict["type"]!)//"car"
    theDict["color"] = "red"//change values
    var namesOfIntegers = [Int: String]()
    namesOfIntegers[16] = "sixteen"
    namesOfIntegers = [:]// namesOfIntegers is once again an empty dictionary of type [Int: String]
    theDict.updateValue("orange",forKey:"color")//change value, the long hand version, returns the old value,nil if key didnt exist
    theDict.removeValueForKey("color")//returns the old value,nil if key didnt exist
    theDict.count//num of items
    theDict.keys//returns all keys in map collection view properties

    theDict.values//returns all values in map collection view properties
    print(Array(theDict.values))//convert the map collection view propertiesinto an usable Array
    theDict["material"] = "plastic"//add new key value pairs
    theDict["color"] = nil//removes the value key pair
    for (theKey,theValue) in theDict{
        print("your value: \(theValue) and key: \(theKey)")
    }
    var anotherDict : [String]
    print(anotherDict)


    /**
    * //the code bellow is a way swift can do basically this:
    * var res = theDict["someKeyNameThatDoesNotExist"]
    * if res != nil {
    *		print the res
    * }else{
    * 	printin("your value: \("no val found for that key")")
    * }
    */


    if var res : String = theDict["someKeyNameThatDoesNotExist"] {
        print("your value: \(res)")
    }else{
        print("no val found for that key")
    }
    /**
    * If your dictionary is a constant, you know exactly what’s there. In that case, a forced unwrap like above is fine. If you have a dictionary where you may add or delete elements from the dictionary, make sure you check for nil.
    */
    if piePrice["Apple"] != nil {
        let extPrice = piePrice["Apple"]! * slices
        print("\(slices) slices of Apple Pie is \(extPrice)")
    }

    //or more compactly with optional chaining
    if let price = piePrice["Apple"]{
        let extPrice = price * slices
        print("\(slices) slices of Apple Pie is \(extPrice)")
    }

    var a = ["color":"blue"]
    var b = ["color":"blue"]
    var c = ["color":"red"]
    a == b//true,
    a == c//false,
    a != c//true,

    //You can explicitly type your of key:value pairs. The preferred way to do this is:
    //Dictionary<string,double>
    let piePrice:[String:Double] = ["Apple":3.99,"Raspberry":3.35]


    //There are times you need an empty dictionary. In those cases, call the dictionary initializer, which for a dictionary is the key:value pair enclosed in square brackets:
    //var pizzaSizes = Dictionary<Int, String>()
    var pieToppings = [String:Double]()

    for myValue  in toppings.values{
        print ("Value =  \(myValue)")
    }
    for (myKey,myValue) in toppings {
        print("\(myKey) \t \(myValue)")
    }
    //make a 10% price increase
    for myKey  in toppings.keys {
        toppings[myKey] = toppings[myKey]! * 1.10
    }


    /**
    * Sometimes we need an array of the keys or values, since a particular API requires an array. We can use the .keys or .values to create an array:
    */
    var valuesArray = [Double](toppings.values)



    //set
    var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
    //You can add a new item into a set by calling the set’s insert(_:) method:
    print(favoriteGenres.contains("Funk")) //To) check whether a set contains a particular item, use the contains(_:) method.
    favoriteGenres.insert("Jazz")
    // favoriteGenres now contains 4 items
    print(Array(theDict.keys))//convert the map collection view properties into an usable Array

    /**
    Use the intersect(_:) method to create a new set with only the values common to both sets.
    Use the exclusiveOr(_:) method to create a new set with values in either set, but not both.
    Use the union(_:) method to create a new set with all of the values in both sets.
    Use the subtract(_:) method to create a new
    */

    /**
    Use the “is equal” operator (==) to determine whether two sets contain all of the same values.
    Use the isSubsetOf(_:) method to determine whether all of the values of a set are contained in the specified set.
    Use the isSupersetOf(_:) method to determine whether a set contains all of the values in a specified set.
    Use the isStrictSubsetOf(_:) or isStrictSupersetOf(_:) methods to determine whether a set is a subset or superset, but not equal to, a specified set.
    Use the isDisjointWith(_:) method to determine whether two sets have any values in common.
    */
}
```


```swift
let h: Dictionary<String, Int> = ["Alex": 31, "Paul": 39]
let i: Dictionary<String, Int> = ["Alex": 32, "Paul": 39]

Swift.print(h == i)//false

let temp = [h,i]

let index = temp.indexOf { $0 == i } ?? -1//-1 indicates no result found

index//1
//
```

Find a key at an index (keys will change places randomly so dont rely on this) (but if you only have one key then its fine)
```swift
nameDict.keys[nameDict.startIndex.advancedBy(0)]
```

Sorting dictionary:

```swift
let dict = ["b": 2, "a": 1, "c": 3]
// (Array(dict).sorted{$0.1 < $1.1}).forEach{(k,v) in print("\(k):\(v)")}
Array(self).sorted { $0.key < $1.key }.forEach { $0 }
//Output: a:1, b:2, c:3
//Swap out the `.forEach` with `.map` 👉 Functional programming 🤖
```

### Manipulate key and value
```swift
let newDict = Dictionary(uniqueKeysWithValues: oldDict.map { key, value in (key.uppercased(), value.lowercased()) })
```

## mapValues:
```swift
let dictionary = ["foo": 1, "bar": 2, "baz": 5]
let newDictionary = dictionary.mapValues { value in // there is also compactMapValues
   return value + 1
}
// let newDictionary = dictionary.mapValues { $0 + 1 } // also works
print(newDictionary) // prints: ["baz": 6, "foo": 2, "bar": 3]
```

### Has key:
```swift
// if you know value cant be nil
dict["someKey"] != nil
// or if value can be nil: (bit slower)
dict.keys.contains("somekey")
```

### Compactmap values
```swift
let dict: [String, Any] = [:]
let newDict: [String: String] = dict.compactMapValues { $0 as? String }
```
