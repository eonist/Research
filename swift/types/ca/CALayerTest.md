//this is good: http://www.raywenderlich.com/90488/calayer-in-ios-with-swift-10-examples

CALayer
```swift
class CardView:UIView{
   lazy var topBar:TopBar = createTopBar()
   let bgLayer: CALayer = {
      let layer = CALayer()
      layer.backgroundColor = UIColor.green.cgColor
      return layer
   }()
   override init(frame: CGRect) {
      Swift.print("CardView.init")
      super.init(frame: frame)
      self.backgroundColor = .gray
      self.layer.addSublayer(bgLayer)
      bgLayer.frame = CGRect.init(x: 12, y: 12, width: self.frame.width-24, height: self.frame.height-24)
      bgLayer.cornerRadius = 24
      //_ = topBar
   }
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
```


**Properties of CALayer:**

```objc
class CALayer: NSObject {
    var bounds: CGRect
    var position: CGPoint
    var zPosition: CGFloat
    var frame: CGRect

    var opacity: CGFloat
    var hidden: Bool
    var mask: CALayer!
    var borderWidth: CGFloat
    var borderColor: CGColor!
    var cornerRadius: CGFloat
    var shadowOpacity: CGFloat
    var shadowRadius: CGFloat
	 var shadowOffset: CGSize
    var shadowColor: CGColor!

    var actions: [NSObject : AnyObject]!  // Defaults to nil!
    var delegate: AnyObject! // NSObject (CALayerDelegate)

```

**Draw an image in an calayer:**

```objc
CALayer *sublayer = [CALayer layer];
sublayer.backgroundColor = [UIColor blueColor].CGColor;
sublayer.shadowOffset = CGSizeMake(0, 3);
sublayer.shadowRadius = 5.0;
sublayer.shadowColor = [UIColor blackColor].CGColor;
sublayer.shadowOpacity = 0.8;
sublayer.frame = CGRectMake(30, 30, 128, 192);
sublayer.borderColor = [UIColor blackColor].CGColor;
sublayer.borderWidth = 2.0;
sublayer.cornerRadius = 10.0;
[self.view.layer addSublayer:sublayer];

CALayer *imageLayer = [CALayer layer];
imageLayer.frame = sublayer.bounds;
imageLayer.cornerRadius = 10.0;
imageLayer.contents = (id) [UIImage imageNamed:@"BattleMapSplashScreen.jpg"].CGImage;
imageLayer.masksToBounds = YES;
[sublayer addSublayer:imageLayer];

```



//more in the COcoa book from big nerd ranch
//TextLayer:

```swift
let textContainer = CALayer()
textContainer.anchorPoint = CGPoint.zeroPoint
textContainer.zPosition = 100
textContainer.backgroundColor = NSColor.blackColor().CGColor
textContainer.borderColor = NSColor.whiteColor().CGColor
textContainer.borderWidth = 2
textContainer.cornerRadius = 15
textContainer.shadowOpacity = 0.5
view.layer!.addSublayer(textContainer)

let textLayer = CATextLayer()
textLayer.anchorPoint = CGPoint.zeroPoint
textLayer.position = CGPointMake(10, 6)
textLayer.zPosition = 100
textLayer.fontSize = 24
textLayer.foregroundColor = NSColor.whiteColor().CGColor
self.textLayer = textLayer”

textContainer.addSublayer(textLayer)

```


```swift
// Sketch Shadow

extension CALayer {
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}

layer.applySketchShadow()
layer.applySketchShadow(color: .red, alpha: 0.6, x: 0, y: 4, blur: 8, spread: -4)
```
