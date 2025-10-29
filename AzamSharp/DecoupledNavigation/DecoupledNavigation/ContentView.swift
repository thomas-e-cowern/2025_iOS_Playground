//
//  ContentView.swift
//  DecoupledNavigation
//
//  Created by Thomas Cowern on 10/29/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CustomerListView(customers: Customer.sampleCustomers)
                .navigationDestination(for: Customer.self) { customer in
                    CustomerDetailVIew(customer: customer)
                }
        }
        .navigationTitle("Customer List Screen")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
