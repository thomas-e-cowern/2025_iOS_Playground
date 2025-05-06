//
//  EmployeeStore.swift
//  HotCoffee
//
//  Created by Thomas Cowern on 5/6/25.
//
import Foundation
import Observation

@Observable
class EmployeeStore {
    
    let httpClient: HTTPClient
    var employees: [Employee] = []
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func addEmployee(name: String, role: String, department: String) {
        let employee = Employee(id: UUID(), name: name, role: role, department: department)
        employees.append(employee)
    }
    
    func getEmployeesByDepartment(department: String) -> [Employee] {
        return employees.filter {
            $0.department == department
        }
    }
}
