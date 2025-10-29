//
//  CustomerDetailVIew.swift
//  DecoupledNavigation
//
//  Created by Thomas Cowern on 10/29/25.
//

import SwiftUI

struct CustomerDetailVIew: View {
    
    let customer: Customer
    
    var body: some View {
        VStack {
            Text(customer.name)
                .font(.headline)
            Text(customer.address)
                .font(.footnote)
        }
    }
}

#Preview {
    CustomerDetailVIew(customer: Customer.sampleCustomer)
}
