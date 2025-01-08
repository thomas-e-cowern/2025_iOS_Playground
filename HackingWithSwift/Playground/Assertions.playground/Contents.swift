import Foundation

func sum(of numbers: [Int]) -> Int {
    assert(numbers.count > 0, "This should always be given with some numbers")
    return numbers.reduce(0, +)
}

let number = Int.random(in: 1...3)

switch number {
case 1:
    print("You rolled a one...")
case 2:
    print("You rolled a two...")
case 3:
    print("You rolled a three...")
default:
    assertionFailure("Rolling a 3 sided dice is never a good idea...")
}

extension Array {
    mutating func removeRandom(_ number: Int) {
        precondition(count > number, "Can't remove \(number) items from an array with \(count) items")
        
        for _ in 0..<number {
            remove(at: Int.random(in: 0..<count))
        }
    }
}

func updateStatus(to newStatus: String) -> String {
    if newStatus == "active" || newStatus == "inactive" {
        print("Status: \(newStatus)")
        return "Updating status"
    }
    
    preconditionFailure("Unknown status: \(newStatus)")
}

updateStatus(to: "active")

//guard let url = Bundle.main.url(forResource: "input", withExtension: "json") else {
//    fatalError("Faliled to locate input.json in bundle")
//}
