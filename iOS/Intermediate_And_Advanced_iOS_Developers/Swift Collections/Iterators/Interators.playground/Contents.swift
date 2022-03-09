import UIKit

let names = ["Alex", "John", "Mary"]

//The old Way
for name in names {
    print("Old Way: " + name)
}

print("\n")

var nameIterator = names.makeIterator()

while let name = nameIterator.next() {
    print("Iterator Way: " + name)
}

/*The IteratorProtocol*/
    //protocol IteratorProtocol {
    //    associatedtype Element
    //
    //    mutating func next() -> Element?
    //
    //}

print("\n")

struct Countdown: Sequence {
    let start: Int
    
    func makeIterator() -> some IteratorProtocol {
        return CountdownIterator(self)
    }
}

struct CountdownIterator: IteratorProtocol {
    let countdown: Countdown
    var currentValue = 0
    
    init(_ countdown: Countdown) {
        self.countdown = countdown
        self.currentValue = countdown.start
    }
    
    mutating func next() -> Int? {
        if currentValue > 0 {
            let value = currentValue
            currentValue -= 1
            return value
        } else {
            return nil
        }
    }
}

let countdown = Countdown(start: 10)

print("The old Way")
for count in countdown {
    print(count)
}

print("\nThe makeIterator mathod")
var count = countdown.makeIterator()
while let num = count.next() {
    print(num)
}

struct CountdownDoc: Sequence, IteratorProtocol {
var count: Int

mutating func next() -> Int? {
    if count == 0 {
        return nil
    } else {
        defer { count -= 1 }
        return count
    }
}
}


let threeToGo = CountdownDoc(count: 3)
for i in threeToGo {
    print(i)
}
