### Simple tap gesture in iOS

```swift
class View: UIView {
   init(frame: CGRect) {
      let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
      self.isUserInteractionEnabled = true
      self.addGestureRecognizer(tapGestureRecognizer)
   }
   /**
    * On single tap
    */
   @objc func handleTapGesture(gestureRecognizer: UITapGestureRecognizer) {
      Swift.print("tap")
   }
}
```
