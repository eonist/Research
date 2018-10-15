## example
```swift
class Testing {
    
    var timer:NSTimer?
    func test(){
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "tester:", userInfo: somethingToPass, repeats: false)
    }
    
    func tester(timer: NSTimer){
        let theStringToPrint = timer.userInfo as! String
        print(theStringToPrint)
    }
}
```




## another one:
```swift
NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: "onFlip", userInfo: nil, repeats: false)
```


## stop:
timer.invalidate()


## Adding user info:

```swift
var timer: NSTimer?

startTimer() {
    timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self,
                    selector: "event:", userInfo: ["custom":"data"], repeats: true)
    }
}

func event(timer: NSTimer!) {        
    let info = timer.userInfo
    // work with custom data        
}
```

## Side notes:

You should probably assert if thetimer is nil before starting a timer if its not nil then invalidate it

## Resources:

perform_selector in swift: (this can be used to call methods/functions by a string)
https://github.com/tokorom/performSelector-swift

