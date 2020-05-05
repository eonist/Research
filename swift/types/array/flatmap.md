### Flatmap + reduce

```swift
/**
 * Returns total height of all rows
 * - Important: ⚠️️ in the heightForRowAt class, don't use cellForRow, as the cell isn't made yet, probably shouldn't put cellForRow in that method anyways
 */
var totalRowHeight: CGFloat {
	(0..<self.numberOfSections).indices.flatMap { sectionIdx in
		(0..<self.numberOfRows(inSection: sectionIdx)).indices.map { rowIdx in
			self.tableView!(self, heightForRowAt: IndexPath.init(row: rowIdx, section: sectionIdx))
		}
	}.reduce(0, +)
}
```
