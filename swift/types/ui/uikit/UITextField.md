### Basic UITextField

```swift
let textField = UITextField.init(frame: self.frame)
textField.text = "Testing"
addSubview(textField)
textField.textColor = .white
textField.textAlignment = .center
textField.font = .boldSystemFont(ofSize: 16)
```

### UITextField

```swift
var dynamicTxtField: UITextField = UITextField()
dynamicTxtField.frame = CGRectMake(50, 70, 200, 30)
dynamicTxtField.backgroundColor = UIColor.lightGrayColor()
self.view.addSubview(dynamicTxtField)
```
from:http://www.apptuitions.com/programmatically-creating-uibuttonuilabeluitextfield-using-swift/


### Adding UITextField on UIView Programmatically Swift

```swift
var textFiled = UITextField(frame: CGRectMake(20.0, 30.0, 100.0, 33.0))
textFiled.backgroundColor = UIColor.redColor()
textFiled.borderStyle = UITextBorderStyle.Line
self.view.addSubview(textFiled)
```
link: http://stackoverflow.com/questions/24710041/adding-uitextfield-on-uiview-programmatically-swift

### Adding left or right icon int he textfield
If you need to get fancy you can add a little view on the right or left of the text field. According to Apple, “You can use the left overlay view to indicate the intended behavior of the text field, You can use the right overlay view to provide indicate additional features available for the text field
