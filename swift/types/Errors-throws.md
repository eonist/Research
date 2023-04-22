Using error in async code: http://alisoftware.github.io/swift/async/error/2016/02/06/async-errors/


project
//https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ErrorHandling.html#//apple_ref/doc/uid/TP40014097-CH42-ID508
//this is great: https://www.hackingwithswift.com/new-syntax-swift-2-error-handling-try-catch
//IMPORTANT: You can also do defer as a final statement. read the above for this
//NOTE: Syntax is a bit different: do-catch + try + defer vs traditional try-catch-finally syntax.
//NOTE: Swift exceptions are not compatible with ObjC exceptions. Your do-catch block will not catch any NSException, and vice versa, for that you must use ObjC.
//NOTE: guard statement (using guard keyword) which let you write little less if/else code than in normal error checking/signaling code.
//this line should normally be present do-catch block like this
//IMPORTANT: there are two ways of doing error handeling. 1. you wrap an error function in a do catch block and 2. you use a variable for the result with the try? . see apple link above for both, they are also here
/*

Try error SHORTHAND!
```swift
if let data = try? NSData(contentsOfURL: URL, options: []) {
    print("Data Loaded")
} else {
    print("Unable to Load Data")
}
func loadContentsOfFileAtURL(URL: NSURL) -> String? {
    guard let data = try? NSData(contentsOfURL: URL, options: []) else {
        return nil
    }

    return String(data: data, encoding: NSUTF8StringEncoding)
}
```

links

http://szulctomasz.com/2015/08/14/swift-2-error-handing-using-errortype-throws-try-and-do-catch.html
https://www.raywenderlich.com/130197/magical-error-handling-swift

```swift

//Use fatalError("message here") for debugging


do {
    try expression
    statements
} catch pattern 1 {
    statements
} catch pattern 2 where condition {
    statements
}
*/
enum AwfulError: Error {
    case Bad
    case Worse
    case Terrible
}

func doDangerousStuff() throws -> String {
    // If something bad happens throw the error:
    throw AwfulError.Bad

    // If something worse happens, throw another error:
    throw AwfulError.Worse

    // If something terrible happens, you know what to do:
    throw AwfulError.Terrible

    // If you made it here, you can return:
    return "some data"
}


/*
 * TODO: what about ErrorType
 */
func test(){
    do {
        let theResult = try doDangerousStuff()
        print(theResult)
    }
    catch AwfulError.Bad {
        // Deal with badness.
    }
    catch AwfulError.Worse {
        // Deal with worseness.
    }
    catch AwfulError.Terrible {
        // Deal with terribleness.
    }
    catch {
         //not handled error
    }
}
```
//A variant of the try keyword is try!. That keyword may be appropriate for those programmer errors again. If you mark a throwing call with try!, you are promising the compiler that that error will never happen and you do not need to catch it. If the statement does produce an error, the application will stop execution and you should start debugging.
let theResult = try! doDangerousStuff()

//In order to throw an error you use throw keyword like this
```swift

func test3(){
    do {
        try rideTheDragon(redDragon)
    } catch DragonError.DragonIsMissing {
        // Error-handling
    } catch DragonError.NotEnoughMana(let manaRequired) {
        // More error-handlng
    } catch {
        // Catch all error-handling
    }
    //Alternatively in function that is itself marked with throws keyword like this
    throw {
        try rideTheDragon(quest.dragon)
    }


    throw DragonError.DragonIsMissing

    enum DragonError: ErrorType {
        case DragonIsMissing
        case NotEnoughMana(manaRequired: Int)
    }
}
```

```swift

//Excerpt From: Apple Inc. “Using Swift with Cocoa and Objective-C (Swift 2 Prerelease).” iBooks.
//Example: (from the book)
NSFileManager *fileManager = [NSFileManager defaultManager];
NSURL *URL = [NSURL fileURLWithPath:@"/path/to/file"];
NSError *error = nil;
BOOL success = [fileManager removeItemAtURL:URL error:&error];
if (!success && error){
    NSLog(@"Error: %@", error.domain);
}

//The equivalent in swift will be:
import Foundation
func test4(){
    let fileManager = NSFileManager.defaultManager()
    let URL = NSURL.fileURLWithPath("path/to/file")
    do {
        try fileManager.removeItemAtURL(URL)
    } catch let error as NSError {
        print ("Error: \(error.domain)")
    }
}

enum SecureStoreError: ErrorType {
    case DirectoryNotExist
    case NoRights
}
func testing(){
    let store = SecureStore()
    do {
        try store.storeData(NSData(), path: "path/to/dir")
    } catch SecureStoreError.DirectoryNotExist {
        print("dir not exist")
    } catch SecureStoreError.NoRights {
        print("no rights")
    } catch {
        print("not handled error")
    }
}
//a class example
class SecureStore {

