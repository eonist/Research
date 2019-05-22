### Get symbols

```javascript
/**
 * Get all the symbols for a document.
 * @param {MSDocument} doc
 * @return {NSArray}
 */
function getSymbols(doc) {
 return doc.documentData().allSymbols();
}
```

### create symbol
```javascript
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
