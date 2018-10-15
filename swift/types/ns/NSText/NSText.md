
//add font and size to a NSText instance:

text.font = NSFont(name: "Times-Roman", size: 22)

enum NSTextAlignment : UInt {
    case Left
    case Right
    case Center
    case Justified
    case Natural
}

**To decide which OS X text technology is right for your application, apply the following guidelines:**
- If possible, use Cocoa text. The NSTextView class is the most advanced full-featured, flexible text view in OS X. For small amounts of text, use NSTextField. For more information about text views, see Text System User Interface Layer Programming Guide .

- To display web content in your application, use WebKit. For more information about WebKit, see WebKit Objective-C Programming Guide .

- If you have your own page layout engine, you can use Core Text to generate the glyphs and position them relative to each other. For more information about Core Text, see Core Text Programming Guide .


