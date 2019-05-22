## Get pages

```javascript

var firstPage = context.document.pages().firstObject()
let pages = context.document.pages();
for(var i = 0; i < pages.length; i++) {
    var page = pages[i]
    log(page)
}
```

## create page

```javascript

function createPageType2(doc, pageName){
  var doc = context.document;
  page = doc.documentData().addBlankPage()
  page.setName(pageName)
}

```