    func storeData(data: NSData, path: String) throws -> String {
        // Some logic goes here...
        // More logic...

        // Ooops, directory not exist, throw error
        throw SecureStoreError.DirectoryNotExist

        // the code here is executed when directory exist.

        // checking rights...
        // Oops, no write-rights, throw error
        throw SecureStoreError.NoRights

        // We've got rights

        // Saving logic goes here
        // Generates some identifier for stored data
        // This will be only returned if method didn't throw above.
        return NSUUID().UUIDString
    }
}
```

//Throwing an Error:
```swift
/objc
/*
*errorPtr = [NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorCannotOpenFile userInfo: nil]
*/

//Will be automatically propagated to the caller:
//swift

//throw NSError(domain: NSURLErrorDomain, code: NSURLErrorCannotOpenFile, userInfo: nil)

```

```swift

//From Apple books, The Swift Programming Language it's seems erros should be handle using enum
enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

func test6(){
    switch success {
    case let .Result(sunrise, sunset):
        let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
        print(serverResponse)
    case let .Error(error):
        let serverResponse = "Failure...  \(error)"
        print(serverResponse)
    }
}
```





```swift

//Excerpt From: Apple Inc. “Using Swift with Cocoa and Objective-C.” iBooks. https://itun.es/br/1u3-0.l

//And the books also encourage you to use cocoa error pattern from Objective-C (NSError Object)

//Error reporting in Swift follows the same pattern it does in Objective-C, with the added benefit of offering optional return values. In the simplest case, you return a Bool value from the function to indicate whether or not it succeeded. When you need to report the reason for the error, you can add to the function an NSError out parameter of type NSErrorPointer. This type is roughly equivalent to Objective-C’s NSError **, with additional memory safety and optional typing. You can use the prefix & operator to pass in a reference to an optional NSError type as an NSErrorPointer object, as shown in the code listing below.


func test5(){
    var writeError : NSError?
    let someText:String = "some text"
    let writtenData:()? = try? someText.writeToFile("/some/path/here", atomically: false, encoding: NSUTF8StringEncoding)
    func testingError(){
        if !(writtenData != nil) {
            if let error = writeError {
                print("write failure: " + error.localizedDescription)
            }
        }
    }
}

```

```swift


//In development, you can use assert to catch any errors which might appear, and need to be fixed before going to production.
//The classic NSError approach isn't altered, you send an NSErrorPointer, which gets populated.
//Brief example:

func testing3(){
    let error:NSError?
    let contents = try? NSFileManager.defaultManager().contentsOfDirectoryAtPath("/Users/leandros")
    if let error = error {
        print("An error occurred \(error)")
    } else {
        print("Contents: \(contents)")
    }
}

```


//More fancy Error Handling techniques can be found in: What's New in Swift (2015 Session 106 28m30s)

//Error handling model: The new error handling model in Swift 2.0 will instantly feel natural, with familiar try, throw, and catch keywords. Best of all, it was designed to work perfectly with the Apple SDKs and NSError. In fact, NSError conforms to a Swift’s ErrorType. You’ll definitely want to watch the WWDC session on What’s New in Swift to hear more about it.
```swift


/**
 * this is how you deal with address pointers and errors in swift when calling an obj-c method
 */

func testing2(){
    // Get the NSFileManager
    let theFileManager = NSFileManager.defaultManager()
    // Define optional NSError
    //var error : NSError?//just creat an address to a variable, and pass this as the call .moveItemAtPath
    //var theSuccess = try

    do {
        try theFileManager.moveItemAtPath("/some/path", toPath:"/some/other/path")//<--&error is the address to the variable, not the variable it self
    } catch let error as NSError {
        print ("Error: \(error.domain)")
        print("It didn't work.")
        print(error.localizedDescription)
        print(error.localizedFailureReason)
    }
}


```

```swift

Disabling Error Propagation

Sometimes you know a throwing function or method won’t, in fact, throw an error at runtime. On those occasions, you can write try! before the expression to disable error propagation and wrap the call in a runtime assertion that no error will be thrown. If an error actually is thrown, you’ll get a runtime error.

For example, the following code uses a loadImage(_:) function, which loads the image resource at a given path or throws an error if the image can’t be loaded. In this case, because the image is shipped with the application, no error will be thrown at runtime, so it is appropriate to disable error propagation.


//let photo = try! loadImage("./Resources/John Appleseed.jpg")


/*

func fetchData() -> Data? {
if let data = try? fetchDataFromDisk() { return data }
if let data = try? fetchDataFromServer() { return data }
return nil
}




*/

```

### new


```swift
struct RuntimeError: Error {
	let message: String
	init(_ message: String) {
		self.message = message
	}
	public var localizedDescription: String {
		return message
	}
}


func test(color:NSColor) throws{
	if color == .red {
		throw RuntimeError("I don't like red")
	}else if color == .green {
		throw RuntimeError("I'm not into green")
	}else {
		throw RuntimeError("I like all other colors")
	}
}

do {
	try test(color:.blue)
} catch let error {
	print ("Error: \(error)")//"I like all other colors"
}


//switch on case (and on message):


