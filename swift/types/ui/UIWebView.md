

### UIWebView
```swift
var webview=UIWebView(frame:CGRectMake(20, 240, 280, 310));
        var url = NSURL(string: "http://www.google.com");
        var request = NSURLRequest(URL: url);
        webview.scalesPageToFit=true;
        webview.loadRequest(request);
        self.view.addSubview(webview);
```
