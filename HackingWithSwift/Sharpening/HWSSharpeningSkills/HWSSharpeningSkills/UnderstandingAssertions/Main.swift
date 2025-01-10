//
//  Main.swift
//  HWSSharpeningSkills
//
//  Created by Thomas Cowern on 1/8/25.
//

import Foundation

func sum(of numbers: [Int]) -> Int {
    assert(numbers.count > 0, "sum must always be given at least one number")
    return numbers.reduce(0, +)
}

let number = Int.random(in: 1...3)

//switch number {
//case 1:
//    print("You rolled a one...")
//case 2:
//    print("You rolled a one...")
//case 3:
//    print("You rolled a one...")
//default:
//    assertionFailure("Rolling a 3 sided dice is never a good idea...")
//}
