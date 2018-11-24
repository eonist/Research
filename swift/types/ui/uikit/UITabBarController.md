## Add a tabbar programmatically in UITabBarController with swift

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
   // Override point for customization after application launch.
   self.window = UIWindow(frame: UIScreen.main.bounds)

   let nav1 = UINavigationController()
   let first = FirstViewController(nibName: nil, bundle: nil)
   nav1.viewControllers = [first]

   let second = SecondViewController(nibName: nil, bundle: nil)
   let nav2 = UINavigationController()
   nav2.viewControllers = [second]

   let tabBar = UITabBarController()
   tabBar.tabBar.tintColor = .purple
   tabBar.viewControllers = [nav1, nav2]

   first.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
   second.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
//      tabBar.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)

   self.window?.rootViewController = tabBar
   self.window?.makeKeyAndVisible()

   return true
}
class FirstViewController:UIViewController{
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .orange
   }
}
class SecondViewController:UIViewController{
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .green
   }
}
```
