
### Modal dismiss segue:
* https://stackoverflow.com/questions/9382099/ios-storyboarding-dismissing-a-modal
* This makes it possible to dismiss a modal view
* EXAMPLE: CTRL drag a link from a button in the modal back to where you want to go



```swift
/**
 * Segues (Basically transition to detail mode)
 */
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    Swift.print("sender:  \(String(describing: sender))")
    Swift.print("transition to: \(String(describing: segue.identifier))")
    if segue.identifier == "showWalletType" {
        if let indexPath = tableView.indexPathForSelectedRow {
            Swift.print("indexPath:  \(indexPath)")
            //                let object:WatchListItem.ItemType = WalletTypeTableController.listItems[indexPath.row] //TODO: ⚠️️ make this a guard
            //                Swift.print("object:  \(object)")
            Swift.print("segue.destination:  \(segue.destination)")

            if let controller:WalletTypeTableController = (segue.destination as? WalletTypeTableController){
                if let idx:Int = WalletTypeTableController.listItems.index(of: watchListItemType){
                    controller.indexNumber = idx
                }
            }

            Swift.print("segue complete")
        }
    }
}
```

```swift
@IBAction func unwindToWatchListItemMethod(segue: UIStoryboardSegue) {
    Swift.print("Unwind 🎉")
    Swift.print("transition to: \(String(describing: segue.identifier))")
    if segue.identifier == "unwindToWatchListItem" {
        Swift.print("segue.destination:  \(segue.destination)")
        Swift.print("segue.source:  \(segue.source)")
        let watchListView:WalletTypeTableController = segue.source as! WalletTypeTableController
        Swift.print("watchListView:  \(watchListView)")
        if let indexPath = watchListView.tableView.indexPathForSelectedRow {
            Swift.print("indexPath:  \(indexPath)")
            self.watchListItemType = WalletTypeTableController.listItems[indexPath.row]/*sets the data in the next view*/
            Swift.print("segue complete")
        }
    }else if segue.identifier == "unwindFromScan" {
        let scanViewController:ScanViewController = segue.source as! ScanViewController
        if let qrLabel:UILabel = scanViewController.qrLabel, let address:String = qrLabel.text{
            addressTextField?.text = address//set address to the address from scan. TODO: Do some assertion etc
        }
    }
}

```

```swift
/**
 * rewind to prev view:
 */
override func willMove(toParentViewController parent: UIViewController?) {
    super.willMove(toParentViewController:parent)
    Swift.print("willMove: \(String(describing: parent))")
    if parent == nil {
        if let index = detailItem?.index {
            Swift.print("index:  \(index)")
            let titleText:String = titleTextField!.text!
            let addressText:String = addressTextField!.text!
            let newItem = WatchListItem.init(type: watchListItemType, title:titleText , address: addressText)
            Swift.print("newItem:  \(newItem)")
            WatchListManagerViewController.listItems[index] = newItem//set the new data to the arr
        }
    }
}
```


//programatically 

```swift
//go to
@IBAction func segueToPushViewController(_ sender: UIButton) {
   self.navigationController?.pushViewController(destinationViewController, animated: true)
}
//go back
@IBAction func goBackToOriginViewController(_ sender: UIButton) {
   self.navigationController?.popViewController(animated: true)
}
```


```swift

```