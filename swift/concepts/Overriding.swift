//inheritance info: https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html#//apple_ref/doc/uid/TP40014097-CH18-ID203
//Access levels in Swift 
//NOTE: private only accessible from within the same source code file 
//NOTE: internal This is the default accessible across multiple code files, but must be compiled together into the same module 
//NOTE: public accessible from any module that has imported yours 

//list superclass names: https://books.google.no/books?id=AYonCgAAQBAJ&pg=PA18&lpg=PA18&dq=list+superclass+swift&source=bl&ots=CAg5jeCqhE&sig=09AMGUBkiK601C7COjP-7n20lsQ&hl=en&sa=X&ved=0CC4Q6AEwB2oVChMI7eDJnMukyAIVJXVyCh2K7wul

//Changing access levels public 
class Player {
	//properties no modifier, will default to internal 
	var name:String
    var score:Int
	//public methods 
	public func description(){
		printin ("Player V (name) has a score of V (score)")
	}
	//private methods 
	private func calculateBonus (){
		//
	}
}

//classes:
class Person{
	//properties accessabøe outside a class:
	var name:String = "Paul"//values must be set if you use a class aka initialized
	let age:Int = 77;
	/**
 	 * NOTE: initializers are optional you can still use this object without passing params
	 */
    init(name:String = "jo",age:Int = 22){//class initializer w/ params
		self.name = name;//self refers to properties outside the method bit inside the class, aka this in other languages
		self.age = age;
	}
	//methods accessable outside a class:
    func desc()->String{
		return name + ", " + age
	}
    deinit{//system calls this method when an object is not used anymor
		//usefull if you need to close a connection to a database at the end of a lifetime of the ojb etc
		//needs more research
	}
}


newPerson.name = "Pete"
newPerson.age = 25
printin("your value: \(newPerson.desc())")

//
/**
 * class inheritance: super class and sub class
 * NOTE: if you mark a class final like:"final class Employee" then it cant be overriden by inheritance
 * NOTE: you may also overide variable setters and getters in swift simply, with the overide key infront of it
 */
 class Employee:Person{
 	var sallary:Int
 	var firstName:String = "Jo"
 	var lastName:String = "Socrates"
 	lazy var bonus : Int = calcBonus()//lazy makes the prop not init it self before something tries to access it. think of it almost as a method with a return var, his is just a handy way of doing things, nothing revolutionary
 	//property observere
 	var nickName:String = "Joey"{
 		willSet{//called before you set a value
 			
 			
 			("your value: \(newValue)")
 		}
 		didSet(oldNickName){//called after you set a value, the oldNickName enables you to rename the default oldValue
 			printin("your value: \(oldNickName)")
 		}
 	}
 	/**
 	 * NOTE: any overide of init must call the designated init method of the superclass
 	 * NOTE: you can also have many designated initializers
 	 * NOTE: you can create a class without initializers, if all public properties are set
 	 * NOTE: designated initiaizers are inherited if the class doesnt provide any of its own
 	 * NOTE: convenince initializers are inherited if the subclass has all of the superclasses designated initializers
 	 */
 	override init(sallery:Int){
 		self.sallery = sallery;
 		super.init()//we always call the super init last in the method, unlike obj-c
 	}
 	/**
	 * convenince initializers are a way to have many inits that can have different ways of initing your class
	 * NOTE: the convenince initializer must call the designated initializer at somepoint. 
	 */
	convenience init(fullName:String){
		self.init()//when using a convenince initializer you must call the designated initializer before setting any properties
		var fullNameArray = newValue.componentsSeperatedByString(" ")//newValue is the value you resive from the setter
		self.firstName = fullNameArray[0]
		self.lastName = fullNameArray[1]
		
	}
 	func calcBonus()->Int{
		return 5+2
	}		
 	override func desc()->String{
 		return super.description + " " + sallery
 	}
 	final func sallery()->Int{//final methods cant be overridden, but are still accesible from outside the class
		return sallary
	}
	/**
	 * computed properties, aka getters and setters?
 	 */
 	var fullName:String {
	 	get{//getter
			 return firstName + " " + lastName 	
	 	}
		set{//setter
			 var fullNameArray = newValue.componentsSeperatedByString(" ")//newValue is the value you resive from the setter
			 firstName = fullNameArray[0]
			 lastName = fullNameArray[1]
	 	}
	 }
	 var occupation:String{//same as getter just "shorthand"
	 	return "Quant"
	 }
 }
 var sammy:Employee = Employee(name:"Sammy")
 printin("your value: \(sammy.sallery)")
 printin("your value: \(sammy.desc)")
 printin("your value: \(sammy.fullName)")
 
 
 
//Preventing Overrides:

//You can prevent a method, property, or subscript from being overridden by marking it as final. Do this by writing the final modifier before the method, property, or subscript’s introducer keyword (such as final var, final func, final class func, and final subscript).

//Any attempt to override a final method, property, or subscript in a subclass is reported as a compile-time error. Methods, properties, or subscripts that you add to a class in an extension can also be marked as final within the extension’s definition.

//You can mark an entire class as final by writing the final modifier before the class keyword in its class definition (final class). Any attempt to subclass a final class is reported as a compile-time error.

/*

public class MyBaseClass {
        private var _name: String = "Hi"
        public internal(set) var name: String {
            get {
                return self._name
            }
            set {
                self._name = newValue
            }
        }
    }

    public class MyDerivedClass:MyBaseClass {
        override public var name: String {
            get {
                return "Derived - \(super.name)"
            }
            set {
                super._name = newValue
            }
        }
    }

    MyDerivedClass().name
	 
	 
	 */