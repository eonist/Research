My notes on masking UIView<!--more-->

### Masking with CAShapeLayer

```swift
/**
 * Creates and applies mask to view
 */
func createMaskLayer() -> CAShapeLayer{
  let maskLayer = CAShapeLayer()
  let path = UIBezierPath.init(roundedRect: self.frame, cornerRadius: 24)
  maskLayer.path = path.cgPath
  self.layer.mask = maskLayer//applies the mask to the view
  return maskLayer
}
```
