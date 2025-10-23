//
//  main.swift
//  CodableSandbox
//
//  Created by Thomas Cowern on 10/21/25.
//

import Foundation

struct Employee: Decodable {
    var id: Int
    var name: String
    var age: Int
}

extension Employee: Decodable {
    private struct EmployeeV1: Decodable {
        let id: Int
        let name: String
        let age: Int
    }

    private struct EmployeeV2: Decodable {
        let id: Int
        let name: String
        let currentAge: Int
        let country: String
    }
}

let json = """
{
    "id": 13,
    "name": "Taylor Swift",
    "age": 26
}
"""

let jsonData = Data(json.utf8)

let decoder = JSONDecoder()
let employee = try decoder.decode(Employee.self, from: jsonData)

print("\(employee.name) is \(employee.age) years old.")

