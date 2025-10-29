//
//  CustomerListView.swift
//  DecoupledNavigation
//
//  Created by Thomas Cowern on 10/29/25.
//

import SwiftUI

struct CustomerListView: View {
    
    let customers: [Customer]
    
    var body: some View {
        List {
            ForEach(customers) { customer in
                NavigationLink(value: customer) {
                    CustomerCellView(customer: customer)
                }
            }
        }
    }
}

#Preview {
    CustomerListView(customers: Customer.sampleCustomers)
}
