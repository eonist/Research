### Calculating how much time something takes:

```swift
let startTime = NSDate()
//do some intensive cpu stuff here
Swift.print("Time: " + "\(abs(startTime.timeIntervalSinceNow))")
```