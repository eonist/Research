
### UIActionSheet
```swift
import UIKit

class ViewController:UIViewController,UIActionSheetDelegate{
        override func viewDidLoad(){
                super.viewDidLoad()
                var actionSheet = UIActionSheet()
                // actionSheet.title = "the title"
                actionSheet.addButtonWithTitle("cannel")
                actionSheet.addButtonWithTitle("action 1")
                actionSheet.addButtonWithTitle("action 2")
                actionSheet.cannelButtonIndex = 0
                actionSheet.delegate = self
                actionSheet.showInView(self.view)
        }

        func actionsheet(actionSheet:UIActionSheet!,clickedButtonAtIndex buttonIndex:Int){
                printInt("you clicked:"+actionSheet.buttonTitleAtIndex(buttonIndex))
        }
}
```
