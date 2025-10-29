//
//  Customer+Extensions.swift
//  DecoupledNavigation
//
//  Created by Thomas Cowern on 10/29/25.
//

import Foundation

#if DEBUG
extension Customer {
    static var sampleCustomer: Customer {
        Customer(name: "Alice Smith")
    }

    static var sampleCustomers: [Customer] {
        [
            Customer(name: "Bob Elks"),
            Customer(name: "Lisa Belt"),
            Customer(name: "Phil Collings")
        ]
    }
}
#endif
