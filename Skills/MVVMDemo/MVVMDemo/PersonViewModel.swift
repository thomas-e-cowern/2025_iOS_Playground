//
//  PersonViewModel.swift
//  MVVMDemo
//
//  Created by Thomas Cowern on 7/15/25.
//

import SwiftUI

@Observable
class PersonViewModel {
    var people: [Person] = []
    
    func shuffleOrder() {
        people.shuffle()
    }
    
    func reverseOrder() {
        people.reverse()
    }
    
    func removeLasePerson() {
        people.removeLast()
    }
    
    func removeFirstPerson() {
        people.removeFirst()
    }
    
    let samplePeople: [Person] = [
        Person(name: "Alice Johnson", email: "alice.johnson@example.com", phoneNumber: "555-123-4567"),
        Person(name: "Bob Smith", email: "bob.smith@example.com", phoneNumber: "555-987-6543"),
        Person(name: "Carol Lee", email: "carol.lee@example.com", phoneNumber: "555-456-7890")
    ]
}
