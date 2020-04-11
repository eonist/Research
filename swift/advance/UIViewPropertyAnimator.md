### UIViewPropertyAnimator

#### advance usage:  
http://www.swiftkickmobile.com/building-better-app-animations-swift-uiviewpropertyanimator/

#### game made with constraints and uiviewpropanimator :  
https://medium.freecodecamp.org/interactive-animations-with-swifts-uiviewpropertyanimator-284262530a0a

```swift
//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let liveView = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 150))
liveView.backgroundColor = .white

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = liveView

let square = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
square.backgroundColor = .red

liveView.addSubview(square)

let animator = UIViewPropertyAnimator.init(duration: 5, curve: .linear)

animator.addAnimations {
   square.frame.origin.x = 350//destination
}

let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
blurView.frame = liveView.bounds

liveView.addSubview(blurView)

animator.addAnimations {
   blurView.effect = nil
}

// If you want to restore the blur after it was animated, you have to
// safe a reference to the effect which is manipulated
let effect = blurView.effect

animator.addCompletion {
   // In case you want to restore the blur effect
   if $0 == .start { blurView.effect = effect }
}

animator.startAnimation()
animator.pauseAnimation()

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
   animator.fractionComplete = 0.5
   Swift.print("animator.fractionComplete:  \(animator.fractionComplete)")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
   // decide the direction you want your animation to go.
   // animator.isReversed = true
   animator.startAnimation()
}

```
