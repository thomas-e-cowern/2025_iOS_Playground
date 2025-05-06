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
}
