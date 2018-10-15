### UISlider
```swift
var sliderDemo = UISlider(frame:CGRectMake(20, 260, 280, 20))
sliderDemo.minimumValue = 0
sliderDemo.maximumValue = 100
sliderDemo.continuous = true
sliderDemo.tintColor = UIColor.redColor()
sliderDemo.value = 50
sliderDemo.addTarget(self, action: "sliderValueDidChange:", forControlEvents: .ValueChanged)
self.view.addSubview(sliderDemo)

func sliderValueDidChange(sender:UISlider!)
{
println("value--\(sender.value)")
}
```
