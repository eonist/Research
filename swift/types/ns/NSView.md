```swift
private func createQRView() -> NSView{
	 let frame = NSRect.init(x: 0, y: 0, width: 180, height: 180)
	 let qrView:NSView = NSView.init(frame: frame)
	 qrView.wantsLayer = true
	 qrView.layer?.backgroundColor = NSColor.gray.cgColor
	 self.addSubview(qrView)
	 Align.align(qrView, self.frame.size, Alignment.centerCenter, Alignment.centerCenter,CGPoint.init(0, 0))
	 return qrView
}
```
