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
for (var i = 0; i < obj.length; i++) {        
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

### JSON asserting:

Some nice json parsing: https://sketchpacks.com/kvendrik/sketch-json-parser
More nixe json parsing: https://github.com/davidklaw/sketch-generator-spotify/blob/master/Spotify.generator.sketchplugin
```js
//get JSON by user input
var jsonStr = jsonObj ? JSON.stringify(jsonObj) : [doc askForUserInput:"Enter the JSON you'd like to use" initialValue:""],
	 json;

//if input is an array, make valid json
if (jsonStr.indexOf('[') == 0) {
	 jsonStr = '{ "__sketchJsonArray": '+jsonStr+' }';
}


//attempt to parse json
try {
	json = JSON.parse(jsonStr);
} catch(e){
    [app displayDialog:"Whoops, looks like that's not valid JSON."]
	return;
}

//check if json is an array
if (json.__sketchJsonArray) {
    //is an array
    var dataArr = json.__sketchJsonArray;

    //loop selected layers
    for(var i = 0; i < selectedCount; i++){
        var currLayer = selectedLayers[i],
            currObj = dataArr[i];

        if(currObj){
            utils.parseLayer(currLayer, currObj);
        }
    }
} else {
    //single object
    //loop selected layers
    for(var i = 0; i < selectedCount; i++){
        utils.parseLayer(selectedLayers[i], json);
    }
}
```
