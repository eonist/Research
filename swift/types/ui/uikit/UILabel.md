
### UILabel

```swift
var label: UILabel = UILabel()
label.backgroundColor = UIColor.orange
label.textColor = UIColor.black
label.textAlignment = .center
label.text = "test label"
self.addSubview(label)
return label
```

### with

```swift
with(.init()) {
// $0.backgroundColor = .orange
   $0.textColor = UIColor.black
   $0.textAlignment = .left
   $0.text = "test label"
   self.addSubview($0)
}
```
