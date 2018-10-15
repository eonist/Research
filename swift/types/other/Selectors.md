Selectors are usually used when using NSTimer etc (there is an overview of all apple methods that uses a selector somewhere in your docs)

selectors can be used to check if a method exists:
```swift
class Worker : NSObject{
    func work() {Swift.print("work") }
    func eat(food: AnyObject) { }
    func sleep(hours: Int, minutes: Int) { }
}

let worker = Worker()
let canWork = worker.respondsToSelector(Selector("work"))
```

If you need to make a protocol with a variable that is a Selector do this:  

```swift
protocol IEventSender {
    var event: ((event:Event) -> ())?{get set}
}
class EventSender:IEventSender {
    var event: ((event:Event) -> ())?/*this holds any method assigned to it that has its type*/
}
```

NOTE: also see closures.md