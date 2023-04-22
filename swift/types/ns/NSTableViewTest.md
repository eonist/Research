Video source:
There is an apple video about View based table view. its mentioned in session 217 44:14 Layerbacked views

// example of tableview with custom design? https://developer.apple.com/library/mac/samplecode/TableViewPlayground/TableViewPlayground.zip

//and this  🤷//http://stackoverflow.com/questions/4599747/programmatically-creating-an-nstableview-trouble-getting-the-nsheaderview-to-sh?rq=1

//apple ref: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSTableView_Class/


//https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Protocols/NSTableDataSource_Protocol/index.html#//apple_ref/occ/intfm/NSTableViewDataSource/tableView:objectValueForTableColumn:row:

//https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/TableView/Introduction/Introduction.html#//apple_ref/doc/uid/10000026i


```swift

/**
Drag and droping in NSViewTable: (Awesome)
https://www.youtube.com/watch?v=V0yLZnVFJjw

Row Groups:
Cocoa Programming L53 - Groups in NSTableView
*/




//Add the tableView(viewForTableColumn:row:) method to AppDelegate. This method returns an NSView that will appear in the table view cell, based on the row number and column used:
func test(){
	 func tableView(tableView: NSTableView!, viewForTableColumn tableColumn: NSTableColumn!, row: Int) -> NSView!  {
		 // recycle cell
        let cell = tableView.makeViewWithIdentifier(tableColumn.identifier, owner: self) as NSTableCellView

        let textField = cell.textField
        let song = self.songs[row]

        if tableColumn.identifier == "Title" {
            textField?.stringValue = song.title
			} else if tableColumn.identifier == "Duration" {
            let durationText = NSString(format: "%i:%02i",Int(song.duration) / 60,Int(song.duration) % 60)
            textField?.stringValue = durationText
        }
        return cell
    }


	 //Sorting:
	 /*
	 Sorting a Table View

		When you click a table view header, you’re indicating to the table view that it should re-sort the contents of the table. To do this, the table columns need to know what specific property they’re responsible for showing.
		This is implemented by providing sort keys to each of the columns. Sort keys indicate what property should be used for sorting.
		To add sort keys, select the “Title” table column in the outline. Open the Attributes Inspector and set the sort key to title. Leave the selector as compare: and the order as Ascending. Then, select the “Duration” table column in the outline, and change the sort key to duration.
		When a table column header is clicked, the table view’s data source receives a tableView(sortDescriptorsDidChange:) message. A sort descriptor is an instance of the NSSortDescriptor class, which provides information on how a collection of objects should be sorted.
		To sort an array using sort descriptors, you take the array, and use the sort method. This method takes a closure that it uses to work out how a pair of objects is ordered; you can simple take each sort descriptor, and use its compareObject(toObject:)”


	 */
	 //To implement the tableView(sortDescriptorsDidChange:) method, add the following method to AppDelegate:
    func tableView(tableView: NSTableView!,
                    sortDescriptorsDidChange oldDescriptors: [AnyObject]!)  {

        // Apply each sort descriptor, in reverse order

        for sortDescriptor in tableView.sortDescriptors.reverse()
            as [NSSortDescriptor] {
            songs.sort() {
                (item1, item2) in
                return sortDescriptor.compareObject(item1, toObject: item2)
                    == NSComparisonResult.OrderedAscending
            }
        }

        tableView.reloadData()
    }
}
```


### Custom selection background:

https://stackoverflow.com/questions/9463871/change-selection-color-on-view-based-nstableview

```swift
 class MyNSTableRowView: NSTableRowView {

     override func drawSelection(in dirtyRect: NSRect) {
         if self.selectionHighlightStyle != .none {
             let selectionRect = NSInsetRect(self.bounds, 2.5, 2.5)
             NSColor(calibratedWhite: 0.65, alpha: 1).setStroke()
             NSColor(calibratedWhite: 0.82, alpha: 1).setFill()
             let selectionPath = NSBezierPath.init(roundedRect: selectionRect, xRadius: 6, yRadius: 6)
             selectionPath.fill()
             selectionPath.stroke()
         }
     }
 }
// NSTableViewDelegate
 func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
    return MyNSTableRowView()
}
```
## Better custom selection code:

```swift
class AudioCellView: NSTableRowView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.white.cgColor
    }

    override var isEmphasized: Bool {
        set {}
        get {
            return false
        }
    }

    override var selectionHighlightStyle: NSTableView.SelectionHighlightStyle {
        set {}
        get {
            return .regular
        }
    }

    override func drawSelection(in dirtyRect: NSRect) {
        if self.selectionHighlightStyle != .none {
            let selectionRect = NSInsetRect(self.bounds, 2.5, 2.5)
            NSColor(calibratedWhite: 0.85, alpha: 0.6).setFill()
            let selectionPath = NSBezierPath.init(rect: selectionRect)
            selectionPath.fill()
        }
    }
}
```
