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

