

### UISegmentedControl
```swift
var customSegmentedControl = UISegmentedControl (items: ["one","two","three"])
customSegmentedControl.frame = CGRectMake(60, 250,200, 30)
customSegmentedControl.selectedSegmentIndex = 1
customSegmentedControl.tintColor = UIColor.redColor()
customSegmentedControl.addTarget(self, action: "segmentedValueChanged:", forControlEvents: .ValueChanged)
self.view.addSubview(customSegmentedControl)

func segmentedValueChanged(sender:UISegmentedControl!)
{
println("It Works, Value is --&gt;\(sender.selectedSegmentIndex)")
}
```
from: http://www.apptuitions.com/programmatically-creating-uistepper-and-uisegmentedcontrol-using-swift/
