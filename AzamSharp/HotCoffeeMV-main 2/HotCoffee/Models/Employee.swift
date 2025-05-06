//
//  Employee.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 4/8/24.
//

import Foundation

// Define Employee struct
struct Employee: Identifiable {
    let id: UUID
    var name: String
    var role: String
    var department: String
}
