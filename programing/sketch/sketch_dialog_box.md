## Show message (in document):

```javascript
var doc = context.document;
doc.showMessage(layer.name());
```

## Show a dialog box with 1 button:

```javascript
var app = NSApplication.sharedApplication();
app.displayDialog_withTitle('hey', 'testing');
log('hello');
```

## Show a dialog box with 2 buttons:
```Javascript
var app = NSApplication.sharedApplication();
app.displayDialog_withTitle('let\'s go baby 💪', 'Awesome 🤗'); // were awesome is the title
log('hello');
```

## Show open files dialog box:

```javascript
var openDlg = [NSOpenPanel openPanel];
[openDlg setCanChooseFiles:1];
[openDlg setAllowsMultipleSelection:0];
[openDlg setCanChooseDirectories:0];
if ( [openDlg runModalForDirectory:nil file:nil] == NSOKButton ){
  var files = [openDlg filenames];
  log(files[0]); // /Users/eon/Desktop/swish_todo.md
}
```

## Show open folder dialog box:

```javascript
var openDlg = [NSOpenPanel openPanel];
[openDlg setCanChooseFiles:1];
[openDlg setAllowsMultipleSelection:0];
[openDlg setCanChooseDirectories:1];
openPanel.setDirectoryURL(NSURL.fileURLWithPath('~/Documents/'))
if ( [openDlg runModalForDirectory:nil file:nil] == NSOKButton ){
  var files = [openDlg filenames];
  log(files[0]); // /Users/eon/Desktop/_tempDel/HCCQR-iOS-app
}
```
**Alternatively**

```javascript
var openPanel = NSOpenPanel.openPanel()
openPanel.setCanChooseDirectories(false)
openPanel.setCanChooseFiles(true)
openPanel.setCanCreateDirectories(false)
openPanel.setDirectoryURL(NSURL.fileURLWithPath('~/Documents/'))

openPanel.setTitle('Choose a file')
openPanel.setPrompt('Choose')
openPanel.runModal()
```

## Alert

```javascript
function alert(title, message){
  var app = [NSApplication sharedApplication];
  [app displayDialog:message withTitle:title];
}
alert("John", "Doe")
```

## Combo-box prompt:

```javascript
function createSelect(msg, items, selectedItemIndex) {
	var selectedItemIndex = selectedItemIndex || 0
	var accessory = NSComboBox.alloc().initWithFrame(NSMakeRect(0,0,200,25))
	//accessory.addItemsWithObjectValues(items)
	//accessory.selectItemAtIndex(selectedItemIndex)
	var alert = NSAlert.alloc().init()
	alert.setMessageText(msg)
	alert.addButtonWithTitle('OK')
	alert.addButtonWithTitle('Cancel')
	alert.setAccessoryView(accessory)
	var responseCode = alert.runModal()
	return [responseCode, sel]
}
createSelect("Hello",{"a","b","c"},1) // ,2
```


  selectedItemIndex = selectedItemIndex || 0

  var accessory = NSComboBox.alloc().initWithFrame(NSMakeRect(0,0,200,25))
  accessory.addItemsWithObjectValues(items)
  accessory.selectItemAtIndex(selectedItemIndex)

  var alert = NSAlert.alloc().init()
  alert.setMessageText(msg)
  alert.addButtonWithTitle('OK')
  alert.addButtonWithTitle('Cancel')
  alert.setAccessoryView(accessory)

  var responseCode = alert.runModal()
  var sel = accessory.indexOfSelectedItem()
