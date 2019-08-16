DispatchQueue.main.async {
   //do something on the main thread
}
DispatchQueue.global(qos: .background).async {
   //do something on a background thread
}
