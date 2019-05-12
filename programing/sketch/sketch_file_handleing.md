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
    var fileManager = [NSFileManager defaultManager],
    cachesURL = [[fileManager URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] lastObject],
    withName = (typeof withName !== 'undefined') ? withName : (Date.now() / 1000),
    folderName = [NSString stringWithFormat:"%@", withName];
    return [[cachesURL URLByAppendingPathComponent:folderName] path];
}
var createFolderAtPath = function(pathString) {
    var fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:pathString]) return true;
    return [fileManager createDirectoryAtPath:pathString withIntermediateDirectories:true attributes:nil error:nil];
}
var removeFileOrFolder = function(filePath) {
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
 }
```


## Read text from file:

```javascript
//create panel for user to select file
var open = NSOpenPanel.openPanel();
var fileTypes = [NSArray arrayWithObjects:@"json",nil];

open.setAllowedFileTypes(fileTypes);
open.setCanChooseDirectories(true);
open.setCanChooseFiles(true);
open.setCanCreateDirectories(true);
open.setTitle("Import a Color Palette");
open.setPrompt("Import Palette");
open.runModal();

//import the selected file and parse to JSON object
var filePath = open.URLs().firstObject().path();
var fileContents = NSString.stringWithContentsOfFile(filePath);
```
