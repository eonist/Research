https://medium.com/swift-india/uialertcontroller-in-swift-22f3c5b1dd68


### With input-textField

```swift
let alert = UIAlertController(title: "Rename playlist", message: "\(playlistId)", preferredStyle: .alert) // prompt a dialog with input field
alert.addTextField { textField in
   textField.text = "\(self.playlistId)"
}
let action = UIAlertAction(title: "OK", style: .default) { [weak alert] _ in
   let textField = alert!.textFields![0]
   print("New playlist name: \(String(describing: textField.text))")
}
alert.addAction(action)
self.parentViewController?.present(alert, animated: true, completion: nil)
```

### Simple:

```swift
with(UIAlertController(title: nil, message: "Prefrences", preferredStyle: .actionSheet)) {
   let defaultAction = UIAlertAction(title: "Edit playlist", style: .default) { [weak self] (_ alert: UIAlertAction!) -> Void  in
      Swift.print("Go to edit playlist")
      self?.showDetail()
   }
   let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_ alert: UIAlertAction!) -> Void in
      Swift.print("Cancel, do nothing")
   }
   $0.addAction(defaultAction)
   $0.addAction(cancelAction)
   self.parentViewController?.present($0, animated: true, completion: nil)
}
```

## user input:

```swift
let alert = UIAlertController(title: "What's your name?", message: nil, preferredStyle: .alert)
alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

alert.addTextField(configurationHandler: { textField in
    textField.placeholder = "Input your name here..."
})

alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in

    if let name = alert.textFields?.first?.text {
        print("Your name: \(name)")
    }
}))

self.present(alert, animated: true)
```
