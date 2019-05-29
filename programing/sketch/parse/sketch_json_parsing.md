### JSON - (array example)

```json
[
 { "name" : "Doris Chapman", "age" : 32, "diet" : "vegan" },
 { "name" : "Hudson Anderson", "age" : 23, "diet" : "low carb" }
]

```

### JS - (array example)

```swift
// Data parser (command l)
var selection = context.selection
var doc = context.document
var userJSON = [doc askForUserInput:"Paste your JSON here:" initialValue:""];
var json = userJSON, obj = JSON.parse(json);
for (var i = 0; i < obj.length; i++){        
    for (var key in obj[0]) {
        var value = obj[i][key]
        log("Item: " + i + " Key: " + key + " Value: " + value)
    }
}
```


### JSON - object example:

```json
{
    "Featured": "featured english",
    "Playlist": "some playlist english",
    "Album": "some album english"
}
```

### JS - (object example)

```js
// Data parser (command l)
var selection = context.selection
var doc = context.document
var userJSON = [doc askForUserInput:"Paste your JSON here:" initialValue:""];
var json = userJSON, obj = JSON.parse(json);
log("json: " + json)
log("obj: " + obj)
log("obj.length: " + obj.length)
for (var key in obj) {
    var value = obj[key]
    log(" Key: " + key + " Value: " + value)
}

```
