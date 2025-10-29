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
        Text(customer.name)
    }
}

#Preview {
    CustomerCellView(customer: Customer.sampleCustomer)
}
