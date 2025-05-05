//
//  AddCoffeeOrderScreen.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 8/14/23.
//

import SwiftUI

struct AddCoffeeOrderScreen: View {
    
    @Environment(\.httpClient) private var httpClient
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var coffeeName: String = ""
    @State private var total: Double = 0.0
    @State private var size: CoffeeSize = .medium
    @State private var saving: Bool = false
    
    var onSave: (CoffeeOrder) -> Void
    
    private var isFormValid: Bool {
        return true
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Coffee Name", text: $coffeeName)
            TextField("Total", value: $total, format: .number)
            
            Picker("Coffee Size", selection: $size) {
                ForEach(CoffeeSize.allCases) { size in
                    Text(size.rawValue)
                }
            }.pickerStyle(.segmented)
            
            HStack {
                Spacer()
                Button("Place Order") {
                    saving = true
                }.buttonStyle(.borderedProminent)
                    .task(id: saving) {
                        if saving {
                            await placeOrder()
                            saving = false
                            dismiss()
                        }
                    }
                
                Spacer()
            }
        }
    }
    
    private func placeOrder() async {
        do {
            let newOrder = CoffeeOrder(name: name, coffeeName: coffeeName, total: total, size: size)
            let newOrderData = try JSONEncoder().encode(newOrder)
            
            let resource = Resource(url: APIs.addOrder.url, method: .post(newOrderData), modelType: CoffeeOrder.self)
            let orderResponse = try await httpClient.load(resource)
            onSave(orderResponse)
        } catch {
            print("Error in place order: \(error.localizedDescription)")
        }
    }
}

#Preview {
    AddCoffeeOrderScreen { _ in
        // More to come...
    }
}
