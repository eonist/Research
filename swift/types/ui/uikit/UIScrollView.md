### Example:

```swift
import UIKit

class ViewController: UIViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
      let customScrollView:CustomScrollView = .init(frame: UIScreen.main.bounds)
      self.view.backgroundColor = .yellow
      self.view.addSubview(customScrollView)
   }
}
/**
 * CustomScrollView
 */
class CustomScrollView:UIScrollView,UIScrollViewDelegate{
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .green
      Swift.print("init")
      let rect = UIView.init(frame: .init(origin: .zero, size: .init(width: 100, height: 1800)))
      rect.backgroundColor = .red
      self.addSubview(rect)
      self.delegate = self
      self.contentSize = rect.frame.size
      self.isScrollEnabled = true
   }
   func scrollViewDidScroll(_ scrollView: UIScrollView) {
      Swift.print("scrollViewDidScroll")
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}



```


### create scrollview programmatically in swift without outlet

link :http://stackoverflow.com/questions/28156911/create-scrollview-programmatically-in-swift-without-outlet


### UIScrollView
```swift
override func viewDidLoad(){
        super.viewDidLoad()
        var scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        var imageView = UIImageView(image:UIImage(name:"imgName"))
        scrollView.contentSize = imageView.bounds.size
        scrollView.addSubview(imageView)
        self.view.addSubview(scrollView)

        // zoom
        scrollView.minimumZoomScale = 0.1
        scrollView.maximunZoomScale = 3
        scrollView.delegate = self
}

//UIscrollViewDelegate
func viewForZoomingInScrollView(scrollView:UIScrollView!) -> UIView!{
        for subview:AnyObject in scrollView.subviews{
                if subview.isKindOfClass(UIImageView){
                        return subview as UIView
                }
        }
        return nil
}

```
