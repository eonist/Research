```swift
DispatchQueue.main.async {
   //do something on the main thread
}
DispatchQueue.global(qos: .background).async {
   //do something on a background thread
}

```
### DispatchQoS Priority Levels:
- .userInteractive: Used for work directly involved in providing an interactive UI
- .userInitiated: Used for performing work that has been explicitly requested by the user
- .default: This QoS is not intended to be used by developers to classify work.
- .utility: Used for performing work which the user is unlikely to be immediately waiting for the results.
- .background: Used for work that is not user initiated or visible.
- .unspecified

.userInteractive is intended for user-interactive tasks, such as animations, events, and updating UI. As a rule of thumb, use this QoS for tasks that your app’s user is actively using.
.userInitiated is intended for tasks that prevent the user from using your app, like saving a file. Use it for tasks that your app’s user is actively waiting on.
.utility is intended for tasks that don’t require an immediate result, such as background downloads with a progress bar. Use it for background tasks that need a balance between responsiveness, performance and energy efficiency.
.background is intended for tasks that aren’t visible to your app’s user, like indexing, sync and backups. This setting prioritizes energy efficiency.

alot of good tips:
- https://gist.github.com/FWEugene/3861f0460c3e23f684e113f0f8d6947f
- https://medium.com/@engsultan2009/concurrent-management-in-ios-part-1-836b5b5da52f
