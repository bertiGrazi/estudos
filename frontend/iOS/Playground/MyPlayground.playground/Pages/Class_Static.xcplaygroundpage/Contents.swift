import UIKit

class MyClass {
    
    static func staticMethod() {
        print(#function)
    }

    class func classMethod() {
        print(#function)
    }
}

MyClass.staticMethod()
MyClass.classMethod()

