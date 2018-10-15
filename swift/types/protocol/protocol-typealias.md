typealias PetLike = protocol<KittenLike, DogLike>
typealias CatLike = protocol<KittenLike, TigerLike> //in swift 3: typealias CatLike = KittenLike & TigerLike

see http://en.swifter.tips/protocol-composition/


```swift
struct SoundChecker {
    static func checkPetTalking(pet: protocol<KittenLike, DogLike>) {
        //...
    }

    static func checkCatTalking(cat: protocol<KittenLike, TigerLike>) {
        //...
    }
}    
```