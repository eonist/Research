//https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html#//apple_ref/doc/uid/TP40014097-CH25-ID267

//Basically delegate is just an "interface in other languages" and passing a reference to the method in another class that you want to call. Simple concept

// Define a protocol that has a function called handleIntruder
protocol HouseSecurityDelegate {

    // We don't define the function here, but rather
    // indicate that any class that is a HouseSecurityDelegate
    // is required to have a handleIntruder() function
    func handleIntruder()
}
class House {
    // The delegate can be any object that conforms to the HouseSecurityDelegate
    // protocol
    var delegate : HouseSecurityDelegate?

    func burglarDetected() {
        // Check to see if the delegate is there, then call it
        delegate?.handleIntruder()
    }
}

class GuardDog : HouseSecurityDelegate {
    func handleIntruder() {
        println("Releasing the hounds!")
    }
}


let myHouse = House()
myHouse.burglarDetected() // does nothing

let theHounds = GuardDog()
myHouse.delegate = theHounds
myHouse.burglarDetected() // prints "Releasing the hounds!"





//MyClass.swift
protocol MyClassDelegate {
  func myClassDelegateMethod(sender:MyClass)
}
class MyClass {
    var delegate: MyClassDelegate?
    func doSomething {
        delegate?.myClassDelegateMethod(self)
    }
}
Now the parent class, a ViewController we’ve called MYViewController

//MYViewController.swift
class MyViewController:UIViewController, MyClassDelegate {
    var myClass:MyClass
    init() {
        myClass = MyClass()
        myClass.delegate = self
        myClass.doSomething()
    }
    func myClassDelegateMethod(sender:MyClass) {
        println("MyClass called this method via MyClassDelegate!")
    }
    ...
}




another Example

```swift
protocol Targetable {
    var life: Int { get set }
    func takeDamage(damage: Int)
}

protocol Shootable {
    func shoot(target: Targetable)
}

class Pistol: Shootable {
    func shoot(target: Targetable) {
        target.takeDamage(1)
    }
}

class Shotgun: Shootable {
    func shoot(target: Targetable) {
        target.takeDamage(5)
    }
}

class Enemy: Targetable {
    var life: Int = 10

    func takeDamage(damage: Int) {
        life -= damage
        println("enemy lost \(damage) hit points")

        if life <= 0 {
            println("enemy is dead now")
        }
    }
}

class Player {
    var weapon: Shootable!

    init(weapon: Shootable) {
        self.weapon = weapon
    }

    func shoot(target: Targetable) {
        weapon.shoot(target)
    }
}

var terminator = Player(weapon: Pistol())

var enemy = Enemy()

terminator.shoot(enemy)
//> enemy lost 1 hit points
terminator.shoot(enemy)
//> enemy lost 1 hit points
terminator.shoot(enemy)
//> enemy lost 1 hit points
terminator.shoot(enemy)
//> enemy lost 1 hit points
terminator.shoot(enemy)
//> enemy lost 1 hit points

// changing weapon because the pistol is inefficient
terminator.weapon = Shotgun()

terminator.shoot(enemy)
//> enemy lost 5 hit points
//> enemy is dead now

```