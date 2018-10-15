### UIAlertView
```swift
import UIKit
class ViewController:UIViewController{
        override func viewDidLoad(){
                super.viewDidLoad()
                var alertView = UIAlertView()
                alertView.title = "messageTitle"
                alertView.message = "are you true to delete this item?"
                alertView.addButtonWithTitle("Cannel")
                alertView.addButtonWithTitle("Ok")
                alertView.cannelButtonIndex = 0
                alertView.delegate = self
                alertView.show()
        }

        func alertView(alertView:UIAlertView,clickedButtonAtIndex buttonIndex:Int){
                if(buttonIndex==alertView.cannelButtonIndex){
                        printIn("you clicked cannel button")
                }else{
                        printInt("you clicked Ok button")
                }
        }
}
```
