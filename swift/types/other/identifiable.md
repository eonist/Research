# Identifiable

### Resources:
- https://nshipster.com/identifiable/

### Example:

```swift
import Foundation

// Style 1: id requirement fulfilled by stored property
struct Product: Identifiable {
    let id: UUID
}

```

```swift
import Foundation

struct Product {
    var uuid: UUID
}

// Style 2: id requirement fulfilled by computed property
extension Product: Identifiable {
    var id { uuid }
}
```

```swift
import Foundation

struct Product {
    var id: UUID
}

// Style 3: id requirement fulfilled by existing property
extension Product: Identifiable {}
```