do {
    try test(color:.blue)
} catch let error as RuntimeError where error.message == "I like all other colors"{
    Swift.print ("Error: \(error)")//"I like all other colors"
}catch let error {
    Swift.print ("Other cases: Error: \((error as! RuntimeError).message)")
}

//throw error with message:

func handleDigit(_ digit: Int) throws {
    switch digit {
    case 0, 1, 2, 3, 4, 5, 6, 7, 8, 9:
        print("Yes, \(digit) is a digit!")
    default:
        throw Error(message: "The given number was not a digit.")
    }
}

//Simple:
do {
	try test(color:.blue)
} catch {
	print ("Error: \(error)")//"I like all other colors"
}

```



//


```swift
enum Error: ErrorType {
    case EmptyField
    case PasswordDoNotMatch
    case InvalidEmail
    case UserCardIDTaken
    case IncorrectSignIn
    case InvalidPassword
}
extension Error: CustomStringConvertible {
    var description : String {
        get {
            switch self {
            case .EmptyField: return "Porfavor llene todos los campos"
            case .PasswordDoNotMatch: return "La contraseña no coincide"
            case .InvalidEmail: return "Porfavor entre un email valido"
            case .UserCardIDTaken: return "La Cedula ya existe"
            case .IncorrectSignIn: return "Email o Contraseña son incorrectos"
            case .InvalidPassword: return "Las contraseñas no coinciden"
            }
        }
    }
}
```


```swift
extension String: Error {}/*Then you can just throw a string*/

extension String: LocalizedError {/*adds error.localizedDescription*/
    public var errorDescription: String? { return self }
}

func test(color:NSColor) throws{
    if color == .red {
        throw "I don't like red"
    }else if color == .green {
        throw "I'm not into green"
    }else {
        throw "I like all other colors"
    }
}

do {
    try test(color:.green)
} catch let error where error.localizedDescription == "I don't like red"{
    Swift.print ("Error: \(error)")//"I don't like red"
}catch let error {
    Swift.print ("Other cases: Error: \(error.localizedDescription)")/*I like all other colors*/
}
```


//nice example:

```swift
func loginUserWithUsername(username: String?, password: String?) throws -> String {
    guard let username = username where username.characters.count != 0 else {
        throw LoginError.EmptyUsername
    }

    guard let password = password where password.characters.count != 0 else {
        throw LoginError.EmptyPassword
    }
    ///Handle all the other,
    return "token:" + username
}

func login() {

    do {
        let token = try loginUserWithUsername("konrad1977", password: nil)
        print("user logged in \(token)")
    } catch LoginError.EmptyUsername {
        print("empty username")
    } catch LoginError.EmptyPassword {
        print("empty password")
    } catch {
        print(error)
    }
}
```

//nicer example:

```swift
extension LoginError : CustomStringConvertible {
    var description: String {
        switch self {
            case .EmptyUsername:
                return "Username cannot be empty"

            case .EmptyPassword:
                return "Password cannot be empty"
        }
    }
}

func login() {

    do {
        let token = try loginUserWithUsername("konrad1977", password: nil)
        print("user logged in \(token)")
    } catch let error as LoginError {
        print(error.description)
    } catch {
        print(error)
    }
}
```



### Rethrows:

- The rethrows keyword indicates to the compiler that the outer function is a throwing function only if the closure passed in throws an error that is propagated to the current scope.
- Basically with rethrows, we can use throw inside the closure. When the error handlers are called within the function we use throws.

```swift
typealias MagicalOperation = () throws -> MagicalResult
func doSomethingMagical(magicalOperation: MagicalOperation) rethrows -> MagicalResult {
  return try magicalOperation()
}


```


//switching:


```swift
func retrieveFailureDetails(from error: ChangoSpellError) -> String {
 var details = ""

    switch error {
    case .hatMissingOrNotMagical:
        details = "Did you forget your hat, or does it need its batteries charged?"

    case .familiarAlreadyAToad:
        details = "Why are you trying to change a Toad into a Toad?"

    default: break
    }
    return details
}
```


//Advance custom error:


```swift
enum AppError: ErrorType, CustomStringConvertible {
    case DivisionError
    case NetworkError(code: Int)
    case UnexpectedError(message: String)
    case OtherNSError(nsError: NSError)

    var description: String {
        switch self {
        ...
        }
    }
}
do {
    ...
} catch UnboxError.MissingKey(let key) {
    // Specific error case of a MissingKey
    print("Missing Key", key)
} catch let error as UnboxError {
    // Catch all other UnboxError
    // Because UnboxError conforms to CustomStringConvertible, we can print `description`
    print(error.description)
} catch let error as NSError {
    // Warning: Cast to NSError (details will be lost). Not recommended.
    print(error.localizedDescription)
}
```

## RuntimeError:

```swift
throw NSError.init(domain: "unable to convert string to data", code: 0)
```

```swift
struct RuntimeError: LocalizedError
{
    let message: String

    init(_ message: String)
    {
        self.message = message
    }

    public var errorDescription: String?
    {
        return message
    }
}
```
