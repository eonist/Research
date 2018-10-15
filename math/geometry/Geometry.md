
[nsHipster on geometry in swift](http://nshipster.com/cggeometry/) 


Calculates the nearest point to this point on a line from `pointA` to `pointB`.
NOTE: provides a convenience method for working with pathfinding graphs.
```swift
extension float2 {
    /// 
    func nearestPointOnLineSegment(lineSegment: (startPoint: float2, endPoint: float2)) -> float2 {
        // A vector from this point to the line start.
        let vectorFromStartToLine = self - lineSegment.startPoint
        
        // The vector that represents the line segment.
        let lineSegmentVector = lineSegment.endPoint - lineSegment.startPoint
        
        // The length of the line squared.
        let lineLengthSquared = distance_squared(lineSegment.startPoint, lineSegment.endPoint)
        
        // The amount of the vector from this point that lies along the line.
        let projectionAlongSegment = dot(vectorFromStartToLine, lineSegmentVector)
        
        // Component of the vector from the point that lies along the line.
        let componentInSegment = projectionAlongSegment / lineLengthSquared
        
        // Clamps the component between [0 - 1].
        let fractionOfComponent = max(0, min(1, componentInSegment))
        
        return lineSegment.startPoint + lineSegmentVector * fractionOfComponent
    }
}
```



```swift
/**
 * Returns the shortest angle between two angles. The result is always between
 * -π and π.
 */
public func shortestAngleBetween(angle1: CGFloat, angle2: CGFloat) -> CGFloat {
    let twoπ = π * 2.0
    var angle = (angle2 - angle1) % twoπ
    if (angle >= π) {
        angle = angle - twoπ
    }
    if (angle <= -π) {
        angle = angle + twoπ
    }
    return angle
}
```