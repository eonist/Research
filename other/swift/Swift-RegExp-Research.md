## **Work around for swift/obj-c lack of associative capturing groups**
Sometimes you need to have groups within groups in a regexp pattern. This is trivial in other languages where there is real support for associative capturing groupes or "named capturing groups" if you will. But They are not in objc.   

NOTE: There may be a solution with enums and using numbered capturing groups. I havent had the time to research that fully so here is a nice workaround:
```
let str = ".upButton"
let pattern = "(?:\\.(\\w+?))?"
//what this pattern does is that it captures the string part "upButton" only if its preceded by a "." char
//and the outer group is not capture because it has the "?:" "do not capture flag"
//the inner group becomes the first group.
//Dont forget to use RegExp.matches when doing capturing groups
```

## **Wrappers:**  
http://benscheirman.com/2014/06/regex-in-swift/

https://github.com/glaurent/SwiftRegExp/blob/master/RegExp.swift

https://gist.github.com/ningsuhen/dc6e589be7f5a41e7794

//matches:
http://stackoverflow.com/questions/27880650/swift-extract-regex-matches

//comprehensive tutorial:
http://www.raywenderlich.com/86205/nsregularexpression-swift-tutorial