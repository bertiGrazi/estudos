import UIKit

let ratigns = [4, 8.5, 9.5, 2, 5, 8.0, 7]

let results = ratigns.reduce([:]) { (results: [String: Int], rating: Double) in
    
    var copy = results
    
    switch rating {
        case 1..<4:
            copy["Very bad", default: 0] += 1
        
        case 4..<6:
            copy["Ok", default: 0] += 1
        
        case 6..<8:
           copy["Good", default: 0] += 1
        
        case 8..<11:
            copy["Excellent", default: 0] += 1
        
        default: break
    }
    
    return copy
}

print(results)
