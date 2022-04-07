import UIKit


struct User {
    var userId: Int?
    let name: String
}

//All parameters passed to a Swift function are constants, so you cannot change them. If you wish, you can pass one or more parameters as inout, which means they can be changed inside your function, and those changes reflect the original value outside the function.

func saveUser(_ user: inout User) {
    user.userId = 100
}

var user = User(name: "John Doe")
saveUser(&user)


print(user)
