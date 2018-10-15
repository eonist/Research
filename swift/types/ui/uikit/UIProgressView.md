
### UIProgressView
```swift
var progressView = UIProgressView(progressViewStyle:UIProgressViewStyle.Default)
progressView.center = self.view.center
progressView.progress = 0.5
self.view.addSubview(progressView)
progressView.setProgress(0.8,animated:true)
progressView.progressTintColor = UIColor.greenColor()
progressView.trackTintColor = UIColor.blueColor()
```
