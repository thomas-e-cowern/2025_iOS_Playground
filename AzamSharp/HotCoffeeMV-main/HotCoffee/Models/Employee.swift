//
//  Employee.swift
//  HotCoffee
//
//  Created by Thomas Cowern on 5/6/25.
//
import Foundation

struct Employee: Identifiable {
    var id: UUID
    var name: String
    var role: String
    var department: String
}
