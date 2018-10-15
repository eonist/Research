
## Passing Data through View Controllers with Swift without Using Storyboard

 ```swift
class UberWebviewController : UIViewController {

    var dataFromAPI : [Any]

    init(data someData : [Any]) {
        self.dataFromAPI = someData
        super.init(nibName: nil, bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


let viewController = UberWebviewController(data: whateverYourDataIs)
self.navigationController?.presentViewController(viewController, animated: true, completion: nil)

 ```
 from : http://stackoverflow.com/questions/27047904/passing-data-through-view-controllers-with-swift-without-using-storyboard

 http://stackoverflow.com/questions/31813942/swift-programmatically-navigate-to-viewcontroller-and-pass-data
