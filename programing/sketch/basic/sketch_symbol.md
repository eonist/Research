# Symbol

more symbol references: https://medium.com/sketch-app-sources/sketch-gists-useful-snippets-for-plugin-development-1-3-214a77097142


## Get all Symbols

```js
/**
 * Get all the symbols for a document.
 * @param {MSDocument} doc
 * @return {NSArray}
 */
function getSymbols(doc) {
 return doc.documentData().allSymbols();
}
```

## Create symbol from layer

```js
function createSymbolFromLayer(page, layer, name) {
    page.addLayers([layer]);
    layer.isSelected = true;
    var layers = MSLayerArray.arrayWithLayers([layer]);
    if (MSSymbolCreator.canCreateSymbolFromLayers(layers)) {
        var symbolName = SYMBOL_PREFIX+"/"+name;
        var symbolInstance = MSSymbolCreator.createSymbolFromLayers_withName_onSymbolsPage(layers, symbolName, true);
        var symbolMaster = symbolInstance.symbolMaster();
        symbolMaster.setLayerListExpandedType(1);
        symbolInstance.removeFromParent();
    }
    return symbolMaster;
}
```
