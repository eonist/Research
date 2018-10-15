The Comparable protocol extends the Equatable protocol -> implement both of them

In Apple's Reference is an example from Apple (within the Comparable protocol reference) you can see how you should do it: Don't put the operation implementations within the class, but rather on the outside/global scope. Also you only have to implement the < operator.

Correct example:


```swift
class Person : Comparable {
    let name : String

    init(name : String) {
        self.name = name
    }
}
//these methods must reside outside class scopes
func < (lhs: Person, rhs: Person) -> Bool {
    return lhs.name < rhs.name
}

func == (lhs: Person, rhs: Person) -> Bool {
    return lhs.name == rhs.name
}

let paul = Person(name: "Paul")
let otherPaul = Person(name: "Paul")
let ben = Person(name: "Ben")

paul > otherPaul  // false
paul <= ben       // false
paul == otherPaul // true
```

EXAMPLE:

```swift
var numbers = [4,2,5,1,0,-1,22,3]

func before<T:Comparable>(a: T, b: T) -> Bool {
    return a < b;
}

let sortedNumbers = conditionSort(numbers, before)//-1,0,1,2,3,4,5,22
print(sortedNumbers)
```



NOTE:
there is also: Striding over Strideable values, which are Comparable and can be advanced an arbitrary distance in O(1).


