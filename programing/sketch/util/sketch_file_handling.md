## Resources:
- Has import code: https://medium.com/@marianomike/the-beginners-guide-to-writing-sketch-plugins-part-6-exporting-data-36865e571122
- Has export functionality, but for newer sketch apps: https://gist.github.com/tadija/751e7b2e85afa099603b0c49574c0ad9

## Read / write (not tested)
```javascript
function readFile(path) {
    return NSString.stringWithContentsOfFile_encoding_error(path, NSUTF8StringEncoding, null);
}

function writeFile(path, content) {
    const string = NSString.stringWithFormat("%@", content);
    return string.writeToFile_atomically(path, true);
}
```

## TempFolder
```javascript
var createTempFolderNamed = function(name) {
    var tempPath = getTempFolderPath(name);
    createFolderAtPath(tempPath);
    return tempPath;
}
var getTempFolderPath = function(withName) {
    var fileManager = NSFileManager.defaultManager()
    cachesURL = [[fileManager URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] lastObject],
    withName = (typeof withName !== 'undefined') ? withName : (Date.now() / 1000),
    folderName = [NSString stringWithFormat:"%@", withName];
    return [[cachesURL URLByAppendingPathComponent:folderName] path];
}
var createFolderAtPath = function(pathString) {
    var fileManager = NSFileManager.defaultManager()
    if([fileManager fileExistsAtPath:pathString]) return true;
    return [fileManager createDirectoryAtPath:pathString withIntermediateDirectories:true attributes:nil error:nil];
}
var removeFileOrFolder = function(filePath) {
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
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

##  String from file

```js
var path = "/some/non/existing/file/path.txt"
var errorPtr = MOPointer.alloc().init()

var str = NSString.stringWithContentsOfFile_encoding_error(path, NSUTF8StringEncoding, errorPtr);
print(str);
print(errorPtr.value())
```


##  JSON

```js
var jsonFromFile = function(filePath, mutable) {
   var data = [NSData dataWithContentsOfFile:filePath];
	var options = mutable == true ? NSJSONReadingMutableContainers : 0
	return [NSJSONSerialization JSONObjectWithData:data options:options error:nil];
}

var saveJsonToFile = function(jsonObj, filePath) {
    writeTextToFile(stringify(jsonObj), filePath);
}

var stringify = function(obj, prettyPrinted) {
    var prettySetting = prettyPrinted ? NSJSONWritingPrettyPrinted : 0,
    jsonData = [NSJSONSerialization dataWithJSONObject:obj options:prettySetting error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
```


## Read and write

```js
var writeTextToFile = function(text, filePath) {
    var t = [NSString stringWithFormat:@"%@", text],
    f = [NSString stringWithFormat:@"%@", filePath];
    return [t writeToFile:f atomically:true encoding:NSUTF8StringEncoding error:nil];
}

var readTextFromFile = function(filePath) {
    var fileManager = NSFileManager.defaultManager()
    if([fileManager fileExistsAtPath:filePath]) {
        return [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    }
    return nil;
}
```


## User path:

```js
const temp = NSHomeDirectory() + "/Desktop"
log(temp) ///Users/eon/Desktop
```


## assert if file exists : ✅

```js
const fileDir = NSHomeDirectory() + "/Desktop/" + "image.png"
const fileExists = NSFileManager.defaultManager().fileExistsAtPath(fileDir)
fileExists ? log("exists") : log("not exist")
```
