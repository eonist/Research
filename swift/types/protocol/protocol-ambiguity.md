Note however that you can't use ambiguity to differentiate with the same method name that has been called. do{(self as B).do()} will only work if self and B doesn't share the same base protocol with do signature

```swift
protocol X{}
extension X{
    func render(){
        Swift.print("X")
    }
}
protocol Y{}
extension Y{
    func render(){
        Swift.print("Y")
    }
}
class A:X,Y{
    func renderX() {
        (self as X).render()
    }
    func renderY() {
        (self as Y).render()
    }
}
let a = A()
a.renderX()//x
a.renderY()//y

```