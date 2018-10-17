class View:UIView{
	let gradientLayer: CAGradientLayer = {
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
      self.layer.addSublayer(gradientLayer)
      gradientLayer.frame = CGRect.init(x: 12, y: 12, width: self.frame.width-24, height: self.frame.height-24)
      gradientLayer.cornerRadius = 24
      //_ = topBar
   }
}
