import UIKit

//struct User {
//    var name: String
//    var password: Optional<String>
//}
//
//let marisol = User(name: "Marisol", password: "dshiel12")
//let amelia = User(name: "Amelia", password: nil)


let newScore: Int? = nil
let maxScore = 50

if newScore == maxScore {
    print("You matched the high score!")
}

struct User: Equatable { }  // Fails with equatable
let a: User? = User()
let b: User? = User()
print(a == b)

struct User1 {
//    var friend: User1 - infinite friends recursion problem
}

struct User2 {
    var friends: [User2]
}

//struct User3 {
//    var friend: User3? - same problem as User1 recursion
//}

// To fix User3 issue:
// 1. Create a class
// 2. Wrap in optional

final class Box<T> {
    var value: T

    init(value: T) {
        self.value = value
    }
}

struct User3 {
    var friend: Box<User3>?
}
