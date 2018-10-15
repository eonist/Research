import AngleGradientLayer

class MyView: UIView {

    override class func layerClass() -> AnyClass {
        return AngleGradientLayer.self
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        let l: AngleGradientLayer = self.layer as! AngleGradientLayer
        l.colors = [
            UIColor(red: 0, green: 0, blue: 0.5, alpha: 1).CGColor,
            UIColor(red: 1, green: 1, blue: 0.4, alpha: 1).CGColor]
    }
}