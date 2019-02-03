```swift
let data = ["Alpha","Beta","Gamma","Delta"]

let b2 = data.first(where:{$0=="Beta"})
Swift.print("b2: " + "\(b2)")//beta
```

### use condition, see removeDups method
```swift
let contidtion {$0 == $1}
condition:(_ a:T, _ b:T) -> Bool
if result.first(where:{condition(item,$0)}) == nil
```

### Use of condition
```swift
let condition:(ColorMapItem) -> Bool = { colorMapItem in
   return false
}
guard let color:UIColor = colorMap.first(where: condition)?.color else {fatalError("Unable to colorize")}
```
