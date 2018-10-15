### code injection via Protocol extension

```swift
protocol CustomString{
    func doSomething()
}
extension CustomString{
    func doSomething(){
        print("wuu 💥")
    }
}
class A{}
extension A:CustomString{}//👈 you sort of attach CustomString functionality


let a = A()
a.doSomething()//wuu 💥

```