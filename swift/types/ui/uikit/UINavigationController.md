
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


```swift
//transitioning views in from the left w/o navcontroller:
/*other options here -> https://stackoverflow.com/a/42627260/5389500*/
extension UIViewController {

    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)

        present(viewControllerToPresent, animated: false)
    }

    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)

        dismiss(animated: false)
    }
}
```
http://stackoverflow.com/questions/28793331/creating-a-navigationcontroller-programatically-swift
http://stackoverflow.com/questions/22981610/programatically-creating-uinavigationcontroller-in-ios
