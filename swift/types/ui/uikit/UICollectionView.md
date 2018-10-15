collection view with different sized cells
https://www.raywenderlich.com/164608/uicollectionview-custom-layout-tutorial-pinterest-2



## Creating a UICollectionView programmatically
```swift
class TwoViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        var flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout();

        var __collectionView:UICollectionView? = UICollectionView(frame: CGRectMake(10, 10, 300, 400), collectionViewLayout: flowLayout);
        __collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell");
        __collectionView?.delegate = self;
        __collectionView?.dataSource = self;
        __collectionView?.backgroundColor = UIColor.cyanColor();

        self.view.addSubview(__collectionView!);
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 20;
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        var cell:UICollectionViewCell=collectionView.dequeueReusableCellWithReuseIdentifier("collectionCell", forIndexPath: indexPath) as UICollectionViewCell;

        cell.backgroundColor = UIColor.greenColor();
        return cell;
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSizeMake(50, 50);
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsetsMake(5, 5, 5, 5); //top,left,bottom,right
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
```

link: http://stackoverflow.com/questions/17856055/creating-a-uicollectionview-programmatically
      http://randexdev.com/2014/07/uicollectionview/
