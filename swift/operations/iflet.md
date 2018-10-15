## If let else

```swift
if let a = b else{
	fatalError("💥")//crashes app if be is nil
}

```

## Successive asserting if let trick:

```swift
if let a, a.count>0, a.count < 10{
	/*do your thing*/
}
```


## Multiple let vars:

```swift
if let age = age, let name = name where name.characters.count > 0 && age.characters.count > 0{
	//do things with age and name
}
```

## if let else if let:
The bellow can also be done via switch
```swift
let x:Any = "5"
if let a = x as? String {
    Swift.print("a: " + "\(a)")
} else if let b = x as? Int {
    Swift.print("b: " + "\(b)")
}
```


## Making a known into an unknown:

```swift
let optionalName = Optional<String>.some("Princess Moana")
if let name = optionalName {}
```