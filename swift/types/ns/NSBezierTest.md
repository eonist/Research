
PaintCode example output: (greate for organizing styles etc)  
[here](http://www.raywenderlich.com/36341/paintcode-tutorial-dynamic-buttons) ””


add arccenter
//This doesn't work as its iOS counterpart
    self.appendBezierPathWithArcWithCenter(center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)

    //This worked like the iOS counterpart
    let path = CGPathCreateMutableCopy(self.CGPath)
    CGPathAddArc(path, nil, center.x, center.y, radius, startAngle, endAngle, clockwise)
    self.CGPath = path
