//: [Previous](@previous)

import Foundation

struct MyArray {
    var first: Int?
    var second: Int?
    
    subscript(index: Int) -> Int {
        get {
            if index == 0 {
                return first!
            } else if index == 1 {
                return second!
            }
            fatalError("Array index out of bounds exception")
        }
        set {
            if index == 0 {
                first = newValue
            } else if index == 1 {
                second = newValue
            } else {
                fatalError("We cannot store more the 2 elements")
            }
        }
    }
}

var myArr = MyArray()
myArr[0] = 10
myArr[0]
myArr[1] = 12
myArr[1]

//: [Next](@next)
