import UIKit
import Foundation

let userDefaults = UserDefaults.standard

let dictionaryKey = "myDictionary"

userDefaults.set(0.24, forKey: "Volume")
userDefaults.set(true, forKey: "MusicOn")
userDefaults.set("Angela", forKey: "PlayerName")
userDefaults.set(Date(), forKey: "AppLastOpendeByUser")

var array = [1, 2, 3]
userDefaults.set(array, forKey: "myArray")


let dictionary = ["name": "Angela"]
userDefaults.set(dictionary, forKey: dictionaryKey)

let volume = userDefaults.float(forKey: "Volume")
let appLastOpen = userDefaults.object(forKey: "AppLastOpendeByUser")
let myArray = userDefaults.array(forKey: "myArray")
let myDictionary = userDefaults.dictionary(forKey: dictionaryKey)


class Car {
    var colour = "red"
}

let myCar = Car()
myCar.colour = "Blue"

let yourCar = Car()
print(yourCar.colour)

class OutherCar {
    var colour = "Red"
    
    //always same the copy
    static let singletonCar = Car()
}

let myOtherCar = OutherCar.singletonCar
myOtherCar.colour = "Blue"

let herCar = OutherCar.singletonCar
print(herCar.colour)

class A {
    init() {
        OutherCar.singletonCar.colour = "Brown"
    }
}

class B {
    init() {
        print(OutherCar.singletonCar.colour)
    }
}
