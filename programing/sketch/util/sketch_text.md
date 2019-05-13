## Text (works ✅)

```javascript

function createTextShape(textString){
	var sketch = context.api();
	var document = sketch.selectedDocument;
	var selection = document.selectedLayers;
	var page = document.selectedPage;
	var text = page.newText({
	    text: textString,
	    frame: new sketch.Rectangle(0, 0, 00, 00)// doesn't matter aperantly
	});
	var textStyle = text.sketchObject.style().textStyle(); // access the underlying sketch object and get its textstyle
	var mutableAttributes = NSMutableDictionary.dictionaryWithDictionary(textStyle.attributes());// textstyle consists of a dictionary of attributes, take a mutable copy of that dictionary
	mutableAttributes.setObject_forKey(NSColor.colorWithRed_green_blue_alpha(0,0,0,1),'NSColor'); // set the NSColor key for the attributes dictionary, set color to black
	textStyle.setValue_forKey_(mutableAttributes,'attributes');// write the attributes dictionary back onto the textstyle (and we're done)
	return text
}

createTextShape("Black text\nAnother line")
```
