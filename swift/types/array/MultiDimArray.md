```swift
import Foundation

func testing(){
    let array3D: [[[Int]]] = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]
    print(array3D.count)
    
    //Arrays with dictionaries (method 1):
    var taskItems:[Dictionary<String,String>] = []
    taskItems.append(["color":"blue"])
    
    //Arrays with dictionaries (method 2):
    var taskItems2 = [[String:String]()]
    taskItems2.append(["color":"blue"])
}

```

## Reducing columns:

```swift
let tempArray = [[1,2,3],[4,5,6]]
        
var result:[Int] = [0,0,0]
tempArray.forEach{
	for i in $0.indices{
		result[i] = result[i] + $0[i]
	}
}
Swift.print(result)//[5, 7, 9]
```