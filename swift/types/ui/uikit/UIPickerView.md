```swift
private func embedButtons(_ toolbar: UIToolbar) {
    func setupLabelBarButtonItem() -> UIBarButtonItem {
        let label = UILabel()
        label.text = "Set Alarm Time"
        label.textColor = .white
        return UIBarButtonItem(customView: label)
    }

    let todayButton = UIBarButtonItem(title: "Today", style: .plain, target: self, action: #selector(self.todayPressed(_:)))

    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.donePressed(_:)))

    let flexButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)

    toolbar.setItems([todayButton, flexButton, setupLabelBarButtonItem(), flexButton, doneButton], animated: true)
}
```

```swift
let picker = UIPickerView()
picker.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(picker)

picker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
picker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
picker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

// UIPickerViewDataSource and UIPickerViewDelegate

func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 2
}

func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if component == 0 {
        return 10
    } else {
        return 100
    }
}

func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if component == 0 {
        return "First \(row)"
    } else {
        return "Second \(row)"
    }
}
```

### Example:

```swift
let picker: UIPickerView
picker = UIPickerView(frame: CGRectMake(0, 200, view.frame.width, 300))
picker.backgroundColor = .whiteColor()

picker.showsSelectionIndicator = true
picker.delegate = self
picker.dataSource = self

let toolBar = UIToolbar()
toolBar.barStyle = UIBarStyle.default
toolBar.isTranslucent = true
toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
toolBar.sizeToFit()

let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self. donePicker))
let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self. donePicker))

toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
toolBar.userInteractionEnabled = true

textField1.inputView = picker
textField1.inputAccessoryView = toolBar

import Foundation
import UIKit

protocol ToolbarPickerViewDelegate: class {
    func didTapDone()
    func didTapCancel()
}

class ToolbarPickerView: UIPickerView {

    public private(set) var toolbar: UIToolbar?
    public weak var toolbarDelegate: ToolbarPickerViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    private func commonInit() {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelTapped))

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        self.toolbar = toolBar
    }

    @objc func doneTapped() {
        self.toolbarDelegate?.didTapDone()
    }

    @objc func cancelTapped() {
        self.toolbarDelegate?.didTapCancel()
    }
}

class MyViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    fileprivate let pickerView = ToolbarPickerView()
    fileprivate let titles = ["0", "1", "2", "3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.textField.inputView = self.pickerView
        self.textField.inputAccessoryView = self.pickerView.toolbar

        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.pickerView.toolbarDelegate = self

        self.pickerView.reloadAllComponents()
    }
}

extension MyViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.titles.count
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.titles[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textField.text = self.titles[row]
    }
}

extension MyViewController: ToolbarPickerViewDelegate {

    func didTapDone() {
        let row = self.pickerView.selectedRow(inComponent: 0)
        self.pickerView.selectRow(row, inComponent: 0, animated: false)
        self.textView.text = self.titles[row]
        self.textField.resignFirstResponder()
    }

    func didTapCancel() {
        self.textField.text = nil
        self.textField.resignFirstResponder()
    }
}
```


### Picker in the keyboard:

https://stackoverflow.com/a/52082204/5389500
