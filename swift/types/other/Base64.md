```swift

extension String {
   //: ### Base64 encoding a string
   func base64Encoded() -> String? {
      if let data = self.data(using: .utf8) {
         return data.base64EncodedString()
      }
      return nil
   }

   //: ### Base64 decoding a string
   func base64Decoded() -> String? {
      if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters) {
         return String(data: data, encoding: .utf8)
      }
      return nil
   }
}
var str = "Hello, play✅ground🎉"
Swift.print("Original string: \"\(str)\"")

if let base64Str = str.base64Encoded() {
   Swift.print("Base64 encoded string: \"\(base64Str)\"")//"SGVsbG8sIHBsYXninIVncm91bmTwn46J"
   if let trs = base64Str.base64Decoded() {
      Swift.print("Base64 decoded string: \"\(trs)\"")//"Hello, play✅ground🎉"
      Swift.print("Check if base64 decoded string equals the original string: \(str == trs)")
   }
}
```
