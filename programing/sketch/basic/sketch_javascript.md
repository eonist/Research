###

```js

```

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

// Modern sketch api:
var screenShotPaths = []
screenShotPaths.forEach(screenShot => {
    log("screenShot: " + screenShot)
});
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

if(firstName == "Manuele") {
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

###

```js

```
