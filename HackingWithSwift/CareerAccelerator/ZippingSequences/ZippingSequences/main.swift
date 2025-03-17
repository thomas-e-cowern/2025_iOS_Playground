//
//  main.swift
//  ZippingSequences
//
//  Created by Thomas Cowern on 3/17/25.
//

import Foundation

let friends = ["Daphne", "Frasier", "Martin", "Niles"]

let numbers = [1, 5, 6]

// Returns Fatal error: Index out of range
//for (index, friend) in friends.enumerated() {
//    let number = numbers[index]
//    print("\(friend) has number \(number)")
//}

// Using zip to add numbers from 2 arrays
for (friend, number) in zip(friends, numbers) {
    print("\(friend) has number \(number)")
}


let firstResults = [85, 95, 90]
let secondResults = [85, 100, 100]

let combinedResults = zip(firstResults, secondResults).map { $0 + $1 }

//print(combinedResults)

// Using zip to combine multiple data sources
let characters = ["Aragorn", "Gimli", "Legolas"]
let races = ["human", "dwarf", "elf"]
let weapons = ["sword", "axe", "bow"]

let team = zip(characters, zip(races, weapons))

for (character, (race, weapon)) in team {
    print("\(character) the \(race) uses his \(weapon)")
}
