### Startkit 

Remember to remove MainStoryBoard, ViewController and MainStoryBoard from info.plist

```swift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
     self.window = {
             let window = UIWindow(frame: UIScreen.main.bounds)
             let mainVC = UIViewController()
             self.navigationController = UINavigationController(rootViewController: mainVC)
             //UINavigationController(rootViewController: PickFlavorViewController.instanceFromStoryboard())
             window.rootViewController = navigationController
             window.makeKeyAndVisible()//since we have no Main storyboard
             return window
         }()
    return true
  }
}
```

### With out NavVC

Remember to remove MainStoryBoard, ViewController and MainStoryBoard from info.plist

```swift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = {
            let window = UIWindow(frame: UIScreen.main.bounds)
            let vc = MainVC()
            window.rootViewController = vc
            window.makeKeyAndVisible()/*since we have no Main storyboard*/
            return window
        }()
        return true
    }
    func applicationWillResignActive(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) { }
    func applicationWillEnterForeground(_ application: UIApplication) { }
    func applicationDidBecomeActive(_ application: UIApplication) { }
    func applicationWillTerminate(_ application: UIApplication) { }
}
/**
 * Main view controller
 */
class MainVC :UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view = MainView()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
}
/**
 * Main view
 */
class MainView:UIView{}


```