### Version number:

```javascript
var getSketchVersionAsInt = function() {
	var versionString = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString");
	var versionNumber = versionString.stringByReplacingOccurrencesOfString_withString(".", "") + ""
	while(versionNumber.length != 3) {
		versionNumber += "0"
	}
	return parseInt(versionNumber);
}
```
