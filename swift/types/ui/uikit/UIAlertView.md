### UIAlertView
DEPRECATED now use: UIAlertController
```swift
import UIKit
class ViewController: UIViewController{
     override func viewDidLoad(){
          super.viewDidLoad()
          var alertView = UIAlertView()
          alertView.title = "messageTitle"
          alertView.message = "are you true to delete this item?"
          alertView.addButtonWithTitle("Cancel")
          alertView.addButtonWithTitle("Ok")
          alertView.cancelButtonIndex = 0
          alertView.delegate = self
          alertView.show()
     }

     func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int){
          if buttonIndex == alertView.cancelButtonIndex {
               print("you clicked cannel button")
          } else{
               print("you clicked Ok button")
          }
     }
}
```
## Alert that can return (untested)
```swift

 var doneloop = false

 let alert = UIAlertController(title:"Title", message: "Message", preferredStyle: UIAlertControllerStyle.alert)

 let action1 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
 (action: UIAlertAction!) in
    print("push OK button")

    doneloop = true // Runloop flag
 })

 alert.addAction(action1)

 self.present(alert, animated: false, completion: nil)

 while !doneloop {
    RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
 }

 alert.dismiss(animated: false, completion: nil)
```
