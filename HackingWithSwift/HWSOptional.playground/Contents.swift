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
