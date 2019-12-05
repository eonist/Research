```swift
/*
 * IMPORTANT: ⚠️️ gradient.colors is of type any, so remember to do UIColor.green.cgColor
 */
class View: UIView{
	lazy var gradientLayer: CAGradientLayer = {
      let layer = CAGradientLayer()
      layer.colors = [
         UIColor.red.cgColor,
         UIColor.green.cgColor
      ]
      return layer
   }()
   override init(frame: CGRect) {
      Swift.print("CardView.init")
      super.init(frame: frame)
      self.backgroundColor = .gray
      self.layer.addSublayer(gradientLayer)//view.layer.insertSublayer(gradient, at: 0)
      gradientLayer.frame = CGRect.init(x: 12, y: 12, width: self.frame.width-24, height: self.frame.height-24)
      gradientLayer.cornerRadius = 24
   }
}
```
