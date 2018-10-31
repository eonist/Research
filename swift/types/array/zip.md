## Zip example:

```swift
let grades = ["a","b","c"]
let ids = [0,1,2]
let ids_grades = zip(ids,grades)
for item in ids_grades{
    print("id: \(item.0 ) grade: \(item.1)")//id: 0 grade: a ,id: 1 grade: b ,id: 2 grade: c
}
```

### Zip two arrays to TupleArray:
```swift
let grades = ["a","b","c"]
let ids = [0,1,2]
let ids_grades:[(Int,String)] = Array(zip(ids,grades))//Alternatively zip(ids,grades).map{($0, $1)}
for item in ids_grades{
   print("id: \(item.0 ) grade: \(item.1)")//id: 0 grade: a ,id: 1 grade: b ,id: 2 grade: c
}
```
