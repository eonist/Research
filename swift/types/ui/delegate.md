###  What is the difference Delegates and Callbacks ?

The difference between delegates and callbacks is that with delegates, the NetworkService is telling the delegate “There is something changed.” With callbacks, the delegate is observing the NetworkService.

Example of delegate in Swift (you could also grab vc from view, simpler)

```swift
protocol MyDelegate: class {
   func onButtonTapped()
}
class MyViewController: UIViewController, MyDelegate {
  var myView: MyView!
  override func viewDidLoad() {
       super.viewDidLoad()
       myView.delegate = self
  }
  func onButtonTapped() {
        let nextViewController = NextVC()
        navigationController?.pushViewController(nextViewController, animated: false)
     }
}
class MyView: UIView {
   weak var delegate: MyDelegate?
   let button = UIButton()
   button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
  func buttonTapped(){
     self.delegate?.onButtonTapped()
  }
}
```
