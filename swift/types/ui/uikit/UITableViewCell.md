extension UITableViewCell {
   static var identifier: String {
       return String(describing: self)
   }
}

let cell = tableView.dequeueReusableCell(withIdentifier: ExampleTableViewCell.identifier)
tableView.register(ExampleTableViewCell.self, forCellReuseIdentifier: ExampleTableViewCell.identifier)

print(ExampleTableViewCell.identifier) //ExampleTableViewCell
