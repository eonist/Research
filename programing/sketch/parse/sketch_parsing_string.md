## File-Path elements

```javascript
var basefileName = filename.toString().lastPathComponent();
var pathExtension = basefileName.pathExtension();
```

## Basic string splitting:

```js
/**
 * split("this is a test") // ["this","is","a","test"]
 */
function split(str, delimiter) {
  var arr = str.split(delimiter);
  var items = []
  for(var i = 0; i < arr.length; i++){
	   var item = arr[i];
     items.push(item)
     //log("item: " + item)
  }
  return items
}

var result = split("this is a test", ' ')
log("result.length: " + result.length)
```
