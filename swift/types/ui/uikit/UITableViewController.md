boilerplate TableViewController code:

```swift
/**
 * ⚠️️ Don't forget to add "Cell" to the StoryBoard cell reuse identifier
 */
class TableViewController:UITableViewController{
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
