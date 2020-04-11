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
