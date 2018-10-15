### Subscripts enable you to access data via brackets like: instance[2] pr instance["color"] or instance["color",3]

**NOTE:** https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Subscripts.html#//apple_ref/doc/uid/TP40014097-CH16-ID305

```swift
let punch = Punchlist()
punch["nid"] = "123"
println(punch["nid"])

class Punchlist {
    var nid: String?
    var title: String?
    subscript(key: String) -> String? {
        get {
            if key == "nid" {
                return nid
            } else if key == "title" {
                return title
            }
            return nil
        }
        set {
            if key == "nid" {
                nid = newValue
            } else if key == "title" {
                title = newValue        
            }
        }
    }
}
```

```swift
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")
// prints "six times three is 18"

//
```

```swift
class Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
```


### Example: 


```swift
class Temp{
    var name:String = "ss"
    var color:String = "ss"
}
extension Temp{
    subscript(key: String) -> String {
        get {
            if key == "name" {
                return name
            } else if key == "color" {
                return color
            }else{
                fatalError("err")
            }
            
        }
        set {
            if key == "name" {
                self.name = newValue
            } else if key == "color" {
                self.color = newValue
            }else{
                fatalError("err")
            }
        }
    }
}

let temp = Temp()

temp["color"] = "blue"

temp["color"]
```




### Subscripts

```swift
//Extensions can add new subscripts to an existing type. This example adds an integer subscript to Swift’s built-in Int type. This subscript [n] returns the decimal digit n places in from the right of the number:

123456789[0] //returns 9
123456789[1] //returns 8
//…and so on:

extension Int {
    subscript(var digitIndex: Int) -> Int {
        var decimalBase = 1
        while digitIndex > 0 {
            decimalBase *= 10
            --digitIndex
        }
        return (self / decimalBase) % 10
    }
}

```



### Generic subscript

```swift
Generic Subscripts
Subscripts are an important part of making data types accessible in an intuative way. To improve their usefulness, subscripts can now be generic [SE-0148]:
struct GenericDictionary<Key: Hashable, Value> {
  private var data: [Key: Value]

  init(data: [Key: Value]) {
    self.data = data
  }

  subscript<T>(key: Key) -> T? {
    return data[key] as? T
  }
}
```



### advance generic subscripts:


```swift
In this example, the return type is generic. You can then use this generic subscript like so:
// Dictionary of type: [String: Any]
var earthData = GenericDictionary(data: ["name": "Earth", "population": 7500000000, "moons": 1])

// Automatically infers return type without "as? String"
let name: String? = earthData["name"]

// Automatically infers return type without "as? Int"
let population: Int? = earthData["population"]
Not only can the return type be generic, but the actual subscript type can be generic as well:
extension GenericDictionary {
  subscript<Keys: Sequence>(keys: Keys) -> [Value] where Keys.Iterator.Element == Key {
    var values: [Value] = []
    for key in keys {
      if let value = data[key] {
        values.append(value)
      }
    }
    return values
  }
}

// Array subscript value
let nameAndMoons = earthData[["moons", "name"]]        // [1, "Earth"]
// Set subscript value
let nameAndMoons2 = earthData[Set(["moons", "name"])]  // [1, "Earth"]
```