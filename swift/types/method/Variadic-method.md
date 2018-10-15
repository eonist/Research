**Variadic functions**

Variadic functions are functions that have a variable number of arguments (indicated by ... after the argument's type) that can be accessed into their body as an array.

```swift
func jediBladeColor (colors: String...) -> () {
  for color in colors {
    println("\(color)")
  }
}
jediBladeColor("red","green")
```