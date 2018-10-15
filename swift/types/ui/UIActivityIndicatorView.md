

### Adding progress icon programmatically to a new UIView
```swift
 override func loadView() {
        super.loadView()

        var baseView = UIView()
        baseView.backgroundColor = UIColor(red: 13/255, green: 44/255, blue: 75/255, alpha: 1)
        self.view = baseView

        var progressIcon = UIActivityIndicatorView()
        progressIcon.setTranslatesAutoresizingMaskIntoConstraints(false)
        progressIcon.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        view.addSubview(progressIcon)
        progressIcon.startAnimating()

        var constraints = [NSLayoutConstraint]()
        constraints.append(NSLayoutConstraint(
            item: progressIcon,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: view,
            attribute: .CenterX,
            multiplier: 1,
            constant: 0)
        )
        constraints.append(NSLayoutConstraint(
            item: progressIcon,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: view,
            attribute: .CenterY,
            multiplier: 1,
            constant: 0)
        )

        view.addConstraints(constraints)

    }
```
link: https://coderwall.com/p/6onn0g/adding-progress-icon-programmatically-to-a-new-uiview
