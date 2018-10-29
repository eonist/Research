##### Compact AppDelegate for iOS
```swift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   var window: UIWindow?
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {return true}
   func applicationWillResignActive(_ application: UIApplication) {}
   func applicationDidEnterBackground(_ application: UIApplication) {}
   func applicationWillEnterForeground(_ application: UIApplication) {}
   func applicationDidBecomeActive(_ application: UIApplication) {}
   func applicationWillTerminate(_ application: UIApplication) {}
}
```

### Notes on AppDelegate

What are the most important application delegate methods a developer should handle ?

The operating system calls specific methods within the application delegate to facilitate transitioning to and from various states. The seven most important application delegate methods a developer should handle are:

**application:willFinishLaunchingWithOptions**
Method called when the launch process is initiated. This is the first opportunity to execute any code within the app.

**application:didFinishLaunchingWithOptions**
Method called when the launch process is nearly complete. Since this method is called is before any of the app’s windows are displayed, it is the last opportunity to prepare the interface and make any final adjustments.

**applicationDidBecomeActive**
Once the application has become active, the application delegate will receive a callback notification message via the method applicationDidBecomeActive.

This method is also called each time the app returns to an active state from a previous switch to inactive from a resulting phone call or SMS.

**applicationWillResignActive**
There are several conditions that will spawn the applicationWillResignActive method. Each time a temporary event, such as a phone call, happens this method gets called. It is also important to note that “quitting” an iOS app does not terminate the processes, but rather moves the app to the background.

**applicationDidEnterBackground**
This method is called when an iOS app is running, but no longer in the foreground. In other words, the user interface is not currently being displayed. According to Apple’s UIApplicationDelegate Protocol Reference, the app has approximately five seconds to perform tasks and return. If the method does not return within five seconds, the application is terminated.

**applicationWillEnterForeground**
This method is called as an app is preparing to move from the background to the foreground. The app, however, is not moved into an active state without the applicationDidBecomeActive method being called. This method gives a developer the opportunity to re-establish the settings of the previous running state before the app becomes active.

**applicationWillTerminate**
This method notifies your application delegate when a termination event has been triggered. Hitting the home button no longer quits the application. Force quitting the iOS app, or shutting down the device triggers the applicationWillTerminate method. This is the opportunity to save the application configuration, settings, and user preferences.
