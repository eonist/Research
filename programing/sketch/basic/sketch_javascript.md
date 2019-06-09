

### Objects

```js
var user = {
    firstName: "Manuele",
    lastName: "Capacci",
    age: 28,
    role: "Product Designer"
}
// using the object's variables
user.firstName;
user.lastName;
user.age;
user.role;
```


### Arrays

```js
var users = ["Manuele", "Daniel", "Miklos"]
// "users" is an array that contains a list of names

user[0]; // this equals "Manuele"
user[1]; // this equals "Daniel"
user[2]; // this equals "Miklos"

for(var i = 0; i < users.count(); i++){ // sometimes this is .length
	var user = users[i];
  log("user: " + user) // Manuele, Daniel, Miklos
}

// Modern sketch api: (works sketch 47++) (does not work in sketch preview mode)
var strings = ["a","b","c"]
strings.forEach(string => {
    log("string: " + string)
});

//concat arrays:
let arrA = ["a","b","c"]
let arrB = ["1","2","3"]
var arrC = arrA
arrC = arrC.concat(arrB)

log("arrC: " + arrC) // a,b,c,1,2,3
log(arrC.length) // 6
for(var i = 0; i < arrC.length; i++){
	log(arrC[i]) // a,b,c,1,2,3
}

```

### Functions

```js
// a function declaration
function sum(a, b) {
    return a + b;
}

// calling the function
sum(2, 3); // this equals 5

// recapping what we've learned so far

var total = sum(2, 3); // the variable "total" will equal 5
log(sum(2, 3)); // this will output 5 in the console
log(total); // this will also output 5 in the console
```


### Conditional Statements

```js
var firstName = "Manuele";

if (firstName == "Manuele") {
    // do something for Manuele
} else if(firstName == "Daniel") {
    // do something for Daniel
} else {
    // do something for anybody else
}
```


### Switch

```js
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
```

### OR operator:

```js
/**
 * @Example: setName(null) // "image"
 * @Example: setName("someImage") // "someImage"
 */
function setName(name) {
   var name = name || "image";
}
```

### nil or

```js
function pathString() {
  return defaultsDict["pathString"] ? defaultsDict["pathString"] : NSHomeDirectory() + "/Desktop"
}
```
