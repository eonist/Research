
### UIStepper
```swift
var customStepper = UIStepper (frame:CGRectMake(110, 250, 0, 0))
customStepper.wraps = true
customStepper.autorepeat = true
customStepper.maximumValue = 10
customStepper.addTarget(self, action: "stepperValueChanged:", forControlEvents: .ValueChanged)
self.view.addSubview(customStepper)

func stepperValueChanged(sender:UIStepper!)
{
println("It Works, Value is --&gt;\(Int(sender.value).description)")
}
```
