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
