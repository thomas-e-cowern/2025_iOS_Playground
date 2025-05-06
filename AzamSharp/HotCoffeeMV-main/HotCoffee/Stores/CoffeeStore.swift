//
//  CoffeeStore.swift
//  HotCoffee
//
//  Created by Thomas Cowern on 5/5/25.
//
import Foundation
import Observation

@Observable
class CoffeeStore {
    let httpClient: HTTPClient
    
    var orders: [CoffeeOrder] = []
    var employees: [Employee] = []
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func loadOrders() async throws {
        let resource = Resource(url: APIs.orders.url, modelType: [CoffeeOrder].self)
        orders = try await httpClient.load(resource)
    }
    
    func placeOrder(coffeeOrder: CoffeeOrder) async throws {
        let newOrderData = try JSONEncoder().encode(coffeeOrder)
        let resource = Resource(url: APIs.addOrder.url, method: .post(newOrderData), modelType: CoffeeOrder.self)
        let savedCoffeeOrder = try await httpClient.load(resource)
        orders.append(savedCoffeeOrder)
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
