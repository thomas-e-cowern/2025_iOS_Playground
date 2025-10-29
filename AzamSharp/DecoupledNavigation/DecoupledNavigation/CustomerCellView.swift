//
//  CustomerCellView.swift
//  DecoupledNavigation
//
//  Created by Thomas Cowern on 10/29/25.
//

import SwiftUI

struct CustomerCellView: View {
    
    let customer: Customer
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(customer.name)
            Text(customer.address)
        }
    }
}

#Preview {
    CustomerCellView(customer: Customer.sampleCustomer)
}
