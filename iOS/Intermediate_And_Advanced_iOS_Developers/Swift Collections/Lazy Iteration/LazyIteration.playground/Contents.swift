import UIKit


let indexes = 1..<5000

indexes.filter { index -> Bool in
    print("[filter]")
    return index % 2 == 0
}.map { (index) -> String in
    print("[map]")
    return "image_\(index)"
}
