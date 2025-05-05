//
//  CoffeeOrderListScreen.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 8/14/23.
//

import SwiftUI

struct CoffeeOrderListScreen: View {
    
    @Environment(\.httpClient) private var httpClient
    
    @State private var isPresented: Bool = false
    @State private var orders: [CoffeeOrder] = []
    
    var body: some View {
        List(orders) { order in
            NavigationLink(value: order) {
                Text(order.name)
            }
        }
        .navigationDestination(for: CoffeeOrder.self, destination: { coffeeOrder in
            CoffeeDetailScreen(coffeeOrder: coffeeOrder)
        })
        .task {
            do {
                try await loadOrders()
            } catch {
                print(error.localizedDescription)
            }
        }.navigationTitle("Orders")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Order") {
                        isPresented = true
                    }
                }
            })
            .sheet(isPresented: $isPresented, content: {
                AddCoffeeOrderScreen { order in
                    orders.append(order)
                }
            })
    }
    
    private func loadOrders() async throws {
        let resource = Resource(url: APIs.orders.url, modelType: [CoffeeOrder].self)
        orders = try await httpClient.load(resource)
    }
}

#Preview {
    NavigationStack {
        CoffeeOrderListScreen()
            .environment(\.httpClient, HTTPClient())
    }
}
