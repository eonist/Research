### Simple button:   

```swift
let btn: UIButton = UIButton(type: .system)
btn.backgroundColor = .gray
btn.setTitle("Button", for: .normal)
btn.setTitleColor(.black, for: .normal)
btn.titleLabel?.textAlignment = .center
btn.titleLabel?.font =  .systemFont(ofSize: 12)
btn.frame = CGRect(x:100, y:50, width:100, height:50)
btn.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
self.view.addSubview(btn)

@objc func buttonTouched(sender:UIButton) {
    Swift.print("It Works!!!")
}
```

### Programatic toggle button

```swift
class RecordButton: UIButton {
    var toggle: Bool = false
    var onToggle:(_ toggle:Bool)->Void = { toggle in Swift.print("onToggle: \(toggle)")}
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        self.setTitle("Record", for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font =  .systemFont(ofSize: 12)
        let bottomCenter:CGPoint = {
            let rect = UIScreen.main.bounds
            return CGPoint.init(x: rect.midX, y: rect.height - 50 - 20)
        }()
        self.frame = CGRect(x:bottomCenter.x, y:bottomCenter.y, width:100, height:100)
        self.layer.cornerRadius = 50
        self.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
    }
    @objc func buttonTouched(sender:UIButton) {
        Swift.print("It Works!!!")
        toggle = !toggle
        if toggle {
            self.backgroundColor = .red//recording
        }else {
            self.backgroundColor = .green//idle
        }
        onToggle(toggle)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

```


### Using overriding:


```swift
/**
 * let customButton: CustomButton = CustomButton.init(frame:CGRect.init(x:0,y:0,width:120,height:40))
 * addSubview(customButton)
 * customButton.tapUpInsideCallBack = {
 *    Swift.print("🎉")
 * }
 * TODO: Add onTapDownInside method
 */
class CustomButton: UIView {
   var tapUpInsideCallBack: TapUpInsideCallBack = defaultTapUpInside
   override init(frame: CGRect) {
      super.init(frame: frame)
      backgroundColor = .purple//Debug
      userInteractionEnabled = true/*⚠️️ might be needed ? */
   }
   /**
    * On tap down inside
    */
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       if let touch = touches.first, touch.view == imageView {
          /*touch began*/
       }
       super.touchesBegan(touches, withEvent:event)
    }
    /**
     * On tap up inside
     */
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
       if let touch = touches.first, touch.view == imageView{
          /*touch ended*/
          onTapUpInside()
       }
       super.touchesEnded(touches, withEvent: event)
    }
}
extension CustomButton{
   typealias TapUpInsideCallBack = () -> Void
   static let defaultTapUpInside: TapUpInsideCallBack = {Swift.print("default \(CustomButton.self).onTapUpInside")}
}
```


### UIButton
```swift
let dunamicButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
dunamicButton.backgroundColor = UIColor.greenColor()
dunamicButton.setTitle("Button", forState: UIControlState.Normal)
dunamicButton.frame = CGRectMake(100, 100, 100, 50)
dunamicButton.addTarget(self, action: "buttonTouched:", forControlEvents: UIControlEvents.TouchUpInside)
self.view.addSubview(dunamicButton)

func buttonTouched(sender:UIButton!) {
   print("It Works!!!")
}
```
link: http://stackoverflow.com/questions/24030348/how-to-create-a-button-programmatically
http://stackoverflow.com/questions/24102191/make-a-uibutton-programatically-in-swift
