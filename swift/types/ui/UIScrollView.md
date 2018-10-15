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
