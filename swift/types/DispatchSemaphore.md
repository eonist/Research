Limiting Work in Progress
As we already know, unlimited work might lead to a deadlock. Here is how we can apply dispatch semaphore to limit a queue to 3 concurrent tasks:


```swift
let concurrentTasks = 3

let queue = DispatchQueue(label: "Concurrent queue", attributes: .concurrent)
let sema = DispatchSemaphore(value: concurrentTasks)

for _ in 0..<999 {
    queue.async {
        // Do work
        sema.signal()
    }
    sema.wait()
}
```
