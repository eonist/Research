
### Creating a navigationController programatically (Swift)
```swift
self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
var nav1 = UINavigationController()
var mainView = ViewController(nibName: nil, bundle: nil) //ViewController = Name of your controller
nav1.viewControllers = [mainView]
self.window!.rootViewController = nav1
self.window?.makeKeyAndVisible()
```
link:

http://stackoverflow.com/questions/28793331/creating-a-navigationcontroller-programatically-swift
http://stackoverflow.com/questions/22981610/programatically-creating-uinavigationcontroller-in-ios
