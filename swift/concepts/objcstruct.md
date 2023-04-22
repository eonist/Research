### 54 Make struct adher to objc

The second option is to use the @objcMembers attribute on your whole class or struct, like this:

@objcMembers class SomeStruct: UIViewController {
    // code
}
