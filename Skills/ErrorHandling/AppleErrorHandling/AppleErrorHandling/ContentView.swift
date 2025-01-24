//
//  ContentView.swift
//  AppleErrorHandling
//
//  Created by Thomas Cowern on 1/24/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var vendingMachine = VendingMachine()
    
    var body: some View {
        VStack {
            ForEach(vendingMachine.inventory.sorted { $0.value.id < $1.value.id }, id: \.key) { key, value in
                HStack {
                    Text(key)
                    Spacer()
                    Text("\(value.price)")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
