### When to use enum:
if your problem domain can be divided into a finite set of distinctive categories, an enum may be the right choice.

more here: https://appventure.me/2015/10/17/advanced-practical-enum-examples/

```swift
enum Numbers: Int {
	case one = 1, two, three, four
}

let value = Numbers.Three
print(value.rawValue)//Output:3
```

```swift
//advance usage of enum: http://appventure.me/2015/10/17/advanced-practical-enum-examples/

class EnumTest{//enumerations:
	//enums are simple classes that can be used like this:
	enum CarType{
		case Tractor
		case Sports
		case Sedan
		//or case Tractor, Sports,Sedan
	}
    func test(){
        var johnLikes:CarType
        johnLikes = CarType.Sedan
        johnLikes = .Sedan

        switch johnLikes{
            case .Sedan:
                print("he likes sedan")
            case .Sports:
                print("he likes sport cars")
            case .Tractor:
                print("he likes tractors")
            default:
                break;
        }
    }

}
enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

enum PlanetNumbers:Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

enum Letters: Character {
    case a = "A"
    case b = "B"
    case c = "C"
}

//When integers are used for raw values, they auto-increment if no value is specified.
enum Numbers: Int {
    case One = 1, Two, Three, Four, Five
}

var five = Numbers.Five
func testing(){
    print(five.rawValue)// 5
    let possibleNum = Numbers(rawValue: 2)!
    print(possibleNum == Numbers.Two)       // true
}


//nested enums:
enum Character {
  enum Weapon {
    case Bow
    case Sword
    case Lance
    case Dagger
  }
  enum Helmet {
    case Wooden
    case Iron
    case Diamond
  }
  case Thief
  case Warrior
  case Knight
}
//Now you have a hierachical system to describe the various items that your character has access to.

let character = Character.Thief
let weapon = Character.Weapon.Bow
let helmet = Character.Helmet.Iron

//enums in structs:
//Containing Enums
//In a similar vein, you can also embed enums in structs or classes. Continuing with our previous example:

struct Character {
   enum CharacterType {
    case Thief
    case Warrior
    case Knight
  }
  enum Weapon {
    case Bow
    case Sword
    case Lance
    case Dagger
  }
  let type: CharacterType
  let weapon: Weapon
}

let warrior = Character(type: .Warrior, weapon: .Sword)
//This, again, helps in keeping related information together.
```



### Mutating method:
```swift
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
	switch self {
		case Off:
		    self = Low
		case Low:
		    self = High
		case High:
		    self = Off
		}
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
// ovenLight is now equal to .High
ovenLight.next()
// ovenLight is now equal to .Off
```


### Using Custom Data Types as Enum Values:
```swift
enum Devices: CGSize {
   case iPhone3GS = CGSize(width: 320, height: 480)
   case iPhone5 = CGSize(width: 320, height: 568)
   case iPhone6 = CGSize(width: 375, height: 667)
   case iPhone6Plus = CGSize(width: 414, height: 736)
}
extension CGSize: StringLiteralConvertible {
    public init(stringLiteral value: String) {
		let size = CGSizeFromString(value)
		self.init(width: size.width, height: size.height)
    }

    public init(extendedGraphemeClusterLiteral value: String) {
		let size = CGSizeFromString(value)
		self.init(width: size.width, height: size.height)
    }

    public init(unicodeScalarLiteral value: String) {
		let size = CGSizeFromString(value)
		self.init(width: size.width, height: size.height)
    }
}
enum Devices: CGSize {
   case iPhone3GS = "{320, 480}"
   case iPhone5 = "{320, 568}"
   case iPhone6 = "{375, 667}"
   case iPhone6Plus = "{414, 736}"
}
let a = Devices.iPhone5
let b = a.rawValue
print("the phone size string is \(a), width is \(b.width), height is \(b.height)")
// prints : the phone size string is iPhone5, width is 320.0, height is 568.0
```


```swift
enum Direction {
  case North, South, West, East
}
let myDir = Direction.West
switch myDir {
	case .North: println("you're going north")
	case .South: println("you're going south")
	case .West: println("you're going west")
	case .East: println("you're going east")
}
```



```swift
//: [Previous](@previous)

import Foundation

enum PlayerTurn {
    case WaitingToRollDice
    case Done(Int)

    init () {
        self = .WaitingToRollDice
    }
    mutating func rollDice() -> Int {
        let diceResult = Int(arc4random_uniform(6) + 1)
        if (diceResult < 6) {
            self = .Done(diceResult)
        }
        return diceResult
    }
}


var turn = PlayerTurn()
var done = false

//Swift.print("turn: " + "\(turn)")

repeat {
    switch turn {
	    case .WaitingToRollDice:
	        turn.rollDice()
	    case let .Done(result):
	        print("Player rolled \(result)")
	        done = true
    }
} while (!done)


//Player rolled 5

```


```swift
enum Character {
  enum Weapon {
    case Bow
    case Sword
    case Lance
    case Dagger
  }
  enum Helmet {
    case Wooden
    case Iron
    case Diamond
  }
  case Thief
  case Warrior
  case Knight
}

let character = Character.Thief
let weapon = Character.Weapon.Bow
let helmet = Character.Helmet.Iron
```


```swift
enum Device {
  case iPad, iPhone
  var year: Int {
    switch self {
	case iPhone: return 2007
	case iPad: return 2010
     }
  }
}
```

#### String enum example:

enum Suit:String {
    case spades = "♠"
    case hearts = "♥"
    case diamonds = "♦"
    case clubs = "♣"
}
swift.print(Suit.spades.rawValue)//"♠"


#### String to enum:

enum Foo: String {
   case a, b, c, d
}

let a = Foo(rawValue: "a")
assert(a == Foo.a)


#### Nested enums:
```swift
enum State {
     enum Normal{
         case search
         case idle
     }
     case normal(Normal)
     case hidden
 }
 /**
  * Set state
	* ## Examples:
	* setState(.normal(.idle))//🤷
	* setState(.normal(.search))//🚀
	* setState(.hidden)//🤦
  */
 func setState(_ state:State){
     switch state {
     case .normal(let normal):
         switch normal {
         case .idle:
              print("🤷")
         case .search:
              print("🚀")
         }
     case .hidden:
         print("🤦")
     }
 }
```

 ### Hash to type
 ```swift
 enum CellType:String{
     case primary,secondary,tierary
     static let types:[CellType] = [.primary,.secondary,.tierary]
     /**
      * NOTE: Since there is no way to get back an enum value from its hashValue, you have to do it manually.
      */
     static func fromHashValue(hashValue: Int) -> CellType {
         if hashValue == 0 {
             return .primary
         } else if hashValue == 1{
             return .secondary
         } else {
             return .tierary
         }
     }
 }
 ```


### Access name of int enum:
```swift
public enum TestEnum : Int {
   case one = 0, two, three
}
Swift.print("\(String(describing: TestEnum.three))") // three
```
