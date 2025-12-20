//
//  OrderView.swift
//  iDine
//
//  Created by Thomas Cowern on 12/20/25.
//

import SwiftUI

struct OrderView: View {
    
    @Environment(Order.self) var order
    
    var placeOrder: Bool {
        if order.items.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    if placeOrder {
                        Text("Your order is empty")
                    } else {
                        ForEach(order.items) { item in
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }
                
                Section {
                    NavigationLink("Place Order") {
                        Text("Check Out")
                    }
                    .disabled(placeOrder)
                }
            }
            .navigationTitle("Check Out")
        }
    }
}

#Preview {
    OrderView()
        .environment(Order())
}
