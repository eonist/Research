boilerplate TableViewController code:

```swift
/**
 * ⚠️️ Don't forget to add "Cell" to the StoryBoard cell reuse identifier
 */
class TableViewController: UITableViewController {
    let list:[String] = ["red","blue","green"]

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
}

```

viewDidLoad is called once the view is fully loaded and can be used to do one-time initializations like the configuration of a number formatter, registering for notifications, or calls to API that only need to be done once.
viewWillAppear is called every time the view is about to appear on screen. In our application, it is called every time you select the Overview tab. This is a good point to update your UI or to refresh your data model.
viewDidAppear is called after the view appears on screen. Here you can start some fancy animations.
viewWillDisappear is called before the view disappears. Here you can stop your fancy animations you started in viewDidAppear.
viewDidDisappear is called after the view is no longer on the screen. Here you can discard everything you no longer need. For example, you could invalidate a timer you used to upate your data model on a periodic time base.


updateViewConstraints is called every time the layout changes, like when the window is resized.
viewWillLayout is called before the layout method of a view controller’s view is called. For example, you can use this method to adjust constraints.
viewDidLayout is called after layout is called.
