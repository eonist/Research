

### UIImageview Programmatically in swift
```swift
var imageViewObject :UIImageView
imageViewObject = UIImageView(frame:CGRectMake(0, 0, 100, 100));
imageViewObject.image = UIImage(named:"imageName.png")
self.view.addSubview(imageViewObject)

imageViewObject.contentMode = UIViewContentMode.ScaleToFill
//imageViewObject.contentMode = UIViewContentMode.ScaleAspectFit
//imageViewObject.contentMode = UIViewContentMode.ScaleAspectFill
```
