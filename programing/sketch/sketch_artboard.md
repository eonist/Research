```javascript
var copyNames = []
var numBoards = 0
for(var i = 0; i < selection.length; i++) {
    var current = selection[i];
    if([current className] == "MSArtboardGroup") {
        copyNames.push([current name] + '');
        numBoards +=1
     }
  }
  if(numBoards == 0) {
    doc.showMessage("At Least One Artboard Must Be Selected");
    return;
  }
}
```
## Get artboards:

```javascript
var getAllArtboardNames = function(context) {
    let pages = context.document.pages();
    var names = []
    // Filter layers using NSPredicate
    for(var i = 0; i < pages.length; i++) {
        var currentPage = pages[i]
        var scope =  [currentPage children],
        predicate = NSPredicate.predicateWithFormat("(className == %@)",           "MSArtboardGroup"),
        layers = [scope filteredArrayUsingPredicate:predicate];
        var loop = [layers objectEnumerator], layer;

        while (layer = [loop nextObject]) {
	var nameOfBoard = [layer name]
            if(nameOfBoard.indexOf("-synced") < 0) {
                names.push(nameOfBoard);
            }
        }
    }
    return names;
}
```

## Get artboards (alternative)

```javascript
let artboardsOnOtherPages = [];
let pages = Array.fromNSArray(document.pages());
pages = pages.filter(page => page != document.currentPage());
for (var i = 0; i < pages.length; i++) {
    var artboards = Array.fromNSArray(pages[i].artboards());
    artboardsOnOtherPages = artboardsOnOtherPages.concat(artboards);
}
```
