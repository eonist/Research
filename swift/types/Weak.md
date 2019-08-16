## Weak
Use weak if the ref to the var can become nil in the future.
Use unowned if the ref can never become nil in the future

```swift
onPublish = { [weak self] post in
    self?.publishedPosts.append(post)
    print("Published post count is now: \(self?.publishedPosts.count)")
}

download(imageURL, completion: { [weak imageViewController] result in
    // ...
})

download(imageURL, completion: { [weak imageViewController, weak imageFinalizer] result in
    // ...
})
```

Structs doesn't need to use weak, because they are copied wholesale in params etc. 
