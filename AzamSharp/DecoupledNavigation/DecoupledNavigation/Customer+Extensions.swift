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
        Customer(name: "Alice Smith", address: "1939 Pine Road Phoenix, AZ 12360")
    }

    static var sampleCustomers: [Customer] {
        [
            Customer(name: "Bob Elks", address: "2345 Pine Road Phoenix, AZ 12360"),
            Customer(name: "Lisa Belt", address: "8828 Cedar Lane Houston, AZ 38237"),
            Customer(name: "Phil Collings", address: "3098 Cedar Lane New York, AZ 72202")
        ]
    }
}
#endif
