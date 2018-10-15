### hack to get: extensionprivate

```swift
//Temp.swift
Temp{
   private var test = "🦄"
   public func doTest(){return test}
}
extension Temp{
   public var _test:String {get{return test}set{test = newValue}}
}
//Temp+Extension.swift
extension {
   func changePrivVar(){
      _test = "🎈"
   }
}

let temp = Temp()
temp.doTest()//🦄
temp.changePrivVar()
temp.doTest()//🎈
```
