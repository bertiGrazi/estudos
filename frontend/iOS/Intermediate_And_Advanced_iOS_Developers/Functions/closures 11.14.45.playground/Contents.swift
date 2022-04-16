import UIKit

//Clousere simple
/**
 let variavel: (oTipoDaVariavel) -> OqueQueremosRetornar = { TipoQueEstamosMandando in
     continuaAFuncao
 }
 */

let myName: (String) -> () = { name in
    print("Hello, my name is \(name)")
}

myName("Grazi")

//Clouse with $0
let another: (String) -> () = {
    print("Hello, my name is \($0)")
}

another("Maria")

// Two arguments
let numbers: (Int, Int) -> Int = { (number, time) in
    return number * time
}

let result = numbers(5, 5)
print(result)

let numbersWith$: (Int, Int) -> Int = {
    return $0 * $1
}

let resultWith$ = numbersWith$(5, 5)
print(resultWith$)

// Clousure in normal way

func getPost(completion: @escaping (([String]) -> () )) {
    var posts: [String] = []
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        posts = ["Hello", "Introduce to Clousure"]
        completion(posts)
    }
}

getPost { post in
    print(post)
}
