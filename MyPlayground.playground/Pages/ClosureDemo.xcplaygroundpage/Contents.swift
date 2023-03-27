//: [Previous](@previous)

import Foundation


//Global functions are closures that have a name and don’t capture any values.

//Nested functions are closures that have a name and can capture values from their enclosing function.

//Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.


let fruits = ["Bananas🍌🫒 - 63%",
              "Strawberries🍓 - 56%",
              "Grapes🍇 - 55%",
              "Apples🍎 - 55%",
              "Watermelon🍉 - 50%",
              "Oranges🍊 - 47%",
              "Blueberries🫐 - 41%",
              "Lemons🍋 - 41%"]
// Fuction
func backword(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var revarse = fruits.sorted(by: backword)
print(revarse)

// Closure
revarse = fruits.sorted(by: { (s1: String, s2: String) -> Bool in return s1 < s2 } )
print("\nClosure\n")
print(revarse)

//Inferring Type From Context
revarse = fruits.sorted(by: { (s1, s2) -> Bool in return s1 < s2 } )
print("\nInferring Type From Context\n")
print(revarse)

//Implicit Returns from Single-Expression Closures
revarse = fruits.sorted(by: { s1,s2 in s1 > s2 } )
print("\nImplicit Returns from Single-Expression Closures\n")
print(revarse)

//Shorthand Argument Names
revarse = fruits.sorted(by: {$0 < $1})
print("\nShorthand Argument Names\n")
print(revarse)

//Operator Methods
revarse = fruits.sorted(by: >)
print("\nOperator Methods\n")
print(revarse)

//Trailing Closures
func someFunctionThatTakesAClosure(closure: () -> Void) {
    closure()
}

someFunctionThatTakesAClosure(closure: {
    print("\nTrailing Closures\n")
})

someFunctionThatTakesAClosure() {
    print("\nThis is from another closure\n")
}
someFunctionThatTakesAClosure {
    print("\ncomplete closure\n ")
}
//Trailing Closures using map
let countNumes  = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
//Create array
let numbers = [100, 200, 300, 400, 500, 10, 20, 30, 40, 50]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = countNumes[number % 10]! + output
        number /= 10
    } while number > 0
    
    return output
}

print(strings)

//func loadPicture(from server: Server, completin: (Picture) -> Void, onFailure: (Piture) -> Void) {
//    if let picture = download("photo.jpg", from: server){
//        completion(picture)
//    } else {
//        onFailure()
//    }
//}
//
//struct Server {
//    var picture: String = ""
//}
//
//loadPicture(from: someServer) { picture in
//    someView.currentPicture = picture
//} onFailure: {
//    print("Couldn't download the next picture.")
//}

//Capturing Values
func makeIncrementer(forIncrement amount: Int) -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal +=  amount
        return runningTotal
    }
    return runningTotal
}
let incrementByTen = makeIncrementer(forIncrement: 10)
print(incrementByTen)

//Function Types as Return Types

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 8
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
print("\nCounting to zero:\n")

while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

var i = 0
var closureArr = [()->()]()
for _ in 1...5{
    closureArr.append {
        print(i)
    }
    i += 1
}
print(closureArr)

var closureArr2 = [()->()]()
var j = 0
for _ in 1...5 {
    closureArr2.append { [j] in
        print(j)
    }
    j += 1
}
print(closureArr2)
