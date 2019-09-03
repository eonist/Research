
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

## Bottom sheet:

```swift
let alertController = UIAlertController(title: nil, message: "Prefrences", preferredStyle: .actionSheet)

let defaultAction = UIAlertAction(title: "Edit playlist", style: .default, handler: { (alert: UIAlertAction!) -> Void in
   Swift.print("Do some action here.")
})

let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (alert: UIAlertAction!) -> Void in
   Swift.print("Do some destructive action here.")
})

let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (alert: UIAlertAction!) -> Void in
   Swift.print("Do something here upon cancellation.")
})

alertController.addAction(defaultAction)
alertController.addAction(deleteAction)
alertController.addAction(cancelAction)

//      if let popoverController = alertController.popoverPresentationController {
//         popoverController.barButtonItem = sender as? UIBarButtonItem
//      }

self.parentViewController?.present(alertController, animated: true, completion: nil)
```
