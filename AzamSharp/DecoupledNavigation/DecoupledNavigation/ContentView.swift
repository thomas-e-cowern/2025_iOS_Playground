//
//  ContentView.swift
//  DecoupledNavigation
//
//  Created by Thomas Cowern on 10/29/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomerListView(customers: Customer.sampleCustomers)
        .padding()
        .navigationTitle("Customer List Screen")
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
