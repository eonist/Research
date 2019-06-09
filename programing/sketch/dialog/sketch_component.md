### Segmented control

```javascript
var anchorSegControl = NSSegmentedControl.alloc().initWithFrame(NSMakeRect(0,0,140,30))
anchorSegControl.setSegmentCount(3)
anchorSegControl.setSegmentStyle(NSSegmentStyleTexturedRounded)

var iconTop = NSImage.alloc().initByReferencingFile(plugin.urlForResourceNamed("icon_top.png").path())
var iconMiddle = NSImage.alloc().initByReferencingFile(plugin.urlForResourceNamed("icon_middle.png").path())
var iconBottom = NSImage.alloc().initByReferencingFile(plugin.urlForResourceNamed("icon_bottom.png").path())
iconTop.setTemplate(true)
iconMiddle.setTemplate(true)
iconBottom.setTemplate(true)

anchorSegControl.setImage_forSegment(iconTop, 0)
anchorSegControl.setImage_forSegment(iconMiddle, 1)
anchorSegControl.setImage_forSegment(iconBottom, 2)

anchorSegControl.setWidth_forSegment(40, 0)
anchorSegControl.setWidth_forSegment(40, 1)
anchorSegControl.setWidth_forSegment(40, 2)

anchorSegControl.setSelected_forSegment(true, userDefaults.lastSelectedAnchorIndex)

alert.addAccessoryView(anchorSegControl)
```

### Checkbox:

```javascript

// Add checkbox
var checkbox = NSButton.alloc().initWithFrame(NSMakeRect(0,0,200,23))
checkbox.setButtonType(NSSwitchButton)
checkbox.setBezelStyle(0)
checkbox.setTitle("Round to Nearest Pixel Edge")
var shouldRound = userDefaults.shouldRoundPosition
checkbox.setState( shouldRound ? NSOnState : NSOffState )

alert.addAccessoryView(checkbox)

```

## Labels
```javascript
var label = NSTextField.alloc().initWithFrame(NSMakeRect(x,y,w,h));
label.setStringValue(text);
```

## TextField inputs
```javascript
// Creating the inputs
var horizontalTextField = NSTextField.alloc().initWithFrame(NSMakeRect(0, viewHeight - 85, 130, 20));
var verticalTextField = NSTextField.alloc().initWithFrame(NSMakeRect(140, viewHeight - 85, 130, 20));
// Adding the textfield
view.addSubview(horizontalTextField);
view.addSubview(verticalTextField);
// Default values for textfield
horizontalTextField.setStringValue('5');
```

## ComboBox (2 arrows):

```javascript
// Creating the input
dropdown = NSPopUpButton.alloc().initWithFrame(NSMakeRect(0, viewHeight - 230, (viewWidth / 2), 22));
// Filling the PopUpButton with options
[dropdown addItemWithTitle:"Optie 1"];
[dropdown addItemWithTitle:"Optie 2"];
// Adding the PopUpButton to the dialog
view.addSubview(dropdown);
verticalTextField.setStringValue('5');
```

## Combobox (1 arrow)

```javascript
var accessory = NSComboBox.alloc().initWithFrame(NSMakeRect(0,0,200,25))
accessory.addItemsWithObjectValues(items)
accessory.selectItemAtIndex(selectedItemIndex)
var alert = NSAlert.alloc().init()
alert.setMessageText(msg)
alert.addButtonWithTitle('OK')
alert.addButtonWithTitle('Cancel')
alert.setAccessoryView(accessory)
```

## Checkbox:

```javascript
// Creating the input
checkbox = NSButton.alloc().initWithFrame(NSMakeRect(0, viewHeight - 140, viewWidth, 20));
// Setting the options for the checkbox
checkbox.setButtonType(NSSwitchButton);
checkbox.setBezelStyle(0);
checkbox.setTitle("Checkbox");
checkbox.setState(NSOffState); //Change this to NSOnState if you want the checkbox to be selected by default
```

## RadioButtons:
```javascript
// Acts like a template (prototype) for our radio buttons
var buttonFormat;
  buttonFormat = NSButtonCell.alloc().init();
  buttonFormat.setButtonType(NSRadioButton);

// The matrix will contain all the cells (radio buttons)
  matrixFormat = NSMatrix.alloc().initWithFrame_mode_prototype_numberOfRows_numberOfColumns(
            NSMakeRect(0, 20, 400, 50), // Horizontal position, vertical position, width, height
            NSRadioModeMatrix, // This makes the radio buttons work together
            buttonFormat,
            1, // 1 row
            3 // 3 columns (for 3 radio buttons)
        );

// Settings the size of the radio buttons
  matrixFormat.setCellSize(CGSizeMake(100, 25));

// Adding the radio buttons to the form
  var cells = matrixFormat.cells();
              cells.objectAtIndex(0).setTitle("Horizontal");
              cells.objectAtIndex(1).setTitle("Vertical");
              cells.objectAtIndex(2).setTitle("Both");

// Adding the matrix to the form
  view.addSubview(matrixFormat);
```

## File-picker:

```javascript
var alert = COSAlertWindow.new();
var view = NSView.alloc().initWithFrame(NSMakeRect(0, 0, 250, 200));

var btn = NSButton.alloc().initWithFrame(NSMakeRect(0, 0, 100, 20));
btn.setBezelStyle(1);
btn.setTitle("Select file");

btn.setCOSJSTargetFunction(function(sender){
   log("works")

});

view.addSubview(btn);
var labelLayer = NSTextField.alloc().initWithFrame(NSMakeRect(120, 0, 150, 20));
labelLayer.setEditable(false);
labelLayer.setEnabled(true);
labelLayer.setStringValue("~/Documents/");
view.addSubview(labelLayer);

alert.setAccessoryView(view);
var response = alert.runModal();
```
