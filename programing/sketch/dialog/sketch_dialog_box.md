## Show message (in document):
// has a lot of dialog box code: https://raw.githubusercontent.com/lewishowles/sketch-replace-colour/master/ReplaceColour.sketchplugin/Contents/Sketch/script.cocoascript

// source code for Alert: https://github.com/ccgus/CocoaScript/blob/master/src/framework/COSAlertWindow.m
```javascript
var doc = context.document;
doc.showMessage(layer.name());
```

## Super simple text input example:

```js
var selection = context.selection
var doc = context.document
var string = [doc askForUserInput:"Paste your string here:" initialValue:""];
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

## Show open folder dialog box: (🚫 Doesnt work)

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

## Read text from file: (works ✅)  

```javascript
//create panel for user to select file
var open = NSOpenPanel.openPanel();

open.setCanChooseDirectories(true);
open.setCanChooseFiles(true);
open.setCanCreateDirectories(true);
open.setTitle("Import a Color Palette");
open.setPrompt("Import Palette");
open.runModal();

//import the selected file and parse to JSON object
var filePath = open.URLs().firstObject().path();
var fileContents = NSString.stringWithContentsOfFile(filePath);
log("filePath: " + filePath); // filePath: /Users/eon/Desktop/Screenshot 2019-05-11 at 21.42.06.png
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
var responseCode = openPanel.runModal(
log("responseCode: " + responseCode)
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

## Dialog with Combobox:

```javascript
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
```


## Special path setter dialog:

```javascript
function createPanel(msg, default_path) {
  var openPanel;

  var okButton = NSButton.alloc().initWithFrame(NSMakeRect(0, 0, 100, 30));
  okButton.setTitle("Restore default");
  okButton.setCOSJSTargetFunction(function(sender) {
    NSApp.stopModal();
  });
  okButton.setBezelStyle(NSRoundedBezelStyle);

  openPanel = NSOpenPanel.openPanel();
  openPanel.setCanChooseDirectories(true);
  openPanel.setCanChooseFiles(false);
  openPanel.setCanCreateDirectories(true);
  if(default_path !== null)
    openPanel.setDirectoryURL(NSURL.fileURLWithPath(default_path));
  else
    openPanel.setDirectoryURL(NSURL.fileURLWithPath(NSHomeDirectory().stringByAppendingString("/Documents/")));

  openPanel.setPrompt("Set path");
  openPanel.setMessage(msg);
  openPanel.setAccessoryView(okButton);

  var responseCode = openPanel.runModal();
  var url = openPanel.URL().absoluteString();

  return {"responseCode":responseCode, "selection":url};
}

var choice = createPanel("hello world","~/Documents")

 switch(choice.responseCode) {
   case -1000:
     SketchReplaceImagesDefaults.clearDefaults();
     doc.showMessage("Restored default.");
     break;
   case 1:
     if(choice.selection.length() < 1) {
      present_error(doc);
      return;
     }

     var relativePath = choice.selection;
     if (!/\/$/.test(relativePath)) {
      relativePath = relativePath + "/";
     }

     var url = NSURL.URLWithString(relativePath);
     if(url) {
      SketchReplaceImagesDefaults.saveDefaults(relativePath);
      doc.showMessage('Set path to: "'+relativePath+'"');
     } else {
      present_error(doc);
     }
     break;
   default:
      doc.showMessage("Cancelled");
     break;
 }
};
```


### Customize the Dialog icon:

```javascript
alert.icon = loadLocalImage({
    scriptPath: scriptPath,
    filePath: "Contents/Resources/logo.png"
});
```


### Dialog with response handler

```js
function createDialogWindow(context) {

  // Setup the window
  var alert = COSAlertWindow.new()
  alert.setMessageText("Example modal")
  alert.addButtonWithTitle("Run")
  alert.addButtonWithTitle("Cancel")

  // Create initial view panel
  var width = 425
  var height = 20
  var view = NSView.alloc().initWithFrame(NSMakeRect(0, 0, width, height))
  alert.addAccessoryView(view)

  // Create checkbox input
  checkbox = NSButton.alloc().initWithFrame(NSMakeRect(0, 0, 425, 20))
  checkbox.setButtonType(NSSwitchButton)
  checkbox.setState(false)
  checkbox.setBezelStyle(0)
  checkbox.setTitle("Perform this action when checked")

  view.addSubview(checkbox)

  var answer = alert.runModal()

  if(answer === 1000) {
    var checkboxIsNotChecked = (checkbox.stringValue() === 0)
    log(checkboxIsNotChecked)
    /*
     * 1000 is the response code of the OK button.
     * here you should run the function when a person clicked OK.
     */
  }

}
```


### Dialog box with response handler:

```js
function createDialogWindow(context) {

  // Setup the window
  var alert = COSAlertWindow.new()
  alert.setMessageText("Example modal")
  alert.addButtonWithTitle("Run")
  alert.addButtonWithTitle("Cancel")

  // Create initial view panel
  var width = 425
  var height = 20
  var view = NSView.alloc().initWithFrame(NSMakeRect(0, 0, width, height))
  alert.addAccessoryView(view)

  // Create checkbox input
  checkbox = NSButton.alloc().initWithFrame(NSMakeRect(0, 0, 425, 20))
  checkbox.setButtonType(NSSwitchButton)
  checkbox.setState(false)
  checkbox.setBezelStyle(0)
  checkbox.setTitle("Perform this action when checked")

  view.addSubview(checkbox)

  var response = alert.runModal()
  handleDialogResponse(alert,response)

}
function handleDialogResponse(alert, response) {
      log("response: " + response)
  if(response === 1000) {
    var checkbox = alert.viewAtIndex(0).subviews()[0]
    log(checkbox)
    var checkboxIsNotChecked = (checkbox.stringValue() === 0)
    if (checkboxIsNotChecked) {
        log("checked")
    }else {
        log("unchecked")
    }
    log(checkboxIsNotChecked)
    /*
     * 1000 is the response code of the OK button.
     * here you should run the function when a person clicked OK.
     */
  } else { // answer === 1001
        log("else")
    }

//     alert.viewAtIndex(1).stringValue(),
// 					replacementProperty : alert.viewAtIndex(3).i18nObjectValues[alert.viewAtIndex(3).indexOfSelectedItem()],
// 					replaceHue          : alert.viewAtIndex(5).i18nObjectValues[alert.viewAtIndex(5).indexOfSelectedItem()],
}

createDialogWindow(context)
```
