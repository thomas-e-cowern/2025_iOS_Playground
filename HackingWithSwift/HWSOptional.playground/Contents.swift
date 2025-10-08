import UIKit

struct User {
    var name: String
    var password: String?
}

// user with password
let john = User(name: "John", password: "qs35fbn89")

// user without password
let amy = User(name: "Amy")

// safer way to do it
struct UserNP {
    var name: String
    var password: Optional<String>
}

// requires use of nil for passwrod
let bob = UserNP(name: "Bob", password: nil)


let newScore: Int? = nil
let maxScore = 50

if newScore == maxScore {
    print("You matched the high score!")
}


struct UserEmpty { }
let a: UserEmpty? = UserEmpty()
let b: UserEmpty? = UserEmpty()
// print(a == b) fails becuase UserEmpty is not equatable


