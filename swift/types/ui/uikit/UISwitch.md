### UISwitch
```swift
var switchDemo=UISwitch(frame:CGRectMake(150, 300, 0, 0));
switchDemo.on = true
switchDemo.setOn(true, animated: false);
switchDemo.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged);
self.view.addSubview(switchDemo);

func switchValueDidChange(sender:UISwitch!) {
  if (sender.on == true){
    println(“on”)
  }
  else {
    println(“off”)
  }
}
```
from :http://www.apptuitions.com/programmatically-creating-uiview-uislider-uiswitch-using-swift/
