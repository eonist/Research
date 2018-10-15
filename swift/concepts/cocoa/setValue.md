class Temp:NSObject{
    @objc dynamic var temp:String = ""
}

let temp = Temp()
temp.setValue("test", forKey: "temp")

temp.temp//test
