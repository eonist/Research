### Simple overriding example:

//adding dynamism to a static language like swift.
//https://developer.apple.com/videos/play/wwdc2015-408/?time=1767


```swift
protocol X{func test()}
protocol Y:X{}
protocol Z:X{}
extension X{
    func test(){
        Swift.print("x")
    }
}
extension Y{
    func test(){
        Swift.print("y")
    }
}
extension Z{
    /*func test(){
     Swift.print("z")
     }*/
}
class A:X{}
class B:Y{}
class C:Z{}

A().test()//x
B().test()//y
C().test()//x
```

### Anonymous method calls (polymorphism) w/ protocols (dynamic dispatch)

```swift

/*Protocols*/
protocol X{
    func doA()
    func doC()
}
protocol Y{}
protocol Z:X,Y{
    func doSomething()
}
/*Classes*/
class A:Z{
    func doSomething(){
        Swift.print("A.doSomething()")
    }
}
/*Extensions*/
extension Y{
    func doC() {//as long as doX doesn't exist in X or Z this will work
        Swift.print("Y.doC()")
     }
}
extension Z{
    func doA() {/*overrides X.doA()*/
        Swift.print("Z.doA()")
        doSomething()
    }
}
extension X{
    func render(){
        doA()
        doB()
        doC()
    }
    func doA(){ Swift.print("X.doA()")}
    func doB(){ Swift.print("X.doB()")}
}
extension Y{}

let a:Z = A()
a.render()
//Z.doA()👈 called from X.render()
//A.doSomething()👈 this is a method in a class!
//X.doB()👈 called from X.render()
//Y.doC() 👈 this is called from X.render()

```